(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit := Pure tt.

Definition mul (a : u64) (b : u64) : M u128 :=
  let lo := tt in
  let hi := tt in
  let _ :=
    let _ := InlineAssembly in
    tt in
  let* α0 := cast hi in
  let* α1 := M.alloc 64 in
  let* α2 := shl α0 α1 in
  let* α3 := cast lo in
  add α2 α3.
