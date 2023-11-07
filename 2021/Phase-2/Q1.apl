:Namespace Q1
⍝ Bowling!

⍝ Helper function to get all matches
    RollNumbers←('-',(1↓⎕D),'X/')∘⍳
    Sets←{ ⍝ X is the only thing that doesn't take up two characters, so pad and split into twos.
        w←('X'⎕R'XX')⍵
        w⊂⍨(18⍴1 0),((≢w)-18)↑1
    }


⍝ Now, in order to be valid:
⍝ 1. Rank must be 1 → 1 = ≢⍴⍵
⍝ 2. size must be correct.
LastSet←{ ⍝ check the last set
    ≢⍵<2:0
    ∧/(2↑⍵)∊⎕D:2=≢⍵ ⍝ no bonus without the below conditions
    revert ← ('XX'⎕R(,'X'))⍵
    'XX'≡2↑⍵:(3=≢revert)∧∧/(2↓⍵)∊⎕D,'X-' ⍝ Strike - 2 bonus rolls
    ((⊃⍵)∊⎕D)∧'/'=2⊃⍵:(3=≢revert)∧(⊃⌽⍵)∊⎕D,'X-' ⍝ spare - 1 bonus roll
    0
}
FirstSets ← {
    'XX'≡⍵:1
    ((⊃⍵)∊⎕D)∧'/-'∊⍨⊃⌽⍵:1
    ∧/⍵∊⎕D:10≥+/⍎¨⍵
    0
}
ValidGame ← {
    1≠≢⍴⍵:0
    11>≢⍵:0 ⍝ Minimum game size 11: XXXXXXXXX11
    sets←Sets ⍵
    10≠≢sets:0
    (LastSet ⊃⌽sets) ∧ ∧/FirstSets¨¯1↓sets
}
  ⍝ Part 2:
  lastSetScore←{
    'XX'≡2↑⍵:10++/(1↓⎕D,'X')⍳1↓⍺ ⍝ Strike condition: next two rolls
    '/'=2⊃⍵:10+(1↓⎕D,'X')⍳3⊃⍵ ⍝ Spare condition: next roll
    ¯1+⍵⍳⍨'-',1↓⎕D,'X'
  }
  BowlingScore←{ ⍝ Assumes that 1 = ValidGame ⍵.
    sets←Sets ⍵
    setScores←{'X'=⊃⍵:11⋄'/'=⊃⌽⍵:10⋄+/¯1+('-',1↓⎕D)⍳⍵}¨¯1↓sets ⍝ strike is 11, spare is 10
    rev←('XX'⎕R(,'X'))⊃⌽sets ⍝ convert back to original form(reverse)
    lScore← rev lastSetScore ⊃⌽sets
    setScores,←lScore
    nextRolls←9↑1↓2↑¨2,/0,⍨¯1+('-',1↓⎕D)∘⍳¨{'X'=⊃⍵:1↑⍵⋄'/'=2⊃⍵:(⊃⍵),⍕10-⍎⊃⍵⋄⍵}¨sets,⊂'00' ⍝ A bit spaghetti, but what it does is:
                                                                                          ⍝ 1. add an empty roll to the end
                                                                                          ⍝ 2. add extra rolls for each
                                                                                          ⍝ 3. assign point value
    bonus←+/¨((≢nextRolls)↑¯1↓3|10 11⍳setScores)↑¨nextRolls ⍝ Take the right number of rolls for each and sum
    +\(setScores-11=setScores)+(≢setScores)↑bonus,0 ⍝ add the bonuses and addition scan
  }
:EndNamespace
