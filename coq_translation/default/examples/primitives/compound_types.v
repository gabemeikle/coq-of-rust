(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let logical : bool := true in
  let a_float : f64 := 1 (* 1.0 *) in
  let an_integer := 5 in
  let default_float := 3 (* 3.0 *) in
  let default_integer := 7 in
  let inferred_type := 12 in
  let* _ := assign inferred_type 4294967296 in
  let mutable := 12 in
  let* _ := assign mutable 21 in
  let mutable := true in
  Pure tt.
