(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module HasArea.
  Section HasArea.
    Context `{ℋ : State.Trait}.
    
    Class Trait (Self : Set) : Type := {
      area : (ref Self) -> M f64;
    }.
    
  End HasArea.
End HasArea.

Module Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle.
  Section Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := generics_bounds.Rectangle.
    
    Definition area (self : ref Self) : M f64 :=
      let* α0 := deref self generics_bounds.Rectangle in
      let* α1 := α0.["length"] in
      let* α2 := deref self generics_bounds.Rectangle in
      let* α3 := α2.["height"] in
      BinOp.mul α1 α3.
    
    Global Instance AssociatedFunction_area :
      Notation.DoubleColon Self "area" := {
      Notation.double_colon := area;
    }.
    
    Global Instance ℐ : generics_bounds.HasArea.Trait Self := {
      generics_bounds.HasArea.area := area;
    }.
  End Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle.
End Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle.

Module Rectangle.
  Section Rectangle.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      length : f64;
      height : f64;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_length : Notation.Dot "length" := {
      Notation.dot x := let* x := M.read x in Pure x.(length) : M _;
    }.
    Global Instance Get_AF_length : Notation.DoubleColon t "length" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(length) : M _;
    }.
    Global Instance Get_height : Notation.Dot "height" := {
      Notation.dot x := let* x := M.read x in Pure x.(height) : M _;
    }.
    Global Instance Get_AF_height : Notation.DoubleColon t "height" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(height) : M _;
    }.
  End Rectangle.
End Rectangle.
Definition Rectangle `{ℋ : State.Trait} : Set := M.val Rectangle.t.

Module Impl_core_fmt_Debug_for_generics_bounds_Rectangle.
  Section Impl_core_fmt_Debug_for_generics_bounds_Rectangle.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := generics_bounds.Rectangle.
    
    Definition fmt
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M ltac:(core.fmt.Result) :=
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 := deref (mk_str "Rectangle") str in
      let* α3 := borrow α2 str in
      let* α4 := deref (mk_str "length") str in
      let* α5 := borrow α4 str in
      let* α6 := deref self generics_bounds.Rectangle in
      let* α7 := α6.["length"] in
      let* α8 := borrow α7 f64 in
      let* α9 := deref α8 f64 in
      let* α10 := borrow α9 f64 in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := deref (mk_str "height") str in
      let* α13 := borrow α12 str in
      let* α14 := deref self generics_bounds.Rectangle in
      let* α15 := α14.["height"] in
      let* α16 := borrow α15 f64 in
      let* α17 := borrow α16 (ref f64) in
      let* α18 := deref α17 (ref f64) in
      let* α19 := borrow α18 (ref f64) in
      let* α20 := pointer_coercion "Unsize" α19 in
      core.fmt.Formatter::["debug_struct_field2_finish"] α1 α3 α5 α11 α13 α20.
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    Global Instance ℐ : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_generics_bounds_Rectangle.
End Impl_core_fmt_Debug_for_generics_bounds_Rectangle.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module Triangle.
  Section Triangle.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      length : f64;
      height : f64;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_length : Notation.Dot "length" := {
      Notation.dot x := let* x := M.read x in Pure x.(length) : M _;
    }.
    Global Instance Get_AF_length : Notation.DoubleColon t "length" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(length) : M _;
    }.
    Global Instance Get_height : Notation.Dot "height" := {
      Notation.dot x := let* x := M.read x in Pure x.(height) : M _;
    }.
    Global Instance Get_AF_height : Notation.DoubleColon t "height" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(height) : M _;
    }.
  End Triangle.
End Triangle.
Definition Triangle `{ℋ : State.Trait} : Set := M.val Triangle.t.

Definition print_debug
    `{ℋ : State.Trait}
    {T : Set}
    {ℋ_0 : core.fmt.Debug.Trait T}
    (t : ref T)
    : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str ""; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow t (ref T) in
      let* α5 := deref α4 (ref T) in
      let* α6 := borrow α5 (ref T) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    M.alloc tt in
  M.alloc tt.

Definition area
    `{ℋ : State.Trait}
    {T : Set}
    {ℋ_0 : generics_bounds.HasArea.Trait T}
    (t : ref T)
    : M f64 :=
  let* α0 := deref t T in
  let* α1 := borrow α0 T in
  (generics_bounds.HasArea.area (Self := T) (Trait := ltac:(refine _))) α1.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* rectangle :=
    let* α0 := M.alloc 3 (* 3.0 *) in
    let* α1 := M.alloc 4 (* 4.0 *) in
    M.alloc
      {|
        generics_bounds.Rectangle.length := α0;
        generics_bounds.Rectangle.height := α1;
      |} in
  let* _triangle :=
    let* α0 := M.alloc 3 (* 3.0 *) in
    let* α1 := M.alloc 4 (* 4.0 *) in
    M.alloc
      {|
        generics_bounds.Triangle.length := α0;
        generics_bounds.Triangle.height := α1;
      |} in
  let* _ :=
    let* α0 := borrow rectangle generics_bounds.Rectangle in
    let* α1 := deref α0 generics_bounds.Rectangle in
    let* α2 := borrow α1 generics_bounds.Rectangle in
    generics_bounds.print_debug α2 in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "Area: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow rectangle generics_bounds.Rectangle in
      let* α5 :=
        (generics_bounds.HasArea.area
            (Self := generics_bounds.Rectangle)
            (Trait := ltac:(refine _)))
          α4 in
      let* α6 := borrow α5 f64 in
      let* α7 := deref α6 f64 in
      let* α8 := borrow α7 f64 in
      let* α9 := core.fmt.rt.Argument::["new_display"] α8 in
      let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
      let* α11 := deref α10 (list core.fmt.rt.Argument) in
      let* α12 := borrow α11 (list core.fmt.rt.Argument) in
      let* α13 := pointer_coercion "Unsize" α12 in
      let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
      std.io.stdio._print α14 in
    M.alloc tt in
  M.alloc tt.
