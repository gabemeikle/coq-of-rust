(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter increase : (Ty.path "i32") -> Ty.path "unit".

Parameter decrease : (Ty.path "i32") -> Ty.path "unit".

Parameter help : Ty.path "unit".

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : Ty.path "unit".
