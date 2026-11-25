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
- **MarkdownAST to text (decided in the spike):** plain MarkdownAST elements are
  copied below a `Document` root and converted with
  `convert(Markdown.MD, root)`, then written with `Markdown.plain`, as before. The
  conversion errors on Documenter's own elements, and `copy_tree` cannot deepcopy
  them (a `PageLink` holds the whole page). So `copy_tree` is called with a mapping
  function that turns `PageLink`, `LocalLink` and `LocalImage` into `Link` and `Image`
  with paths relative to the page. Documenter's block elements (`DocsNodesBlock`,
  `IndexNode`, `ContentsNode`, `MultiOutput`, ...) get their own `render` methods.
- **Output stability:** the output may change (anchor ids, the legacy `-1` anchors,
  docstring headers, source links), but every difference to the golden files of
  step 1 is listed and intended.

## Steps

1. **Golden files.** Run the current test suite under Julia 1.10 with Documenter
   0.27.18 and save the generated `test/example/build/**/*.md` as reference output
   (`test/golden/`). Add content assertions to `test/example/tests.jl` (headings,
   docstring blocks, cross-reference links, index and contents lists, code blocks,
   math, admonitions, footnotes, images), not only checks that files exist.
2. **Spike (done, branch `documenter-1`).** A minimal `Markdown` writer on Documenter
   1.20 that registers with the selectors and renders headings with their anchors,
   paragraphs, code blocks, `@meta`/`@setup` (no output) and the links and images of a
   page. Everything else warns and is left out. Not done yet: `AnchoredInline`, all
   Documenter blocks (step 3).
3. **Node coverage (done).** `render` methods for `DocsNodesBlock`/`DocsNode`,
   `IndexNode`, `ContentsNode`, `EvalNode`, `MultiOutput`/`MultiOutputElement`,
   `MultiCodeBlock`, `RawNode`, `AnchoredHeader` and the links and images; the other
   Documenter elements warn and are left out. `AnchoredInline` is replaced by its
   content. The example suite had to be ported too (`Documenter.DOM`, an `@eval` that
   returns `Markdown.MD`, `warnonly` for the links and footnotes that Documenter 1
   reports as errors).
4. **Compare (done).** All 37 tests pass on Documenter 1.20. The differences to
   `test/golden/` are listed in `CHANGELOG.md`; the golden files stay those of
   Documenter 0.27.25. They also hold output that changes on every run (`rand()`,
   `@time` in the fixtures), which a diff has to ignore.
5. **Docs, CI, release (done).**
   - `docs/make.jl`: `Deps.pip` is removed (`deps` and `make` of `deploydocs` still
     exist in Documenter 1; `make` runs `mkdocs build`); the Python packages are
     installed in the CI workflow. The dead `@ref` links of `docs/src/index.md` point to
     the Documenter manual. `pip` is removed from `src/DocumenterMarkdown.jl`.
   - `.github/workflows/CI.yml`: Julia 1.10, 1 and nightly, current action versions.
   - `README.md`, `CHANGELOG.md` and `CLAUDE.md` updated; `version` is 0.3.0.
   - Still to do: merge `documenter-1` into `master`, check that CI is green on
     GitHub, register and tag 0.3.0.

## Done when

- The example test suite passes on Documenter 1.20 with the content assertions.
- `mkdocs build` succeeds on the generated output.
- CI is green on Julia 1.10 and the latest release.
