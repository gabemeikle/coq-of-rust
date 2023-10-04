(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Ref.
  Section Ref.
    Context {T : Set}.
    Unset Primitive Projections.
    Record t : Set := {
      _ : ref T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End Ref.
End Ref.
Definition Ref := @Ref.t.

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
  Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
    Context {T : Set}.
    Context `{core.fmt.Debug.Trait T}.
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

Parameter print :
    forall `{H' : State.Trait} {T : Set} `{core.fmt.Debug.Trait T},
    T -> M (H := H') unit.

Parameter print_ref :
    forall `{H' : State.Trait} {T : Set} `{core.fmt.Debug.Trait T},
    (ref T) -> M (H := H') unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
