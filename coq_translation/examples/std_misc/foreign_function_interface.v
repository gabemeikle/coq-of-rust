(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error ForeignMod.

Parameter cos : foreign_function_interface.Complex
    -> M foreign_function_interface.Complex.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.

Module Complex.
  Record t : Set := {
    re : f32;
    im : f32;
  }.
  
  Global Instance Get_re : Notation.Dot "re" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_im : Notation.Dot "im" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Complex.
Definition Complex : Set := Complex.t.

Module Impl_core_clone_Clone_for_foreign_function_interface_Complex.
  Definition Self := foreign_function_interface.Complex.
  
  Parameter clone : ref Self -> M foreign_function_interface.Complex.
  
  Global Instance Method_clone : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone := clone;
  }.
End Impl_core_clone_Clone_for_foreign_function_interface_Complex.

Module Impl_core_marker_Copy_for_foreign_function_interface_Complex.
  Definition Self := foreign_function_interface.Complex.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End Impl_core_marker_Copy_for_foreign_function_interface_Complex.

Module Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
  Definition Self := foreign_function_interface.Complex.
  
  Parameter fmt : ref Self-> mut_ref core.fmt.Formatter -> M core.fmt.Result.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
