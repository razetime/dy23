∇Q6

⍝ Fischer-random checking
⍝ Another good use for ⍥(Over)

f←{((⍵⍳'K')<⍸'R'=⍵)∧⍥(≠/)2|⍸'B'=⍵}

f 'RNBQKBNR'
f 'BBNRKNRQ'
f 'RBBNQNRK'
f 'BRBKRNQN'
∇
