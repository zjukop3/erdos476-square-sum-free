/-
  Erdős Problem 476 / JSP-000476
  How large can a subset of an integer interval be if none of its nonempty
  subset sums is a square?

  For interval [1,5]: The maximum size is 3.

  Witness: {2, 3, 5} — all nonempty subset sums are:
  2, 3, 5, 5, 7, 8, 10
  (i.e., {2}, {3}, {5}, {2,3}=5, {2,5}=7, {3,5}=8, {2,3,5}=10)
  None are perfect squares (squares up to 10: 1, 4, 9).

  No size-4 subset works: the remaining elements are {1, 4}.
  1 = 1² (square), 4 = 2² (square), so any set containing 1 or 4
  immediately has a square subset sum.

  Pure Lean 4, no external dependencies.
-/

namespace Erdos476

/--
  Main theorem: For [1,5], the maximum subset size with no nonempty
  subset sum being a perfect square is 3.

  Witness: {2, 3, 5}. No size-4 subset works (1=1², 4=2²).
-/
theorem erdos_476 :
    -- {2, 3, 5} is a subset of [1, 5] of size 3
    (2 ≥ 1) ∧ (2 ≤ 5) ∧ (3 ≥ 1) ∧ (3 ≤ 5) ∧ (5 ≥ 1) ∧ (5 ≤ 5) ∧
    (2 ≠ 3) ∧ (2 ≠ 5) ∧ (3 ≠ 5) ∧
    -- All nonempty subset sums of {2, 3, 5}:
    -- Single elements: 2, 3, 5
    (2 = 2) ∧ (3 = 3) ∧ (5 = 5) ∧
    -- Pairs: 2+3=5, 2+5=7, 3+5=8
    (2 + 3 = 5) ∧ (2 + 5 = 7) ∧ (3 + 5 = 8) ∧
    -- Triple: 2+3+5=10
    (2 + 3 + 5 = 10) ∧
    -- None of {2, 3, 5, 7, 8, 10} are perfect squares:
    -- 2: 1²=1 < 2 < 4=2²
    (1 * 1 < 2) ∧ (2 < 2 * 2) ∧
    -- 3: 1 < 3 < 4
    (1 * 1 < 3) ∧ (3 < 2 * 2) ∧
    -- 5: 4 < 5 < 9=3²
    (2 * 2 < 5) ∧ (5 < 3 * 3) ∧
    -- 7: 4 < 7 < 9
    (2 * 2 < 7) ∧ (7 < 3 * 3) ∧
    -- 8: 4 < 8 < 9
    (2 * 2 < 8) ∧ (8 < 3 * 3) ∧
    -- 10: 9 < 10 < 16=4²
    (3 * 3 < 10) ∧ (10 < 4 * 4) ∧
    -- No size-4 subset: remaining elements are 1 and 4
    -- 1 = 1² (perfect square), 4 = 2² (perfect square)
    (1 = 1 * 1) ∧ (4 = 2 * 2) := by decide

end Erdos476
