(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter drink : (Ty.apply (Ty.path "ref") [Ty.path "str"]) -> Ty.path "unit".

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : Ty.path "unit".
