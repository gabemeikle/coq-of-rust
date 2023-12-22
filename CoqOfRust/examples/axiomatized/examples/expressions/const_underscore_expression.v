(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Foo.
Section Foo.
  Record t : Set := {
    test : bool.t;
  }.
  
  Global Instance Get_test : Notations.Dot "test" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(test)) (fun β α => Some (α <| test := β |>));
  }.
  Global Instance Get_AF_test : Notations.DoubleColon t "test" := {
    Notations.double_colon (α : M.Val t) := α.["test"];
  }.
End Foo.
End Foo.

Module  Bar.
Section Bar.
  Record t : Set := {
    test : alloc.string.String.t;
  }.
  
  Global Instance Get_test : Notations.Dot "test" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(test)) (fun β α => Some (α <| test := β |>));
  }.
  Global Instance Get_AF_test : Notations.DoubleColon t "test" := {
    Notations.double_colon (α : M.Val t) := α.["test"];
  }.
End Bar.
End Bar.

Module  BarTrait.
Section BarTrait.
  Class Trait (Self : Set) : Type := {
    show : Self -> M alloc.string.String.t;
  }.
  
End BarTrait.
End BarTrait.

Module  Impl_const_underscore_expression_BarTrait_for_const_underscore_expression_Bar_t.
Section Impl_const_underscore_expression_BarTrait_for_const_underscore_expression_Bar_t.
  Definition Self : Set := const_underscore_expression.Bar.t.
  
  (*
          fn show(self: Self) -> String {
              self.test
          }
  *)
  Parameter show : Self -> M alloc.string.String.t.
  
  Global Instance AssociatedFunction_show :
    Notations.DoubleColon Self "show" := {
    Notations.double_colon := show;
  }.
  
  Global Instance ℐ : const_underscore_expression.BarTrait.Trait Self := {
    const_underscore_expression.BarTrait.show := show;
  }.
End Impl_const_underscore_expression_BarTrait_for_const_underscore_expression_Bar_t.
End Impl_const_underscore_expression_BarTrait_for_const_underscore_expression_Bar_t.
