(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Point.
Section Point.
  Context `{ℋ : State.Trait}.
  
  Unset Primitive Projections.
  Record t : Set := {
    x : f64;
    y : f64;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot x' := let* x' := M.read x' in M.pure x'.(x) : M _;
  }.
  Global Instance Get_AF_x : Notation.DoubleColon t "x" := {
    Notation.double_colon x' := let* x' := M.read x' in M.pure x'.(x) : M _;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot x := let* x := M.read x in M.pure x.(y) : M _;
  }.
  Global Instance Get_AF_y : Notation.DoubleColon t "y" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(y) : M _;
  }.
End Point.
End Point.
Definition Point `{ℋ : State.Trait} : Set := M.Val Point.t.

Module  Impl_associated_functions_and_methods_Point.
Section Impl_associated_functions_and_methods_Point.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := associated_functions_and_methods.Point.
  
  Definition origin : M associated_functions_and_methods.Point :=
    let* α0 := M.alloc 0 (* 0.0 *) in
    let* α1 := M.alloc 1 (* 1.0 *) in
    M.alloc
      {|
        associated_functions_and_methods.Point.y := α0;
        associated_functions_and_methods.Point.x := α1;
      |}.
  
  Global Instance AssociatedFunction_origin :
    Notation.DoubleColon Self "origin" := {
    Notation.double_colon := origin;
  }.
  
  Definition new
      (x : f64)
      (y : f64)
      : M associated_functions_and_methods.Point :=
    M.alloc
      {|
        associated_functions_and_methods.Point.x := x;
        associated_functions_and_methods.Point.y := y;
      |}.
  
  Global Instance AssociatedFunction_new : Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
End Impl_associated_functions_and_methods_Point.
End Impl_associated_functions_and_methods_Point.

Module  Rectangle.
Section Rectangle.
  Context `{ℋ : State.Trait}.
  
  Unset Primitive Projections.
  Record t : Set := {
    p1 : associated_functions_and_methods.Point;
    p2 : associated_functions_and_methods.Point;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_p1 : Notation.Dot "p1" := {
    Notation.dot x := let* x := M.read x in M.pure x.(p1) : M _;
  }.
  Global Instance Get_AF_p1 : Notation.DoubleColon t "p1" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(p1) : M _;
  }.
  Global Instance Get_p2 : Notation.Dot "p2" := {
    Notation.dot x := let* x := M.read x in M.pure x.(p2) : M _;
  }.
  Global Instance Get_AF_p2 : Notation.DoubleColon t "p2" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(p2) : M _;
  }.
End Rectangle.
End Rectangle.
Definition Rectangle `{ℋ : State.Trait} : Set := M.Val Rectangle.t.

Module  Impl_associated_functions_and_methods_Rectangle.
Section Impl_associated_functions_and_methods_Rectangle.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := associated_functions_and_methods.Rectangle.
  
  Definition get_p1
      (self : ref Self)
      : M associated_functions_and_methods.Point :=
    let* α0 := deref self associated_functions_and_methods.Rectangle in
    α0.["p1"].
  
  Global Instance AssociatedFunction_get_p1 :
    Notation.DoubleColon Self "get_p1" := {
    Notation.double_colon := get_p1;
  }.
  
  Definition area (self : ref Self) : M f64 :=
    let*
        '{|
          associated_functions_and_methods.Point.x := x1;
          associated_functions_and_methods.Point.y := y1;
        |} :=
      let* α0 := deref self associated_functions_and_methods.Rectangle in
      α0.["p1"] in
    let*
        '{|
          associated_functions_and_methods.Point.x := x2;
          associated_functions_and_methods.Point.y := y2;
        |} :=
      let* α0 := deref self associated_functions_and_methods.Rectangle in
      α0.["p2"] in
    let* α0 := BinOp.sub x1 x2 in
    let* α1 := BinOp.sub y1 y2 in
    let* α2 := BinOp.mul α0 α1 in
    f64::["abs"] α2.
  
  Global Instance AssociatedFunction_area :
    Notation.DoubleColon Self "area" := {
    Notation.double_colon := area;
  }.
  
  Definition perimeter (self : ref Self) : M f64 :=
    let*
        '{|
          associated_functions_and_methods.Point.x := x1;
          associated_functions_and_methods.Point.y := y1;
        |} :=
      let* α0 := deref self associated_functions_and_methods.Rectangle in
      α0.["p1"] in
    let*
        '{|
          associated_functions_and_methods.Point.x := x2;
          associated_functions_and_methods.Point.y := y2;
        |} :=
      let* α0 := deref self associated_functions_and_methods.Rectangle in
      α0.["p2"] in
    let* α0 := M.alloc 2 (* 2.0 *) in
    let* α1 := BinOp.sub x1 x2 in
    let* α2 := f64::["abs"] α1 in
    let* α3 := BinOp.sub y1 y2 in
    let* α4 := f64::["abs"] α3 in
    let* α5 := BinOp.add α2 α4 in
    BinOp.mul α0 α5.
  
  Global Instance AssociatedFunction_perimeter :
    Notation.DoubleColon Self "perimeter" := {
    Notation.double_colon := perimeter;
  }.
  
  Definition translate (self : mut_ref Self) (x : f64) (y : f64) : M unit :=
    let* _ :=
      let* α0 := deref self associated_functions_and_methods.Rectangle in
      let* α1 := α0.["p1"] in
      let* α2 := α1.["x"] in
      assign_op add α2 x in
    let* _ :=
      let* α0 := deref self associated_functions_and_methods.Rectangle in
      let* α1 := α0.["p2"] in
      let* α2 := α1.["x"] in
      assign_op add α2 x in
    let* _ :=
      let* α0 := deref self associated_functions_and_methods.Rectangle in
      let* α1 := α0.["p1"] in
      let* α2 := α1.["y"] in
      assign_op add α2 y in
    let* _ :=
      let* α0 := deref self associated_functions_and_methods.Rectangle in
      let* α1 := α0.["p2"] in
      let* α2 := α1.["y"] in
      assign_op add α2 y in
    M.alloc tt.
  
  Global Instance AssociatedFunction_translate :
    Notation.DoubleColon Self "translate" := {
    Notation.double_colon := translate;
  }.
End Impl_associated_functions_and_methods_Rectangle.
End Impl_associated_functions_and_methods_Rectangle.

Module  Pair.
Section Pair.
  Context `{ℋ : State.Trait}.
  
  Unset Primitive Projections.
  Record t : Set := {
    x0 : alloc.boxed.Box i32 alloc.boxed.Box.Default.A;
    x1 : alloc.boxed.Box i32 alloc.boxed.Box.Default.A;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.pure x.(x0) : M _;
  }.
  Global Instance Get_1 : Notation.Dot "1" := {
    Notation.dot x := let* x := M.read x in M.pure x.(x1) : M _;
  }.
End Pair.
End Pair.
Definition Pair `{ℋ : State.Trait} : Set := M.Val Pair.t.

Module  Impl_associated_functions_and_methods_Pair.
Section Impl_associated_functions_and_methods_Pair.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := associated_functions_and_methods.Pair.
  
  Definition destroy (self : Self) : M unit :=
    let 'associated_functions_and_methods.Pair.Build_t first second := self in
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow
            [ mk_str "Destroying Pair("; mk_str ", "; mk_str ")
" ]
            (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow first (alloc.boxed.Box i32 alloc.alloc.Global) in
        let* α5 := deref α4 (alloc.boxed.Box i32 alloc.alloc.Global) in
        let* α6 := borrow α5 (alloc.boxed.Box i32 alloc.alloc.Global) in
        let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
        let* α8 := borrow second (alloc.boxed.Box i32 alloc.alloc.Global) in
        let* α9 := deref α8 (alloc.boxed.Box i32 alloc.alloc.Global) in
        let* α10 := borrow α9 (alloc.boxed.Box i32 alloc.alloc.Global) in
        let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
        let* α12 := borrow [ α7; α11 ] (list core.fmt.rt.Argument) in
        let* α13 := deref α12 (list core.fmt.rt.Argument) in
        let* α14 := borrow α13 (list core.fmt.rt.Argument) in
        let* α15 := pointer_coercion "Unsize" α14 in
        let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
        std.io.stdio._print α16 in
      M.alloc tt in
    M.alloc tt.
  
  Global Instance AssociatedFunction_destroy :
    Notation.DoubleColon Self "destroy" := {
    Notation.double_colon := destroy;
  }.
End Impl_associated_functions_and_methods_Pair.
End Impl_associated_functions_and_methods_Pair.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* rectangle :=
    let* α0 := associated_functions_and_methods.Point::["origin"] in
    let* α1 := M.alloc 3 (* 3.0 *) in
    let* α2 := M.alloc 4 (* 4.0 *) in
    let* α3 := associated_functions_and_methods.Point::["new"] α1 α2 in
    M.alloc
      {|
        associated_functions_and_methods.Rectangle.p1 := α0;
        associated_functions_and_methods.Rectangle.p2 := α3;
      |} in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Rectangle perimeter: "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow rectangle associated_functions_and_methods.Rectangle in
      let* α5 := associated_functions_and_methods.Rectangle::["perimeter"] α4 in
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
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "Rectangle area: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow rectangle associated_functions_and_methods.Rectangle in
      let* α5 := associated_functions_and_methods.Rectangle::["area"] α4 in
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
  let* square :=
    let* α0 := associated_functions_and_methods.Point::["origin"] in
    let* α1 := M.alloc 1 (* 1.0 *) in
    let* α2 := M.alloc 1 (* 1.0 *) in
    let* α3 := associated_functions_and_methods.Point::["new"] α1 α2 in
    M.alloc
      {|
        associated_functions_and_methods.Rectangle.p1 := α0;
        associated_functions_and_methods.Rectangle.p2 := α3;
      |} in
  let* _ :=
    let* α0 := borrow_mut square associated_functions_and_methods.Rectangle in
    let* α1 := M.alloc 1 (* 1.0 *) in
    let* α2 := M.alloc 1 (* 1.0 *) in
    associated_functions_and_methods.Rectangle::["translate"] α0 α1 α2 in
  let* pair :=
    let* α0 := M.alloc 1 in
    let* α1 := (alloc.boxed.Box i32 alloc.alloc.Global)::["new"] α0 in
    let* α2 := M.alloc 2 in
    let* α3 := (alloc.boxed.Box i32 alloc.alloc.Global)::["new"] α2 in
    M.alloc (associated_functions_and_methods.Pair.Build_t α1 α3) in
  let* _ := associated_functions_and_methods.Pair::["destroy"] pair in
  M.alloc tt.
