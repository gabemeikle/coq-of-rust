(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Centimeters.
Section Centimeters.
  Context `{ℋ : State.Trait}.
  
  Unset Primitive Projections.
  Record t : Set := {
    x0 : f64;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.pure x.(x0) : M _;
  }.
End Centimeters.
End Centimeters.
Definition Centimeters `{ℋ : State.Trait} : Set := M.Val Centimeters.t.

Module  Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.
Section Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := derive.Centimeters.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.
End Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.

Module  Impl_core_cmp_PartialEq_for_derive_Centimeters.
Section Impl_core_cmp_PartialEq_for_derive_Centimeters.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := derive.Centimeters.
  
  Definition eq (self : ref Self) (other : ref derive.Centimeters) : M bool :=
    let* α0 := deref self derive.Centimeters in
    let* α1 := α0.["0"] in
    let* α2 := deref other derive.Centimeters in
    let* α3 := α2.["0"] in
    BinOp.eq α1 α3.
  
  Global Instance AssociatedFunction_eq : Notation.DoubleColon Self "eq" := {
    Notation.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_derive_Centimeters.
End Impl_core_cmp_PartialEq_for_derive_Centimeters.

Module  Impl_core_cmp_PartialOrd_for_derive_Centimeters.
Section Impl_core_cmp_PartialOrd_for_derive_Centimeters.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := derive.Centimeters.
  
  Definition partial_cmp
      (self : ref Self)
      (other : ref derive.Centimeters)
      : M (core.option.Option core.cmp.Ordering) :=
    let* α0 := deref self derive.Centimeters in
    let* α1 := α0.["0"] in
    let* α2 := borrow α1 f64 in
    let* α3 := deref α2 f64 in
    let* α4 := borrow α3 f64 in
    let* α5 := deref other derive.Centimeters in
    let* α6 := α5.["0"] in
    let* α7 := borrow α6 f64 in
    let* α8 := deref α7 f64 in
    let* α9 := borrow α8 f64 in
    (core.cmp.PartialOrd.partial_cmp (Self := f64) (Trait := ltac:(refine _)))
      α4
      α9.
  
  Global Instance AssociatedFunction_partial_cmp :
    Notation.DoubleColon Self "partial_cmp" := {
    Notation.double_colon := partial_cmp;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialOrd.Required.Trait Self
      (Rhs := core.cmp.PartialOrd.Default.Rhs Self) := {
    core.cmp.PartialOrd.partial_cmp := partial_cmp;
    core.cmp.PartialOrd.lt := Datatypes.None;
    core.cmp.PartialOrd.le := Datatypes.None;
    core.cmp.PartialOrd.gt := Datatypes.None;
    core.cmp.PartialOrd.ge := Datatypes.None;
  }.
End Impl_core_cmp_PartialOrd_for_derive_Centimeters.
End Impl_core_cmp_PartialOrd_for_derive_Centimeters.

Module  Inches.
Section Inches.
  Context `{ℋ : State.Trait}.
  
  Unset Primitive Projections.
  Record t : Set := {
    x0 : i32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.pure x.(x0) : M _;
  }.
End Inches.
End Inches.
Definition Inches `{ℋ : State.Trait} : Set := M.Val Inches.t.

Module  Impl_core_fmt_Debug_for_derive_Inches.
Section Impl_core_fmt_Debug_for_derive_Inches.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := derive.Inches.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M ltac:(core.fmt.Result) :=
    let* α0 := deref f core.fmt.Formatter in
    let* α1 := borrow_mut α0 core.fmt.Formatter in
    let* α2 := deref (mk_str "Inches") str in
    let* α3 := borrow α2 str in
    let* α4 := deref self derive.Inches in
    let* α5 := α4.["0"] in
    let* α6 := borrow α5 i32 in
    let* α7 := borrow α6 (ref i32) in
    let* α8 := deref α7 (ref i32) in
    let* α9 := borrow α8 (ref i32) in
    let* α10 := pointer_coercion "Unsize" α9 in
    core.fmt.Formatter::["debug_tuple_field1_finish"] α1 α3 α10.
  
  Global Instance AssociatedFunction_fmt : Notation.DoubleColon Self "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_derive_Inches.
End Impl_core_fmt_Debug_for_derive_Inches.

Module  Impl_derive_Inches.
Section Impl_derive_Inches.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := derive.Inches.
  
  Definition to_centimeters (self : ref Self) : M derive.Centimeters :=
    let 'derive.Inches.Build_t inches := self in
    let* α0 := cast inches in
    let* α1 := M.alloc 3 (* 2.54 *) in
    let* α2 := BinOp.mul α0 α1 in
    M.alloc (derive.Centimeters.Build_t α2).
  
  Global Instance AssociatedFunction_to_centimeters :
    Notation.DoubleColon Self "to_centimeters" := {
    Notation.double_colon := to_centimeters;
  }.
End Impl_derive_Inches.
End Impl_derive_Inches.

Module  Seconds.
Section Seconds.
  Context `{ℋ : State.Trait}.
  
  Unset Primitive Projections.
  Record t : Set := {
    x0 : i32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.pure x.(x0) : M _;
  }.
End Seconds.
End Seconds.
Definition Seconds `{ℋ : State.Trait} : Set := M.Val Seconds.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* _one_second :=
    let* α0 := M.alloc 1 in
    M.alloc (derive.Seconds.Build_t α0) in
  let* foot :=
    let* α0 := M.alloc 12 in
    M.alloc (derive.Inches.Build_t α0) in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "One foot equals "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow foot derive.Inches in
      let* α5 := deref α4 derive.Inches in
      let* α6 := borrow α5 derive.Inches in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    M.alloc tt in
  let* meter :=
    let* α0 := M.alloc 100 (* 100.0 *) in
    M.alloc (derive.Centimeters.Build_t α0) in
  let* cmp :=
    let* α0 := borrow foot derive.Inches in
    let* α1 := derive.Inches::["to_centimeters"] α0 in
    let* α2 := borrow α1 derive.Centimeters in
    let* α3 := borrow meter derive.Centimeters in
    let* α4 :=
      (core.cmp.PartialOrd.lt
          (Self := derive.Centimeters)
          (Trait := ltac:(refine _)))
        α2
        α3 in
    let* α5 := use α4 in
    if (α5 : bool) then
      M.pure (mk_str "smaller")
    else
      let* α0 := deref (mk_str "bigger") str in
      borrow α0 str in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "One foot is "; mk_str " than one meter.
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow cmp (ref str) in
      let* α5 := deref α4 (ref str) in
      let* α6 := borrow α5 (ref str) in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    M.alloc tt in
  M.alloc tt.
