(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter increase : forall `{H' : State.Trait}, i32 -> M (H := H') unit.

Parameter decrease : forall `{H' : State.Trait}, i32 -> M (H := H') unit.

Parameter help : forall `{H' : State.Trait}, M (H := H') unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
