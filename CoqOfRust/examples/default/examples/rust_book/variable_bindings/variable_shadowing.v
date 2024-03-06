(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let shadowed_binding = 1;

    {
        println!("before being shadowed: {}", shadowed_binding);

        // This binding *shadows* the outer one
        let shadowed_binding = "abc";

        println!("shadowed in inner block: {}", shadowed_binding);
    }
    println!("outside inner block: {}", shadowed_binding);

    // This binding *shadows* the previous binding
    let shadowed_binding = 2;
    println!("shadowed in outer block: {}", shadowed_binding);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* shadowed_binding := M.alloc ((Integer.of_Z 1) : Ty.path "i32") in
    let* _ :=
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "before being shadowed: ") in
          let* α1 := M.read (mk_str "
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 :=
            M.call
              ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                (borrow shadowed_binding)) in
          let* α4 := M.alloc [ α3 ] in
          let* α5 :=
            M.call
              ((Ty.path "core::fmt::Arguments")::["new_v1"]
                (pointer_coercion "Unsize" (borrow α2))
                (pointer_coercion "Unsize" (borrow α4))) in
          let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
          M.alloc α6 in
        M.alloc tt in
      let* shadowed_binding := M.copy (mk_str "abc") in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "shadowed in inner block: ") in
          let* α1 := M.read (mk_str "
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 :=
            M.call
              ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                (borrow shadowed_binding)) in
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
        let* α0 := M.read (mk_str "outside inner block: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_display"]
              (borrow shadowed_binding)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* shadowed_binding := M.alloc ((Integer.of_Z 2) : Ty.path "i32") in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "shadowed in outer block: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_display"]
              (borrow shadowed_binding)) in
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
