(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter analyze_slice :
    forall `{H' : State.Trait},
    (ref (Slice i32)) -> M (H := H') unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
