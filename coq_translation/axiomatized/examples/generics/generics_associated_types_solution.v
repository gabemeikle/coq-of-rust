(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Container.
  Record t : Set := { _ : i32; _ : i32;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_1 : Notation.Dot 1 := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Container.
Definition Container := Container.t.

Module Contains.
  Class Trait (Self : Set) {A : Set} {B : Set} : Set := {
    A := A;
    B := B;
    contains : (ref Self) -> (ref ImplSelf.A) -> (ref ImplSelf.B) -> (M bool);
    first : (ref Self) -> (M i32);
    last : (ref Self) -> (M i32);
  }.
  
  Global Instance Method_A `(Trait) : Notation.DoubleColonType Self "A" := {
    Notation.double_colon_type := A;
  }.
  Global Instance Method_B `(Trait) : Notation.DoubleColonType Self "B" := {
    Notation.double_colon_type := B;
  }.
  Global Instance Method_contains `(Trait) : Notation.Dot "contains" := {
    Notation.dot := contains;
  }.
  Global Instance Method_first `(Trait) : Notation.Dot "first" := {
    Notation.dot := first;
  }.
  Global Instance Method_last `(Trait) : Notation.Dot "last" := {
    Notation.dot := last;
  }.
End Contains.

Module
  Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.
  Definition Self := generics_associated_types_solution.Container.
  
  Definition A : Set := i32.
  
  Definition B : Set := i32.
  
  Parameter contains : ref Self-> ref i32-> ref i32 -> M bool.
  
  Global Instance Method_contains : Notation.Dot "contains" := {
    Notation.dot := contains;
  }.
  
  Parameter first : ref Self -> M i32.
  
  Global Instance Method_first : Notation.Dot "first" := {
    Notation.dot := first;
  }.
  
  Parameter last : ref Self -> M i32.
  
  Global Instance Method_last : Notation.Dot "last" := {
    Notation.dot := last;
  }.
  
  Global Instance I :
      generics_associated_types_solution.Contains.Trait Self := {
    generics_associated_types_solution.Contains.contains := contains;
    generics_associated_types_solution.Contains.first := first;
    generics_associated_types_solution.Contains.last := last;
  }.
End
  Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.

Parameter difference : forall
    {C : Set},
    `{generics_associated_types_solution.Contains.Trait C}
    ref C
    -> M i32.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
