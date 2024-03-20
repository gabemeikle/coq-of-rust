(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let names = vec!["Bob", "Frank", "Ferris"];

    for name in names.into_iter() {
        match name {
            "Ferris" => println!("There is a rustacean among us!"),
            _ => println!("Hello {}", name),
        }
    }

    // println!("names: {:?}", names);
    // FIXME ^ Comment out this line
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* names :=
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
      let* α2 := M.read (mk_str "Bob") in
      let* α3 := M.read (mk_str "Frank") in
      let* α4 := M.read (mk_str "Ferris") in
      let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
      let* α6 := M.call_closure α1 [ α5 ] in
      let* α7 := M.read α6 in
      let* α8 := M.call_closure α0 [ M.pointer_coercion (* Unsize *) α7 ] in
      M.alloc α8 in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        (Ty.apply
          (Ty.path "alloc::vec::into_iter::IntoIter")
          [
            Ty.apply (Ty.path "&") [ Ty.path "str" ];
            Ty.path "alloc::alloc::Global"
          ])
        []
        "into_iter"
        [] in
    let* α1 :=
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
    let* α2 := M.read names in
    let* α3 := M.call_closure α1 [ α2 ] in
    let* α4 := M.call_closure α0 [ α3 ] in
    let* α5 := M.alloc α4 in
    let* α6 :=
      match_operator
        α5
        [
          fun γ =>
            let* iter := M.copy γ in
            M.loop
              (let* _ :=
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::iterator::Iterator"
                    (Ty.apply
                      (Ty.path "alloc::vec::into_iter::IntoIter")
                      [
                        Ty.apply (Ty.path "&") [ Ty.path "str" ];
                        Ty.path "alloc::alloc::Global"
                      ])
                    []
                    "next"
                    [] in
                let* α1 := M.call_closure α0 [ iter ] in
                let* α2 := M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      let* α0 := M.break in
                      let* α1 := M.read α0 in
                      let* α2 := M.never_to_any α1 in
                      M.alloc α2;
                    fun γ =>
                      let* γ0_0 :=
                        M.get_struct_tuple_field_or_break_match
                          γ
                          "core::option::Option::Some"
                          0 in
                      let* name := M.copy γ0_0 in
                      match_operator
                        name
                        [
                          fun γ =>
                            let* _ :=
                              let* α0 :=
                                M.get_function "std::io::stdio::_print" [] in
                              let* α1 :=
                                M.get_associated_function
                                  (Ty.path "core::fmt::Arguments")
                                  "new_const"
                                  [] in
                              let* α2 :=
                                M.read
                                  (mk_str "There is a rustacean among us!
") in
                              let* α3 := M.alloc (Value.Array [ α2 ]) in
                              let* α4 :=
                                M.call_closure
                                  α1
                                  [ M.pointer_coercion (* Unsize *) α3 ] in
                              let* α5 := M.call_closure α0 [ α4 ] in
                              M.alloc α5 in
                            M.alloc (Value.Tuple []);
                          fun γ =>
                            let* _ :=
                              let* α0 :=
                                M.get_function "std::io::stdio::_print" [] in
                              let* α1 :=
                                M.get_associated_function
                                  (Ty.path "core::fmt::Arguments")
                                  "new_v1"
                                  [] in
                              let* α2 := M.read (mk_str "Hello ") in
                              let* α3 := M.read (mk_str "
") in
                              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                              let* α5 :=
                                M.get_associated_function
                                  (Ty.path "core::fmt::rt::Argument")
                                  "new_display"
                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ]
                                  ] in
                              let* α6 := M.call_closure α5 [ name ] in
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
                            M.alloc (Value.Tuple [])
                        ]
                  ] in
              M.alloc (Value.Tuple []))
        ] in
    M.read (M.use α6)
  | _, _ => M.impossible
  end.
