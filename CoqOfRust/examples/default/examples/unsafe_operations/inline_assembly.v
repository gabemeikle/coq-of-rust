(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    unsafe {
        asm!("nop");
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let _ := InlineAssembly in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
