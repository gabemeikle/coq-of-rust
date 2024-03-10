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
          BinOp.Panic.add
            (Value.Integer Integer.Usize 1)
            (Value.Integer Integer.Usize 2) in
        M.alloc α0 in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "1 + 2 = ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 := M.call α5 [ val ] in
          let* α7 := M.alloc (Value.Array [ α6 ]) in
          let* α8 :=
            M.call
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α7
              ] in
          let* α9 := M.call α0 [ α8 ] in
          M.alloc α9 in
        M.alloc (Value.Tuple []) in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* val :=
        let* α0 :=
          BinOp.Panic.add
            (Value.Integer Integer.Usize 3)
            (Value.Integer Integer.Usize 4) in
        M.alloc α0 in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "3 + 4 = ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 := M.call α5 [ val ] in
          let* α7 := M.alloc (Value.Array [ α6 ]) in
          let* α8 :=
            M.call
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α7
              ] in
          let* α9 := M.call α0 [ α8 ] in
          M.alloc α9 in
        M.alloc (Value.Tuple []) in
      M.alloc (Value.Tuple []) in
    let* val :=
      let* α0 :=
        BinOp.Panic.mul
          (Value.Integer Integer.Usize 2)
          (Value.Integer Integer.Usize 3) in
      let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.Usize 1) in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "(2 * 3) + 1 = ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ val ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
