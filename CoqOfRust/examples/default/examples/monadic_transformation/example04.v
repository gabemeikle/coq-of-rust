(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let x = &1;
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x : Ty.apply (Ty.path "ref") [Ty.path "i32"] :=
      let* α0 : Ty.path "i32" := M.alloc ((Integer.of_Z 1) : Ty.path "i32") in
      M.alloc (borrow α0) in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
