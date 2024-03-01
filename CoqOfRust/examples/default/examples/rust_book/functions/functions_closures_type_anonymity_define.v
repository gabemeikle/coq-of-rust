(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // `F` must be generic.
    fn apply<F>(f: F)
    where
        F: FnOnce(),
    {
        f();
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with | [], [] => M.pure tt | _, _ => M.impossible end.

(*
    fn apply<F>(f: F)
    where
        F: FnOnce(),
    {
        f();
    }
*)
Definition apply (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [F], [f] =>
    let* f := M.alloc f in
    let* _ : Ty.tuple :=
      let* α0 : Ty.function [F; Ty.tuple] _ :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.function.FnOnce.call_once
            (Self := F)
            (Args := Ty.tuple)
            (Trait := ℐ))) in
      let* α1 : F := M.read f in
      let* α2 : Ty.tuple := M.call (α0 α1 tt) in
      M.alloc α2 in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
