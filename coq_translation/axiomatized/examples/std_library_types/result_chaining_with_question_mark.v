(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  Module MathError.
    Inductive t : Set :=
    | DivisionByZero
    | NonPositiveLogarithm
    | NegativeSquareRoot.
  End MathError.
  Definition MathError : Set := MathError.t.
  
  Module
    Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
    Definition Self `{State.Trait} :=
      result_chaining_with_question_mark.checked.MathError.
    
    Parameter fmt :
        forall `{State.Trait},
        (ref Self) -> (mut_ref core.fmt.Formatter) -> M core.fmt.Result.
    
    Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
    Global Hint Resolve I : core.
  End
    Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  
  Definition MathResult : Set :=
    core.result.Result f64 result_chaining_with_question_mark.checked.MathError.
  
  Parameter div :
      forall `{State.Trait},
      f64 -> f64 -> M result_chaining_with_question_mark.checked.MathResult.
  
  Parameter sqrt :
      forall `{State.Trait},
      f64 -> M result_chaining_with_question_mark.checked.MathResult.
  
  Parameter ln :
      forall `{State.Trait},
      f64 -> M result_chaining_with_question_mark.checked.MathResult.
  
  Parameter op_ :
      forall `{State.Trait},
      f64 -> f64 -> M result_chaining_with_question_mark.checked.MathResult.
  
  Parameter op : forall `{State.Trait}, f64 -> f64 -> M unit.
End checked.

Module MathError.
  Inductive t : Set :=
  | DivisionByZero
  | NonPositiveLogarithm
  | NegativeSquareRoot.
End MathError.
Definition MathError : Set := MathError.t.

Module
  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  Definition Self `{State.Trait} :=
    result_chaining_with_question_mark.checked.MathError.
  
  Parameter fmt :
      forall `{State.Trait},
      (ref Self) -> (mut_ref core.fmt.Formatter) -> M core.fmt.Result.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.

Definition MathResult : Set :=
  core.result.Result f64 result_chaining_with_question_mark.checked.MathError.

Parameter div :
    forall `{State.Trait},
    f64 -> f64 -> M result_chaining_with_question_mark.checked.MathResult.

Parameter sqrt :
    forall `{State.Trait},
    f64 -> M result_chaining_with_question_mark.checked.MathResult.

Parameter ln :
    forall `{State.Trait},
    f64 -> M result_chaining_with_question_mark.checked.MathResult.

Parameter op_ :
    forall `{State.Trait},
    f64 -> f64 -> M result_chaining_with_question_mark.checked.MathResult.

Parameter op : forall `{State.Trait}, f64 -> f64 -> M unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
