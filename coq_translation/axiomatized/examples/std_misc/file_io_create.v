(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter LOREM_IPSUM : forall `{H' : State.Trait}, ref str.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
