(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // This binding lives in the main function
    let long_lived_binding = 1;

    // This is a block, and has a smaller scope than the main function
    {
        // This binding only exists in this block
        let short_lived_binding = 2;

        println!("inner short: {}", short_lived_binding);
    }
    // End of the block

    // Error! `short_lived_binding` doesn't exist in this scope
    // println!("outer short: {}", short_lived_binding);
    // FIXME ^ Comment out this line

    println!("outer long: {}", long_lived_binding);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* long_lived_binding := M.alloc ((Integer.of_Z 1) : Ty.path "i32") in
    let* _ :=
      let* short_lived_binding := M.alloc ((Integer.of_Z 2) : Ty.path "i32") in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "inner short: ") in
          let* α1 := M.read (mk_str "
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 :=
            M.call
              ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                (borrow short_lived_binding)) in
          let* α4 := M.alloc [ α3 ] in
          let* α5 :=
            M.call
              ((Ty.path "core::fmt::Arguments")::["new_v1"]
                (pointer_coercion "Unsize" (borrow α2))
                (pointer_coercion "Unsize" (borrow α4))) in
          let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
          M.alloc α6 in
        M.alloc tt in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "outer long: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_display"]
              (borrow long_lived_binding)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
