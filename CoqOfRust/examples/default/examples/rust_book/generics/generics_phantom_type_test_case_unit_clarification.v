(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Inch *)
(* {
  ty_params := [];
  variants := [];
} *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read self in
      let* α1 := match_operator α0 [] in
      let* α2 := M.read α1 in
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Inch")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Inch")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Inch")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.

(* Enum Mm *)
(* {
  ty_params := [];
  variants := [];
} *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read self in
      let* α1 := match_operator α0 [] in
      let* α2 := M.read α1 in
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Mm")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Mm")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Mm")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.

(* Struct
  {
    name := "Length";
    ty_params := [ ("Unit", None) ];
    fields :=
      [ Ty.path "f64"; Ty.apply (Ty.path "core::marker::PhantomData") [ Unit ]
      ];
  } *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; Unit ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_tuple_field2_finish" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Length") in
      let* α3 := M.read self in
      let* α4 := M.read self in
      let* α5 := M.alloc (M.get_struct_tuple α4 1) in
      M.call
        α0
        [
          α1;
          α2;
          M.pointer_coercion (* Unsize *) (M.get_struct_tuple α3 0);
          M.pointer_coercion (* Unsize *) α5
        ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *)
        (Ty.apply
          (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
          [ Unit ])
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [ Unit ].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; Unit ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_trait_method
          "core::clone::Clone"
          "clone"
          [ (* Self *) Ty.path "f64" ] in
      let* α1 := M.read self in
      let* α2 := M.call α0 [ M.get_struct_tuple α1 0 ] in
      let* α3 :=
        M.get_trait_method
          "core::clone::Clone"
          "clone"
          [ (* Self *) Ty.apply (Ty.path "core::marker::PhantomData") [ Unit ]
          ] in
      let* α4 := M.read self in
      let* α5 := M.call α3 [ M.get_struct_tuple α4 1 ] in
      M.pure
        (Value.StructTuple
          "generics_phantom_type_test_case_unit_clarification::Length"
          [ α2; α5 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *)
        (Ty.apply
          (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
          [ Unit ])
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [ Unit ].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *)
        (Ty.apply
          (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
          [ Unit ])
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [ Unit ].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  (*
      type Output = Length<Unit>;
  *)
  Definition Output : Ty.t :=
    Ty.apply
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
        [ Unit ].
  
  (*
      fn add(self, rhs: Length<Unit>) -> Length<Unit> {
          // `+` calls the `Add` implementation for `f64`.
          Length(self.0 + rhs.0, PhantomData)
      }
  *)
  Definition add (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; Unit ], [ self; rhs ] =>
      let* self := M.alloc self in
      let* rhs := M.alloc rhs in
      let* α0 := M.read (M.get_struct_tuple self 0) in
      let* α1 := M.read (M.get_struct_tuple rhs 0) in
      let* α2 := BinOp.Panic.add α0 α1 in
      M.pure
        (Value.StructTuple
          "generics_phantom_type_test_case_unit_clarification::Length"
          [ α2; Value.StructTuple "core::marker::PhantomData" [] ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::ops::arith::Add"
      (* Self *)
        (Ty.apply
          (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
          [ Unit ])
      (* Trait polymorphic types *) []
      (* Instance *)
        [ ("Output", InstanceField.Ty Output); ("add", InstanceField.Method add)
        ]
      (* Instance polymorphic types *) [ Unit ].
End Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

(*
fn main() {
    // Specifies `one_foot` to have phantom type parameter `Inch`.
    let one_foot: Length<Inch> = Length(12.0, PhantomData);
    // `one_meter` has phantom type parameter `Mm`.
    let one_meter: Length<Mm> = Length(1000.0, PhantomData);

    // `+` calls the `add()` method we implemented for `Length<Unit>`.
    //
    // Since `Length` implements `Copy`, `add()` does not consume
    // `one_foot` and `one_meter` but copies them into `self` and `rhs`.
    let two_feet = one_foot + one_foot;
    let two_meters = one_meter + one_meter;

    // Addition works.
    println!("one foot + one_foot = {:?} in", two_feet.0);
    println!("one meter + one_meter = {:?} mm", two_meters.0);

    // Nonsensical operations fail as they should:
    // Compile-time Error: type mismatch.
    //let one_feter = one_foot + one_meter;
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* one_foot :=
      let* α0 := M.read UnsupportedLiteral in
      M.alloc
        (Value.StructTuple
          "generics_phantom_type_test_case_unit_clarification::Length"
          [ α0; Value.StructTuple "core::marker::PhantomData" [] ]) in
    let* one_meter :=
      let* α0 := M.read UnsupportedLiteral in
      M.alloc
        (Value.StructTuple
          "generics_phantom_type_test_case_unit_clarification::Length"
          [ α0; Value.StructTuple "core::marker::PhantomData" [] ]) in
    let* two_feet :=
      let* α0 :=
        M.get_trait_method
          "core::ops::arith::Add"
          "add"
          [
            (* Self *)
              Ty.apply
                (Ty.path
                  "generics_phantom_type_test_case_unit_clarification::Length")
                [
                  Ty.path
                    "generics_phantom_type_test_case_unit_clarification::Inch"
                ];
            (* Rhs *)
              Ty.apply
                (Ty.path
                  "generics_phantom_type_test_case_unit_clarification::Length")
                [
                  Ty.path
                    "generics_phantom_type_test_case_unit_clarification::Inch"
                ]
          ] in
      let* α1 := M.read one_foot in
      let* α2 := M.read one_foot in
      let* α3 := M.call α0 [ α1; α2 ] in
      M.alloc α3 in
    let* two_meters :=
      let* α0 :=
        M.get_trait_method
          "core::ops::arith::Add"
          "add"
          [
            (* Self *)
              Ty.apply
                (Ty.path
                  "generics_phantom_type_test_case_unit_clarification::Length")
                [
                  Ty.path
                    "generics_phantom_type_test_case_unit_clarification::Mm"
                ];
            (* Rhs *)
              Ty.apply
                (Ty.path
                  "generics_phantom_type_test_case_unit_clarification::Length")
                [
                  Ty.path
                    "generics_phantom_type_test_case_unit_clarification::Mm"
                ]
          ] in
      let* α1 := M.read one_meter in
      let* α2 := M.read one_meter in
      let* α3 := M.call α0 [ α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "one foot + one_foot = ") in
        let* α3 := M.read (mk_str " in
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ M.get_struct_tuple two_feet 0 ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "one meter + one_meter = ") in
        let* α3 := M.read (mk_str " mm
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ M.get_struct_tuple two_meters 0 ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
