(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Container.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    x0 : i32;
    x1 : i32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 `{State.Trait} : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
  }.
  Global Instance Get_1 `{State.Trait} : Notation.Dot "1" := {
    Notation.dot x := let* x := M.read x in Pure x.(x1) : M _;
  }.
End Container.
Definition Container `{State.Trait} : Set := M.val Container.t.

Module Contains.
  Class Trait (Self : Set) `{State.Trait} : Type := {
    A : Set;
    B : Set;
    contains : (ref Self) -> (ref A) -> (ref B) -> M bool;
    first : (ref Self) -> M i32;
    last : (ref Self) -> M i32;
    a : (ref Self) -> M A;
  }.
  
  Global Instance Method_A `(Trait) : Notation.DoubleColonType Self "A" := {
    Notation.double_colon_type := A;
  }.
  Global Instance Method_B `(Trait) : Notation.DoubleColonType Self "B" := {
    Notation.double_colon_type := B;
  }.
  Global Instance Method_contains `{State.Trait} `(Trait)
    : Notation.Dot "contains" := {
    Notation.dot := contains;
  }.
  Global Instance Method_first `{State.Trait} `(Trait)
    : Notation.Dot "first" := {
    Notation.dot := first;
  }.
  Global Instance Method_last `{State.Trait} `(Trait) : Notation.Dot "last" := {
    Notation.dot := last;
  }.
  Global Instance Method_a `{State.Trait} `(Trait) : Notation.Dot "a" := {
    Notation.dot := a;
  }.
End Contains.

Module
  Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.
  Definition Self `{State.Trait} :=
    generics_associated_types_solution.Container.
  
  Definition A : Set := i32.
  
  Definition B : Set := i32.
  
  Parameter contains :
      forall `{State.Trait},
      (ref Self) -> (ref i32) -> (ref i32) -> M bool.
  
  Global Instance Method_contains `{State.Trait} : Notation.Dot "contains" := {
    Notation.dot := contains;
  }.
  
  Parameter first : forall `{State.Trait}, (ref Self) -> M i32.
  
  Global Instance Method_first `{State.Trait} : Notation.Dot "first" := {
    Notation.dot := first;
  }.
  
  Parameter last : forall `{State.Trait}, (ref Self) -> M i32.
  
  Global Instance Method_last `{State.Trait} : Notation.Dot "last" := {
    Notation.dot := last;
  }.
  
  Parameter a : forall `{State.Trait}, (ref Self) -> M i32.
  
  Global Instance Method_a `{State.Trait} : Notation.Dot "a" := {
    Notation.dot := a;
  }.
  
  Global Instance I `{State.Trait}
    : generics_associated_types_solution.Contains.Trait Self := {
    generics_associated_types_solution.Contains.A := A;
    generics_associated_types_solution.Contains.B := B;
    generics_associated_types_solution.Contains.contains := contains;
    generics_associated_types_solution.Contains.first := first;
    generics_associated_types_solution.Contains.last := last;
    generics_associated_types_solution.Contains.a := a;
  }.
  Global Hint Resolve I : core.
End
  Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.

Parameter difference :
    forall
      `{State.Trait}
      {C : Set}
      `{generics_associated_types_solution.Contains.Trait C},
    (ref C) -> M i32.

Parameter get_a :
    forall
      `{State.Trait}
      {C : Set}
      `{generics_associated_types_solution.Contains.Trait C},
    (ref C) -> M C::type["A"].

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
