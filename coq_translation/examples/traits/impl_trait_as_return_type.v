(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter combine_vecs_explicit_return_type : alloc.vec.Vec i32->
    alloc.vec.Vec i32
    ->
      M
        (core.iter.adapters.cycle.Cycle
          (core.iter.adapters.chain.Chain
            (alloc.vec.into_iter.IntoIter i32)
            (alloc.vec.into_iter.IntoIter i32))).

Parameter combine_vecs : alloc.vec.Vec i32-> alloc.vec.Vec i32 -> M OpaqueDef.

Error OpaqueTy.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
