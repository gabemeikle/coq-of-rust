(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter NTHREADS : forall `{H' : State.Trait}, u32.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
