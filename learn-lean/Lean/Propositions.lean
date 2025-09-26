
-- import Mathlib

set_option linter.unusedVariables false

namespace Propositions

def Implies (p q : Prop) : Prop := p → q
structure Proof (p : Prop) : Type where proof : p

#check And
#check Prop

variable (p q r : Prop)

#check p → q
#check Implies

#check And p q
#check p ∧ q


axiom modus_ponens (p q : Prop) :
  Proof (p → q) -> Proof p -> Proof q

#check fun hp: p => fun hq : q => hp

theorem t1 : p → q → p :=
  fun hp: p => fun hq : q => hp

#print t1

theorem t1_1 : p → q → p :=
  fun hp : p =>
  fun hq : q =>
  show p from hp

#print t1_1

axiom hp : p

#check hp


axiom unsound : False
theorem ex : 1 = 0 :=
  False.elim unsound

#check ex




end Propositions
