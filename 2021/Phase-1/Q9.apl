∇Q9

⍝ There might be a better way to do this, but this works pretty well

f←{⌈/≢¨{⍵⊂⍨1,2≠/⍵}×2-/⍵}

f 1 2 3 5 5 5 6 4 3

f 1 2 3 4 4 4 4 4 5 4 3

f 1 2
∇
