(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "PhoneNumber";
    ty_params := [];
    fields :=
      [
        ("area_code",
          Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ]);
        ("number", Ty.path "u32")
      ];
  } *)

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self : Ty.t :=
    Ty.path "unpacking_options_via_question_mark::PhoneNumber".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          Value.DeclaredButUndefined
          [
            fun γ =>
              match_operator Value.DeclaredButUndefined [ fun γ => M.read self ]
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "unpacking_options_via_question_mark::PhoneNumber")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self : Ty.t :=
    Ty.path "unpacking_options_via_question_mark::PhoneNumber".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "unpacking_options_via_question_mark::PhoneNumber")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.

(* StructRecord
  {
    name := "Job";
    ty_params := [];
    fields :=
      [
        ("phone_number",
          Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_via_question_mark::PhoneNumber" ])
      ];
  } *)

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.
  Definition Self : Ty.t := Ty.path "unpacking_options_via_question_mark::Job".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator Value.DeclaredButUndefined [ fun γ => M.read self ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "unpacking_options_via_question_mark::Job")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.
  Definition Self : Ty.t := Ty.path "unpacking_options_via_question_mark::Job".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "unpacking_options_via_question_mark::Job")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.

(* StructRecord
  {
    name := "Person";
    ty_params := [];
    fields :=
      [
        ("job",
          Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_via_question_mark::Job" ])
      ];
  } *)

Module Impl_unpacking_options_via_question_mark_Person.
  Definition Self : Ty.t :=
    Ty.path "unpacking_options_via_question_mark::Person".
  
  (*
      fn work_phone_area_code(&self) -> Option<u8> {
          // This would need many nested `match` statements without the `?` operator.
          // It would take a lot more code - try writing it yourself and see which
          // is easier.
          self.job?.phone_number?.area_code
      }
  *)
  Definition work_phone_area_code (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_trait_method
          "core::ops::try_trait::Try"
          "branch"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::option::Option")
                [ Ty.path "unpacking_options_via_question_mark::PhoneNumber" ]
          ] in
      let* α1 :=
        M.get_trait_method
          "core::ops::try_trait::Try"
          "branch"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::option::Option")
                [ Ty.path "unpacking_options_via_question_mark::Job" ]
          ] in
      let* α2 := M.read self in
      let* α3 := M.read (M.get_struct_record α2 "job") in
      let* α4 := M.call α1 [ α3 ] in
      let* α5 := M.alloc α4 in
      let* α6 :=
        match_operator
          α5
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::ops::control_flow::ControlFlow::Break"
                  0 in
              let* residual := M.copy γ0_0 in
              let* α0 :=
                M.get_trait_method
                  "core::ops::try_trait::FromResidual"
                  "from_residual"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "u8" ];
                    (* R *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "core::convert::Infallible" ]
                  ] in
              let* α1 := M.read residual in
              let* α2 := M.call α0 [ α1 ] in
              let* α3 := M.return_ α2 in
              let* α4 := M.read α3 in
              let* α5 := M.never_to_any α4 in
              M.alloc α5;
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::ops::control_flow::ControlFlow::Continue"
                  0 in
              let* val := M.copy γ0_0 in
              M.pure val
          ] in
      let* α7 := M.read (M.get_struct_record α6 "phone_number") in
      let* α8 := M.call α0 [ α7 ] in
      let* α9 := M.alloc α8 in
      let* α10 :=
        match_operator
          α9
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::ops::control_flow::ControlFlow::Break"
                  0 in
              let* residual := M.copy γ0_0 in
              let* α0 :=
                M.get_trait_method
                  "core::ops::try_trait::FromResidual"
                  "from_residual"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "u8" ];
                    (* R *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "core::convert::Infallible" ]
                  ] in
              let* α1 := M.read residual in
              let* α2 := M.call α0 [ α1 ] in
              let* α3 := M.return_ α2 in
              let* α4 := M.read α3 in
              let* α5 := M.never_to_any α4 in
              M.alloc α5;
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::ops::control_flow::ControlFlow::Continue"
                  0 in
              let* val := M.copy γ0_0 in
              M.pure val
          ] in
      M.read (M.get_struct_record α10 "area_code")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_work_phone_area_code :
    M.IsAssociatedFunction Self "work_phone_area_code" work_phone_area_code.
End Impl_unpacking_options_via_question_mark_Person.

(*
fn main() {
    let p = Person {
        job: Some(Job {
            phone_number: Some(PhoneNumber {
                area_code: Some(61),
                number: 439222222,
            }),
        }),
    };

    assert_eq!(p.work_phone_area_code(), Some(61));
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* p :=
      M.alloc
        (Value.StructRecord
          "unpacking_options_via_question_mark::Person"
          [
            ("job",
              Value.StructTuple
                "core::option::Option::Some"
                [
                  Value.StructRecord
                    "unpacking_options_via_question_mark::Job"
                    [
                      ("phone_number",
                        Value.StructTuple
                          "core::option::Option::Some"
                          [
                            Value.StructRecord
                              "unpacking_options_via_question_mark::PhoneNumber"
                              [
                                ("area_code",
                                  Value.StructTuple
                                    "core::option::Option::Some"
                                    [ Value.Integer Integer.U8 61 ]);
                                ("number", Value.Integer Integer.U32 439222222)
                              ]
                          ])
                    ]
                ])
          ]) in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "unpacking_options_via_question_mark::Person")
          "work_phone_area_code" in
      let* α1 := M.call α0 [ p ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        M.alloc
          (Value.StructTuple
            "core::option::Option::Some"
            [ Value.Integer Integer.U8 61 ]) in
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
                    Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ];
                  (* Rhs *)
                    Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ]
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
                    Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ];
                    Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ]
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
