(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn double_first(vec: Vec<&str>) -> i32 {
    let first = vec.first().unwrap(); // Generate error 1
    2 * first.parse::<i32>().unwrap() // Generate error 2
}
*)
Definition double_first (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ vec ] =>
    let* vec := M.alloc vec in
    let* first :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [
              Ty.apply
                (Ty.path "&")
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
            ])
          "unwrap"
          [] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "first"
          [] in
      let* α2 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "alloc::alloc::Global"
            ])
          []
          "deref"
          [] in
      let* α3 := M.call_closure α2 [ vec ] in
      let* α4 := M.call_closure α1 [ α3 ] in
      let* α5 := M.call_closure α0 [ α4 ] in
      M.alloc α5 in
    let* α0 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::result::Result")
          [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
        "unwrap"
        [] in
    let* α1 :=
      M.get_associated_function (Ty.path "str") "parse" [ Ty.path "i32" ] in
    let* α2 := M.read first in
    let* α3 := M.read α2 in
    let* α4 := M.call_closure α1 [ α3 ] in
    let* α5 := M.call_closure α0 [ α4 ] in
    let* α6 := BinOp.Panic.mul (Value.Integer Integer.I32 2) α5 in
    let* α0 := M.alloc α6 in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    println!("The first doubled is {}", double_first(numbers));

    println!("The first doubled is {}", double_first(empty));
    // Error 1: the input vector is empty

    println!("The first doubled is {}", double_first(strings));
    // Error 2: the element doesn't parse to a number
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* numbers :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply
                (Ty.path "array")
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α2 := M.read (mk_str "42") in
      let* α3 := M.read (mk_str "93") in
      let* α4 := M.read (mk_str "18") in
      let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
      let* α6 := M.call_closure α1 [ α5 ] in
      let* α7 := M.read α6 in
      let* α8 := M.call_closure α0 [ M.pointer_coercion (* Unsize *) α7 ] in
      M.alloc α8 in
    let* empty :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* strings :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply
                (Ty.path "array")
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α2 := M.read (mk_str "tofu") in
      let* α3 := M.read (mk_str "93") in
      let* α4 := M.read (mk_str "18") in
      let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
      let* α6 := M.call_closure α1 [ α5 ] in
      let* α7 := M.read α6 in
      let* α8 := M.call_closure α0 [ M.pointer_coercion (* Unsize *) α7 ] in
      M.alloc α8 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "The first doubled is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "i32" ] in
        let* α6 := M.get_function "multiple_error_types::double_first" [] in
        let* α7 := M.read numbers in
        let* α8 := M.call_closure α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call_closure α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call_closure α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "The first doubled is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "i32" ] in
        let* α6 := M.get_function "multiple_error_types::double_first" [] in
        let* α7 := M.read empty in
        let* α8 := M.call_closure α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call_closure α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call_closure α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "The first doubled is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "i32" ] in
        let* α6 := M.get_function "multiple_error_types::double_first" [] in
        let* α7 := M.read strings in
        let* α8 := M.call_closure α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call_closure α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call_closure α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
