
<a id='Style-demos'></a>

<a id='Style-demos-1'></a>

# Style demos


<a id='Styling-of-lists'></a>

<a id='Styling-of-lists-1'></a>

## Styling of lists


  * Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  * Nulla quis venenatis justo.
  * In non *sodales* eros.


In an admonition it looks like this:


!!! note "Bulleted lists in admonitions"
      * Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      * Nulla quis venenatis justo.
      * In non *sodales* eros.

    Second list

      * Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      * Nulla quis venenatis justo.
      * In non *sodales* eros.



Also, custom admonition classes can be used:


!!! myadmonition "My Admonition Class"
    In the HTML output, this admonition has `is-category-myadmonition` applied to it. Its style can be changed by adding styles to `.admonition-header` and `.admonition-body` in a custom css file and adding it to the build with, for example:

    ```julia
    makedocs(
        # ...
        format=Documenter.HTML(;
            #...
            assets=["assets/custom.css"]
        )
    )
    ```

    See [`test/examples/src/assets/custom.css`](https://github.com/JuliaDocs/Documenter.jl/blob/master/test/examples/src/assets/custom.css) for an example of a custom CSS file.



But otherwise


  * Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  * Nulla quis venenatis justo.
  * In non *sodales* eros.


In block quotes


>   * Lorem ipsum dolor sit amet, consectetur adipiscing elit.
>   * Nulla quis venenatis justo.
>   * In non *sodales* eros.
>
> Second list
>
>   * Lorem ipsum dolor sit amet, consectetur adipiscing elit.
>   * Nulla quis venenatis justo.
>   * In non *sodales* eros.



!!! note
    1. asd
    2. asdf



<a id='Links-and-code-spans'></a>

<a id='Links-and-code-spans-1'></a>

## Links and code spans


Lorem [ipsum](#) dolor sit [`amet`](#), consectetur adipiscing `elit`.


<a id='Code-blocks'></a>

<a id='Code-blocks-1'></a>

## Code blocks


```julia
foo = "Example of string $(interpolation)."
```


<a id='Footnote-rendering'></a>

<a id='Footnote-rendering-1'></a>

## Footnote rendering


This sentence has a footnote.[^5]


[^5]:
    An example of how you can benchmark a log density with gradient `∇P`, obtained as described below:

    ```julia
    using BenchmarkTools, LogDensityProblems
    x = randn(LogDensityProblems.dimension(∇P))
    @benchmark LogDensityProblems.logdensity_and_gradient($∇P, $x)
    ```



<a id='Math'></a>

<a id='Math-1'></a>

## Math


Inline: $\frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}$


Display equation:


$$
\frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}
$$


!!! note "Long equations in admonitions"
    Inline: $\frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}$

    Display equation:

    $$
    \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}
    $$



Long equations in footnotes.[^longeq]


[^longeq]:
    Inline: $\frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}$

    Display equation:

    $$
    \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}
    $$


<a id='Main.Mod.long_equations_in_docstrings' href='#Main.Mod.long_equations_in_docstrings'>#</a>
**`Main.Mod.long_equations_in_docstrings`** &mdash; *Function*.



Inline: $\frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}$

Display equation:

$$
\frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}
$$

!!! note "Long equations in admonitions"
    Inline: $\frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}$

    Display equation:

    $$
    \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}
    $$


Long equations in footnotes.[^longeq-footnote]

[^longeq-footnote]:

````
Inline: ``\frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}``

Display equation:

```math
\frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2} + \frac{1+2+3+4+5+6}{\sigma^2}
```
````


<a target='_blank' href='https://github.com/ufechner7/DocumenterMarkdown.jl/blob/COMMIT/test/example/make.jl#L22-L52' class='documenter-source'>source</a><br>

