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
  | [], [vec] =>
    let* vec := M.alloc vec in
    let* first :
        Ty.apply (Ty.path "ref") [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
      let* α0 :
          Ty.function
            [Ty.apply
                (Ty.path "ref")
                [Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [Ty.apply (Ty.path "ref") [Ty.path "str"];
                      Ty.apply (Ty.path "alloc::alloc::Global") []]]]
            (Ty.apply (Ty.path "ref") [_]) :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.deref.Deref.deref
            (Self :=
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [Ty.apply (Ty.path "ref") [Ty.path "str"];
                  Ty.apply (Ty.path "alloc::alloc::Global") []])
            (Trait := ℐ))) in
      let* α1 :
          Ty.apply
            (Ty.path "ref")
            [Ty.apply
                (Ty.path "slice")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]]] :=
        M.call (α0 (borrow vec)) in
      let* α2 :
          Ty.apply
            (Ty.path "core::option::Option")
            [Ty.apply
                (Ty.path "ref")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]]] :=
        M.call
          ((Ty.apply
                (Ty.path "slice")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]])::["first"]
            α1) in
      let* α3 :
          Ty.apply (Ty.path "ref") [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
        M.call
          ((Ty.apply
                (Ty.path "core::option::Option")
                [Ty.apply
                    (Ty.path "ref")
                    [Ty.apply (Ty.path "ref") [Ty.path "str"]]])::["unwrap"]
            α2) in
      M.alloc α3 in
    let* α0 :
        Ty.apply (Ty.path "ref") [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
      M.read first in
    let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] := M.read (deref α0) in
    let* α2 :
        Ty.apply
          (Ty.path "core::result::Result")
          [Ty.path "i32";
            Ty.apply (Ty.path "core::num::error::ParseIntError") []] :=
      M.call ((Ty.path "str")::["parse"] α1) in
    let* α3 : Ty.path "i32" :=
      M.call
        ((Ty.apply
              (Ty.path "core::result::Result")
              [Ty.path "i32";
                Ty.apply
                  (Ty.path "core::num::error::ParseIntError")
                  []])::["unwrap"]
          α2) in
    let* α4 : Ty.path "i32" :=
      BinOp.Panic.mul ((Integer.of_Z 2) : Ty.path "i32") α3 in
    let* α0 : Ty.path "i32" := M.alloc α4 in
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* numbers :
        Ty.apply
          (Ty.path "alloc::vec::Vec")
          [Ty.apply (Ty.path "ref") [Ty.path "str"];
            Ty.apply (Ty.path "alloc::alloc::Global") []] :=
      let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "42") in
      let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "93") in
      let* α2 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "18") in
      let* α3 :
          Ty.apply
            (Ty.path "array")
            [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
        M.alloc [ α0; α1; α2 ] in
      let* α4 :
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.call ((alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"] α3) in
      let* α5 :
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.read α4 in
      let* α6 :
          Ty.apply
            (Ty.path "alloc::vec::Vec")
            [Ty.apply (Ty.path "ref") [Ty.path "str"];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.call
          ((Ty.apply
                (Ty.path "slice")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]])::["into_vec"]
            (pointer_coercion "Unsize" α5)) in
      M.alloc α6 in
    let* empty :
        Ty.apply
          (Ty.path "alloc::vec::Vec")
          [Ty.apply (Ty.path "ref") [Ty.path "str"];
            Ty.apply (Ty.path "alloc::alloc::Global") []] :=
      let* α0 :
          Ty.apply
            (Ty.path "alloc::vec::Vec")
            [Ty.apply (Ty.path "ref") [Ty.path "str"];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.call
          (Ty.apply
              (Ty.path "alloc::vec::Vec")
              [Ty.apply (Ty.path "ref") [Ty.path "str"];
                Ty.apply (Ty.path "alloc::alloc::Global") []])::["new"] in
      M.alloc α0 in
    let* strings :
        Ty.apply
          (Ty.path "alloc::vec::Vec")
          [Ty.apply (Ty.path "ref") [Ty.path "str"];
            Ty.apply (Ty.path "alloc::alloc::Global") []] :=
      let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "tofu") in
      let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "93") in
      let* α2 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "18") in
      let* α3 :
          Ty.apply
            (Ty.path "array")
            [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
        M.alloc [ α0; α1; α2 ] in
      let* α4 :
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.call ((alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"] α3) in
      let* α5 :
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.read α4 in
      let* α6 :
          Ty.apply
            (Ty.path "alloc::vec::Vec")
            [Ty.apply (Ty.path "ref") [Ty.path "str"];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.call
          ((Ty.apply
                (Ty.path "slice")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]])::["into_vec"]
            (pointer_coercion "Unsize" α5)) in
      M.alloc α6 in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "The first doubled is ") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 :
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [Ty.apply (Ty.path "ref") [Ty.path "str"];
                Ty.apply (Ty.path "alloc::alloc::Global") []] :=
          M.read numbers in
        let* α4 : Ty.path "i32" :=
          M.call (multiple_error_types.double_first α3) in
        let* α5 : Ty.path "i32" := M.alloc α4 in
        let* α6 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α5)) in
        let* α7 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α6 ] in
        let* α8 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α7))) in
        let* α9 : Ty.tuple := M.call (std.io.stdio._print α8) in
        M.alloc α9 in
      M.alloc tt in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "The first doubled is ") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 :
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [Ty.apply (Ty.path "ref") [Ty.path "str"];
                Ty.apply (Ty.path "alloc::alloc::Global") []] :=
          M.read empty in
        let* α4 : Ty.path "i32" :=
          M.call (multiple_error_types.double_first α3) in
        let* α5 : Ty.path "i32" := M.alloc α4 in
        let* α6 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α5)) in
        let* α7 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α6 ] in
        let* α8 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α7))) in
        let* α9 : Ty.tuple := M.call (std.io.stdio._print α8) in
        M.alloc α9 in
      M.alloc tt in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "The first doubled is ") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 :
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [Ty.apply (Ty.path "ref") [Ty.path "str"];
                Ty.apply (Ty.path "alloc::alloc::Global") []] :=
          M.read strings in
        let* α4 : Ty.path "i32" :=
          M.call (multiple_error_types.double_first α3) in
        let* α5 : Ty.path "i32" := M.alloc α4 in
        let* α6 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α5)) in
        let* α7 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α6 ] in
        let* α8 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α7))) in
        let* α9 : Ty.tuple := M.call (std.io.stdio._print α8) in
        M.alloc α9 in
      M.alloc tt in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
