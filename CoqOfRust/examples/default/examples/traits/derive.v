(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Centimeters.
Section Centimeters.
  Record t : Set := {
    x0 : f64.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Centimeters.
End Centimeters.

Module  Impl_core_marker_StructuralPartialEq_for_derive_Centimeters_t.
Section Impl_core_marker_StructuralPartialEq_for_derive_Centimeters_t.
  Ltac Self := exact derive.Centimeters.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait ltac:(Self) := {
  }.
End Impl_core_marker_StructuralPartialEq_for_derive_Centimeters_t.
End Impl_core_marker_StructuralPartialEq_for_derive_Centimeters_t.

Module  Impl_core_cmp_PartialEq_for_derive_Centimeters_t.
Section Impl_core_cmp_PartialEq_for_derive_Centimeters_t.
  Ltac Self := exact derive.Centimeters.t.
  
  (*
  PartialEq
  *)
  Definition eq
      (self : ref ltac:(Self))
      (other : ref derive.Centimeters.t)
      : M bool.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* other : M.Val (ref derive.Centimeters.t) := M.alloc other in
    M.function_body
      (let* α0 : ref derive.Centimeters.t := M.read self in
      let* α1 : M.Val derive.Centimeters.t := deref α0 in
      let* α2 : ref derive.Centimeters.t := M.read other in
      let* α3 : M.Val derive.Centimeters.t := deref α2 in
      BinOp.eq α1.["0"] α3.["0"]).
  
  Global Instance AssociatedFunction_eq :
    Notations.DoubleColon ltac:(Self) "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait ltac:(Self)
      (Rhs := core.cmp.PartialEq.Default.Rhs ltac:(Self)) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_derive_Centimeters_t.
End Impl_core_cmp_PartialEq_for_derive_Centimeters_t.

Module  Impl_core_cmp_PartialOrd_for_derive_Centimeters_t.
Section Impl_core_cmp_PartialOrd_for_derive_Centimeters_t.
  Ltac Self := exact derive.Centimeters.t.
  
  (*
  PartialOrd
  *)
  Definition partial_cmp
      (self : ref ltac:(Self))
      (other : ref derive.Centimeters.t)
      : M (core.option.Option.t core.cmp.Ordering.t) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* other : M.Val (ref derive.Centimeters.t) := M.alloc other in
    M.function_body
      (let* α0 : ref derive.Centimeters.t := M.read self in
      let* α1 : M.Val derive.Centimeters.t := deref α0 in
      let* α2 : ref f64.t := borrow α1.["0"] in
      let* α3 : M.Val f64.t := deref α2 in
      let* α4 : ref f64.t := borrow α3 in
      let* α5 : ref derive.Centimeters.t := M.read other in
      let* α6 : M.Val derive.Centimeters.t := deref α5 in
      let* α7 : ref f64.t := borrow α6.["0"] in
      let* α8 : M.Val f64.t := deref α7 in
      let* α9 : ref f64.t := borrow α8 in
      let* α10 : core.option.Option.t core.cmp.Ordering.t :=
        (core.cmp.PartialOrd.partial_cmp
            (Self := f64.t)
            (Trait := ltac:(refine _)))
          α4
          α9 in
      M.alloc α10).
  
  Global Instance AssociatedFunction_partial_cmp :
    Notations.DoubleColon ltac:(Self) "partial_cmp" := {
    Notations.double_colon := partial_cmp;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialOrd.Required.Trait ltac:(Self)
      (Rhs := core.cmp.PartialOrd.Default.Rhs ltac:(Self)) := {
    core.cmp.PartialOrd.partial_cmp := partial_cmp;
    core.cmp.PartialOrd.lt := Datatypes.None;
    core.cmp.PartialOrd.le := Datatypes.None;
    core.cmp.PartialOrd.gt := Datatypes.None;
    core.cmp.PartialOrd.ge := Datatypes.None;
  }.
End Impl_core_cmp_PartialOrd_for_derive_Centimeters_t.
End Impl_core_cmp_PartialOrd_for_derive_Centimeters_t.

Module  Inches.
Section Inches.
  Record t : Set := {
    x0 : i32.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Inches.
End Inches.

Module  Impl_core_fmt_Debug_for_derive_Inches_t.
Section Impl_core_fmt_Debug_for_derive_Inches_t.
  Ltac Self := exact derive.Inches.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : M.Val core.fmt.Formatter.t := deref α0 in
      let* α2 : mut_ref core.fmt.Formatter.t := borrow_mut α1 in
      let* α3 : ref str.t := M.read (mk_str "Inches") in
      let* α4 : M.Val str.t := deref α3 in
      let* α5 : ref str.t := borrow α4 in
      let* α6 : ref derive.Inches.t := M.read self in
      let* α7 : M.Val derive.Inches.t := deref α6 in
      let* α8 : ref i32.t := borrow α7.["0"] in
      let* α9 : M.Val (ref i32.t) := M.alloc α8 in
      let* α10 : ref (ref i32.t) := borrow α9 in
      let* α11 : M.Val (ref i32.t) := deref α10 in
      let* α12 : ref (ref i32.t) := borrow α11 in
      let* α13 : M.Val (ref (ref i32.t)) := M.alloc α12 in
      let* α14 : M.Val (ref type not implemented) :=
        pointer_coercion "Unsize" α13 in
      let* α15 : ref type not implemented := M.read α14 in
      let* α16 : core.result.Result.t unit core.fmt.Error.t :=
        core.fmt.Formatter.t::["debug_tuple_field1_finish"] α2 α5 α15 in
      M.alloc α16).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_derive_Inches_t.
End Impl_core_fmt_Debug_for_derive_Inches_t.

Module  Impl_derive_Inches_t.
Section Impl_derive_Inches_t.
  Ltac Self := exact derive.Inches.t.
  
  (*
      fn to_centimeters(&self) -> Centimeters {
          let &Inches(inches) = self;
  
          Centimeters(inches as f64 * 2.54)
      }
  *)
  Definition to_centimeters (self : ref ltac:(Self)) : M derive.Centimeters.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    M.function_body
      (let* 'derive.Inches.Build_t inches : M.Val (ref derive.Inches.t) :=
        M.copy self in
      let* α0 : M.Val f64.t := cast inches in
      let* α1 : M.Val f64.t := M.alloc 3 (* 2.54 *) in
      let* α2 : M.Val f64.t := BinOp.mul α0 α1 in
      let* α3 : f64.t := M.read α2 in
      M.alloc (derive.Centimeters.Build_t α3)).
  
  Global Instance AssociatedFunction_to_centimeters :
    Notations.DoubleColon ltac:(Self) "to_centimeters" := {
    Notations.double_colon := to_centimeters;
  }.
End Impl_derive_Inches_t.
End Impl_derive_Inches_t.

Module  Seconds.
Section Seconds.
  Record t : Set := {
    x0 : i32.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Seconds.
End Seconds.

(*
fn main() {
    let _one_second = Seconds(1);

    // Error: `Seconds` can't be printed; it doesn't implement the `Debug` trait
    //println!("One second looks like: {:?}", _one_second);
    // TODO ^ Try uncommenting this line

    // Error: `Seconds` can't be compared; it doesn't implement the `PartialEq` trait
    //let _this_is_true = (_one_second == _one_second);
    // TODO ^ Try uncommenting this line

    let foot = Inches(12);

    println!("One foot equals {:?}", foot);

    let meter = Centimeters(100.0);

    let cmp = if foot.to_centimeters() < meter {
        "smaller"
    } else {
        "bigger"
    };

    println!("One foot is {} than one meter.", cmp);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* _one_second : M.Val derive.Seconds.t :=
      let* α0 : M.Val i32.t := M.alloc 1 in
      let* α1 : i32.t := M.read α0 in
      M.alloc (derive.Seconds.Build_t α1) in
    let* foot : M.Val derive.Inches.t :=
      let* α0 : M.Val i32.t := M.alloc 12 in
      let* α1 : i32.t := M.read α0 in
      M.alloc (derive.Inches.Build_t α1) in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "One foot equals "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref derive.Inches.t := borrow foot in
        let* α8 : M.Val derive.Inches.t := deref α7 in
        let* α9 : ref derive.Inches.t := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
        let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    let* meter : M.Val derive.Centimeters.t :=
      let* α0 : M.Val f64.t := M.alloc 100 (* 100.0 *) in
      let* α1 : f64.t := M.read α0 in
      M.alloc (derive.Centimeters.Build_t α1) in
    let* cmp : M.Val (ref str.t) :=
      let* α0 : ref derive.Inches.t := borrow foot in
      let* α1 : derive.Centimeters.t :=
        derive.Inches.t::["to_centimeters"] α0 in
      let* α2 : M.Val derive.Centimeters.t := M.alloc α1 in
      let* α3 : ref derive.Centimeters.t := borrow α2 in
      let* α4 : ref derive.Centimeters.t := borrow meter in
      let* α5 : bool.t :=
        (core.cmp.PartialOrd.lt
            (Self := derive.Centimeters.t)
            (Trait := ltac:(refine _)))
          α3
          α4 in
      let* α6 : M.Val bool.t := M.alloc α5 in
      let* α7 : M.Val bool.t := use α6 in
      let* α8 : bool.t := M.read α7 in
      let* α9 : M.Val (ref str.t) :=
        if (α8 : bool) then
          M.pure (mk_str "smaller")
        else
          let* α0 : ref str.t := M.read (mk_str "bigger") in
          let* α1 : M.Val str.t := deref α0 in
          let* α2 : ref str.t := borrow α1 in
          M.alloc α2 in
      M.copy α9 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "One foot is "; mk_str " than one meter.
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (ref str.t) := borrow cmp in
        let* α8 : M.Val (ref str.t) := deref α7 in
        let* α9 : ref (ref str.t) := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
        let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    M.alloc tt).
