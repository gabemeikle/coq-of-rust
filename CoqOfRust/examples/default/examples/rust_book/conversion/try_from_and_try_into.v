(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "EvenNumber";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

Module Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_tuple_field1_finish" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "EvenNumber") in
      let* α3 := M.read self in
      let* α4 := M.alloc (M.get_struct_tuple α3 0) in
      M.call α0 [ α1; α2; M.pointer_coercion (* Unsize *) α4 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.

Module Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.
  (*
  PartialEq
  *)
  Definition eq (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      let* α0 := M.read self in
      let* α1 := M.read (M.get_struct_tuple α0 0) in
      let* α2 := M.read other in
      let* α3 := M.read (M.get_struct_tuple α2 0) in
      M.pure (BinOp.Pure.eq α1 α3)
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_convert_TryFrom_i32_for_try_from_and_try_into_EvenNumber.
  (*
      type Error = ();
  *)
  Definition Error : Ty.t := Ty.tuple [].
  
  (*
      fn try_from(value: i32) -> Result<Self, Self::Error> {
          if value % 2 == 0 {
              Ok(EvenNumber(value))
          } else {
              Err(())
          }
      }
  *)
  Definition try_from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ value ] =>
      let* value := M.alloc value in
      let* α0 := M.read value in
      let* α1 := BinOp.Panic.rem α0 (Value.Integer Integer.I32 2) in
      let* α2 := M.alloc (BinOp.Pure.eq α1 (Value.Integer Integer.I32 0)) in
      let* α3 := M.read (M.use α2) in
      let* α4 :=
        if Value.is_true α3 then
          let* α0 := M.read value in
          M.alloc
            (Value.StructTuple
              "core::result::Result::Ok"
              [ Value.StructTuple "try_from_and_try_into::EvenNumber" [ α0 ] ])
        else
          M.alloc
            (Value.StructTuple
              "core::result::Result::Err"
              [ Value.Tuple [] ]) in
      M.read α4
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::TryFrom"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      (* Trait polymorphic types *) [ (* T *) Ty.path "i32" ]
      (* Instance *)
        [
          ("Error", InstanceField.Ty Error);
          ("try_from", InstanceField.Method try_from)
        ]
      (* Instance polymorphic types *) [].
End Impl_core_convert_TryFrom_i32_for_try_from_and_try_into_EvenNumber.

(*
fn main() {
    // TryFrom

    assert_eq!(EvenNumber::try_from(8), Ok(EvenNumber(8)));
    assert_eq!(EvenNumber::try_from(5), Err(()));

    // TryInto

    let result: Result<EvenNumber, ()> = 8i32.try_into();
    assert_eq!(result, Ok(EvenNumber(8)));
    let result: Result<EvenNumber, ()> = 5i32.try_into();
    assert_eq!(result, Err(()));
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::convert::TryFrom"
          "try_from"
          [
            (* Self *) Ty.path "try_from_and_try_into::EvenNumber";
            (* T *) Ty.path "i32"
          ] in
      let* α1 := M.call α0 [ Value.Integer Integer.I32 8 ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        M.alloc
          (Value.StructTuple
            "core::result::Result::Ok"
            [
              Value.StructTuple
                "try_from_and_try_into::EvenNumber"
                [ Value.Integer Integer.I32 8 ]
            ]) in
      let* α4 := M.alloc (Value.Tuple [ α2; α3 ]) in
      match_operator
        α4
        [
          fun γ =>
            let* γ0_0 := M.get_tuple_field γ 0 in
            let* γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 :=
              M.get_trait_method
                "core::cmp::PartialEq"
                "eq"
                [
                  (* Self *)
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ];
                  (* Rhs *)
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ]
                ] in
            let* α1 := M.read left_val in
            let* α2 := M.read right_val in
            let* α3 := M.call α0 [ α1; α2 ] in
            let* α4 := M.alloc (UnOp.Pure.not α3) in
            let* α5 := M.read (M.use α4) in
            if Value.is_true α5 then
              let* kind :=
                M.alloc
                  (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
              let* α0 :=
                M.get_function
                  "core::panicking::assert_failed"
                  [
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ];
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ]
                  ] in
              let* α1 := M.read kind in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 :=
                M.call
                  α0
                  [
                    α1;
                    α2;
                    α3;
                    Value.StructTuple "core::option::Option::None" []
                  ] in
              let* α0 := M.alloc α4 in
              let* α1 := M.read α0 in
              let* α2 := M.never_to_any α1 in
              M.alloc α2
            else
              M.alloc (Value.Tuple [])
        ] in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::convert::TryFrom"
          "try_from"
          [
            (* Self *) Ty.path "try_from_and_try_into::EvenNumber";
            (* T *) Ty.path "i32"
          ] in
      let* α1 := M.call α0 [ Value.Integer Integer.I32 5 ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        M.alloc
          (Value.StructTuple "core::result::Result::Err" [ Value.Tuple [] ]) in
      let* α4 := M.alloc (Value.Tuple [ α2; α3 ]) in
      match_operator
        α4
        [
          fun γ =>
            let* γ0_0 := M.get_tuple_field γ 0 in
            let* γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 :=
              M.get_trait_method
                "core::cmp::PartialEq"
                "eq"
                [
                  (* Self *)
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ];
                  (* Rhs *)
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ]
                ] in
            let* α1 := M.read left_val in
            let* α2 := M.read right_val in
            let* α3 := M.call α0 [ α1; α2 ] in
            let* α4 := M.alloc (UnOp.Pure.not α3) in
            let* α5 := M.read (M.use α4) in
            if Value.is_true α5 then
              let* kind :=
                M.alloc
                  (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
              let* α0 :=
                M.get_function
                  "core::panicking::assert_failed"
                  [
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ];
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ]
                  ] in
              let* α1 := M.read kind in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 :=
                M.call
                  α0
                  [
                    α1;
                    α2;
                    α3;
                    Value.StructTuple "core::option::Option::None" []
                  ] in
              let* α0 := M.alloc α4 in
              let* α1 := M.read α0 in
              let* α2 := M.never_to_any α1 in
              M.alloc α2
            else
              M.alloc (Value.Tuple [])
        ] in
    let* result :=
      let* α0 :=
        M.get_trait_method
          "core::convert::TryInto"
          "try_into"
          [
            (* Self *) Ty.path "i32";
            (* T *) Ty.path "try_from_and_try_into::EvenNumber"
          ] in
      let* α1 := M.call α0 [ Value.Integer Integer.I32 8 ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.alloc
          (Value.StructTuple
            "core::result::Result::Ok"
            [
              Value.StructTuple
                "try_from_and_try_into::EvenNumber"
                [ Value.Integer Integer.I32 8 ]
            ]) in
      let* α1 := M.alloc (Value.Tuple [ result; α0 ]) in
      match_operator
        α1
        [
          fun γ =>
            let* γ0_0 := M.get_tuple_field γ 0 in
            let* γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 :=
              M.get_trait_method
                "core::cmp::PartialEq"
                "eq"
                [
                  (* Self *)
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ];
                  (* Rhs *)
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ]
                ] in
            let* α1 := M.read left_val in
            let* α2 := M.read right_val in
            let* α3 := M.call α0 [ α1; α2 ] in
            let* α4 := M.alloc (UnOp.Pure.not α3) in
            let* α5 := M.read (M.use α4) in
            if Value.is_true α5 then
              let* kind :=
                M.alloc
                  (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
              let* α0 :=
                M.get_function
                  "core::panicking::assert_failed"
                  [
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ];
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ]
                  ] in
              let* α1 := M.read kind in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 :=
                M.call
                  α0
                  [
                    α1;
                    α2;
                    α3;
                    Value.StructTuple "core::option::Option::None" []
                  ] in
              let* α0 := M.alloc α4 in
              let* α1 := M.read α0 in
              let* α2 := M.never_to_any α1 in
              M.alloc α2
            else
              M.alloc (Value.Tuple [])
        ] in
    let* result :=
      let* α0 :=
        M.get_trait_method
          "core::convert::TryInto"
          "try_into"
          [
            (* Self *) Ty.path "i32";
            (* T *) Ty.path "try_from_and_try_into::EvenNumber"
          ] in
      let* α1 := M.call α0 [ Value.Integer Integer.I32 5 ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.alloc
          (Value.StructTuple "core::result::Result::Err" [ Value.Tuple [] ]) in
      let* α1 := M.alloc (Value.Tuple [ result; α0 ]) in
      match_operator
        α1
        [
          fun γ =>
            let* γ0_0 := M.get_tuple_field γ 0 in
            let* γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 :=
              M.get_trait_method
                "core::cmp::PartialEq"
                "eq"
                [
                  (* Self *)
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ];
                  (* Rhs *)
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ]
                ] in
            let* α1 := M.read left_val in
            let* α2 := M.read right_val in
            let* α3 := M.call α0 [ α1; α2 ] in
            let* α4 := M.alloc (UnOp.Pure.not α3) in
            let* α5 := M.read (M.use α4) in
            if Value.is_true α5 then
              let* kind :=
                M.alloc
                  (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
              let* α0 :=
                M.get_function
                  "core::panicking::assert_failed"
                  [
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ];
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                      ]
                  ] in
              let* α1 := M.read kind in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 :=
                M.call
                  α0
                  [
                    α1;
                    α2;
                    α3;
                    Value.StructTuple "core::option::Option::None" []
                  ] in
              let* α0 := M.alloc α4 in
              let* α1 := M.read α0 in
              let* α2 := M.never_to_any α1 in
              M.alloc α2
            else
              M.alloc (Value.Tuple [])
        ] in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
