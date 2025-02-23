(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    fn foo() -> ! {
        panic!("This call never returns.");
    }
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] => M.pure (Value.Tuple [])
  | _, _ => M.impossible
  end.

(*
    fn foo() -> ! {
        panic!("This call never returns.");
    }
*)
Definition foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 :=
      M.get_function
        "std::panicking::begin_panic"
        [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
    let* α1 := M.read (mk_str "This call never returns.") in
    M.call_closure α0 [ α1 ]
  | _, _ => M.impossible
  end.
