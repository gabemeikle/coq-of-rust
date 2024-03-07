(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn some_fn() {
    ()
}
*)
Definition some_fn (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with | [], [] => M.pure tt | _, _ => M.impossible end.

(*
fn main() {
    let a: () = some_fn();
    println!("This function returns and you can see this line.")
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* a :=
      let* α0 :=
        M.call
          (M.var "diverging_functions_no_info_in_return_type::some_fn")
          [] in
      M.alloc α0 in
    let* _ :=
      let* α0 :=
        M.read (mk_str "This function returns and you can see this line.
") in
      let* α1 := M.alloc [ α0 ] in
      let* α2 :=
        M.call
          (Ty.path "core::fmt::Arguments")::["new_const"]
          [ pointer_coercion "Unsize" (borrow α1) ] in
      let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
      M.alloc α3 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
