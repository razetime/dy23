∇Q1
⍝ Problem 1

f←{100×(+/⍵∊'CG')÷≢⍵}

ft←100×(+/∊∘'GC'÷≢)   ⍝ Same, but tacit

f 'GCGCGCGCCCGGGGCCG'
f 'ACGTACGTACGTACGT'
f 10 12 16 10/'ACGT'
∇
