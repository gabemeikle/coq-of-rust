(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Unit.
Section Unit.
  Inductive t : Set := Build.
End Unit.
End Unit.

Module  Impl_core_fmt_Debug_for_clone_Unit_t.
Section Impl_core_fmt_Debug_for_clone_Unit_t.
  Ltac Self := exact clone.Unit.t.
  
  (*
  Debug
  *)
  Parameter fmt :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (mut_ref core.fmt.Formatter.t)) ->
        M (M.Val ltac:(core.fmt.Result)).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_clone_Unit_t.
End Impl_core_fmt_Debug_for_clone_Unit_t.

Module  Impl_core_clone_Clone_for_clone_Unit_t.
Section Impl_core_clone_Clone_for_clone_Unit_t.
  Ltac Self := exact clone.Unit.t.
  
  (*
  Clone
  *)
  Parameter clone : (M.Val (ref ltac:(Self))) -> M (M.Val clone.Unit.t).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_clone_Unit_t.
End Impl_core_clone_Clone_for_clone_Unit_t.

Module  Impl_core_marker_Copy_for_clone_Unit_t.
Section Impl_core_marker_Copy_for_clone_Unit_t.
  Ltac Self := exact clone.Unit.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_clone_Unit_t.
End Impl_core_marker_Copy_for_clone_Unit_t.

Module  Pair.
Section Pair.
  Record t : Set := {
    x0 : alloc.boxed.Box.t i32.t alloc.boxed.Box.Default.A;
    x1 : alloc.boxed.Box.t i32.t alloc.boxed.Box.Default.A;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
  Global Instance Get_1 : Notations.Dot "1" := {
    Notations.dot := Ref.map (fun x => x.(x1)) (fun v x => x <| x1 := v |>);
  }.
End Pair.
End Pair.

Module  Impl_core_clone_Clone_for_clone_Pair_t.
Section Impl_core_clone_Clone_for_clone_Pair_t.
  Ltac Self := exact clone.Pair.t.
  
  (*
  Clone
  *)
  Parameter clone : (M.Val (ref ltac:(Self))) -> M (M.Val clone.Pair.t).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_clone_Pair_t.
End Impl_core_clone_Clone_for_clone_Pair_t.

Module  Impl_core_fmt_Debug_for_clone_Pair_t.
Section Impl_core_fmt_Debug_for_clone_Pair_t.
  Ltac Self := exact clone.Pair.t.
  
  (*
  Debug
  *)
  Parameter fmt :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (mut_ref core.fmt.Formatter.t)) ->
        M (M.Val ltac:(core.fmt.Result)).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_clone_Pair_t.
End Impl_core_fmt_Debug_for_clone_Pair_t.

(*
fn main() {
    // Instantiate `Unit`
    let unit = Unit;
    // Copy `Unit`, there are no resources to move
    let copied_unit = unit;

    // Both `Unit`s can be used independently
    println!("original: {:?}", unit);
    println!("copy: {:?}", copied_unit);

    // Instantiate `Pair`
    let pair = Pair(Box::new(1), Box::new(2));
    println!("original: {:?}", pair);

    // Move `pair` into `moved_pair`, moves resources
    let moved_pair = pair;
    println!("moved: {:?}", moved_pair);

    // Error! `pair` has lost its resources
    //println!("original: {:?}", pair);
    // TODO ^ Try uncommenting this line

    // Clone `moved_pair` into `cloned_pair` (resources are included)
    let cloned_pair = moved_pair.clone();
    // Drop the original pair using std::mem::drop
    drop(moved_pair);

    // Error! `moved_pair` has been dropped
    //println!("copy: {:?}", moved_pair);
    // TODO ^ Try uncommenting this line

    // The result from .clone() can still be used!
    println!("clone: {:?}", cloned_pair);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
