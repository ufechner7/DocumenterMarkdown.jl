
<a id='@repl,-@example,-and-@eval-have-correct-LineNumberNodes-inserted'></a>

<a id='@repl,-@example,-and-@eval-have-correct-LineNumberNodes-inserted-1'></a>

# `@repl`, `@example`, and `@eval` have correct `LineNumberNode`s inserted


Add new things at the bottom!!


```julia-repl
julia> println("@__FILE__ should be REPL[1]: ", @__FILE__)
@__FILE__ should be REPL[1]: REPL[1]

julia> println("@__FILE__ should be REPL[2]: ", @__FILE__)
@__FILE__ should be REPL[2]: REPL[2]

julia> println("@__LINE__ should be 1: ", @__LINE__)
@__LINE__ should be 1: 1

julia> @warn "@__FILE__ should be REPL[4] and @__LINE__ 1"
┌ Warning: @__FILE__ should be REPL[4] and @__LINE__ 1
└ @ Main REPL[4]:1

julia> begin
           println("@__FILE__ should be REPL[5]: ", @__FILE__)
           println("@__FILE__ should be REPL[5]: ", @__FILE__)
           println("@__LINE__ should be 4: ", @__LINE__)
           @warn "@__FILE__ should be REPL[5] and @__LINE__ 5"
       end
@__FILE__ should be REPL[5]: REPL[5]
@__FILE__ should be REPL[5]: REPL[5]
@__LINE__ should be 4: 4
┌ Warning: @__FILE__ should be REPL[5] and @__LINE__ 5
└ @ Main REPL[5]:5
```


```julia
println("@__FILE__ should be linenumbers.md: ", @__FILE__)
println("@__LINE__ should be 20: ", @__LINE__)
@warn "@__FILE__ should be linenumbers.md and @__LINE__ 21"
begin
    println("@__FILE__ should be linenumbers.md: ", @__FILE__)
    println("@__LINE__ should be 24: ", @__LINE__)
    @warn "@__FILE__ should be linenumbers.md and @__LINE__ 25"
end
```


```
@__FILE__ should be linenumbers.md: linenumbers.md
@__LINE__ should be 20: 20
┌ Warning: @__FILE__ should be linenumbers.md and @__LINE__ 21
└ @ Main linenumbers.md:21
@__FILE__ should be linenumbers.md: linenumbers.md
@__LINE__ should be 24: 24
┌ Warning: @__FILE__ should be linenumbers.md and @__LINE__ 25
└ @ Main linenumbers.md:25
```


```
$(@__FILE__):$(@__LINE__) should be linenumbers.md:32: linenumbers.md:32
$(@__FILE__):$(@__LINE__) should be linenumbers.md:33: linenumbers.md:33
```

