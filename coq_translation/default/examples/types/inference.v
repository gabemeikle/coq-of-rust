(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let elem := 5 in
  let* vec := alloc.vec.Vec::["new"] in
  let* _ := vec.["push"] elem in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of vec) in
      let* α1 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
