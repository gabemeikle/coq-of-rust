(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter call_me : (list Ty.t) -> (list Value.t) -> M.

Parameter function : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
