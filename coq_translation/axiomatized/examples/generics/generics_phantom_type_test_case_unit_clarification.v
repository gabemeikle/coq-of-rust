(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Inch.
  Inductive t : Set :=
  .
End Inch.
Definition Inch := Inch.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Inch.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Inch.
  
  Parameter clone : forall `{H : State.Trait},
      ref Self ->
      M (H := H) generics_phantom_type_test_case_unit_clarification.Inch.
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Inch.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Mm.
  Inductive t : Set :=
  .
End Mm.
Definition Mm := Mm.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Mm.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Mm.
  
  Parameter clone : forall `{H : State.Trait},
      ref Self ->
      M (H := H) generics_phantom_type_test_case_unit_clarification.Mm.
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Mm.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Length.
  Unset Primitive Projections.
  Record t : Set := {
    _ : f64;
    _ : core.marker.PhantomData Unit;
  }.
  Global Set Primitive Projections.

  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_1 : Notation.Dot 1 := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Length.
Definition Length := Length.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
Section
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Context {Unit : Set}.
  
  Definition
    Self
    :=
    generics_phantom_type_test_case_unit_clarification.Length Unit.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
Section
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Context {Unit : Set}.
  
  Definition
    Self
    :=
    generics_phantom_type_test_case_unit_clarification.Length Unit.
  
  Parameter clone : forall `{H : State.Trait},
      ref Self ->
      M (H := H)
        (generics_phantom_type_test_case_unit_clarification.Length Unit).
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
Section
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Context {Unit : Set}.
  
  Definition
    Self
    :=
    generics_phantom_type_test_case_unit_clarification.Length Unit.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
Section
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Context {Unit : Set}.
  
  Definition
    Self
    :=
    generics_phantom_type_test_case_unit_clarification.Length Unit.
  
  Definition Output : Set :=
    generics_phantom_type_test_case_unit_clarification.Length Unit.
  
  Parameter add : forall `{H : State.Trait},
      Self ->
      generics_phantom_type_test_case_unit_clarification.Length Unit ->
      M (H := H)
        (generics_phantom_type_test_case_unit_clarification.Length Unit).
  
  Global Instance Method_add `{H : State.Trait} : Notation.Dot "add" := {
    Notation.dot := add;
  }.
  
  Global Instance I : core.ops.arith.Add.Trait Self (Rhs := None) := {
    core.ops.arith.Add.add `{H : State.Trait} := add;
  }.
End
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
End
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, M (H := H) unit.
