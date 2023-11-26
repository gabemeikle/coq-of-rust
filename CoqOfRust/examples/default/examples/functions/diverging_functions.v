(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    fn foo() -> ! {
        panic!("This call never returns.");
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* α0 : M.Val unit := M.alloc tt in
    M.read α0).

(*
    fn foo() -> ! {
        panic!("This call never returns.");
    }
*)
Definition foo : M never.t :=
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "This call never returns.") in
      let* α1 : never.t := std.panicking.begin_panic α0 in
      let* α2 : M.Val never.t := M.alloc α1 in
      never_to_any α2 in
    let* α0 : M.Val unit := M.alloc tt in
    let* α1 : M.Val never.t := never_to_any α0 in
    M.read α1).
