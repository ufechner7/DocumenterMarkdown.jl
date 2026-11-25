# Make this package compatible with the latest Documenter version

This package was not maintained for 5 years. Make it work with Documenter 1.20.

## Background

Documenter 1.x is not a drop-in update of 0.27; the port is close to a rewrite of
`src/writer.jl`:

- Pages are a MarkdownAST tree (`page.mdast`), not stdlib `Markdown` objects.
- The modules `Documenter.Documents`, `Anchors`, `Builder`, `Expanders` and
  `Utilities.Selectors` are gone. `Selectors` is now `Documenter.Selectors`;
  `FormatSelector` and `Writer` are defined in Documenter itself (`writers.jl`,
  `Documenter.jl`).
- New or changed node types: `AnchoredHeader`, `DocsNodesBlock`, `DocsNode`,
  `MultiOutputElement`, `SetupNode`, `IndexNode`, `ContentsNode`, `EvalNode`,
  `RawNode`, `PageLink`, `LocalLink`, `LocalImage`, `AnchoredInline`, plus the
  MarkdownAST types (`Heading`, `Paragraph`, `Admonition`, `Table`,
  `FootnoteDefinition`, `DisplayMath`, ...).
- `Deps.pip` and the `deps`/`make` keywords of `deploydocs` were removed in 1.0.

Template: `src/latex/LaTeXWriter.jl` of Documenter 1.20, a non-HTML writer that walks
`page.mdast` with one method per node type.

## Decisions

- **Compat:** drop Documenter 0.27; `Documenter = "1"`, `julia = "1.10"`. Breaking
  release 0.3.0.
- **MarkdownAST to text:** open, decided in step 2 — write Markdown directly from the
  AST, or convert subtrees back to stdlib `Markdown` and keep `Markdown.plain`. First
  check whether MarkdownAST supports that reverse conversion.
- **Output stability:** the output may change (anchor ids, the legacy `-1` anchors,
  docstring headers, source links), but every difference to the golden files of
  step 1 is listed and intended.

## Steps

1. **Golden files.** Run the current test suite under Julia 1.10 with Documenter
   0.27.18 and save the generated `test/example/build/**/*.md` as reference output
   (`test/golden/`). Add content assertions to `test/example/tests.jl` (headings,
   docstring blocks, cross-reference links, index and contents lists, code blocks,
   math, admonitions, footnotes, images), not only checks that files exist.
2. **Spike.** A minimal `Markdown` writer on Documenter 1.20 that registers with the
   selectors and renders only headings, paragraphs and code blocks from `page.mdast`.
   Settle the MarkdownAST-to-text decision here.
3. **Node coverage.** List every node type `LaTeXWriter.jl` handles and implement a
   `render` method for each, plus a fallback that warns on unknown nodes instead of
   erroring.
4. **Compare.** Diff the new output against the golden files; fix regressions and
   document each intended difference in `CHANGELOG.md`.
5. **Docs, CI, release.**
   - `docs/make.jl`: remove `Deps.pip` and the `deps`/`make` keywords of
     `deploydocs`; build MkDocs in the CI workflow instead. Remove `pip` from
     `src/DocumenterMarkdown.jl`.
   - `.github/workflows/CI.yml`: Julia 1.10 and 1, current action versions.
   - Update `README.md` (package status), `CHANGELOG.md` and `CLAUDE.md` (which still
     says the code must stay on the Documenter 0.27 API).
   - Bump `version` to 0.3.0.

## Done when

- The example test suite passes on Documenter 1.20 with the content assertions.
- `mkdocs build` succeeds on the generated output.
- CI is green on Julia 1.10 and the latest release.
