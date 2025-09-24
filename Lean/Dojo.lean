import Mathlib

namespace Dojo

theorem add_zero (n : Nat) (x : Nat) : n + 0 = n := by
    induction n with
    | zero => rfl
    | succ k ih => simp



end Dojo
