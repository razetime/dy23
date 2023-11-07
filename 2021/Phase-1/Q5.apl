∇Q5

⍝ Rect-ify

f←{0=⍵:1⍵⋄{⍵[⍋⍵]}(⊢,⍵∘÷)⊃⌽x/⍨0=⍵|⍨x←⍳⌈⍵*0.5}

⍝ pretty ugly special casing, will change once the question is corrected

f 12
f 16
f¨⍳19
f¨¨999999 1000000
∇
