(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error ForeignMod.

Parameter cos : forall `{H : State.Trait},
    foreign_function_interface.Complex ->
    M (H := H) foreign_function_interface.Complex.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, M (H := H) unit.

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
  
  Parameter clone : forall `{H : State.Trait},
      ref Self ->
      M (H := H) foreign_function_interface.Complex.
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_foreign_function_interface_Complex.

Module Impl_core_marker_Copy_for_foreign_function_interface_Complex.
  Definition Self := foreign_function_interface.Complex.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End Impl_core_marker_Copy_for_foreign_function_interface_Complex.

Module Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
  Definition Self := foreign_function_interface.Complex.
  
  Parameter struct_parameter_for_fmt : core.fmt.Formatter -> string -> 
    string -> f32 -> 
    string -> f32 -> 
    M (H := H) core.fmt.Result.
  
  Global Instance Deb_struct_parameter_for_fmt : Notation.DoubleColon
    core.fmt.Formatter "struct_parameter_for_fmt" := {
    Notation.double_colon := struct_parameter_for_fmt; }.
  
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
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
