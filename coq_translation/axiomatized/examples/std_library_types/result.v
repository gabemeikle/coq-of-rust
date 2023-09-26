(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  Module MathError.
    Inductive t : Set :=
    | DivisionByZero
    | NonPositiveLogarithm
    | NegativeSquareRoot.
  End MathError.
  Definition MathError := MathError.t.
  
  Module Impl_core_fmt_Debug_for_result_checked_MathError.
    Definition Self := result.checked.MathError.
    
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
    Global Hint Resolve I : core.
  End Impl_core_fmt_Debug_for_result_checked_MathError.
  
  Definition MathResult : Set :=
    core.result.Result f64 result.checked.MathError.
  
  Parameter div :
      forall `{H' : State.Trait},
      f64 -> f64 -> M (H := H') result.checked.MathResult.
  
  Parameter sqrt :
      forall `{H' : State.Trait},
      f64 -> M (H := H') result.checked.MathResult.
  
  Parameter ln :
      forall `{H' : State.Trait},
      f64 -> M (H := H') result.checked.MathResult.
End checked.

Module MathError.
  Inductive t : Set :=
  | DivisionByZero
  | NonPositiveLogarithm
  | NegativeSquareRoot.
End MathError.
Definition MathError := MathError.t.

Module Impl_core_fmt_Debug_for_result_checked_MathError.
  Definition Self := result.checked.MathError.
  
  Parameter fmt :
      forall `{H' : State.Trait},
      (ref Self) -> (mut_ref core.fmt.Formatter) -> M (H := H') core.fmt.Result.
  
  Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_result_checked_MathError.

Definition MathResult : Set := core.result.Result f64 result.checked.MathError.

Parameter div :
    forall `{H' : State.Trait},
    f64 -> f64 -> M (H := H') result.checked.MathResult.

Parameter sqrt :
    forall `{H' : State.Trait},
    f64 -> M (H := H') result.checked.MathResult.

Parameter ln :
    forall `{H' : State.Trait},
    f64 -> M (H := H') result.checked.MathResult.
