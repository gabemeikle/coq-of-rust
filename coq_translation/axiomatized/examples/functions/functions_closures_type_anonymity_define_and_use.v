(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter apply : forall
    {F : Set},
    `{core.ops.function.Fn.Trait unit F}
    F
    -> M unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
