(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn reverse(pair: (i32, bool)) -> (bool, i32) {
    // `let` can be used to bind the members of a tuple to variables
    let (int_param, bool_param) = pair;

    (bool_param, int_param)
}
*)
Definition reverse (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [pair] =>
    let* pair := M.alloc pair in
    let* α0 :=
      match_operator
        pair
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* int_param := M.copy γ0_0 in
              let* bool_param := M.copy γ0_1 in
              let* α0 := M.read bool_param in
              let* α1 := M.read int_param in
              M.alloc (α0, α1)
            end) :
            Ty.tuple (Ty.path "bool") (Ty.path "i32")
        ] in
    M.read α0
  | _, _ => M.impossible
  end.



Module  Impl_core_fmt_Debug_for_tuples_Matrix.
Section Impl_core_fmt_Debug_for_tuples_Matrix.
  Definition Self : Ty.t := Ty.apply (Ty.path "tuples::Matrix") [].
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "Matrix") in
      let* α2 := M.read self in
      let* α3 := M.read self in
      let* α4 := M.read self in
      let* α5 := M.read self in
      let* α6 :=
        M.alloc (borrow ((M.var "tuples::Matrix::Get_3") (deref α5))) in
      M.call
        ((Ty.apply
              (Ty.path "core::fmt::Formatter")
              [])::["debug_tuple_field4_finish"]
          α0
          α1
          (pointer_coercion
            "Unsize"
            (borrow ((M.var "tuples::Matrix::Get_0") (deref α2))))
          (pointer_coercion
            "Unsize"
            (borrow ((M.var "tuples::Matrix::Get_1") (deref α3))))
          (pointer_coercion
            "Unsize"
            (borrow ((M.var "tuples::Matrix::Get_2") (deref α4))))
          (pointer_coercion "Unsize" (borrow α6)))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_fmt : Instance.t := {
    Notations.double_colon := fmt;
  }.
  
  Definition ℐ : Instance.t := [("fmt", fmt)].
End Impl_core_fmt_Debug_for_tuples_Matrix.
End Impl_core_fmt_Debug_for_tuples_Matrix.

(*
fn main() {
    // A tuple with a bunch of different types
    let long_tuple = (1u8, 2u16, 3u32, 4u64,
                      -1i8, -2i16, -3i32, -4i64,
                      0.1f32, 0.2f64,
                      'a', true);

    // Values can be extracted from the tuple using tuple indexing
    println!("long tuple first value: {}", long_tuple.0);
    println!("long tuple second value: {}", long_tuple.1);

    // Tuples can be tuple members
    let tuple_of_tuples = ((1u8, 2u16, 2u32), (4u64, -1i8), -2i16);

    // Tuples are printable
    println!("tuple of tuples: {:?}", tuple_of_tuples);
    
    // But long Tuples (more than 12 elements) cannot be printed
    // let too_long_tuple = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
    // println!("too long tuple: {:?}", too_long_tuple);
    // TODO ^ Uncomment the above 2 lines to see the compiler error

    let pair = (1, true);
    println!("pair is {:?}", pair);

    println!("the reversed pair is {:?}", reverse(pair));

    // To create one element tuples, the comma is required to tell them apart
    // from a literal surrounded by parentheses
    println!("one element tuple: {:?}", (5u32,));
    println!("just an integer: {:?}", (5u32));

    //tuples can be destructured to create bindings
    let tuple = (1, "hello", 4.5, true);

    let (a, b, c, d) = tuple;
    println!("{:?}, {:?}, {:?}, {:?}", a, b, c, d);

    let matrix = Matrix(1.1, 1.2, 2.1, 2.2);
    println!("{:?}", matrix);

}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* long_tuple :=
      let* α0 := M.read (UnsupportedLiteral : Ty.path "f32") in
      let* α1 := M.read (UnsupportedLiteral : Ty.path "f64") in
      M.alloc
        ((Integer.of_Z 1) : Ty.path "u8",
          (Integer.of_Z 2) : Ty.path "u16",
          (Integer.of_Z 3) : Ty.path "u32",
          (Integer.of_Z 4) : Ty.path "u64",
          (Integer.of_Z (-1)) : Ty.path "i8",
          (Integer.of_Z (-2)) : Ty.path "i16",
          (Integer.of_Z (-3)) : Ty.path "i32",
          (Integer.of_Z (-4)) : Ty.path "i64",
          α0,
          α1,
          "a"%char,
          true) in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "long tuple first value: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow "Unknown Field")) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "long tuple second value: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow "Unknown Field")) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* tuple_of_tuples :=
      M.alloc
        (((Integer.of_Z 1) : Ty.path "u8",
            (Integer.of_Z 2) : Ty.path "u16",
            (Integer.of_Z 2) : Ty.path "u32"),
          ((Integer.of_Z 4) : Ty.path "u64",
            (Integer.of_Z (-1)) : Ty.path "i8"),
          (Integer.of_Z (-2)) : Ty.path "i16") in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "tuple of tuples: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow tuple_of_tuples)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* pair := M.alloc ((Integer.of_Z 1) : Ty.path "i32", true) in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "pair is ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow pair)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "the reversed pair is ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 := M.read pair in
        let* α4 := M.call ((M.var "tuples::reverse") α3) in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow α5)) in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α7))) in
        let* α9 := M.call ((M.var "std::io::stdio::_print") α8) in
        M.alloc α9 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "one element tuple: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 := M.alloc ((Integer.of_Z 5) : Ty.path "u32") in
        let* α4 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow α3)) in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α5))) in
        let* α7 := M.call ((M.var "std::io::stdio::_print") α6) in
        M.alloc α7 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "just an integer: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 := M.alloc ((Integer.of_Z 5) : Ty.path "u32") in
        let* α4 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow α3)) in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α5))) in
        let* α7 := M.call ((M.var "std::io::stdio::_print") α6) in
        M.alloc α7 in
      M.alloc tt in
    let* tuple :=
      let* α0 := M.read (mk_str "hello") in
      let* α1 := M.read (UnsupportedLiteral : Ty.path "f64") in
      M.alloc ((Integer.of_Z 1) : Ty.path "i32", α0, α1, true) in
    let* α0 :=
      match_operator
        tuple
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _, _, _) =>
              let γ0_0 :=
                Tuple.Access.left (Tuple.Access.left (Tuple.Access.left γ)) in
              let γ0_1 :=
                Tuple.Access.right (Tuple.Access.left (Tuple.Access.left γ)) in
              let γ0_2 := Tuple.Access.right (Tuple.Access.left γ) in
              let γ0_3 := Tuple.Access.right γ in
              let* a := M.copy γ0_0 in
              let* b := M.copy γ0_1 in
              let* c := M.copy γ0_2 in
              let* d := M.copy γ0_3 in
              let* _ :=
                let* _ :=
                  let* α0 := M.read (mk_str "") in
                  let* α1 := M.read (mk_str ", ") in
                  let* α2 := M.read (mk_str ", ") in
                  let* α3 := M.read (mk_str ", ") in
                  let* α4 := M.read (mk_str "
") in
                  let* α5 := M.alloc [ α0; α1; α2; α3; α4 ] in
                  let* α6 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::rt::Argument")
                            [])::["new_debug"]
                        (borrow a)) in
                  let* α7 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::rt::Argument")
                            [])::["new_debug"]
                        (borrow b)) in
                  let* α8 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::rt::Argument")
                            [])::["new_debug"]
                        (borrow c)) in
                  let* α9 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::rt::Argument")
                            [])::["new_debug"]
                        (borrow d)) in
                  let* α10 := M.alloc [ α6; α7; α8; α9 ] in
                  let* α11 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::Arguments")
                            [])::["new_v1"]
                        (pointer_coercion "Unsize" (borrow α5))
                        (pointer_coercion "Unsize" (borrow α10))) in
                  let* α12 := M.call ((M.var "std::io::stdio::_print") α11) in
                  M.alloc α12 in
                M.alloc tt in
              let* matrix :=
                let* α0 := M.read (UnsupportedLiteral : Ty.path "f32") in
                let* α1 := M.read (UnsupportedLiteral : Ty.path "f32") in
                let* α2 := M.read (UnsupportedLiteral : Ty.path "f32") in
                let* α3 := M.read (UnsupportedLiteral : Ty.path "f32") in
                M.alloc (tuples.Matrix.Build_t α0 α1 α2 α3) in
              let* _ :=
                let* _ :=
                  let* α0 := M.read (mk_str "") in
                  let* α1 := M.read (mk_str "
") in
                  let* α2 := M.alloc [ α0; α1 ] in
                  let* α3 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::rt::Argument")
                            [])::["new_debug"]
                        (borrow matrix)) in
                  let* α4 := M.alloc [ α3 ] in
                  let* α5 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::Arguments")
                            [])::["new_v1"]
                        (pointer_coercion "Unsize" (borrow α2))
                        (pointer_coercion "Unsize" (borrow α4))) in
                  let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
                  M.alloc α6 in
                M.alloc tt in
              M.alloc tt
            end) :
            Ty.path "unit"
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
