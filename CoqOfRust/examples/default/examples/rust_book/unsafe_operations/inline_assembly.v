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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let _ : Ty.tuple := InlineAssembly in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
