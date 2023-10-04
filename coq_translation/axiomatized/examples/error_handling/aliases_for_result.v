(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition AliasedResult (T : Set) : Set :=
  core.result.Result T core.num.error.ParseIntError.

Parameter multiply :
    forall `{H' : State.Trait},
    (ref str) ->
      (ref str) ->
      M (H := H') (aliases_for_result.AliasedResult i32).

Parameter print :
    forall `{H' : State.Trait},
    (aliases_for_result.AliasedResult i32) -> M (H := H') unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
