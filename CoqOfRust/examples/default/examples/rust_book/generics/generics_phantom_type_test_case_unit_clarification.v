(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Inch *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self : Ty.t :=
    Ty.path "generics_phantom_type_test_case_unit_clarification::Inch".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read self in
      let* α1 := match_operator (deref α0) [ ] in
      let* α2 := M.read α1 in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self : Ty.t :=
    Ty.path "generics_phantom_type_test_case_unit_clarification::Inch".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (deref α0)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self : Ty.t :=
    Ty.path "generics_phantom_type_test_case_unit_clarification::Inch".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.

(* Enum Mm *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self : Ty.t :=
    Ty.path "generics_phantom_type_test_case_unit_clarification::Mm".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read self in
      let* α1 := match_operator (deref α0) [ ] in
      let* α2 := M.read α1 in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self : Ty.t :=
    Ty.path "generics_phantom_type_test_case_unit_clarification::Mm".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (deref α0)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self : Ty.t :=
    Ty.path "generics_phantom_type_test_case_unit_clarification::Mm".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.

(* Struct Length *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply
      (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
      [Unit].
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "Length") in
      let* α2 := M.read self in
      let* α3 := M.read self in
      let* α4 :=
        M.alloc
          (borrow
            ((M.var
                "generics_phantom_type_test_case_unit_clarification::Length::Get_1")
              (deref α3))) in
      M.call
        ((Ty.path "core::fmt::Formatter")::["debug_tuple_field2_finish"]
          α0
          α1
          (pointer_coercion
            "Unsize"
            (borrow
              ((M.var
                  "generics_phantom_type_test_case_unit_clarification::Length::Get_0")
                (deref α2))))
          (pointer_coercion "Unsize" (borrow α4)))
    | _, _ => M.impossible
    end.
  
  Definition ℐ (Unit : Ty.t) : Instance.t :=
    [("fmt", InstanceField.Method (fmt Unit))].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply
      (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
      [Unit].
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.clone.Clone.clone (Self := Ty.path "f64") (Trait := ℐ))) in
      let* α1 := M.read self in
      let* α2 :=
        M.call
          (α0
            (borrow
              ((M.var
                  "generics_phantom_type_test_case_unit_clarification::Length::Get_0")
                (deref α1)))) in
      let* α3 :=
        ltac:(M.get_method (fun ℐ =>
          core.clone.Clone.clone
            (Self := Ty.apply (Ty.path "core::marker::PhantomData") [Unit])
            (Trait := ℐ))) in
      let* α4 := M.read self in
      let* α5 :=
        M.call
          (α3
            (borrow
              ((M.var
                  "generics_phantom_type_test_case_unit_clarification::Length::Get_1")
                (deref α4)))) in
      M.pure
        (generics_phantom_type_test_case_unit_clarification.Length.Build_t
          α2
          α5)
    | _, _ => M.impossible
    end.
  
  Definition ℐ (Unit : Ty.t) : Instance.t :=
    [("clone", InstanceField.Method (clone Unit))].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply
      (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
      [Unit].
  
  Definition ℐ (Unit : Ty.t) : Instance.t := [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply
      (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
      [Unit].
  
  (*
      type Output = Length<Unit>;
  *)
  Definition Output : Set :=
    Ty.apply
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
        [Unit].
  
  (*
      fn add(self, rhs: Length<Unit>) -> Length<Unit> {
          // `+` calls the `Add` implementation for `f64`.
          Length(self.0 + rhs.0, PhantomData)
      }
  *)
  Definition add (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; rhs] =>
      let* self := M.alloc self in
      let* rhs := M.alloc rhs in
      let* α0 :=
        M.read
          ((M.var
              "generics_phantom_type_test_case_unit_clarification::Length::Get_0")
            self) in
      let* α1 :=
        M.read
          ((M.var
              "generics_phantom_type_test_case_unit_clarification::Length::Get_0")
            rhs) in
      let* α2 := (M.var "BinOp::Panic::add") α0 α1 in
      M.pure
        (generics_phantom_type_test_case_unit_clarification.Length.Build_t
          α2
          core.marker.PhantomData.Build)
    | _, _ => M.impossible
    end.
  
  Definition ℐ (Unit : Ty.t) : Instance.t :=
    [("Output", TODO); ("add", InstanceField.Method (add Unit))].
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* one_foot :=
      let* α0 := M.read (UnsupportedLiteral : Ty.path "f64") in
      M.alloc
        (generics_phantom_type_test_case_unit_clarification.Length.Build_t
          α0
          core.marker.PhantomData.Build) in
    let* one_meter :=
      let* α0 := M.read (UnsupportedLiteral : Ty.path "f64") in
      M.alloc
        (generics_phantom_type_test_case_unit_clarification.Length.Build_t
          α0
          core.marker.PhantomData.Build) in
    let* two_feet :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.arith.Add.add
            (Self :=
              Ty.apply
                (Ty.path
                  "generics_phantom_type_test_case_unit_clarification::Length")
                [Ty.path
                    "generics_phantom_type_test_case_unit_clarification::Inch"])
            (Rhs :=
              Ty.apply
                (Ty.path
                  "generics_phantom_type_test_case_unit_clarification::Length")
                [Ty.path
                    "generics_phantom_type_test_case_unit_clarification::Inch"])
            (Trait := ℐ))) in
      let* α1 := M.read one_foot in
      let* α2 := M.read one_foot in
      let* α3 := M.call (α0 α1 α2) in
      M.alloc α3 in
    let* two_meters :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.arith.Add.add
            (Self :=
              Ty.apply
                (Ty.path
                  "generics_phantom_type_test_case_unit_clarification::Length")
                [Ty.path
                    "generics_phantom_type_test_case_unit_clarification::Mm"])
            (Rhs :=
              Ty.apply
                (Ty.path
                  "generics_phantom_type_test_case_unit_clarification::Length")
                [Ty.path
                    "generics_phantom_type_test_case_unit_clarification::Mm"])
            (Trait := ℐ))) in
      let* α1 := M.read one_meter in
      let* α2 := M.read one_meter in
      let* α3 := M.call (α0 α1 α2) in
      M.alloc α3 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "one foot + one_foot = ") in
        let* α1 := M.read (mk_str " in
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
              (borrow
                ((M.var
                    "generics_phantom_type_test_case_unit_clarification::Length::Get_0")
                  two_feet))) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "one meter + one_meter = ") in
        let* α1 := M.read (mk_str " mm
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
              (borrow
                ((M.var
                    "generics_phantom_type_test_case_unit_clarification::Length::Get_0")
                  two_meters))) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
