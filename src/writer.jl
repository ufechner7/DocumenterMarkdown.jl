using MarkdownAST: MarkdownAST, Node

# import Markdown as MarkdownStdlib
module _Markdown
    import Markdown
end
const MarkdownStdlib = _Markdown.Markdown

"""
    Markdown()

Output format for `makedocs(format = Markdown(), ...)`: one `.md` file per page in the
build directory.
"""
struct Markdown <: Documenter.Writer
end

# return the same file with the extension changed to .md
mdext(f) = string(splitext(f)[1], ".md")

function render(doc::Documenter.Document, settings::Markdown=Markdown())
    @info "DocumenterMarkdown: rendering Markdown pages."
    copy_assets(doc)
    for (src, page) in doc.blueprint.pages
        open(mdext(page.build), "w") do io
            render(io, page.mdast.children, page, doc)
        end
    end
end

function copy_assets(doc::Documenter.Document)
    @debug "copying assets to build directory."
    assets = ASSETS
    if isdir(assets)
        builddir = joinpath(doc.user.build, "assets")
        isdir(builddir) || mkdir(builddir)
        for each in readdir(assets)
            src = joinpath(assets, each)
            dst = joinpath(builddir, each)
            ispath(dst) && @warn "DocumenterMarkdown: overwriting '$dst'."
            cp(src, dst; force = true)
        end
    else
        error("assets directory '$(abspath(assets))' is missing.")
    end
end

# The children of a node, one after the other.
function render(io::IO, children, page, doc)
    for node in children
        render(io, node, node.element, page, doc)
    end
end

# A heading with its anchor: the anchor first, then the legacy anchor with the suffix -1,
# as the Markdown backend of Documenter 0.27 did.
function render(io::IO, node::Node, ah::Documenter.AnchoredHeader, page, doc)
    id = Documenter.anchor_label(ah.anchor)
    println(io, "\n<a id='", id, "'></a>")
    ah.anchor.nth == 1 && println(io, "\n<a id='", id, "-1'></a>")
    render(io, node.children, page, doc)
end

# Metadata nodes (@meta blocks) and setup nodes (@setup blocks) have no output.
render(io::IO, ::Node, ::Union{Documenter.MetaNode,Documenter.SetupNode}, page, doc) =
    println(io, "\n")

# The directory of the output file of a page, relative to the build directory.
function pagedir(page, doc)
    dir = dirname(relpath(page.build, doc.user.build))
    isempty(dir) ? "." : dir
end

# Links to the paths of the build directory are written relative to the directory of the
# page (with the extension .md for pages), as in the Markdown backend of Documenter 0.27.
relative(path, page, doc) = replace(relpath(path, pagedir(page, doc)), "\\" => "/")

# The Documenter elements inside a plain element (links and images) as the elements of
# MarkdownAST that the standard library `Markdown` knows. They cannot be copied as they
# are: a `PageLink` holds the whole page.
function plainelement(page, doc)
    function (::Node, e)
        e isa Documenter.PageLink &&
            return MarkdownAST.Link(
                relative(mdext(relpath(e.page.build, doc.user.build)), page, doc) *
                (isempty(e.fragment) ? "" : "#" * e.fragment), "")
        e isa Documenter.LocalLink &&
            return MarkdownAST.Link(
                relative(e.path, page, doc) * (isempty(e.fragment) ? "" : "#" * e.fragment),
                "")
        e isa Documenter.LocalImage &&
            return MarkdownAST.Image(relative(e.path, page, doc), "")
        return deepcopy(e)
    end
end

# Plain Markdown elements (headings, paragraphs, code blocks, ...): the subtree is copied
# below a `Document` root, converted to the standard library `Markdown` and written.
function render(io::IO, node::Node, ::MarkdownAST.AbstractElement, page, doc)
    root = MarkdownAST.@ast MarkdownAST.Document() do
    end
    push!(root.children, MarkdownAST.copy_tree(plainelement(page, doc), node))
    println(io)
    MarkdownStdlib.plain(io, convert(MarkdownStdlib.MD, root))
    println(io)
end

# The other nodes of Documenter itself (@docs, @example, @index, ...) are not supported
# yet; they are left out with a warning.
function render(io::IO, node::Node, element::Union{Documenter.AbstractDocumenterBlock,
                                                    Documenter.AbstractDocumenterInline},
                page, doc)
    @warn "DocumenterMarkdown: the element $(typeof(element)) on page " *
          "'$(page.source)' is not supported yet and is left out."
end
