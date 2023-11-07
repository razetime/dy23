∇Q2
⍝ Index Of, butreturns 0 instead of length + 1.

f←{(1+≢⍺)|⍺⍳⍵}

ft←((1+≢)⊣)|⍳  ⍝ Tacit version

'DYALOG' f 'APL'

(5 5⍴⎕A) f ↑'UVWXY' 'FGHIJ' 'XYZZY'

∇
