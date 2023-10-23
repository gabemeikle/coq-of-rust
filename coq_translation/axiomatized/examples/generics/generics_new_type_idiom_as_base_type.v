(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Years.
  Section Years.
    Context `{State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : i64;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
  End Years.
End Years.
Definition Years `{State.Trait} : Set := M.val Years.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
