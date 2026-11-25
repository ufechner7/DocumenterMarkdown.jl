
<a id='Tutorial'></a>

<a id='Tutorial-1'></a>

# Tutorial


[Documentation](../index.md#Documentation)


[Index](../index.md#Index)


[Functions](../lib/functions.md#Functions)


[`Main.Mod.func(x)`](../lib/functions.md#Main.Mod.func-Tuple{Any})


[`Main.Mod.T`](../lib/functions.md#Main.Mod.T)


```julia-repl
julia> using Base.Meta # `nothing` shouldn't be displayed.

julia> Meta
Base.Meta

julia> a = 1
1

julia> b = 2;

julia> a + b
3
```


```julia
a = 1
b = 2
a + b

# output

3
```




```julia
a = 1
b = 2
a / b

# output

0.5
```


```julia-repl
julia> a = 1;

julia> b = 2
2

julia> a / b
0.5
```


```
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.10.14 (2026-11-20)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia>
```


```julia-repl
julia> # First definition.
       function f(x, y)
           x + y
       end
       #
       # Second definition.
       #
       struct T
           x
       end

julia> @isdefined(f), @isdefined(T) # Check for both definitions.
(true, true)

julia> import Base

julia> using Base.Meta

julia> r = isexpr(:(using Base.Meta), :using); # Discarded result.

julia> !r
false
```


```julia-repl
julia> for i = 1:5
           println(i)
       end
1
2
3
4
5

julia> println("Printing with semi-comma ending.");
Printing with semi-comma ending.

julia> div(1, 0)
ERROR: DivideError: integer division error
[...]

julia> println("a"); # Semi-colons *not* on the last expression shouldn't suppress output.
       println(1)    # ...
       2             # ...
a
1
2

julia> println("a"); # Semi-colons *not* on the last expression shouldn't suppress output.
       println(1)    # ...
       2;            # Only those in the last expression.
a
1
```


```julia
a = 1
b = 2; # Semi-colons don't affect script doctests.

# output

2
```


```julia-repl
julia> f(x) = (sleep(x); x)
f (generic function with 1 method)

julia> @time f(0.1);
  0.101264 seconds (4 allocations: 112 bytes)
```


```julia-repl
julia> f(0.01)
0.01

julia> div(1, 0)
ERROR: DivideError: integer division error
```


Make sure that stdout is in the right place (#484):


```julia-repl
julia> println("---") === nothing
---
true

julia> versioninfo()
ERROR: UndefVarError: `versioninfo` not defined
```


<a id='Including-images-with-MIME'></a>

<a id='Including-images-with-MIME-1'></a>

## Including images with `MIME`


If `show(io, ::MIME, x)` is overloaded for a particular type then `@example` blocks can show the SVG, HTML/JS/CSS, PNG, JPEG, GIF or WebP image as appropriate in the output.


Assuming the following type and method live in the `InlineSVG` module


```julia
struct SVG
    code :: String
end
Base.show(io, ::MIME"image/svg+xml", svg::SVG) = write(io, svg.code)
```


.. then we we can invoke and show them with an `@example` block:




Without xmlns tag:


```julia
using .InlineSVG
SVG("""
<svg width="82" height="76">
  <g style="stroke-width: 3">
    <circle cx="20" cy="56" r="16" style="stroke: #cb3c33; fill: #d5635c" />
    <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" />
    <circle cx="62" cy="56" r="16" style="stroke: #9558b2; fill: #aa79c1" />
  </g>
</svg>
""")
```

<svg width="82" height="76">
  <g style="stroke-width: 3">
    <circle cx="20" cy="56" r="16" style="stroke: #cb3c33; fill: #d5635c" />
    <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" />
    <circle cx="62" cy="56" r="16" style="stroke: #9558b2; fill: #aa79c1" />
  </g>
</svg>


With xmlns tag:


```julia
using .InlineSVG
SVG("""
<svg width="82" height="76" xmlns="http://www.w3.org/2000/svg">
  <g style="stroke-width: 3">
    <circle cx="20" cy="56" r="16" style="stroke: #cb3c33; fill: #d5635c" />
    <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" />
    <circle cx="62" cy="56" r="16" style="stroke: #9558b2; fill: #aa79c1" />
  </g>
</svg>
""")
```

<svg width="82" height="76" xmlns="http://www.w3.org/2000/svg">
  <g style="stroke-width: 3">
    <circle cx="20" cy="56" r="16" style="stroke: #cb3c33; fill: #d5635c" />
    <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" />
    <circle cx="62" cy="56" r="16" style="stroke: #9558b2; fill: #aa79c1" />
  </g>
</svg>


With single quotes:


```julia
using .InlineSVG
SVG("""
<svg width='82' height='76' xmlns='http://www.w3.org/2000/svg'>
  <g style='stroke-width: 3'>
    <circle cx='20' cy='56' r='16' style='stroke: #cb3c33; fill: #d5635c' />
    <circle cx='41' cy='20' r='16' style='stroke: #389826; fill: #60ad51' />
    <circle cx='62' cy='56' r='16' style='stroke: #9558b2; fill: #aa79c1' />
  </g>
</svg>
""")
```

<svg width='82' height='76' xmlns='http://www.w3.org/2000/svg'>
  <g style='stroke-width: 3'>
    <circle cx='20' cy='56' r='16' style='stroke: #cb3c33; fill: #d5635c' />
    <circle cx='41' cy='20' r='16' style='stroke: #389826; fill: #60ad51' />
    <circle cx='62' cy='56' r='16' style='stroke: #9558b2; fill: #aa79c1' />
  </g>
</svg>


With a mixture of single and double quotes:


```julia
using .InlineSVG
SVG("""
<svg width='82' height='76' xmlns='http://www.w3.org/2000/svg'>
  <g style='stroke-width: 3'>
    <circle cx='20' cy='56' r='16' style='stroke: #cb3c33; fill: #d5635c' />
    <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" />
    <circle cx='62' cy='56' r='16' style='stroke: #9558b2; fill: #aa79c1' />
  </g>
</svg>
""")
```

<svg width='82' height='76' xmlns='http://www.w3.org/2000/svg'>
  <g style='stroke-width: 3'>
    <circle cx='20' cy='56' r='16' style='stroke: #cb3c33; fill: #d5635c' />
    <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" />
    <circle cx='62' cy='56' r='16' style='stroke: #9558b2; fill: #aa79c1' />
  </g>
</svg>


With viewBox and without xmlns, making the svg really large to test that it is resized correctly:


```julia
using .InlineSVG
SVG("""
<svg width="8200" height="7600" viewBox="0 0 82 76">
  <g style="stroke-width: 3">
    <circle cx="20" cy="56" r="16" style="stroke: #cb3c33; fill: #d5635c" />
    <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" />
    <circle cx="62" cy="56" r="16" style="stroke: #9558b2; fill: #aa79c1" />
  </g>
</svg>
""")
```

<svg width="8200" height="7600" viewBox="0 0 82 76">
  <g style="stroke-width: 3">
    <circle cx="20" cy="56" r="16" style="stroke: #cb3c33; fill: #d5635c" />
    <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" />
    <circle cx="62" cy="56" r="16" style="stroke: #9558b2; fill: #aa79c1" />
  </g>
</svg>


Without viewBox and without xmlns, making the svg really large to test that it is resized correctly:


```julia
using .InlineSVG
SVG("""
<svg width="8200" height="7600">
  <g style="stroke-width: 300">
    <circle cx="2000" cy="5600" r="1600" style="stroke: #cb3c33; fill: #d5635c" />
    <circle cx="4100" cy="2000" r="1600" style="stroke: #389826; fill: #60ad51" />
    <circle cx="6200" cy="5600" r="1600" style="stroke: #9558b2; fill: #aa79c1" />
  </g>
</svg>
""")
```

<svg width="8200" height="7600">
  <g style="stroke-width: 300">
    <circle cx="2000" cy="5600" r="1600" style="stroke: #cb3c33; fill: #d5635c" />
    <circle cx="4100" cy="2000" r="1600" style="stroke: #389826; fill: #60ad51" />
    <circle cx="6200" cy="5600" r="1600" style="stroke: #9558b2; fill: #aa79c1" />
  </g>
</svg>


*Note: we can't define the `show` method in the `@example` block due to the world age counter in Julia 0.6 (Documenter's `makedocs` is not aware of any of the new method definitions happening in `eval`s).*


We can also show SVG images with interactivity via the `text/html` MIME to display output that combines HTML, JS and CSS. Assume the following type and method live in the `InlineHTML` modeul


```julia
struct HTML
    code::String
end
Base.show(io, ::MIME"text/html", html::HTML) = write(io, read(html.code))
```


.. then we can invoke and show them with an `@example` block (try mousing over the circles to see the applied style):




```julia
using .InlineHTML
InlineHTML.HTML("""
<script>
  function showStyle(e) {
    document.querySelector("#inline-html-style").innerHTML = e.getAttribute('style');
  }
</script>
<svg width="100%" height="76">
  <g style="stroke-width: 3">
    <circle cx="20" cy="56" r="16" style="stroke: #cb3c33; fill: #d5635c" onmouseover="showStyle(this)"/>
    <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" onmouseover="showStyle(this)"/>
    <circle cx="62" cy="56" r="16" style="stroke: #9558b2; fill: #aa79c1" onmouseover="showStyle(this)"/>
    <text id="inline-html-style" x="90", y="20"></text>
  </g>
</svg>
""")
```

<script>
  function showStyle(e) {
    document.querySelector("#inline-html-style").innerHTML = e.getAttribute('style');
  }
</script>
<svg width="100%" height="76">
  <g style="stroke-width: 3">
    <circle cx="20" cy="56" r="16" style="stroke: #cb3c33; fill: #d5635c" onmouseover="showStyle(this)"/>
    <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" onmouseover="showStyle(this)"/>
    <circle cx="62" cy="56" r="16" style="stroke: #9558b2; fill: #aa79c1" onmouseover="showStyle(this)"/>
    <text id="inline-html-style" x="90", y="20"></text>
  </g>
</svg>


The same mechanism also works for PNG files. Assuming again the following type and method live in the `InlinePNG` module


```julia
struct PNG
    filename::String
end
Base.show(io, ::MIME"image/png", png::PNG) = write(io, read(png.filename))
```


.. then we can invoke and show them with an `@example` block:




```julia
using Documenter
using .InlinePNG
PNG(joinpath(dirname(pathof(Documenter)), "..", "test", "examples", "images", "logo.png"))
```

![](RANDOM.png)


.. and JPEG, GIF and WebP files:




```julia
using Documenter
using .InlineWEBPGIFJPEG
WEBP(joinpath(dirname(pathof(Documenter)), "..", "test", "examples", "images", "logo.webp"))
```

![](RANDOM.webp)


```julia
GIF(joinpath(dirname(pathof(Documenter)), "..", "test", "examples", "images", "logo.gif"))
```

![](RANDOM.gif)


```julia
JPEG(joinpath(dirname(pathof(Documenter)), "..", "test", "examples", "images", "logo.jpg"))
```

![](RANDOM.jpeg)


<a id='Interacting-with-external-files'></a>

<a id='Interacting-with-external-files-1'></a>

## Interacting with external files


You can also write output files and then refer to them in the document:


```julia
open("julia.svg", "w") do io
    write(io, """
    <svg width="82" height="76" xmlns="http://www.w3.org/2000/svg">
      <g style="stroke-width: 3">
        <circle cx="20" cy="56" r="16" style="stroke: #cb3c33; fill: #d5635c" />
        <circle cx="41" cy="20" r="16" style="stroke: #389826; fill: #60ad51" />
        <circle cx="62" cy="56" r="16" style="stroke: #9558b2; fill: #aa79c1" />
      </g>
    </svg>
    """)
end
```


```
339
```


![Julia circles](julia.svg)


Dowload [`data.csv`](data.csv).


<a id='[Links](../index.md)-in-headers'></a>

<a id='[Links](../index.md)-in-headers-1'></a>

## [Links](../index.md) in headers


... are dropped in the navigation links.


<a id='Embedding-raw-HTML'></a>

<a id='Embedding-raw-HTML-1'></a>

## Embedding raw HTML


Below is a nicely rendered version of `^D`:


<kbd>Ctrl</kbd> + <kbd>D</kbd>


<a id='Tables'></a>

<a id='Tables-1'></a>

## Tables


| object | implemented |      value |
| ------:| -----------:| ----------:|
|    `A` |           ✓ |      10.00 |
|   `BB` |           ✓ | 1000000.00 |


With explicit alignment.


| object | implemented |      value |
|:------ |:-----------:| ----------:|
| `A`    |      ✓      |      10.00 |
| `BB`   |      ✓      | 1000000.00 |


<a id='Customizing-assets'></a>

<a id='Customizing-assets-1'></a>

## Customizing assets


The following example only works on the deploy build where


```julia
mathengine = MathJax2(Dict(
    :TeX => Dict(
        :equationNumbers => Dict(:autoNumber => "AMS"),
        :Macros => Dict(
            :ket => ["|#1\\rangle", 1],
            :bra => ["\\langle#1|", 1],
            :pdv => ["\\frac{\\partial^{#1} #2}{\\partial #3^{#1}}", 3, ""],
        ),
    ),
)),
```


or on MathJax v3, the [physics package](http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/physics/physics.pdf) can be loaded:


```julia
mathengine = MathJax3(Dict(
    :loader => Dict("load" => ["[tex]/physics"]),
    :tex => Dict(
        "inlineMath" => [["\$","\$"], ["\\(","\\)"]],
        "tags" => "ams",
        "packages" => ["base", "ams", "autoload", "physics"],
    ),
)),
```


$$
\bra{x}\ket{y}
\pdv[n]{f}{x}
$$


The following at-raw block only renders correctly on the deploy build, where


```julia
assets = [
  asset("https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap", class=:css),
  ...
]
```


<div style="font-family: 'Nanum Brush Script'; text-align: center; font-size: xx-large;">
Hello World!
<br />
Written in <a href="https://fonts.google.com/specimen/Nanum+Brush+Script">Nanum Brush Script.</a>
</div>


<a id='Handling-of-text/latex'></a>

<a id='Handling-of-text/latex-1'></a>

## Handling of `text/latex`


You can define a type that has a `Base.show` method for the `text/latex` MIME:


```julia
struct LaTeXEquation
    code :: String
end
Base.show(io, ::MIME"text/latex", latex::LaTeXEquation) = write(io, latex.code)
```


In an `@example` or `@eval` block, it renders as an equation:


```julia
LaTeXEquation(raw"Foo $x^2$ bar.")
```


```
Main.LaTeXEquation("Foo \$x^2\$ bar.")
```


Documenter also supports having the LaTeX text being already wrapped in `\[ ... \]`:


```julia
LaTeXEquation(raw"\[\left[ \begin{array}{rr}x&2 x\end{array}\right]\]")
```


```
Main.LaTeXEquation("\\[\\left[ \\begin{array}{rr}x&2 x\\end{array}\\right]\\]")
```


or wrapped in `$$ ... $$`:


```julia
LaTeXEquation(raw"$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$$")
```


```
Main.LaTeXEquation("\$\$\\begin{bmatrix} 1 & 2 \\\\ 3 & 4 \\end{bmatrix}\$\$")
```


---


Extra tests for handling multi-line equations ([#1518](https://github.com/JuliaDocs/Documenter.jl/pull/1518)):


```julia
LaTeXEquation(raw"""
\[
    \left[
        \begin{array}{rr}
            x & 2x
        \end{array}
    \right]
\]
""")
```


```
Main.LaTeXEquation("\\[\n    \\left[\n        \\begin{array}{rr}\n            x & 2x\n        \\end{array}\n    \\right]\n\\]\n")
```


```julia
LaTeXEquation(raw"""$$
\begin{bmatrix}
    1 & 2 \\
    3 & 4
\end{bmatrix}
$$""")
```


```
Main.LaTeXEquation("\$\$\n\\begin{bmatrix}\n    1 & 2 \\\\\n    3 & 4\n\\end{bmatrix}\n\$\$")
```


Without `raw""` strings we have to double-escape our `\` and `$`:


```julia
LaTeXEquation("\\[\\left[\\begin{array}{rr} x & 2x \\\\ \n y & y \\end{array}\\right]\\]")
```


```
Main.LaTeXEquation("\\[\\left[\\begin{array}{rr} x & 2x \\\\ \n y & y \\end{array}\\right]\\]")
```


```julia
LaTeXEquation("\$\$\\begin{bmatrix} 1 & 2 \\\\ \n 3 & 4 \\end{bmatrix}\$\$")
```


```
Main.LaTeXEquation("\$\$\\begin{bmatrix} 1 & 2 \\\\ \n 3 & 4 \\end{bmatrix}\$\$")
```

