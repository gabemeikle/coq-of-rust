(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter create_fn : unit -> M OpaqueDef.

Error OpaqueTy.

Parameter create_fnmut : unit -> M OpaqueDef.

Error OpaqueTy.

Parameter create_fnonce : unit -> M OpaqueDef.

Error OpaqueTy.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
