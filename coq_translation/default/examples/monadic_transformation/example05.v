(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Unset Primitive Projections.
  Record t : Set := {
    _ : u32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Foo.
Definition Foo := @Foo.t.

Module Impl_example05_Foo.
  Definition Self := example05.Foo.
  
  Definition plus1 `{H' : State.Trait} (s : Self) : M (H := H') u32 :=
    (s.[0]).["add"] 1.
  
  Global Instance AssociatedFunction_plus1 `{H' : State.Trait} :
    Notation.DoubleColon Self "plus1" := {
    Notation.double_colon := plus1;
  }.
End Impl_example05_Foo.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let foo := example05.Foo.Build_t 0 in
  let _ := foo.["plus1"] in
  Pure tt.
