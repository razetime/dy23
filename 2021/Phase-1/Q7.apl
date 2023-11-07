∇Q7

⍝ Check if magic square

f←1∘=≢∪((+/1 1∘⍉∘⌽),(+/1 1∘⍉),+⌿,+/) ⍝ Feels clunky

f 1 1⍴42
f 3 3⍴4 9 2 3 5 7 8 1 6
f 2 2⍴1 2 3 4
∇
