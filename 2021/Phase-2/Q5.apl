:Namespace Q5
⍝ Lexicographical ordering
⍝ Part 1:
	⍝ Works perfectly with all edge cases and base but hacky and inefficient
	⍝ lexf←{↓(,⍵)[↑⍵∘{⍵/⍨∧/¨⍵≤≢,⍺}∪⍺↑¨,∘.,⍣(0⌈⍺-1)⍨⍳≢⍵]}
	⍝ Base decoding method:
	⍝ Essentially, decoding each number in [0,⍺*⍨≢⍵) gices a lexographically ordered list of required indices.
	⍝ This is then indexed into and split into rows.
	lexf←{↓⍵[⍉1+(⍺/≢⍵)⊤¯1+⍳⍺*⍨≢⍵]}
⍝ Part 2:
	⍝ A bit more complex. I used recursion, but there's probably an iterative way to generate the indices.
	⍝ Mostly done with the help of college textbooks.
	lexv←{
		w←⍵
		Inner←{a←⍺ ⋄ ⍺=1:⍵ ⋄ ⊃,/{(⊂⍵),(a-1)Inner ⍵∘,¨w}¨⍵} ⍝ Recursion is done with name here since using ∇ is quite messy.
		⍺ Inner ,¨⍵
	}
:EndNamespace
