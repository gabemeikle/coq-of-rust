(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Section Foo.
    Context `{State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : u32;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
  End Foo.
End Foo.
Definition Foo `{State.Trait} : Set := M.val Foo.t.

Module Impl_example05_Foo.
  Section Impl_example05_Foo.
    Context `{State.Trait}.
    
    Definition Self : Set := example05.Foo.
    
    Parameter plus1 : Self -> M u32.
    
    Global Instance AssociatedFunction_plus1 :
      Notation.DoubleColon Self "plus1" := {
      Notation.double_colon := plus1;
    }.
  End Impl_example05_Foo.
End Impl_example05_Foo.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
