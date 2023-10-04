(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module WebEvent.
  Module Click.
    Unset Primitive Projections.
    Record t : Set := {
      x : i64;
      y : i64;
    }.
    Global Set Primitive Projections.
  End Click.
  
  Inductive t : Set :=
  | PageLoad
  | PageUnload
  | KeyPress (_ : char)
  | Paste (_ : alloc.string.String)
  | Click (_ : Click.t).
End WebEvent.
Definition WebEvent : Set := WebEvent.t.

Parameter inspect :
    forall `{H' : State.Trait},
    enums.WebEvent -> M (H := H') unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
