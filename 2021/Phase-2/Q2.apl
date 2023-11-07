:Namespace Q2
⍝ Q2: Make a List
⍝ Time to use my favourite idiom: (≠⊆⊢)!
⍝ The page numbers can be partitioned at a digit - minus junction
⍝ Regex equivalent: \d-
⍝ then the rest is simply generating each range.


⍝ Similar to dyadic … in Dyalog Extended, but simpler
Range←{
    i←⍵-⍺
    ⍺+(×i)×0,⍳|i ⍝ use the delta to find out whether to add or subtract from ⍺
}
MakeList←{
    0=≢⍵:⍬ ⍝ Handle empty case
    ⍝           boolean array to slice at the correct minus
    ⍝                    ________↓_________
    ⍝                    |                |
    ⊃,/⊃¨Range/¨{⍎¨⍵⊆⍨~0,2{(⍵∊'-¯')∧⍺∊⎕D}/⍵}¨','(≠⊆⊢),⍵
}
:EndNamespace
