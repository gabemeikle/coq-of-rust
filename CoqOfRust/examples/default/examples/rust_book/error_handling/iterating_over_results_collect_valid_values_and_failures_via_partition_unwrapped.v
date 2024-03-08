(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let strings = vec!["tofu", "93", "18"];
    let (numbers, errors): (Vec<_>, Vec<_>) = strings
        .into_iter()
        .map(|s| s.parse::<i32>())
        .partition(Result::is_ok);
    let numbers: Vec<_> = numbers.into_iter().map(Result::unwrap).collect();
    let errors: Vec<_> = errors.into_iter().map(Result::unwrap_err).collect();
    println!("Numbers: {:?}", numbers);
    println!("Errors: {:?}", errors);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* strings :=
      let* α0 := M.read (mk_str "tofu") in
      let* α1 := M.read (mk_str "93") in
      let* α2 := M.read (mk_str "18") in
      let* α3 := M.alloc [ α0; α1; α2 ] in
      let* α4 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α3 ] in
      let* α5 := M.read α4 in
      let* α6 :=
        M.call
          (Ty.apply
              (Ty.path "slice")
              [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ])::["into_vec"]
          [ pointer_coercion "Unsize" α5 ] in
      M.alloc α6 in
    let* α0 :=
      M.get_method
        "core::iter::traits::iterator::Iterator"
        "partition"
        [
          (* Self *)
            Ty.apply
              (Ty.path "core::iter::adapters::map::Map")
              [
                Ty.apply
                  (Ty.path "alloc::vec::into_iter::IntoIter")
                  [
                    Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                    Ty.path "alloc::alloc::Global"
                  ];
                Ty.function
                  [ Ty.tuple [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ] ]
                  (Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError"
                    ])
              ];
          (* B *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply
                  (Ty.path "core::result::Result")
                  [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ];
                Ty.path "alloc::alloc::Global"
              ];
          (* F *)
            Ty.function
              [
                Ty.apply
                  (Ty.path "ref")
                  [
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError"
                      ]
                  ]
              ]
              (Ty.path "bool")
        ] in
    let* α1 :=
      M.get_method
        "core::iter::traits::iterator::Iterator"
        "map"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::into_iter::IntoIter")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "alloc::alloc::Global"
              ];
          (* B *)
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ];
          (* F *)
            Ty.function
              [ Ty.tuple [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ] ]
              (Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
        ] in
    let* α2 :=
      M.get_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "alloc::alloc::Global"
              ]
        ] in
    let* α3 := M.read strings in
    let* α4 := M.call α2 [ α3 ] in
    let* α5 :=
      M.call
        α1
        [
          α4;
          fun (α0 : Ty.apply (Ty.path "ref") [ Ty.path "str" ]) =>
            (let* α0 := M.alloc α0 in
            match_operator
              α0
              [
                fun γ =>
                  (let* s := M.copy γ in
                  let* α0 := M.read s in
                  M.call (Ty.path "str")::["parse"] [ α0 ]) :
                  _
              ]) :
            _
        ] in
    let* α6 :=
      M.call
        α0
        [
          α5;
          (Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError"
              ])::["is_ok"]
        ] in
    let* α7 := M.alloc α6 in
    let* α0 :=
      match_operator
        α7
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* numbers := M.copy γ0_0 in
              let* errors := M.copy γ0_1 in
              let* numbers :=
                let* α0 :=
                  M.get_method
                    "core::iter::traits::iterator::Iterator"
                    "collect"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "core::iter::adapters::map::Map")
                          [
                            Ty.apply
                              (Ty.path "alloc::vec::into_iter::IntoIter")
                              [
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  [
                                    Ty.path "i32";
                                    Ty.path "core::num::error::ParseIntError"
                                  ];
                                Ty.path "alloc::alloc::Global"
                              ];
                            Ty.function
                              [
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  [
                                    Ty.path "i32";
                                    Ty.path "core::num::error::ParseIntError"
                                  ]
                              ]
                              (Ty.path "i32")
                          ];
                      (* B *)
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                    ] in
                let* α1 :=
                  M.get_method
                    "core::iter::traits::iterator::Iterator"
                    "map"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "alloc::vec::into_iter::IntoIter")
                          [
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.path "i32";
                                Ty.path "core::num::error::ParseIntError"
                              ];
                            Ty.path "alloc::alloc::Global"
                          ];
                      (* B *) Ty.path "i32";
                      (* F *)
                        Ty.function
                          [
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.path "i32";
                                Ty.path "core::num::error::ParseIntError"
                              ]
                          ]
                          (Ty.path "i32")
                    ] in
                let* α2 :=
                  M.get_method
                    "core::iter::traits::collect::IntoIterator"
                    "into_iter"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.path "i32";
                                Ty.path "core::num::error::ParseIntError"
                              ];
                            Ty.path "alloc::alloc::Global"
                          ]
                    ] in
                let* α3 := M.read numbers in
                let* α4 := M.call α2 [ α3 ] in
                let* α5 :=
                  M.call
                    α1
                    [
                      α4;
                      (Ty.apply
                          (Ty.path "core::result::Result")
                          [
                            Ty.path "i32";
                            Ty.path "core::num::error::ParseIntError"
                          ])::["unwrap"]
                    ] in
                let* α6 := M.call α0 [ α5 ] in
                M.alloc α6 in
              let* errors :=
                let* α0 :=
                  M.get_method
                    "core::iter::traits::iterator::Iterator"
                    "collect"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "core::iter::adapters::map::Map")
                          [
                            Ty.apply
                              (Ty.path "alloc::vec::into_iter::IntoIter")
                              [
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  [
                                    Ty.path "i32";
                                    Ty.path "core::num::error::ParseIntError"
                                  ];
                                Ty.path "alloc::alloc::Global"
                              ];
                            Ty.function
                              [
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  [
                                    Ty.path "i32";
                                    Ty.path "core::num::error::ParseIntError"
                                  ]
                              ]
                              (Ty.path "core::num::error::ParseIntError")
                          ];
                      (* B *)
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [
                            Ty.path "core::num::error::ParseIntError";
                            Ty.path "alloc::alloc::Global"
                          ]
                    ] in
                let* α1 :=
                  M.get_method
                    "core::iter::traits::iterator::Iterator"
                    "map"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "alloc::vec::into_iter::IntoIter")
                          [
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.path "i32";
                                Ty.path "core::num::error::ParseIntError"
                              ];
                            Ty.path "alloc::alloc::Global"
                          ];
                      (* B *) Ty.path "core::num::error::ParseIntError";
                      (* F *)
                        Ty.function
                          [
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.path "i32";
                                Ty.path "core::num::error::ParseIntError"
                              ]
                          ]
                          (Ty.path "core::num::error::ParseIntError")
                    ] in
                let* α2 :=
                  M.get_method
                    "core::iter::traits::collect::IntoIterator"
                    "into_iter"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.path "i32";
                                Ty.path "core::num::error::ParseIntError"
                              ];
                            Ty.path "alloc::alloc::Global"
                          ]
                    ] in
                let* α3 := M.read errors in
                let* α4 := M.call α2 [ α3 ] in
                let* α5 :=
                  M.call
                    α1
                    [
                      α4;
                      (Ty.apply
                          (Ty.path "core::result::Result")
                          [
                            Ty.path "i32";
                            Ty.path "core::num::error::ParseIntError"
                          ])::["unwrap_err"]
                    ] in
                let* α6 := M.call α0 [ α5 ] in
                M.alloc α6 in
              let* _ :=
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "Numbers: ") in
                  let* α2 := M.read (mk_str "
") in
                  let* α3 := M.alloc [ α1; α2 ] in
                  let* α4 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_debug"]
                      [ numbers ] in
                  let* α5 := M.alloc [ α4 ] in
                  let* α6 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" α3;
                        pointer_coercion "Unsize" α5
                      ] in
                  let* α7 := M.call α0 [ α6 ] in
                  M.alloc α7 in
                M.alloc tt in
              let* _ :=
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "Errors: ") in
                  let* α2 := M.read (mk_str "
") in
                  let* α3 := M.alloc [ α1; α2 ] in
                  let* α4 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_debug"]
                      [ errors ] in
                  let* α5 := M.alloc [ α4 ] in
                  let* α6 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" α3;
                        pointer_coercion "Unsize" α5
                      ] in
                  let* α7 := M.call α0 [ α6 ] in
                  M.alloc α7 in
                M.alloc tt in
              M.alloc tt
            end) :
            Ty.path "unit"
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
