(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Impl_core_fmt_Display_for_converting_to_string_Circle.
  Definition Self := converting_to_string.Circle.
  
  Parameter fmt :
      forall `{H' : State.Trait},
      (ref Self) -> (mut_ref core.fmt.Formatter) -> M (H := H') core.fmt.Result.
  
  Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Display.Trait Self := {
    core.fmt.Display.fmt `{H' : State.Trait} := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Display_for_converting_to_string_Circle.
