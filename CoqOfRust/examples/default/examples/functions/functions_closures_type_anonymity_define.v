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
Definition main : M unit := M.function_body (M.pure tt).

(*
    fn apply<F>(f: F)
    where
        F: FnOnce(),
    {
        f();
    }
*)
Definition apply
    {F : Set}
    {ℋ_0 : core.ops.function.FnOnce.Trait F (Args := unit)}
    (f : F)
    : M unit :=
  let* f : M.Val F := M.alloc f in
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : F := M.read f in
      let* α1 : unit :=
        (core.ops.function.FnOnce.call_once
            (Self := F)
            (Trait := ltac:(refine _)))
          α0
          tt in
      M.alloc α1 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
