(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    calculate! { // Look ma! Variadic `calculate!`!
        eval 1 + 2,
        eval 3 + 4,
        eval (2 * 3) + 1
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* val :=
        let* α0 :=
          (M.var "BinOp::Panic::add")
            ((Integer.of_Z 1) : Ty.path "usize")
            ((Integer.of_Z 2) : Ty.path "usize") in
        M.alloc α0 in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "1 + 2 = ") in
          let* α1 := M.read (mk_str "
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow val ] in
          let* α4 := M.alloc [ α3 ] in
          let* α5 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α2);
                pointer_coercion "Unsize" (borrow α4)
              ] in
          let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
          M.alloc α6 in
        M.alloc tt in
      M.alloc tt in
    let* _ :=
      let* val :=
        let* α0 :=
          (M.var "BinOp::Panic::add")
            ((Integer.of_Z 3) : Ty.path "usize")
            ((Integer.of_Z 4) : Ty.path "usize") in
        M.alloc α0 in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "3 + 4 = ") in
          let* α1 := M.read (mk_str "
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow val ] in
          let* α4 := M.alloc [ α3 ] in
          let* α5 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α2);
                pointer_coercion "Unsize" (borrow α4)
              ] in
          let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
          M.alloc α6 in
        M.alloc tt in
      M.alloc tt in
    let* val :=
      let* α0 :=
        (M.var "BinOp::Panic::mul")
          ((Integer.of_Z 2) : Ty.path "usize")
          ((Integer.of_Z 3) : Ty.path "usize") in
      let* α1 :=
        (M.var "BinOp::Panic::add") α0 ((Integer.of_Z 1) : Ty.path "usize") in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "(2 * 3) + 1 = ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow val ] in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α4)
            ] in
        let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
