:Namespace Q4
⍝ Going to (Local) Extremes

⍝ Get deltas, remove zeroes and get indices
⍝ get overlapping pairs(inflection in slope)
⍝ create range for each pair and check equality of signs on both ends
⍝ filter out those ranges, then get indices for each where self = middle elem?
⍝ Then average each group of indices.
⍝ So far, works fine for all tests.

MinMax←{
	w←⍵,3/⊃⌽⍵  ⍝ extend the array to prevent errors during check
	⍬≡w:⍬      ⍝ 2-/ fails on ⍬
	∧/0=2-/w:⍬ ⍝ no inflection? return 0
	a←⍵
	ranges←{((⊃⍵)-1)↓⍳1+⍵[2]}¨2,/⍸0≠2-/⍵ ⍝ find indices of increasing sections
	valid←ranges/⍨{{⍵[≢⍵]=-⊃⍵}×2-/a[⍵]}¨ranges
	{(+/÷≢)⍵/⍨{⍵=⍵[⌈.5×≢⍵]}a[⍵]}¨valid ⍝ Average each range which has an extremum
}

:EndNamespace