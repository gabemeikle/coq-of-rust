(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    let cmd = 0xd1;
    unsafe {
        asm!("out 0x64, eax", in("eax") cmd);
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* cmd : M.Val i32.t :=
      let* α0 : M.Val i32.t := M.alloc 209 in
      M.copy α0 in
    let _ : M.Val unit := InlineAssembly in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
