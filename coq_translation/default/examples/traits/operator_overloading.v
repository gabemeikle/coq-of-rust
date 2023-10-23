(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Section Foo.
    Context `{State.Trait}.
    
    Inductive t : Set := Build.
  End Foo.
End Foo.
Definition Foo := @Foo.t.

Module Bar.
  Section Bar.
    Context `{State.Trait}.
    
    Inductive t : Set := Build.
  End Bar.
End Bar.
Definition Bar := @Bar.t.

Module FooBar.
  Section FooBar.
    Context `{State.Trait}.
    
    Inductive t : Set := Build.
  End FooBar.
End FooBar.
Definition FooBar := @FooBar.t.

Module Impl_core_fmt_Debug_for_operator_overloading_FooBar.
  Section Impl_core_fmt_Debug_for_operator_overloading_FooBar.
    Context `{State.Trait}.
    
    Definition Self : Set := operator_overloading.FooBar.
    
    Definition fmt
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M core.fmt.Result :=
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 := deref (mk_str "FooBar") str in
      let* α3 := borrow α2 str in
      core.fmt.Formatter::["write_str"] α1 α3.
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_operator_overloading_FooBar.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_operator_overloading_FooBar.

Module BarFoo.
  Section BarFoo.
    Context `{State.Trait}.
    
    Inductive t : Set := Build.
  End BarFoo.
End BarFoo.
Definition BarFoo := @BarFoo.t.

Module Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
  Section Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
    Context `{State.Trait}.
    
    Definition Self : Set := operator_overloading.BarFoo.
    
    Definition fmt
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M core.fmt.Result :=
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 := deref (mk_str "BarFoo") str in
      let* α3 := borrow α2 str in
      core.fmt.Formatter::["write_str"] α1 α3.
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_operator_overloading_BarFoo.

Module Impl_core_ops_arith_Add_for_operator_overloading_Foo.
  Section Impl_core_ops_arith_Add_for_operator_overloading_Foo.
    Context `{State.Trait}.
    
    Definition Self : Set := operator_overloading.Foo.
    
    Definition Output : Set := operator_overloading.FooBar.
    
    Definition add
        (self : Self)
        (_rhs : operator_overloading.Bar)
        : M operator_overloading.FooBar :=
      let* _ :=
        let* _ :=
          let* α0 :=
            borrow [ mk_str "> Foo.add(Bar) was called
" ] (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := core.fmt.Arguments::["new_const"] α3 in
          std.io.stdio._print α4 in
        Pure tt in
      Pure (operator_overloading.FooBar.Build_t tt).
    
    Global Instance AssociatedFunction_add :
      Notation.DoubleColon Self "add" := {
      Notation.double_colon := add;
    }.
    
    Global Instance I
      : core.ops.arith.Add.Trait Self (Rhs := operator_overloading.Bar) := {
      core.ops.arith.Add.Output := Output;
      core.ops.arith.Add.add := add;
    }.
  End Impl_core_ops_arith_Add_for_operator_overloading_Foo.
  Global Hint Resolve I : core.
End Impl_core_ops_arith_Add_for_operator_overloading_Foo.

Module Impl_core_ops_arith_Add_for_operator_overloading_Bar.
  Section Impl_core_ops_arith_Add_for_operator_overloading_Bar.
    Context `{State.Trait}.
    
    Definition Self : Set := operator_overloading.Bar.
    
    Definition Output : Set := operator_overloading.BarFoo.
    
    Definition add
        (self : Self)
        (_rhs : operator_overloading.Foo)
        : M operator_overloading.BarFoo :=
      let* _ :=
        let* _ :=
          let* α0 :=
            borrow [ mk_str "> Bar.add(Foo) was called
" ] (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := core.fmt.Arguments::["new_const"] α3 in
          std.io.stdio._print α4 in
        Pure tt in
      Pure (operator_overloading.BarFoo.Build_t tt).
    
    Global Instance AssociatedFunction_add :
      Notation.DoubleColon Self "add" := {
      Notation.double_colon := add;
    }.
    
    Global Instance I
      : core.ops.arith.Add.Trait Self (Rhs := operator_overloading.Foo) := {
      core.ops.arith.Add.Output := Output;
      core.ops.arith.Add.add := add;
    }.
  End Impl_core_ops_arith_Add_for_operator_overloading_Bar.
  Global Hint Resolve I : core.
End Impl_core_ops_arith_Add_for_operator_overloading_Bar.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "Foo + Bar = "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        core.ops.arith.Add.add
          (operator_overloading.Foo.Build_t tt)
          (operator_overloading.Bar.Build_t tt) in
      let* α5 := borrow α4 operator_overloading.FooBar in
      let* α6 := deref α5 operator_overloading.FooBar in
      let* α7 := borrow α6 operator_overloading.FooBar in
      let* α8 := core.fmt.rt.Argument::["new_debug"] α7 in
      let* α9 := borrow [ α8 ] (list core.fmt.rt.Argument) in
      let* α10 := deref α9 (list core.fmt.rt.Argument) in
      let* α11 := borrow α10 (list core.fmt.rt.Argument) in
      let* α12 := pointer_coercion "Unsize" α11 in
      let* α13 := core.fmt.Arguments::["new_v1"] α3 α12 in
      std.io.stdio._print α13 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "Bar + Foo = "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        core.ops.arith.Add.add
          (operator_overloading.Bar.Build_t tt)
          (operator_overloading.Foo.Build_t tt) in
      let* α5 := borrow α4 operator_overloading.BarFoo in
      let* α6 := deref α5 operator_overloading.BarFoo in
      let* α7 := borrow α6 operator_overloading.BarFoo in
      let* α8 := core.fmt.rt.Argument::["new_debug"] α7 in
      let* α9 := borrow [ α8 ] (list core.fmt.rt.Argument) in
      let* α10 := deref α9 (list core.fmt.rt.Argument) in
      let* α11 := borrow α10 (list core.fmt.rt.Argument) in
      let* α12 := pointer_coercion "Unsize" α11 in
      let* α13 := core.fmt.Arguments::["new_v1"] α3 α12 in
      std.io.stdio._print α13 in
    Pure tt in
  Pure tt.
