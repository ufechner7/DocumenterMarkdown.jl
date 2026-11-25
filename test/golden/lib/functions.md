


<a id='Function-Index'></a>

<a id='Function-Index-1'></a>

# Function Index



<a id='Functions'></a>

<a id='Functions-1'></a>

# Functions


[`func(x)`](functions.md#Main.Mod.func-Tuple{Any})

<a id='Main.Mod.func-Tuple{Any}' href='#Main.Mod.func-Tuple{Any}'>#</a>
**`Main.Mod.func`** &mdash; *Method*.



```julia
func(x)
```

[`T`](functions.md#Main.Mod.T)


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L8-L12' class='documenter-source'>source</a><br>

<a id='Main.Mod.T' href='#Main.Mod.T'>#</a>
**`Main.Mod.T`** &mdash; *Type*.



```julia
T
```

[`func(x)`](functions.md#Main.Mod.func-Tuple{Any})


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L15-L19' class='documenter-source'>source</a><br>


<a id='Foo'></a>

<a id='Foo-1'></a>

# Foo


```julia
@show pwd()
a = 1
```


```
1
```


...


```julia
@isdefined a
```


```
false
```


```julia
f(x) = 2x
g(x) = 3x
```


```julia
x, y = 1, 2
println(x, y)
```


```
12
```


```julia
struct T end
t = T()
```


```
Main.T()
```


```julia
a + b + c + d + e + f
```


```
21
```


<a id='Foo-2'></a>

## Foo


```julia
@isdefined T
@show typeof(T)
```


```
Main.T
```


```julia
x + y
```


```
3
```


```julia
f(2), g(2)
```


```
(4, 6)
```


<a id='Foo-3'></a>

### Foo


```julia
x - y
```


```
-1
```


```julia
f(1), g(1)
```


```
(2, 3)
```


```julia
A = 1
```


```
1
```


```julia
for i in 1:3
```


```julia
A = 2
```


```
2
```


```julia
    println(A + i)
```


```julia
end
```


```
2
3
4
```


```julia
A + 1
```


```
2
```


<a id='Foo-4'></a>

#### Foo


```julia
a = 1
b = ans
@assert a === b
```


```julia-repl



julia> nothing


julia> rand()
0.16053612161204212

julia> a = 1
1

julia> println(a)
1

julia> b = 2
2

julia> a + b
3

julia> struct T
           x :: Int
           y :: Vector
       end


julia> x = T(1, [1])
Main.T(1, [1])

julia> x.y
1-element Vector{Int64}:
 1

julia> x.x
1
```


```julia-repl
julia> d = 1
1
```


```julia-repl
julia> println(d)
1
```


Test setup function




```julia
@assert w === 5
```


```julia-repl
julia> @assert w === 5

```


<a id='Autodocs'></a>

<a id='Autodocs-1'></a>

# Autodocs




<a id='AutoDocs-Module'></a>

<a id='AutoDocs-Module-1'></a>

## AutoDocs Module

<a id='AutoDocs' href='#AutoDocs'>#</a>
**`AutoDocs`** &mdash; *Module*.



`AutoDocs` module.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L56' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.K' href='#Main.AutoDocs.K'>#</a>
**`Main.AutoDocs.K`** &mdash; *Constant*.



Constant `K`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L69' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.T' href='#Main.AutoDocs.T'>#</a>
**`Main.AutoDocs.T`** &mdash; *Type*.



Type `T`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L72' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.f-Tuple{Any}' href='#Main.AutoDocs.f-Tuple{Any}'>#</a>
**`Main.AutoDocs.f`** &mdash; *Method*.



Function `f`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L66' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.@m-Tuple{}' href='#Main.AutoDocs.@m-Tuple{}'>#</a>
**`Main.AutoDocs.@m`** &mdash; *Macro*.



Macro `@m`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L75' class='documenter-source'>source</a><br>


<a id='Functions,-Modules,-and-Macros'></a>

<a id='Functions,-Modules,-and-Macros-1'></a>

## Functions, Modules, and Macros

<a id='Main.AutoDocs.A.f-Tuple{Any}' href='#Main.AutoDocs.A.f-Tuple{Any}'>#</a>
**`Main.AutoDocs.A.f`** &mdash; *Method*.



Function `A.f`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L80' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.A' href='#Main.AutoDocs.A'>#</a>
**`Main.AutoDocs.A`** &mdash; *Module*.



Module `A`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L78' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.A.@m-Tuple{}' href='#Main.AutoDocs.A.@m-Tuple{}'>#</a>
**`Main.AutoDocs.A.@m`** &mdash; *Macro*.



Macro `B.@m`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L89' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.B.f-Tuple{Any}' href='#Main.AutoDocs.B.f-Tuple{Any}'>#</a>
**`Main.AutoDocs.B.f`** &mdash; *Method*.



Function `B.f`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L95' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.B' href='#Main.AutoDocs.B'>#</a>
**`Main.AutoDocs.B`** &mdash; *Module*.



Module `B`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L93' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.B.@m-Tuple{}' href='#Main.AutoDocs.B.@m-Tuple{}'>#</a>
**`Main.AutoDocs.B.@m`** &mdash; *Macro*.



Macro `B.@m`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L104' class='documenter-source'>source</a><br>


<a id='Constants-and-Types'></a>

<a id='Constants-and-Types-1'></a>

## Constants and Types

<a id='Main.AutoDocs.A.K' href='#Main.AutoDocs.A.K'>#</a>
**`Main.AutoDocs.A.K`** &mdash; *Constant*.



Constant `A.K`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L83' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.A.T' href='#Main.AutoDocs.A.T'>#</a>
**`Main.AutoDocs.A.T`** &mdash; *Type*.



Type `B.T`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L86' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.B.K' href='#Main.AutoDocs.B.K'>#</a>
**`Main.AutoDocs.B.K`** &mdash; *Constant*.



Constant `B.K`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L98' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.B.T' href='#Main.AutoDocs.B.T'>#</a>
**`Main.AutoDocs.B.T`** &mdash; *Type*.



Type `B.T`.


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L101' class='documenter-source'>source</a><br>


<a id='Autodocs-by-Page'></a>

<a id='Autodocs-by-Page-1'></a>

## Autodocs by Page

<a id='Main.AutoDocs.Pages.f-Tuple{Any}' href='#Main.AutoDocs.Pages.f-Tuple{Any}'>#</a>
**`Main.AutoDocs.Pages.f`** &mdash; *Method*.



`f` from page `a.jl`.

Links:

  * [`T(x)`](functions.md#Main.AutoDocs.Pages.T-Tuple{Any})
  * [`T(x, y)`](functions.md#Main.AutoDocs.Pages.T-Tuple{Any, Any})
  * [`f(::Integer)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(::Any, ::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any})
  * [`f(x, y, z)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any, Any})

[^footnote]: Footnote contents. [^footnote]


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/pages/a.jl#L2-L18' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.Pages.f-Tuple{Any, Any}' href='#Main.AutoDocs.Pages.f-Tuple{Any, Any}'>#</a>
**`Main.AutoDocs.Pages.f`** &mdash; *Method*.



`f` from page `b.jl`.

Links:

  * [`T`](functions.md#Main.AutoDocs.Pages.T)
  * [`f`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(::Any, ::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any})
  * [`f(::Any, ::Any, ::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any, Any})


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/pages/b.jl#L2-L13' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.Pages.f-Tuple{Any, Any, Any}' href='#Main.AutoDocs.Pages.f-Tuple{Any, Any, Any}'>#</a>
**`Main.AutoDocs.Pages.f`** &mdash; *Method*.



`f` from page `c.jl`.

Links:

  * [`T`](functions.md#Main.AutoDocs.Pages.T)
  * [`f`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(::Any, ::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any})
  * [`f(::Any, ::Any, ::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any, Any})


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/pages/c.jl#L2-L13' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.Pages.T' href='#Main.AutoDocs.Pages.T'>#</a>
**`Main.AutoDocs.Pages.T`** &mdash; *Type*.



`T` from page `d.jl`.

Links:

  * [`T`](functions.md#Main.AutoDocs.Pages.T)
  * [`f`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(x)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(x, y)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any})
  * [`f(::Any, ::Any, ::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any, Any})


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/pages/d.jl#L2-L13' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.Pages.T-Tuple{Any, Any}' href='#Main.AutoDocs.Pages.T-Tuple{Any, Any}'>#</a>
**`Main.AutoDocs.Pages.T`** &mdash; *Method*.



`T` from page `d.jl`.

Links:

  * [`T()`](functions.md#Main.AutoDocs.Pages.T)
  * [`T(x)`](functions.md#Main.AutoDocs.Pages.T-Tuple{Any})
  * [`T(x, y)`](functions.md#Main.AutoDocs.Pages.T-Tuple{Any, Any})
  * [`T(x, y, z)`](functions.md#Main.AutoDocs.Pages.T)
  * [`f`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(x)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(x, y)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any})
  * [`f(::Any, ::Any, ::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any, Any})


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/pages/d.jl#L33-L47' class='documenter-source'>source</a><br>

<a id='Main.AutoDocs.Pages.T-Tuple{Any}' href='#Main.AutoDocs.Pages.T-Tuple{Any}'>#</a>
**`Main.AutoDocs.Pages.T`** &mdash; *Method*.



`T` from page `d.jl`.

Links:

  * [`T(x)`](functions.md#Main.AutoDocs.Pages.T-Tuple{Any})
  * [`T(x, y)`](functions.md#Main.AutoDocs.Pages.T-Tuple{Any, Any})
  * [`T(x, y, z)`](functions.md#Main.AutoDocs.Pages.T)
  * [`f`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(x)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any})
  * [`f(x, y)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any})
  * [`f(::Any, ::Any, ::Any)`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any, Any, Any})


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/pages/d.jl#L17-L30' class='documenter-source'>source</a><br>


A footnote reference [^footnote].


<a id='Named-docstring-@refs'></a>

<a id='Named-docstring-@refs-1'></a>

# Named docstring `@ref`s


  * a normal docstring `@ref` link: [`AutoDocs.Pages.f`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any});
  * a named docstring `@ref` link: [`f`](functions.md#Main.AutoDocs.Pages.f-Tuple{Any});

