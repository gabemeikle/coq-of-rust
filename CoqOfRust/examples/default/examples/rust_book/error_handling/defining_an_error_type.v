(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "DoubleError";
    ty_params := [];
  } *)

Module Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError.
  Definition Self : Ty.t := Ty.path "defining_an_error_type::DoubleError".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "write_str" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "DoubleError") in
      M.call_closure α0 [ α1; α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "defining_an_error_type::DoubleError")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError.

Module Impl_core_clone_Clone_for_defining_an_error_type_DoubleError.
  Definition Self : Ty.t := Ty.path "defining_an_error_type::DoubleError".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      M.pure (Value.StructTuple "defining_an_error_type::DoubleError" [])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "defining_an_error_type::DoubleError")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_defining_an_error_type_DoubleError.

Axiom Result :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "defining_an_error_type::Result") [ T ]) =
    (Ty.apply
      (Ty.path "core::result::Result")
      [ T; Ty.path "defining_an_error_type::DoubleError" ]).

Module Impl_core_fmt_Display_for_defining_an_error_type_DoubleError.
  Definition Self : Ty.t := Ty.path "defining_an_error_type::DoubleError".
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "invalid first item to double")
      }
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "write_fmt" in
      let* α1 := M.read f in
      let* α2 :=
        M.get_associated_function
          (Ty.path "core::fmt::Arguments")
          "new_const" in
      let* α3 := M.read (mk_str "invalid first item to double") in
      let* α4 := M.alloc (Value.Array [ α3 ]) in
      let* α5 := M.call_closure α2 [ M.pointer_coercion (* Unsize *) α4 ] in
      M.call_closure α0 [ α1; α5 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      (* Self *) (Ty.path "defining_an_error_type::DoubleError")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Display_for_defining_an_error_type_DoubleError.

(*
fn double_first(vec: Vec<&str>) -> Result<i32> {
    vec.first()
        // Change the error to our new type.
        .ok_or(DoubleError)
        .and_then(|s| {
            s.parse::<i32>()
                // Update to the new error type here also.
                .map_err(|_| DoubleError)
                .map(|i| 2 * i)
        })
}
*)
Definition double_first (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ vec ] =>
    let* vec := M.alloc vec in
    let* α0 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::result::Result")
          [
            Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
            Ty.path "defining_an_error_type::DoubleError"
          ])
        "and_then" in
    let* α1 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::option::Option")
          [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
          ])
        "ok_or" in
    let* α2 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "slice")
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
        "first" in
    let* α3 :=
      M.get_trait_method
        "core::ops::deref::Deref"
        "deref"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply (Ty.path "&") [ Ty.path "str" ];
                Ty.path "alloc::alloc::Global"
              ]
        ] in
    let* α4 := M.call_closure α3 [ vec ] in
    let* α5 := M.call_closure α2 [ α4 ] in
    let* α6 :=
      M.call_closure
        α1
        [ α5; Value.StructTuple "defining_an_error_type::DoubleError" [] ] in
    M.call_closure
      α0
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
                    let* s := M.copy γ in
                    let* α0 :=
                      M.get_associated_function
                        (Ty.apply
                          (Ty.path "core::result::Result")
                          [
                            Ty.path "i32";
                            Ty.path "defining_an_error_type::DoubleError"
                          ])
                        "map" in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.apply
                          (Ty.path "core::result::Result")
                          [
                            Ty.path "i32";
                            Ty.path "core::num::error::ParseIntError"
                          ])
                        "map_err" in
                    let* α2 :=
                      M.get_associated_function (Ty.path "str") "parse" in
                    let* α3 := M.read s in
                    let* α4 := M.read α3 in
                    let* α5 := M.call_closure α2 [ α4 ] in
                    let* α6 :=
                      M.call_closure
                        α1
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
                                      M.pure
                                        (Value.StructTuple
                                          "defining_an_error_type::DoubleError"
                                          [])
                                  ]
                              | _ => M.impossible
                              end)
                        ] in
                    M.call_closure
                      α0
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
                                    let* i := M.copy γ in
                                    let* α0 := M.read i in
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
fn print(result: Result<i32>) {
    match result {
        Ok(n) => println!("The first doubled is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Definition print (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ result ] =>
    let* result := M.alloc result in
    let* α0 :=
      match_operator
        result
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Ok"
                0 in
            let* n := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "The first doubled is ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α6 := M.call_closure α5 [ n ] in
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
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Err"
                0 in
            let* e := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "Error: ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α6 := M.call_closure α5 [ e ] in
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
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    print(double_first(numbers));
    print(double_first(empty));
    print(double_first(strings));
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
          "into_vec" in
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
          "new" in
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
          "new" in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* strings :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec" in
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
          "new" in
      let* α2 := M.read (mk_str "tofu") in
      let* α3 := M.read (mk_str "93") in
      let* α4 := M.read (mk_str "18") in
      let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
      let* α6 := M.call_closure α1 [ α5 ] in
      let* α7 := M.read α6 in
      let* α8 := M.call_closure α0 [ M.pointer_coercion (* Unsize *) α7 ] in
      M.alloc α8 in
    let* _ :=
      let* α0 := M.get_function "defining_an_error_type::print" [] in
      let* α1 := M.get_function "defining_an_error_type::double_first" [] in
      let* α2 := M.read numbers in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.call_closure α0 [ α3 ] in
      M.alloc α4 in
    let* _ :=
      let* α0 := M.get_function "defining_an_error_type::print" [] in
      let* α1 := M.get_function "defining_an_error_type::double_first" [] in
      let* α2 := M.read empty in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.call_closure α0 [ α3 ] in
      M.alloc α4 in
    let* _ :=
      let* α0 := M.get_function "defining_an_error_type::print" [] in
      let* α1 := M.get_function "defining_an_error_type::double_first" [] in
      let* α2 := M.read strings in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.call_closure α0 [ α3 ] in
      M.alloc α4 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
