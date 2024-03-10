(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let triple = (0, -2, 3);
    // TODO ^ Try different values for `triple`

    println!("Tell me about {:?}", triple);
    // Match can be used to destructure a tuple
    match triple {
        // Destructure the second and third elements
        (0, y, z) => println!("First is `0`, `y` is {:?}, and `z` is {:?}", y, z),
        (1, _, _) => println!("First is `1` and the rest doesn't matter"),
        (.., 2) => println!("last is `2` and the rest doesn't matter"),
        (3, _, 4) => println!("First is `3`, last is `4`, and the rest doesn't matter"),
        // `..` can be used to ignore the rest of the tuple
        _ => println!("It doesn't matter what they are"),
        // `_` means don't bind the value to a variable
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* triple :=
      M.alloc
        (Value.Tuple
          [
            Value.Integer Integer.I32 0;
            Value.Integer Integer.I32 (-2);
            Value.Integer Integer.I32 3
          ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Tell me about ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ triple ] in
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
    let* α0 :=
      match_operator
        triple
        (Value.Array
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | (_, _, _) =>
                let γ0_0 := Tuple.Access.left (Tuple.Access.left γ) in
                let γ0_1 := Tuple.Access.right (Tuple.Access.left γ) in
                let γ0_2 := Tuple.Access.right γ in
                let* α0 := M.read γ0_0 in
                match α0 with
                | i32.Make 0 =>
                  let* y := M.copy γ0_1 in
                  let* z := M.copy γ0_2 in
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" [] in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_v1" in
                    let* α2 := M.read (mk_str "First is `0`, `y` is ") in
                    let* α3 := M.read (mk_str ", and `z` is ") in
                    let* α4 := M.read (mk_str "
") in
                    let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                    let* α6 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug" in
                    let* α7 := M.call α6 [ y ] in
                    let* α8 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug" in
                    let* α9 := M.call α8 [ z ] in
                    let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
                    let* α11 :=
                      M.call
                        α1
                        [
                          M.pointer_coercion (* Unsize *) α5;
                          M.pointer_coercion (* Unsize *) α10
                        ] in
                    let* α12 := M.call α0 [ α11 ] in
                    M.alloc α12 in
                  M.alloc (Value.Tuple [])
                | _ => M.break_match
                end
              end);
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | (_, _, _) =>
                let γ0_0 := Tuple.Access.left (Tuple.Access.left γ) in
                let γ0_1 := Tuple.Access.right (Tuple.Access.left γ) in
                let γ0_2 := Tuple.Access.right γ in
                let* α0 := M.read γ0_0 in
                match α0 with
                | i32.Make 1 =>
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" [] in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_const" in
                    let* α2 :=
                      M.read
                        (mk_str "First is `1` and the rest doesn't matter
") in
                    let* α3 := M.alloc (Value.Array [ α2 ]) in
                    let* α4 :=
                      M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                    let* α5 := M.call α0 [ α4 ] in
                    M.alloc α5 in
                  M.alloc (Value.Tuple [])
                | _ => M.break_match
                end
              end);
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | (_, _, _) =>
                let γ0_0 := Tuple.Access.left (Tuple.Access.left γ) in
                let γ0_1 := Tuple.Access.right (Tuple.Access.left γ) in
                let γ0_2 := Tuple.Access.right γ in
                let* α0 := M.read γ0_2 in
                match α0 with
                | i32.Make 2 =>
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" [] in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_const" in
                    let* α2 :=
                      M.read
                        (mk_str "last is `2` and the rest doesn't matter
") in
                    let* α3 := M.alloc (Value.Array [ α2 ]) in
                    let* α4 :=
                      M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                    let* α5 := M.call α0 [ α4 ] in
                    M.alloc α5 in
                  M.alloc (Value.Tuple [])
                | _ => M.break_match
                end
              end);
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | (_, _, _) =>
                let γ0_0 := Tuple.Access.left (Tuple.Access.left γ) in
                let γ0_1 := Tuple.Access.right (Tuple.Access.left γ) in
                let γ0_2 := Tuple.Access.right γ in
                let* α0 := M.read γ0_0 in
                match α0 with
                | i32.Make 3 =>
                  let* α0 := M.read γ0_2 in
                  match α0 with
                  | i32.Make 4 =>
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::Arguments")
                          "new_const" in
                      let* α2 :=
                        M.read
                          (mk_str
                            "First is `3`, last is `4`, and the rest doesn't matter
") in
                      let* α3 := M.alloc (Value.Array [ α2 ]) in
                      let* α4 :=
                        M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                      let* α5 := M.call α0 [ α4 ] in
                      M.alloc α5 in
                    M.alloc (Value.Tuple [])
                  | _ => M.break_match
                  end
                | _ => M.break_match
                end
              end);
            fun γ =>
              (let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_const" in
                let* α2 := M.read (mk_str "It doesn't matter what they are
") in
                let* α3 := M.alloc (Value.Array [ α2 ]) in
                let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                let* α5 := M.call α0 [ α4 ] in
                M.alloc α5 in
              M.alloc (Value.Tuple []))
          ]) in
    M.read α0
  | _, _ => M.impossible
  end.
