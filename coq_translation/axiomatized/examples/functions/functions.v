(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, unit -> M (H := H) unit.

Parameter is_divisible_by : forall `{H : State.Trait}, u32->
    u32
    -> M (H := H) bool.

Parameter fizzbuzz : forall `{H : State.Trait}, u32 -> M (H := H) unit.

Parameter fizzbuzz_to : forall `{H : State.Trait}, u32 -> M (H := H) unit.
