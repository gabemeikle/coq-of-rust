(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Record t : Set := { _ : u32;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Foo.
Definition Foo := Foo.t.

Module Impl_example05_Foo.
  Definition Self := example05.Foo.
  
  Parameter plus1 : forall `{H : State.Trait}, Self -> M (H := H) u32.
  
  Global Instance AssociatedFunction_plus1 `{H : State.Trait} :
    Notation.DoubleColon Self "plus1" := {
    Notation.double_colon := plus1;
  }.
End Impl_example05_Foo.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, unit -> M (H := H) unit.
