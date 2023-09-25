(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
  Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
    Context {T : Set}.
    Definition Self := scoping_rules_lifetimes_bounds.Ref T.
    
    Parameter fmt :
        forall `{H' : State.Trait},
        (ref Self) ->
          (mut_ref core.fmt.Formatter) ->
          M (H := H') core.fmt.Result.
    
    Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
    }.
  End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
