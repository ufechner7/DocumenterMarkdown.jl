# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this package is

DocumenterMarkdown.jl is a Markdown / MkDocs output backend for Documenter.jl. A
`make.jl` passes `format = Markdown()` to `makedocs` and gets one `.md` file per page
in the build directory, which MkDocs then turns into HTML (see `docs/make.jl`,
`docs/mkdocs.yml`). The backend was moved out of Documenter itself (commit "Move
MarkdownWriter code here"). The package is small and not actively maintained.

## Hard constraint: Documenter 0.27 only

`Project.toml` pins `Documenter = "0.27.18"` and the code relies on internals of that
series: `Documenter.Utilities.Selectors`, `Documenter.Documents`, `Anchors`,
`Expanders`, `Builder`, and node types such as `Documents.DocsNode`, `IndexNode`,
`ContentsNode`, `EvalNode`, `MultiOutput`, `RawNode`. These do not exist in the same
form in Documenter 0.28 and later (the README says so), so do not "modernise" the code
to a newer Documenter API and do not widen the compat bound without testing. Also
supported are Julia 1.0 and later (CI runs 1.0, 1.6, 1 and nightly), so avoid syntax
and standard-library functions that need a newer Julia.

## Layout

- `src/DocumenterMarkdown.jl`: the module. Registers the writer with Documenter by
  defining `MarkdownFormat <: Documenter.Writers.FormatSelector` with `Selectors.order`,
  `Selectors.matcher` (true when the format is a `Markdown`) and `Selectors.runner`
  (calls `render(doc, fmt)`). Also keeps `pip`, copied from Documenter's old `Deps`
  module for `deploydocs(deps = Deps.pip(...))`. Exports `Markdown`.
- `src/writer.jl`: the `Markdown <: Documenter.Writer` type and all `render` methods,
  one per Documenter node type (`Anchor`, `DocsNode(s)`, `IndexNode`, `ContentsNode`,
  `EvalNode`, `MultiCodeBlock`, `MultiOutput`, `Dict{MIME,Any}`, `RawNode`, ...), with
  a generic fallback that calls `Markdown.plain`.
- `assets/`: files copied to `<build>/assets` by `copy_assets` at every build. The
  build errors if this directory is missing.
- `test/runtests.jl` includes `test/example/make.jl` (a full `makedocs` run over
  `test/example/src/`, with the modules `Mod` and `AutoDocs` defined in that file) and
  then `test/example/tests.jl` (assertions on the output).
- `docs/`: the package's own documentation, built with the package itself.

## Conventions in the code

- The stdlib `Markdown` is imported as `MarkdownStdlib` (through the private module
  `_Markdown`), because this package defines its own `Markdown` type. Never write
  `using Markdown` or `import Markdown` in `writer.jl`.
- Rendering is by multiple dispatch on `render(io, mime, node, page, doc)`. Add support
  for a new node type with a new method; keep the signature and the order of the
  arguments.
- Output is `text/plain` Markdown. Headers inside docstrings are turned into bold text
  (`dropheaders`); do not remove that, the CSS of the HTML output relies on it.
- Links between pages use the extension `.md` (`mdext`); anchors are emitted as
  `<a id='...'></a>` including the legacy `-1` id for the first occurrence.
- Images of `Dict{MIME,Any}` results are written next to the page with a random
  7-letter file name; the "best" representation is chosen in the order markdown, html,
  svg, png, webp, jpeg, gif, plain text. Keep that order when adding a MIME type.

## Commands

```julia
# run the tests (Pkg.test; there is no separate test environment, `Test` is an extra).
# Julia 1.10 is installed with juliaup but is not the default: use `+1.10`.
julia +1.10 --project -e 'using Pkg; Pkg.test()'

# save the generated Markdown as reference output in test/golden/ (after the tests)
julia +1.10 --project test/make_golden.jl

# build the package's own docs, then run MkDocs (needs the Python packages mkdocs,
# pygments and python-markdown-math)
julia --project=docs docs/make.jl
```

The test suite builds a complete Documenter site, so a failure in `test/example/make.jl`
is often a Documenter-version problem rather than a bug in `writer.jl`. Run Julia with
at most 8 threads (`-t 8`), never `-t auto`.

## Workflow

- The default branch is `master`; `origin` is `github.com/ufechner7/DocumenterMarkdown.jl`.
- Record user-visible changes in `CHANGELOG.md`, in the existing style (version
  headings and `[github-N]` link references); do not add an empty section. Bump
  `version` in `Project.toml` only for a release.
- `coverage/` and `REQUIRE` are legacy files; leave them alone.
