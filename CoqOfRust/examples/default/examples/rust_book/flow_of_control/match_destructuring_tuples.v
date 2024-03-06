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
        (1, ..) => println!("First is `1` and the rest doesn't matter"),
        (.., 2) => println!("last is `2` and the rest doesn't matter"),
        (3, .., 4) => println!("First is `3`, last is `4`, and the rest doesn't matter"),
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
        ((Integer.of_Z 0) : Ty.path "i32",
          (Integer.of_Z (-2)) : Ty.path "i32",
          (Integer.of_Z 3) : Ty.path "i32") in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "Tell me about ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
              (borrow triple)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 :=
      match_operator
        triple
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
                  let* α0 := M.read (mk_str "First is `0`, `y` is ") in
                  let* α1 := M.read (mk_str ", and `z` is ") in
                  let* α2 := M.read (mk_str "
") in
                  let* α3 := M.alloc [ α0; α1; α2 ] in
                  let* α4 :=
                    M.call
                      ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
                        (borrow y)) in
                  let* α5 :=
                    M.call
                      ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
                        (borrow z)) in
                  let* α6 := M.alloc [ α4; α5 ] in
                  let* α7 :=
                    M.call
                      ((Ty.path "core::fmt::Arguments")::["new_v1"]
                        (pointer_coercion "Unsize" (borrow α3))
                        (pointer_coercion "Unsize" (borrow α6))) in
                  let* α8 := M.call ((M.var "std::io::stdio::_print") α7) in
                  M.alloc α8 in
                M.alloc tt
              | _ => M.break_match
              end
            end) :
            Ty.tuple [];
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
                  let* α0 :=
                    M.read
                      (mk_str "First is `1` and the rest doesn't matter
") in
                  let* α1 := M.alloc [ α0 ] in
                  let* α2 :=
                    M.call
                      ((Ty.path "core::fmt::Arguments")::["new_const"]
                        (pointer_coercion "Unsize" (borrow α1))) in
                  let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                  M.alloc α3 in
                M.alloc tt
              | _ => M.break_match
              end
            end) :
            Ty.tuple [];
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
                  let* α0 :=
                    M.read
                      (mk_str "last is `2` and the rest doesn't matter
") in
                  let* α1 := M.alloc [ α0 ] in
                  let* α2 :=
                    M.call
                      ((Ty.path "core::fmt::Arguments")::["new_const"]
                        (pointer_coercion "Unsize" (borrow α1))) in
                  let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                  M.alloc α3 in
                M.alloc tt
              | _ => M.break_match
              end
            end) :
            Ty.tuple [];
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
                    let* α0 :=
                      M.read
                        (mk_str
                          "First is `3`, last is `4`, and the rest doesn't matter
") in
                    let* α1 := M.alloc [ α0 ] in
                    let* α2 :=
                      M.call
                        ((Ty.path "core::fmt::Arguments")::["new_const"]
                          (pointer_coercion "Unsize" (borrow α1))) in
                    let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                    M.alloc α3 in
                  M.alloc tt
                | _ => M.break_match
                end
              | _ => M.break_match
              end
            end) :
            Ty.tuple [];
          fun γ =>
            (let* _ :=
              let* α0 := M.read (mk_str "It doesn't matter what they are
") in
              let* α1 := M.alloc [ α0 ] in
              let* α2 :=
                M.call
                  ((Ty.path "core::fmt::Arguments")::["new_const"]
                    (pointer_coercion "Unsize" (borrow α1))) in
              let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
              M.alloc α3 in
            M.alloc tt) :
            Ty.tuple []
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
