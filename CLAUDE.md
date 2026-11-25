# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this package is

DocumenterMarkdown.jl is a Markdown / MkDocs output backend for Documenter.jl. A
`make.jl` passes `format = Markdown()` to `makedocs` and gets one `.md` file per page
in the build directory, which MkDocs then turns into HTML (see `docs/make.jl`,
`docs/mkdocs.yml`). The backend was moved out of Documenter itself (commit "Move
MarkdownWriter code here"). The package is small and not actively maintained.

## Documenter 1 and MarkdownAST

`Project.toml` requires `Documenter = "1"` (developed against 1.20) and Julia 1.10. In
Documenter 1 a page is a MarkdownAST tree (`page.mdast`), not stdlib `Markdown` objects,
and the writer is built on that. The old 0.27 API (`Documenter.Documents`, `Anchors`,
`Utilities.Selectors`, `Deps.pip`) is gone; versions 0.2.x of this package are the
Documenter 0.27 versions. `Documenter.Selectors`, `Documenter.FormatSelector` and
`Documenter.Writer` are the extension points, `src/latex/LaTeXWriter.jl` of Documenter is
the best example of a writer.

## Layout

- `src/DocumenterMarkdown.jl`: the module. Registers the writer with Documenter by
  defining `MarkdownFormat <: Documenter.FormatSelector` with `Selectors.order`,
  `Selectors.matcher` (true when the format is a `Markdown`) and `Selectors.runner`
  (calls `render(doc, fmt)`). Exports `Markdown`.
- `src/writer.jl`: the `Markdown <: Documenter.Writer` type and the `render(io, node,
  element, page, doc)` methods, one per Documenter element (`AnchoredHeader`,
  `DocsNode`, `IndexNode`, `ContentsNode`, `EvalNode`, `MultiCodeBlock`, `MultiOutput`,
  `RawNode`, ...). Plain MarkdownAST elements are converted to the standard library
  `Markdown` (`stdlib_markdown`) and written with `Markdown.plain`. Documenter's own
  inline elements (`PageLink`, `LocalLink`, `LocalImage`, `AnchoredInline`) cannot be
  converted or deep-copied, so `copy_children!` replaces them by plain `Link`/`Image`
  nodes (relative to the page) or their content. Other Documenter elements warn and
  are left out.
- `assets/`: files copied to `<build>/assets` by `copy_assets` at every build. The
  build errors if this directory is missing.
- `test/runtests.jl` includes `test/example/make.jl` (a full `makedocs` run over
  `test/example/src/`, with the modules `Mod` and `AutoDocs` defined in that file) and
  then `test/example/tests.jl` (existence of the files and assertions on the content).
- `test/golden/`: the output of Documenter 0.27.25 (version 0.2.2 of this package),
  saved by `test/make_golden.jl`, for comparing the output of the writer; it contains
  `rand()` and `@time` output of the fixtures, which differ at every run. The differences
  to the current output are listed in `CHANGELOG.md`.
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

# build the package's own docs (runs MkDocs when deploying; needs the Python packages
# mkdocs, pygments and python-markdown-math)
julia +1.10 --project=docs docs/make.jl
```

The test suite builds a complete Documenter site; Documenter 1 turns problems of the
pages into errors, so a failure in `test/example/make.jl` can be a problem of a page (see
`warnonly` there) and not a bug in `writer.jl`. To check the output with MkDocs, run
`mkdocs build` in `docs/` after `julia +1.10 --project=docs docs/make.jl` (needs the
Python packages `mkdocs`, `pygments` and `python-markdown-math`). Run Julia with
at most 8 threads (`-t 8`), never `-t auto`.

## Workflow

- The default branch is `master`; `origin` is `github.com/ufechner7/DocumenterMarkdown.jl`.
- Record user-visible changes in `CHANGELOG.md`, in the existing style (version
  headings and `[github-N]` link references); do not add an empty section. Bump
  `version` in `Project.toml` only for a release.
- `coverage/` and `REQUIRE` are legacy files; leave them alone.
