(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter combine_vecs_explicit_return_type : forall
      `{H : State.Trait},
      alloc.vec.Vec i32->
    alloc.vec.Vec i32
    ->
      M (H := H)
        (core.iter.adapters.cycle.Cycle
          (core.iter.adapters.chain.Chain
            (alloc.vec.into_iter.IntoIter i32)
            (alloc.vec.into_iter.IntoIter i32))).

Parameter combine_vecs : forall `{H : State.Trait}, alloc.vec.Vec i32->
    alloc.vec.Vec i32
    -> M (H := H) OpaqueDef.

Error OpaqueTy.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, unit -> M (H := H) unit.
