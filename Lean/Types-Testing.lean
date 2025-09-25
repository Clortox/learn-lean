import Mathlib

namespace TypesTesting

#check λ (x : Nat) => x + 5

#check Nat -> Bool

def α : Type := Nat
def β : Type := Bool

#check Prod α β
#check α × β

#check Type

#check List

#check Prod
#check max

#check 5 + true

universe u

def F (a : Type u) : Type u := Prod a a
#check F

#eval (fun x : Nat => x + 5) 10
#check fun x : Nat => x + 5

#check (λ (x : Nat) ( y : Bool ) => if y then x else x / 2) 5 True
#eval (λ (x : Nat) ( y : Bool ) => if y then x else x / 2) 5 False

#check fun (α β γ : Type) (g : β -> γ) (f : α -> β) (x : α) => g (f x)

-- naming a function for later eval
def myf (n : Nat) : String := toString n
#check myf
#eval (myf) 5

def foo := let a := Nat; fun x : a => x + 2
#check foo

end TypesTesting
