(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Point.
Section Point.
  Context `{ℋ : State.Trait}.
  
  Record t : Set := {
    x : i32;
    y : i32;
  }.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot x' := let* x' := M.read x' in M.pure x'.(x) : M _;
  }.
  Global Instance Get_AF_x : Notation.DoubleColon t "x" := {
    Notation.double_colon x' := let* x' := M.read x' in M.pure x'.(x) : M _;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot x := let* x := M.read x in M.pure x.(y) : M _;
  }.
  Global Instance Get_AF_y : Notation.DoubleColon t "y" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(y) : M _;
  }.
End Point.
End Point.
Definition Point `{ℋ : State.Trait} : Set := M.Val Point.t.

Module  Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point.
Section Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := scoping_rules_borrowing_the_ref_pattern.Point.
  
  Parameter clone :
      (ref Self) -> M scoping_rules_borrowing_the_ref_pattern.Point.
  
  Global Instance AssociatedFunction_clone :
    Notation.DoubleColon Self "clone" := {
    Notation.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point.

Module  Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point.
Section Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := scoping_rules_borrowing_the_ref_pattern.Point.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{ℋ : State.Trait}, M unit.
