(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // variable binding
    let x = 5;

    // expression;
    x;
    x + 1;
    15;
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* x : ltac:(refine (M.Val i32.t)) := M.alloc 5 in
    let _ := x in
    let* _ : ltac:(refine (M.Val i32.t)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 1 in
      BinOp.add x α0 in
    let* _ : ltac:(refine (M.Val i32.t)) := M.alloc 15 in
    M.alloc tt).
