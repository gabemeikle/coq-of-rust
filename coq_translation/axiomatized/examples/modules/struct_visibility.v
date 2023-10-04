(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  Module OpenBox.
    Section OpenBox.
      Context {T : Set}.
      Unset Primitive Projections.
      Record t : Set := {
        contents : T;
      }.
      Global Set Primitive Projections.
      
      Global Instance Get_contents : Notation.Dot "contents" := {
        Notation.dot '(Build_t x0) := x0;
      }.
      Global Instance Get_AF_contents : Notation.DoubleColon t "contents" := {
        Notation.double_colon '(Build_t x0) := x0;
      }.
    End OpenBox.
  End OpenBox.
  Definition OpenBox (T : Set) : Set := OpenBox.t (T := T).
  
  Module ClosedBox.
    Section ClosedBox.
      Context {T : Set}.
      Unset Primitive Projections.
      Record t : Set := {
        contents : T;
      }.
      Global Set Primitive Projections.
      
      Global Instance Get_contents : Notation.Dot "contents" := {
        Notation.dot '(Build_t x0) := x0;
      }.
      Global Instance Get_AF_contents : Notation.DoubleColon t "contents" := {
        Notation.double_colon '(Build_t x0) := x0;
      }.
    End ClosedBox.
  End ClosedBox.
  Definition ClosedBox (T : Set) : Set := ClosedBox.t (T := T).
  
  Module Impl_struct_visibility_my_ClosedBox_T.
    Definition Self := struct_visibility.my.ClosedBox T.
    
    Parameter new :
        forall `{H' : State.Trait},
        T -> M (H := H') (struct_visibility.my.ClosedBox T).
    
    Global Instance AssociatedFunction_new `{H' : State.Trait} :
      Notation.DoubleColon Self "new" := {
      Notation.double_colon := new;
    }.
  End Impl_struct_visibility_my_ClosedBox_T.
End my.

Module OpenBox.
  Section OpenBox.
    Context {T : Set}.
    Unset Primitive Projections.
    Record t : Set := {
      contents : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_contents : Notation.Dot "contents" := {
      Notation.dot '(Build_t x0) := x0;
    }.
    Global Instance Get_AF_contents : Notation.DoubleColon t "contents" := {
      Notation.double_colon '(Build_t x0) := x0;
    }.
  End OpenBox.
End OpenBox.
Definition OpenBox (T : Set) : Set := OpenBox.t (T := T).

Module ClosedBox.
  Section ClosedBox.
    Context {T : Set}.
    Unset Primitive Projections.
    Record t : Set := {
      contents : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_contents : Notation.Dot "contents" := {
      Notation.dot '(Build_t x0) := x0;
    }.
    Global Instance Get_AF_contents : Notation.DoubleColon t "contents" := {
      Notation.double_colon '(Build_t x0) := x0;
    }.
  End ClosedBox.
End ClosedBox.
Definition ClosedBox (T : Set) : Set := ClosedBox.t (T := T).

Module Impl_struct_visibility_my_ClosedBox_T_2.
  Definition Self := struct_visibility.my.ClosedBox T.
  
  Parameter new :
      forall `{H' : State.Trait},
      T -> M (H := H') (struct_visibility.my.ClosedBox T).
  
  Global Instance AssociatedFunction_new `{H' : State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
End Impl_struct_visibility_my_ClosedBox_T_2.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
