
<a id='Font-demo'></a>

<a id='Font-demo-1'></a>

# Font demo


```julia
using Documenter.Utilities.DOM
function font_demo_snippet(weight, style)
    @tags pre code div
    codeblock = pre(code[".language-julia-repl"]("""
    julia> for n in 0x2700:0x27bf
                Base.isidentifier(string(Char(n))) && print(Char(n))
        end
    ✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
    ✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
    ➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

    julia> ❤(s) = println("I ❤ \$(s)")
    ❤ (generic function with 1 method)

    julia> ❤("Julia")
    I ❤ Julia
    """))

    wrapping_div = if isnothing(weight) && isnothing(style)
        div
    else
        css_style = isnothing(weight) ? "" : "font-weight: $(weight);"
        css_style *= isnothing(style) ? "" : "font-style: $(style);"
        div[:style => css_style]
    end

    return wrapping_div(codeblock)
end
```


```
font_demo_snippet (generic function with 1 method)
```


<a id='Standard-font'></a>

<a id='Standard-font-1'></a>

## Standard font


```julia
font_demo_snippet(nothing, nothing)
```

<div><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

<a id='Different-weights:-100:100:900'></a>

<a id='Different-weights:-100:100:900-1'></a>

## Different weights: `100:100:900`


```julia
font_demo_snippet(100, nothing)
```

<div style="font-weight: 100;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

```julia
font_demo_snippet(200, nothing)
```

<div style="font-weight: 200;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

```julia
font_demo_snippet(300, nothing)
```

<div style="font-weight: 300;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

```julia
font_demo_snippet(400, nothing)
```

<div style="font-weight: 400;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

```julia
font_demo_snippet(500, nothing)
```

<div style="font-weight: 500;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

```julia
font_demo_snippet(600, nothing)
```

<div style="font-weight: 600;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

```julia
font_demo_snippet(700, nothing)
```

<div style="font-weight: 700;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

```julia
font_demo_snippet(800, nothing)
```

<div style="font-weight: 800;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

```julia
font_demo_snippet(900, nothing)
```

<div style="font-weight: 900;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

<a id='Italic-and-italic-@-900'></a>

<a id='Italic-and-italic-@-900-1'></a>

## Italic & italic @ 900


```julia
font_demo_snippet(nothing, "italic")
```

<div style="font-style: italic;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

```julia
font_demo_snippet(900, "italic")
```

<div style="font-weight: 900;font-style: italic;"><pre><code class="language-julia-repl">julia&gt; for n in 0x2700:0x27bf
            Base.isidentifier(string(Char(n))) &amp;&amp; print(Char(n))
    end
✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺
✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍❎❏❐❑❒❓❔❕❖❗❘❙❚❛❜❝❞❟❠❡❢❣❤❥❦❧➔➕➖➗➘➙➚➛➜➝➞➟➠➡
➢➣➤➥➦➧➨➩➪➫➬➭➮➯➰➱➲➳➴➵➶➷➸➹➺➻➼➽➾➿

julia&gt; ❤(s) = println(&quot;I ❤ $(s)&quot;)
❤ (generic function with 1 method)

julia&gt; ❤(&quot;Julia&quot;)
I ❤ Julia
</code></pre></div>

<a id='Unicode-rendering'></a>

<a id='Unicode-rendering-1'></a>

## Unicode rendering


Unicode rendering examples based on issues [#618](https://github.com/JuliaDocs/Documenter.jl/issues/618), [#1561](https://github.com/JuliaDocs/Documenter.jl/issues/1561).


```
'∀'  : Unicode U+2200 (category Sm: Symbol, math)
ERROR: StringIndexError("∀ x ∃ y", 2)
1 ⊻ 3:
```


```
┌────────────────────────────────────────────────────────────────────────────┐
│                                             ┌───────────────┐              │
│ HTTP.request(method, uri, headers, body) -> │ HTTP.Response ├──────────────┼┐
│   │                                         └───────────────┘              ││
│   │                                                                        ││
│   │    ┌──────────────────────────────────────┐       ┌──────────────────┐ ││
│   └───▶│ request(RedirectLayer, ...)          │       │ HTTP.StatusError │ ││
│        └─┬────────────────────────────────────┴─┐     └─────────▲────────┘ ││
│          │ request(BasicAuthLayer, ...)         │               │          ││
│          └─┬────────────────────────────────────┴─┐             │          ││
│            │ request(CookieLayer, ...)            │             │          ││
│            └─┬────────────────────────────────────┴─┐           │          ││
│              │ request(CanonicalizeLayer, ...)      │           │          ││
│              └─┬────────────────────────────────────┴─┐         │          ││
│                │ request(MessageLayer, ...)           ├─────────┼──────┐   ││
```


```
  ┌──────────────────────────────────────────────────────────────────────┐
1 │                             ▗▄▞▀▀▀▀▀▀▀▄▄                             │
  │                           ▄▞▘           ▀▄▖                          │
  │                         ▄▀                ▝▚▖                        │
  │                       ▗▞                    ▝▄                       │
  │                      ▞▘                      ▝▚▖                     │
  │                    ▗▀                          ▝▚                    │
  │                   ▞▘                             ▀▖                  │
  │                 ▗▞                                ▝▄                 │
  │                ▄▘                                   ▚▖               │
  │              ▗▞                                      ▝▄              │
  │             ▄▘                                         ▚▖            │
  │           ▗▀                                            ▝▚           │
  │         ▗▞▘                                               ▀▄         │
  │       ▄▀▘                                                   ▀▚▖      │
0 │ ▄▄▄▄▀▀                                                        ▝▀▚▄▄▄▖│
  └──────────────────────────────────────────────────────────────────────┘
  0                                                                     70
```


```
julia> pretty_table(data, display_size = (11,30))
┌────────┬────────┬────────┬──
│ Col. 1 │ Col. 2 │ Col. 3 │ ⋯
├────────┼────────┼────────┼──
│      1 │  false │    1.0 │ ⋯
│      2 │   true │    2.0 │ ⋯
│      3 │  false │    3.0 │ ⋯
│   ⋮    │   ⋮    │   ⋮    │ ⋱
└────────┴────────┴────────┴──
   1 column and 3 rows omitted
```

