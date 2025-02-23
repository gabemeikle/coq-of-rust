(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let strings = vec!["42", "tofu", "93", "999", "18"];
    let mut errors = vec![];
    let numbers: Vec<_> = strings
        .into_iter()
        .map(|s| s.parse::<u8>())
        .filter_map(|r| r.map_err(|e| errors.push(e)).ok())
        .collect();
    println!("Numbers: {:?}", numbers);
    println!("Errors: {:?}", errors);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
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
      let* α2 := M.read (mk_str "42") in
      let* α3 := M.read (mk_str "tofu") in
      let* α4 := M.read (mk_str "93") in
      let* α5 := M.read (mk_str "999") in
      let* α6 := M.read (mk_str "18") in
      let* α7 := M.alloc (Value.Array [ α2; α3; α4; α5; α6 ]) in
      let* α8 := M.call_closure α1 [ α7 ] in
      let* α9 := M.read α8 in
      let* α10 := M.call_closure α0 [ M.pointer_coercion (* Unsize *) α9 ] in
      M.alloc α10 in
    let* errors :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.path "core::num::error::ParseIntError";
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* numbers :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::filter_map::FilterMap")
            [
              Ty.apply
                (Ty.path "core::iter::adapters::map::Map")
                [
                  Ty.apply
                    (Ty.path "alloc::vec::into_iter::IntoIter")
                    [
                      Ty.apply (Ty.path "&") [ Ty.path "str" ];
                      Ty.path "alloc::alloc::Global"
                    ];
                  Ty.function
                    [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ]
                    (Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "u8"; Ty.path "core::num::error::ParseIntError"
                      ])
                ];
              Ty.function
                [
                  Ty.tuple
                    [
                      Ty.apply
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "u8";
                          Ty.path "core::num::error::ParseIntError"
                        ]
                    ]
                ]
                (Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ])
            ])
          []
          "collect"
          [
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::map::Map")
            [
              Ty.apply
                (Ty.path "alloc::vec::into_iter::IntoIter")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "str" ];
                  Ty.path "alloc::alloc::Global"
                ];
              Ty.function
                [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ]
                (Ty.apply
                  (Ty.path "core::result::Result")
                  [ Ty.path "u8"; Ty.path "core::num::error::ParseIntError" ])
            ])
          []
          "filter_map"
          [
            Ty.path "u8";
            Ty.function
              [
                Ty.tuple
                  [
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "u8"; Ty.path "core::num::error::ParseIntError"
                      ]
                  ]
              ]
              (Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ])
          ] in
      let* α2 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "alloc::vec::into_iter::IntoIter")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "alloc::alloc::Global"
            ])
          []
          "map"
          [
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "u8"; Ty.path "core::num::error::ParseIntError" ];
            Ty.function
              [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ]
              (Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "u8"; Ty.path "core::num::error::ParseIntError" ])
          ] in
      let* α3 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "alloc::alloc::Global"
            ])
          []
          "into_iter"
          [] in
      let* α4 := M.read strings in
      let* α5 := M.call_closure α3 [ α4 ] in
      let* α6 :=
        M.call_closure
          α2
          [
            α5;
            M.closure
              (fun γ =>
                match γ with
                | [ α0 ] =>
                  let* α0 := M.alloc α0 in
                  match_operator
                    α0
                    [
                      fun γ =>
                        let* s := M.copy γ in
                        let* α0 :=
                          M.get_associated_function
                            (Ty.path "str")
                            "parse"
                            [ Ty.path "u8" ] in
                        let* α1 := M.read s in
                        M.call_closure α0 [ α1 ]
                    ]
                | _ => M.impossible
                end)
          ] in
      let* α7 :=
        M.call_closure
          α1
          [
            α6;
            M.closure
              (fun γ =>
                match γ with
                | [ α0 ] =>
                  let* α0 := M.alloc α0 in
                  match_operator
                    α0
                    [
                      fun γ =>
                        let* r := M.copy γ in
                        let* α0 :=
                          M.get_associated_function
                            (Ty.apply
                              (Ty.path "core::result::Result")
                              [ Ty.path "u8"; Ty.tuple [] ])
                            "ok"
                            [] in
                        let* α1 :=
                          M.get_associated_function
                            (Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.path "u8";
                                Ty.path "core::num::error::ParseIntError"
                              ])
                            "map_err"
                            [
                              Ty.tuple [];
                              Ty.function
                                [
                                  Ty.tuple
                                    [ Ty.path "core::num::error::ParseIntError"
                                    ]
                                ]
                                (Ty.tuple [])
                            ] in
                        let* α2 := M.read r in
                        let* α3 :=
                          M.call_closure
                            α1
                            [
                              α2;
                              M.closure
                                (fun γ =>
                                  match γ with
                                  | [ α0 ] =>
                                    let* α0 := M.alloc α0 in
                                    match_operator
                                      α0
                                      [
                                        fun γ =>
                                          let* e := M.copy γ in
                                          let* α0 :=
                                            M.get_associated_function
                                              (Ty.apply
                                                (Ty.path "alloc::vec::Vec")
                                                [
                                                  Ty.path
                                                    "core::num::error::ParseIntError";
                                                  Ty.path "alloc::alloc::Global"
                                                ])
                                              "push"
                                              [] in
                                          let* α1 := M.read e in
                                          M.call_closure α0 [ errors; α1 ]
                                      ]
                                  | _ => M.impossible
                                  end)
                            ] in
                        M.call_closure α0 [ α3 ]
                    ]
                | _ => M.impossible
                end)
          ] in
      let* α8 := M.call_closure α0 [ α7 ] in
      M.alloc α8 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Numbers: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ]
            ] in
        let* α6 := M.call_closure α5 [ numbers ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Errors: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.path "core::num::error::ParseIntError";
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α6 := M.call_closure α5 [ errors ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
