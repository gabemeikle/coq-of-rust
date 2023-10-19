(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Inch.
  Inductive t `{State.Trait} : Set :=
  .
End Inch.
Definition Inch `{State.Trait} : Set := Inch.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Inch.
  
  Definition fmt
      `{State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M core.fmt.Result :=
    let* α0 := "unimplemented parent_kind" in
    never_to_any α0.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Inch.
  
  Definition clone
      `{State.Trait}
      (self : ref Self)
      : M generics_phantom_type_test_case_unit_clarification.Inch :=
    deref self generics_phantom_type_test_case_unit_clarification.Inch.
  
  Global Instance Method_clone `{State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I `{State.Trait} : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone := clone;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Inch.
  
  Global Instance I `{State.Trait} : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Mm.
  Inductive t `{State.Trait} : Set :=
  .
End Mm.
Definition Mm `{State.Trait} : Set := Mm.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Mm.
  
  Definition fmt
      `{State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M core.fmt.Result :=
    let* α0 := "unimplemented parent_kind" in
    never_to_any α0.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Mm.
  
  Definition clone
      `{State.Trait}
      (self : ref Self)
      : M generics_phantom_type_test_case_unit_clarification.Mm :=
    deref self generics_phantom_type_test_case_unit_clarification.Mm.
  
  Global Instance Method_clone `{State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I `{State.Trait} : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone := clone;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Mm.
  
  Global Instance I `{State.Trait} : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Length.
  Section Length.
    Context {Unit : Set}.
    Unset Primitive Projections.
    Record t `{State.Trait} : Set := {
      x0 : f64;
      x1 : core.marker.PhantomData Unit;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 `{State.Trait} : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
    Global Instance Get_1 `{State.Trait} : Notation.Dot "1" := {
      Notation.dot x := let* x := M.read x in Pure x.(x1) : M _;
    }.
  End Length.
End Length.
Definition Length `{State.Trait} : Set := M.val Length.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Section
    Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
    Context {Unit : Set}.
    Context `{core.fmt.Debug.Trait Unit}.
    Definition Self `{State.Trait} :=
      generics_phantom_type_test_case_unit_clarification.Length Unit.
    
    Definition fmt
        `{State.Trait}
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M core.fmt.Result :=
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 := deref (mk_str "Length") str in
      let* α3 := borrow α2 str in
      let* α4 :=
        deref
          self
          (generics_phantom_type_test_case_unit_clarification.Length _) in
      let* α5 := α4.["0"] in
      let* α6 := borrow α5 f64 in
      let* α7 := deref α6 f64 in
      let* α8 := borrow α7 f64 in
      let* α9 := pointer_coercion "Unsize" α8 in
      let* α10 :=
        deref
          self
          (generics_phantom_type_test_case_unit_clarification.Length _) in
      let* α11 := α10.["1"] in
      let* α12 := borrow α11 (core.marker.PhantomData _) in
      let* α13 := borrow α12 (ref (core.marker.PhantomData _)) in
      let* α14 := deref α13 (ref (core.marker.PhantomData _)) in
      let* α15 := borrow α14 (ref (core.marker.PhantomData _)) in
      let* α16 := pointer_coercion "Unsize" α15 in
      core.fmt.Formatter::["debug_tuple_field2_finish"] α1 α3 α9 α16.
    
    Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
  End
    Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Global Hint Resolve I : core.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Section
    Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
    Context {Unit : Set}.
    Context `{core.clone.Clone.Trait Unit}.
    Definition Self `{State.Trait} :=
      generics_phantom_type_test_case_unit_clarification.Length Unit.
    
    Definition clone
        `{State.Trait}
        (self : ref Self)
        : M (generics_phantom_type_test_case_unit_clarification.Length Unit) :=
      let* α0 :=
        deref
          self
          (generics_phantom_type_test_case_unit_clarification.Length _) in
      let* α1 := α0.["0"] in
      let* α2 := borrow α1 f64 in
      let* α3 := deref α2 f64 in
      let* α4 := borrow α3 f64 in
      let* α5 := core.clone.Clone.clone α4 in
      let* α6 :=
        deref
          self
          (generics_phantom_type_test_case_unit_clarification.Length _) in
      let* α7 := α6.["1"] in
      let* α8 := borrow α7 (core.marker.PhantomData _) in
      let* α9 := deref α8 (core.marker.PhantomData _) in
      let* α10 := borrow α9 (core.marker.PhantomData _) in
      let* α11 := core.clone.Clone.clone α10 in
      Pure
        (generics_phantom_type_test_case_unit_clarification.Length.Build_t
          α5
          α11).
    
    Global Instance Method_clone `{State.Trait} : Notation.Dot "clone" := {
      Notation.dot := clone;
    }.
    
    Global Instance I `{State.Trait} : core.clone.Clone.Trait Self := {
      core.clone.Clone.clone := clone;
    }.
  End
    Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Global Hint Resolve I : core.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Section
    Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
    Context {Unit : Set}.
    Context `{core.marker.Copy.Trait Unit}.
    Definition Self `{State.Trait} :=
      generics_phantom_type_test_case_unit_clarification.Length Unit.
    
    Global Instance I `{State.Trait} : core.marker.Copy.Trait Self := {
    }.
  End
    Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Global Hint Resolve I : core.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Section
    Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
    Context {Unit : Set}.
    Definition Self `{State.Trait} :=
      generics_phantom_type_test_case_unit_clarification.Length Unit.
    
    Definition Output : Set :=
      generics_phantom_type_test_case_unit_clarification.Length Unit.
    
    Definition add
        `{State.Trait}
        (self : Self)
        (rhs : generics_phantom_type_test_case_unit_clarification.Length Unit)
        : M (generics_phantom_type_test_case_unit_clarification.Length Unit) :=
      let* α0 := self.["0"] in
      let* α1 := rhs.["0"] in
      let* α2 := add α0 α1 in
      Pure
        (generics_phantom_type_test_case_unit_clarification.Length.Build_t
          α2
          (core.marker.PhantomData.Build_t tt)).
    
    Global Instance Method_add `{State.Trait} : Notation.Dot "add" := {
      Notation.dot := add;
    }.
    
    Global Instance I `{State.Trait}
      : core.ops.arith.Add.Trait Self
          (Rhs := core.ops.arith.Add.Default.Rhs Self)
        := {
      core.ops.arith.Add.Output := Output;
      core.ops.arith.Add.add := add;
    }.
  End
    Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Global Hint Resolve I : core.
End
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* one_foot :=
    let* α0 := M.alloc 12 (* 12.0 *) in
    Pure
      (generics_phantom_type_test_case_unit_clarification.Length.Build_t
        α0
        (core.marker.PhantomData.Build_t tt)) in
  let* one_meter :=
    let* α0 := M.alloc 1000 (* 1000.0 *) in
    Pure
      (generics_phantom_type_test_case_unit_clarification.Length.Build_t
        α0
        (core.marker.PhantomData.Build_t tt)) in
  let* two_feet := core.ops.arith.Add.add one_foot one_foot in
  let* two_meters := core.ops.arith.Add.add one_meter one_meter in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "one foot + one_foot = "; mk_str " in
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := two_feet.["0"] in
      let* α5 := borrow α4 f64 in
      let* α6 := deref α5 f64 in
      let* α7 := borrow α6 f64 in
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
        borrow
          [ mk_str "one meter + one_meter = "; mk_str " mm
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := two_meters.["0"] in
      let* α5 := borrow α4 f64 in
      let* α6 := deref α5 f64 in
      let* α7 := borrow α6 f64 in
      let* α8 := core.fmt.rt.Argument::["new_debug"] α7 in
      let* α9 := borrow [ α8 ] (list core.fmt.rt.Argument) in
      let* α10 := deref α9 (list core.fmt.rt.Argument) in
      let* α11 := borrow α10 (list core.fmt.rt.Argument) in
      let* α12 := pointer_coercion "Unsize" α11 in
      let* α13 := core.fmt.Arguments::["new_v1"] α3 α12 in
      std.io.stdio._print α13 in
    Pure tt in
  Pure tt.
