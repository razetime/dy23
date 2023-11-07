:Namespace Q3
⍝ Q3: Split evenly

Divvy←{
	l←≢⍵
	s←⌊l÷⍺   ⍝ First few groups are of size length÷n (Floor division)
	         ⍝ Rest are of size s + 1.
	x←⍺-⍺|l
	⍝ 0⌈⍺-n is for adding empty elements if applicable(that is, n > l)
	⍝ Uses the special case in dyadic ⊂ where last element denotes extra partitions
	⍝ There might be a cleaner way to do this by specifying number of partitions
	(,⍵)⊂⍨(0⌈⍺-l),⍨⊃,/↑∘1¨(x,⍺-x)/s+0 1
}
	
:EndNamespace