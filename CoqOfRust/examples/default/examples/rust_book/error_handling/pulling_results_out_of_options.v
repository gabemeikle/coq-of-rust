(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn double_first(vec: Vec<&str>) -> Option<Result<i32, ParseIntError>> {
    vec.first().map(|first| first.parse::<i32>().map(|n| 2 * n))
}
*)
Definition double_first (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ vec ] =>
    let* vec := M.alloc vec in
    let* α0 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::option::Option")
          [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
          ])
        "map"
        [
          Ty.apply
            (Ty.path "core::result::Result")
            [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ];
          Ty.function
            [
              Ty.tuple
                [
                  Ty.apply
                    (Ty.path "&")
                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                ]
            ]
            (Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
        ] in
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
    M.call_closure
      α0
      [
        α4;
        M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    let* first := M.copy γ in
                    let* α0 :=
                      M.get_associated_function
                        (Ty.apply
                          (Ty.path "core::result::Result")
                          [
                            Ty.path "i32";
                            Ty.path "core::num::error::ParseIntError"
                          ])
                        "map"
                        [
                          Ty.path "i32";
                          Ty.function
                            [ Ty.tuple [ Ty.path "i32" ] ]
                            (Ty.path "i32")
                        ] in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "str")
                        "parse"
                        [ Ty.path "i32" ] in
                    let* α2 := M.read first in
                    let* α3 := M.read α2 in
                    let* α4 := M.call_closure α1 [ α3 ] in
                    M.call_closure
                      α0
                      [
                        α4;
                        M.closure
                          (fun γ =>
                            match γ with
                            | [ α0 ] =>
                              let* α0 := M.alloc α0 in
                              match_operator
                                α0
                                [
                                  fun γ =>
                                    let* n := M.copy γ in
                                    let* α0 := M.read n in
                                    BinOp.Panic.mul
                                      (Value.Integer Integer.I32 2)
                                      α0
                                ]
                            | _ => M.impossible
                            end)
                      ]
                ]
            | _ => M.impossible
            end)
      ]
  | _, _ => M.impossible
  end.

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    println!("The first doubled is {:?}", double_first(numbers));

    println!("The first doubled is {:?}", double_first(empty));
    // Error 1: the input vector is empty

    println!("The first doubled is {:?}", double_first(strings));
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
            "new_debug"
            [
              Ty.apply
                (Ty.path "core::option::Option")
                [
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ]
                ]
            ] in
        let* α6 :=
          M.get_function "pulling_results_out_of_options::double_first" [] in
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
            "new_debug"
            [
              Ty.apply
                (Ty.path "core::option::Option")
                [
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ]
                ]
            ] in
        let* α6 :=
          M.get_function "pulling_results_out_of_options::double_first" [] in
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
            "new_debug"
            [
              Ty.apply
                (Ty.path "core::option::Option")
                [
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ]
                ]
            ] in
        let* α6 :=
          M.get_function "pulling_results_out_of_options::double_first" [] in
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
