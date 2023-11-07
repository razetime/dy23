:Namespace Q7
⍝ Finding subsequences.

⍝ Part 1:
    sseq1 ← {
        seqs ← ⊃{⊃,/↓⍺∘.,⍵}/⍸¨↓⍵∘.=⍺ ⍝ find all index combos via cartesian power
        seqs ← seqs/⍨{∧/2</⍵}¨seqs  ⍝ Check if in order
        (0≠≢seqs)(⊃seqs)
    }
    sseq ← {⍺ sseq1⍥,⍵} ⍝ convert both to vectors to prevent errors.

⍝ Part 2:
    ⍝ Builds a comparison matrix. Each row is converted to indices.
    ⍝ join each index with the ones greater than it. reduce each row this way.
    ⍝ then, take the first sequence with longest length.
    lcsq←{
      (0=≢⍺)∨0=≢⍵:''
      ind←{⊃⍵[⍒≢¨⍵]}⊃{⍵,{⍵/⍨∧/¨2</¨⍵},⍺∘.,⍵}/⍸¨↓⍺∘.=⍵ ⍝ at each fold iteration,
                                                      ⍝ removes all sequences not in order.
      ∧/ind>0:⍵[ind] ⍝ 0 comes up as a sentinel value from ⊃ so check for that
      ''
    }
    ⍝ Test Suite:
    ⍝ 'AACCTTGG' #.Q7.lcsq 'ACACTGTGA' ⍝ AACTTG, ACCTTG, ACCTGG are also valid results ⍝ AACTGG 
    ⍝ 'ACGTACGTGACG' #.Q7.lcsq '' ⍝ returns empty
    ⍝ 'ACGTACGTGACG' #.Q7.lcsq 'XYZZYX' ⍝ returns empty

:EndNamespace
