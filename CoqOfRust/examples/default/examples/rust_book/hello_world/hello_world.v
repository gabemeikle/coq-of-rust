(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Statements here are executed when the compiled binary is called

    // Print text to the console
    println!("Hello World!");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "Hello World!
") in
        let* α1 := M.alloc [ α0 ] in
        let* α2 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_const"]
              (pointer_coercion "Unsize" (borrow α1))) in
        let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
        M.alloc α3 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
