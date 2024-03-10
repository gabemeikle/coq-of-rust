(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn age() -> u32 {
    15
}
*)
Definition age (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] => M.pure (Value.Integer Integer.U32 15)
  | _, _ => M.impossible
  end.

(*
fn main() {
    println!("Tell me what type of person you are");

    match age() {
        0 => println!("I haven't celebrated my first birthday yet"),
        // Could `match` 1 ..= 12 directly but then what age
        // would the child be? Instead, bind to `n` for the
        // sequence of 1 ..= 12. Now the age can be reported.
        n @ 1..=12 => println!("I'm a child of age {:?}", n),
        n @ 13..=19 => println!("I'm a teen of age {:?}", n),
        // Nothing bound. Return the result.
        n => println!("I'm an old person of age {:?}", n),
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const" in
        let* α2 := M.read (mk_str "Tell me what type of person you are
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.get_function "match_binding::age" [] in
    let* α1 := M.call α0 [] in
    let* α2 := M.alloc α1 in
    let* α0 :=
      match_operator
        α2
        [
          fun γ =>
            let* _ :=
              let* α0 := M.read γ in
              M.is_constant_or_break_match α0 (Value.Integer Integer.U32 0) in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 :=
                M.read (mk_str "I haven't celebrated my first birthday yet
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* n := M.copy γ in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "I'm a child of age ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_debug" in
              let* α6 := M.call α5 [ n ] in
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
            M.alloc (Value.Tuple []);
          fun γ =>
            let* n := M.copy γ in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "I'm a teen of age ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_debug" in
              let* α6 := M.call α5 [ n ] in
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
            M.alloc (Value.Tuple []);
          fun γ =>
            let* n := M.copy γ in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "I'm an old person of age ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_debug" in
              let* α6 := M.call α5 [ n ] in
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
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
