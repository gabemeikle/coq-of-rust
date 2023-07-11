(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition Result : Set := core.result.Result T (alloc.boxed.Box TraitObject).

Module EmptyVec.
  Inductive t : Set := Build.
End EmptyVec.
Definition EmptyVec := EmptyVec.t.

Module Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.
  Definition Self := boxing_errors.EmptyVec.
  
  Parameter fmt : ref Self-> mut_ref core.fmt.Formatter -> M core.fmt.Result.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.

Module Impl_core_clone_Clone_for_boxing_errors_EmptyVec.
  Definition Self := boxing_errors.EmptyVec.
  
  Parameter clone : ref Self -> M boxing_errors.EmptyVec.
  
  Global Instance Method_clone : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone := clone;
  }.
End Impl_core_clone_Clone_for_boxing_errors_EmptyVec.

Module Impl_core_fmt_Display_for_boxing_errors_EmptyVec.
  Definition Self := boxing_errors.EmptyVec.
  
  Parameter fmt : ref Self-> mut_ref core.fmt.Formatter -> M core.fmt.Result.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Display.Trait Self := {
    core.fmt.Display.fmt := fmt;
  }.
End Impl_core_fmt_Display_for_boxing_errors_EmptyVec.

Module Impl_core_error_Error_for_boxing_errors_EmptyVec.
  Definition Self := boxing_errors.EmptyVec.
  
  Global Instance I : core.error.Error.Trait Self :=
    core.error.Error.Build_Trait _.
End Impl_core_error_Error_for_boxing_errors_EmptyVec.

Parameter double_first : alloc.vec.Vec (ref str)
    -> M (boxing_errors.Result i32).

Parameter print : boxing_errors.Result i32 -> M unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
