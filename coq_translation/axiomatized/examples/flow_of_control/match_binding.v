(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter age : forall `{H : State.Trait}, unit -> M (H := H) u32.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, unit -> M (H := H) unit.
