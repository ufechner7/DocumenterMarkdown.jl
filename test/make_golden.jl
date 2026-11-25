# Saves the Markdown that the example build (test/example/make.jl) wrote as reference
# output in test/golden/, to compare a port to another Documenter version with.
# Generated with Documenter 0.27.25 under Julia 1.10: run the tests first, then
#     julia +1.10 --project test/make_golden.jl
# The names of the images are random (7 letters); they are replaced by RANDOM, and the
# commit hash in the source links by COMMIT.
const BUILD = joinpath(@__DIR__, "example", "build")
const GOLDEN = joinpath(@__DIR__, "golden")

rm(GOLDEN; recursive=true, force=true)
for (root, _, files) in walkdir(BUILD), file in files
    endswith(file, ".md") || continue
    src = joinpath(root, file)
    dst = joinpath(GOLDEN, relpath(src, BUILD))
    mkpath(dirname(dst))
    text = replace(read(src, String), r"!\[\]\([a-z]{7}\.(png|webp|jpeg|gif)\)" =>
                   s -> replace(s, r"[a-z]{7}(?=\.)" => "RANDOM"))
    write(dst, replace(text, r"/blob/[0-9a-f]{40}/" => "/blob/COMMIT/"))
end
println("saved ", length(readdir(GOLDEN)), " entries in ", GOLDEN)
