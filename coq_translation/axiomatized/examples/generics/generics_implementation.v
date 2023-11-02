(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Val.
  Section Val.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      val : f64;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_val : Notation.Dot "val" := {
      Notation.dot x := let* x := M.read x in Pure x.(val) : M _;
    }.
    Global Instance Get_AF_val : Notation.DoubleColon t "val" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(val) : M _;
    }.
  End Val.
End Val.
Definition Val `{ℋ : State.Trait} : Set := M.val Val.t.

Module GenVal.
  Section GenVal.
    Context `{ℋ : State.Trait}.
    
    Context {T : Set}.
    
    Unset Primitive Projections.
    Record t : Set := {
      gen_val : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_gen_val : Notation.Dot "gen_val" := {
      Notation.dot x := let* x := M.read x in Pure x.(gen_val) : M _;
    }.
    Global Instance Get_AF_gen_val : Notation.DoubleColon t "gen_val" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(gen_val) : M _;
    }.
  End GenVal.
End GenVal.
Definition GenVal (T : Set) `{ℋ : State.Trait} : Set :=
  M.val (GenVal.t (T := T)).

Module Impl_generics_implementation_Val.
  Section Impl_generics_implementation_Val.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := generics_implementation.Val.
    
    Parameter value : (ref Self) -> M (ref f64).
    
    Global Instance AssociatedFunction_value :
      Notation.DoubleColon Self "value" := {
      Notation.double_colon := value;
    }.
  End Impl_generics_implementation_Val.
End Impl_generics_implementation_Val.

Module Impl_generics_implementation_GenVal_T.
  Section Impl_generics_implementation_GenVal_T.
    Context `{ℋ : State.Trait}.
    
    Context {T : Set}.
    
    Definition Self : Set := generics_implementation.GenVal T.
    
    Parameter value : (ref Self) -> M (ref T).
    
    Global Instance AssociatedFunction_value :
      Notation.DoubleColon Self "value" := {
      Notation.double_colon := value;
    }.
  End Impl_generics_implementation_GenVal_T.
End Impl_generics_implementation_GenVal_T.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{ℋ : State.Trait}, M unit.
