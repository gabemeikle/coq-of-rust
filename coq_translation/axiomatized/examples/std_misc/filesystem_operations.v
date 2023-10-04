(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter cat :
    forall `{H' : State.Trait},
    (ref std.path.Path) ->
      M (H := H') (std.io.error.Result alloc.string.String).

Parameter echo :
    forall `{H' : State.Trait},
    (ref str) -> (ref std.path.Path) -> M (H := H') (std.io.error.Result unit).

Parameter touch :
    forall `{H' : State.Trait},
    (ref std.path.Path) -> M (H := H') (std.io.error.Result unit).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
