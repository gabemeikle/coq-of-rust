(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module SomeType.
  Section SomeType.
    Context `{State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : u32;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
  End SomeType.
End SomeType.
Definition SomeType `{State.Trait} : Set := M.val SomeType.t.

Module OtherType.
  Section OtherType.
    Context `{State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : bool;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
  End OtherType.
End OtherType.
Definition OtherType `{State.Trait} : Set := M.val OtherType.t.

Module Impl_functions_order_SomeType.
  Section Impl_functions_order_SomeType.
    Context `{State.Trait}.
    
    Definition Self : Set := functions_order.SomeType.
    
    Definition meth2 (self : Self) : M unit := Pure tt.
    
    Global Instance AssociatedFunction_meth2 :
      Notation.DoubleColon Self "meth2" := {
      Notation.double_colon := meth2;
    }.
    
    Definition meth1 (self : Self) : M unit :=
      let* _ := functions_order.SomeType::["meth2"] self in
      Pure tt.
    
    Global Instance AssociatedFunction_meth1 :
      Notation.DoubleColon Self "meth1" := {
      Notation.double_colon := meth1;
    }.
  End Impl_functions_order_SomeType.
End Impl_functions_order_SomeType.

Module SomeTrait.
  Section SomeTrait.
    Context `{State.Trait}.
    
    Class Trait (Self : Set) : Type := {
      some_trait_foo : (ref Self) -> M unit;
      some_trait_bar : (ref Self) -> M unit;
    }.
    
  End SomeTrait.
End SomeTrait.

Module Impl_functions_order_SomeTrait_for_functions_order_SomeType.
  Section Impl_functions_order_SomeTrait_for_functions_order_SomeType.
    Context `{State.Trait}.
    
    Definition Self : Set := functions_order.SomeType.
    
    Definition some_trait_bar (self : ref Self) : M unit := Pure tt.
    
    Global Instance AssociatedFunction_some_trait_bar :
      Notation.DoubleColon Self "some_trait_bar" := {
      Notation.double_colon := some_trait_bar;
    }.
    
    Definition some_trait_foo (self : ref Self) : M unit :=
      let* α0 := deref self functions_order.SomeType in
      let* α1 := borrow α0 functions_order.SomeType in
      functions_order.SomeTrait.some_trait_bar α1.
    
    Global Instance AssociatedFunction_some_trait_foo :
      Notation.DoubleColon Self "some_trait_foo" := {
      Notation.double_colon := some_trait_foo;
    }.
    
    Global Instance I : functions_order.SomeTrait.Trait Self := {
      functions_order.SomeTrait.some_trait_bar := some_trait_bar;
      functions_order.SomeTrait.some_trait_foo := some_trait_foo;
    }.
  End Impl_functions_order_SomeTrait_for_functions_order_SomeType.
  Global Hint Resolve I : core.
End Impl_functions_order_SomeTrait_for_functions_order_SomeType.

Module Impl_functions_order_SomeTrait_for_functions_order_OtherType.
  Section Impl_functions_order_SomeTrait_for_functions_order_OtherType.
    Context `{State.Trait}.
    
    Definition Self : Set := functions_order.OtherType.
    
    Definition some_trait_foo (self : ref Self) : M unit := Pure tt.
    
    Global Instance AssociatedFunction_some_trait_foo :
      Notation.DoubleColon Self "some_trait_foo" := {
      Notation.double_colon := some_trait_foo;
    }.
    
    Definition some_trait_bar (self : ref Self) : M unit := Pure tt.
    
    Global Instance AssociatedFunction_some_trait_bar :
      Notation.DoubleColon Self "some_trait_bar" := {
      Notation.double_colon := some_trait_bar;
    }.
    
    Global Instance I : functions_order.SomeTrait.Trait Self := {
      functions_order.SomeTrait.some_trait_foo := some_trait_foo;
      functions_order.SomeTrait.some_trait_bar := some_trait_bar;
    }.
  End Impl_functions_order_SomeTrait_for_functions_order_OtherType.
  Global Hint Resolve I : core.
End Impl_functions_order_SomeTrait_for_functions_order_OtherType.

Definition depends_on_trait_impl (u : u32) (b : bool) : M unit :=
  let* _ :=
    let* α0 :=
      borrow (functions_order.OtherType.Build_t b) functions_order.OtherType in
    functions_order.SomeTrait.some_trait_foo α0 in
  let* _ :=
    let* α0 :=
      borrow (functions_order.SomeType.Build_t u) functions_order.SomeType in
    functions_order.SomeTrait.some_trait_foo α0 in
  Pure tt.

Module inner_mod.
  Definition tar : M unit := Pure tt.
  
  Definition bar : M unit :=
    let* _ := functions_order.inner_mod.tar in
    Pure tt.
  
  Module nested_mod.
    Definition tack : M unit := Pure tt.
    
    Definition tick : M unit :=
      let* _ := functions_order.inner_mod.nested_mod.tack in
      Pure tt.
  End nested_mod.
End inner_mod.

Definition bar : M unit :=
  let* _ := functions_order.inner_mod.tar in
  Pure tt.

Definition tar : M unit := Pure tt.

Module nested_mod.
  Definition tack : M unit := Pure tt.
  
  Definition tick : M unit :=
    let* _ := functions_order.inner_mod.nested_mod.tack in
    Pure tt.
End nested_mod.

Definition tick : M unit :=
  let* _ := functions_order.inner_mod.nested_mod.tack in
  Pure tt.

Definition tack : M unit := Pure tt.

Definition foo : M unit := Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _ := functions_order.foo in
  let* _ := functions_order.inner_mod.bar in
  let* _ :=
    let* α0 := M.alloc 0 in
    functions_order.SomeType::["meth1"] (functions_order.SomeType.Build_t α0) in
  Pure tt.
