(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Inductive t : Set := Build.
End Foo.
Definition Foo := Foo.t.

Module Bar.
  Inductive t : Set := Build.
End Bar.
Definition Bar := Bar.t.

Module FooBar.
  Inductive t : Set := Build.
End FooBar.
Definition FooBar := FooBar.t.

Module Impl_core_fmt_Debug_for_operator_overloading_FooBar.
  Definition Self := operator_overloading.FooBar.
  
  Parameter fmt : ref Self-> mut_ref core.fmt.Formatter -> M core.fmt.Result.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_operator_overloading_FooBar.

Module BarFoo.
  Inductive t : Set := Build.
End BarFoo.
Definition BarFoo := BarFoo.t.

Module Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
  Definition Self := operator_overloading.BarFoo.
  
  Parameter fmt : ref Self-> mut_ref core.fmt.Formatter -> M core.fmt.Result.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_operator_overloading_BarFoo.

Module Impl_core_ops_arith_Add_for_operator_overloading_Foo.
  Definition Self := operator_overloading.Foo.
  
  Definition Output : Set := operator_overloading.FooBar.
  
  Parameter add : Self->
      operator_overloading.Bar
      -> M operator_overloading.FooBar.
  
  Global Instance Method_add : Notation.Dot "add" := {
    Notation.dot := add;
  }.
  
  Global Instance I :
      core.ops.arith.Add.Trait
        Self
        (Rhs := (Some operator_overloading.Bar)) := {
    core.ops.arith.Add.add := add;
  }.
End Impl_core_ops_arith_Add_for_operator_overloading_Foo.

Module Impl_core_ops_arith_Add_for_operator_overloading_Bar.
  Definition Self := operator_overloading.Bar.
  
  Definition Output : Set := operator_overloading.BarFoo.
  
  Parameter add : Self->
      operator_overloading.Foo
      -> M operator_overloading.BarFoo.
  
  Global Instance Method_add : Notation.Dot "add" := {
    Notation.dot := add;
  }.
  
  Global Instance I :
      core.ops.arith.Add.Trait
        Self
        (Rhs := (Some operator_overloading.Foo)) := {
    core.ops.arith.Add.add := add;
  }.
End Impl_core_ops_arith_Add_for_operator_overloading_Bar.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
