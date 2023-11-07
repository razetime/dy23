∇Q3
⍝ Multiplicity

⍝ interesting use for ⍥ (Over)

 f←{/∘⍵¨↓0=⍺∘.|⍥,⍵}

⍝ not really sure how to tacitify this in a non-clunky way

 Y←20?20
 2 4 7 3 9 f Y
 3 f ⍳10
 6 7 f 42
 2 3 5 f ⍬
 ⍬ f ⍳10
∇
