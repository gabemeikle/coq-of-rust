(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter is_odd : forall `{H' : State.Trait}, u32 -> M (H := H') bool.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
