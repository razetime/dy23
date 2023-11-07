∇Q4

⍝ circle - square
⍝ since all elements are number, no requirement for ¨

 f←{(○×⍨⍵÷2)-×⍨⍵÷2*.5}

 f 2×⍳5
 f (2*0.5)×3 3⍴⍳9
∇