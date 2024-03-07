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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with | [], [] => M.pure tt | _, _ => M.impossible end.

(*
    fn foo() -> ! {
        panic!("This call never returns.");
    }
*)
Definition foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 := M.read (mk_str "This call never returns.") in
    M.call (M.var "std::panicking::begin_panic") [ α0 ]
  | _, _ => M.impossible
  end.
