:Namespace Q6
⍝ Battleship
⍝ Pretty fun game.

⍝ Task 1
⍝ operator which validates a battle
⍝ (Who are we to determine the validity of battles? smh)
⍝ Works with the empty and zero edge cases

FleetFinder←{⍸¨⍵∘=¨⍳⌈/,⍵} ⍝ Gets the fleets froma a board.

ValidBoard←{
	⍝ Reference:
	⍝ ⍺⍺ → board size
	⍝ ⍵⍵ → fleet sizes in order
	⍝ ⍵ → board as matrix
		⍝ Special case for 0 0⍴0:
		(∨/0=⍴⍵)∧⍬≡⍵⍵:1
  		(∨/0=⍴⍵)∧⍬≢⍵⍵:0
		fleets ← FleetFinder ⍵
  ⍝ ⍺⍺≡⍴⍵ shape match?
		⍝ Reminder to self that all the points can't be the same for the above since we're taking distinct pts from a matrix.
		⍝ ⍵⍵≡≢¨ships check ship lengths
		⍝ Points have to be collinear and 1 unit away from each other.
		⍝ checks are in the following order:
		⍝  ∘ shape match
		⍝  ∘ fleet lengths match
		⍝  ∘ validity of each fleet
		(⍺⍺≡⍴⍵)∧(⍵⍵≡≢¨fleets)∧∧/{2>≢⍵:1⋄∧/0 1∘≡¨{⍵[⍋⍵]}¨|2-/⍵}¨fleets
}

⍝ Tests(All passed):
  ⍝ (3 3 Q6.ValidBoard 2 3 2 1)3 3⍴2 2 2 1 3 3 1 0 4 ⍝ 1
  ⍝ (3 3 Q6.ValidBoard 2 3 2 1) ⎕←3 3⍴2 2 2 1 3 3 0 1 4 ⍝ 0
  ⍝ (3 3 Q6.ValidBoard 2 3 2 1) ⎕←3 3⍴2 2 2 1 3 3 1 5 4 ⍝ 0
  ⍝ (3 3 Q6.ValidBoard 2 3 2 1) ⎕←3 3⍴0 2 2 1 3 3 1 0 4 ⍝ 0
  ⍝ (3 3 Q6.ValidBoard ⍬) ⎕←3 3⍴0 ⍝ 1
  ⍝ (4 3 Q6.ValidBoard 2 3 2 1) ⎕←3 3⍴2 2 2 1 3 3 1 0 4 ⍝ 0
  ⍝ (3 3 Q6.ValidBoard 2 3 2 1) ⎕←3 3⍴2 2 2 3 1 3 0 1 4 ⍝ 0
  ⍝ (0 0 Q6.ValidBoard 2 3 2 1) 0 0⍴0 ⍝ 0
  ⍝ (0 0 Q6.ValidBoard ⍬) 0 0⍴0 ⍝ 1

  ⍝ Task 2
  ⍝ Due to intersections, get midpoints and check if there are no common midpoints between any lines.
  ⍝ Since diagonals are allowed, now we only need to check distance instead of deltas.
  ⍝ The rest of the logic remains the same.

ValidBoard2←{
	⍝ Same idea as the previous.
	(∨/0=⍴⍵)∧⍬≡⍵⍵:1
	(∨/0=⍴⍵)∧⍬≢⍵⍵:0
  fleets ← FleetFinder ⍵
  fleetDistCheck ← ∧/{∧/3>2(+/×⍨⍤-)/⍵}¨fleets ⍝ Check distances of all points (<3?)
	fleetBetween ← (⊢≡∪)⊃,/(.5×+)/¨fleets ⍝ Are all points in between unique?
	(⍺⍺≡⍴⍵)∧(⍵⍵≡≢¨fleets)∧fleetDistCheck∧fleetBetween ⍝ Bring all the logic together
}

  ⍝ Tests(All Passed):
  ⍝ (2 2 Q6.ValidBoard2 2 2) ⎕←2 2⍴1 2 2 1 ⍝ 0
  ⍝ ⎕←board←3 3⍴2 2 2 1 3 3 0 1 4
  ⍝ (3 3 Q6.ValidBoard2 2 3 2 1) board ⍝ 1
  ⍝ (3 3 Q6.ValidBoard2 1 2 3 2 1) ⎕←3 3⍴1 2 3 2 3 4 3 4 5 ⍝ 1
  ⍝ (3 3 Q6.ValidBoard2 3 2 2) ⎕←3 3⍴1 1 1 0 2 0 2 3 3 ⍝ 1
  ⍝ (0 0 Q6.ValidBoard2 ⍬) 0 0⍴0

:EndNamespace
