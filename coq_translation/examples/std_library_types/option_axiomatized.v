(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter checked_division : i32-> i32 -> M (core.option.Option i32).

Parameter try_division : i32-> i32 -> M unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
