(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Constructor.
Section Constructor.
  Record t : Set := {
    x0 : i32.t;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
End Constructor.
End Constructor.

Module  Impl_core_fmt_Debug_for_constructor_as_function_Constructor_t.
Section Impl_core_fmt_Debug_for_constructor_as_function_Constructor_t.
  Definition Self : Set := constructor_as_function.Constructor.t.
  
  Parameter fmt :
      (ref Self) -> (mut_ref core.fmt.Formatter.t) -> M ltac:(core.fmt.Result).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_constructor_as_function_Constructor_t.
End Impl_core_fmt_Debug_for_constructor_as_function_Constructor_t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M unit.
