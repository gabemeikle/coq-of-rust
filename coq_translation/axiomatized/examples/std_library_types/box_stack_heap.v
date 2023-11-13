(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module  Point.
Section Point.
  Record t : Set := {
    x : f64.t;
    y : f64.t;
  }.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot x' := let* x' := M.read x' in M.alloc x'.(x) : M _;
  }.
  Global Instance Get_AF_x : Notation.DoubleColon t "x" := {
    Notation.double_colon x' := let* x' := M.read x' in M.alloc x'.(x) : M _;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(y) : M _;
  }.
  Global Instance Get_AF_y : Notation.DoubleColon t "y" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(y) : M _;
  }.
End Point.
End Point.

Module  Impl_core_fmt_Debug_for_box_stack_heap_Point_t.
Section Impl_core_fmt_Debug_for_box_stack_heap_Point_t.
  Ltac Self := exact box_stack_heap.Point.t.
  
  (*
  Debug
  *)
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Parameter fmt :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (mut_ref core.fmt.Formatter.t)) ->
        M (M.Val ltac:(core.fmt.Result)).
  
  Global Instance AssociatedFunction_fmt :
    Notation.DoubleColon ltac:(Self) "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_box_stack_heap_Point_t.
End Impl_core_fmt_Debug_for_box_stack_heap_Point_t.

Module  Impl_core_clone_Clone_for_box_stack_heap_Point_t.
Section Impl_core_clone_Clone_for_box_stack_heap_Point_t.
  Ltac Self := exact box_stack_heap.Point.t.
  
  (*
  Clone
  *)
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Parameter clone :
      (M.Val (ref ltac:(Self))) -> M (M.Val box_stack_heap.Point.t).
  
  Global Instance AssociatedFunction_clone :
    Notation.DoubleColon ltac:(Self) "clone" := {
    Notation.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_box_stack_heap_Point_t.
End Impl_core_clone_Clone_for_box_stack_heap_Point_t.

Module  Impl_core_marker_Copy_for_box_stack_heap_Point_t.
Section Impl_core_marker_Copy_for_box_stack_heap_Point_t.
  Ltac Self := exact box_stack_heap.Point.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_box_stack_heap_Point_t.
End Impl_core_marker_Copy_for_box_stack_heap_Point_t.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module  Rectangle.
Section Rectangle.
  Record t : Set := {
    top_left : box_stack_heap.Point.t;
    bottom_right : box_stack_heap.Point.t;
  }.
  
  Global Instance Get_top_left : Notation.Dot "top_left" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(top_left) : M _;
  }.
  Global Instance Get_AF_top_left : Notation.DoubleColon t "top_left" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(top_left) : M _;
  }.
  Global Instance Get_bottom_right : Notation.Dot "bottom_right" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(bottom_right) : M _;
  }.
  Global Instance Get_AF_bottom_right :
    Notation.DoubleColon t "bottom_right" := {
    Notation.double_colon x :=
      let* x := M.read x in M.alloc x.(bottom_right) : M _;
  }.
End Rectangle.
End Rectangle.

(*
fn origin() -> Point {
    Point { x: 0.0, y: 0.0 }
}
*)
Parameter origin : M (M.Val box_stack_heap.Point.t).

(*
fn boxed_origin() -> Box<Point> {
    // Allocate this point on the heap, and return a pointer to it
    Box::new(Point { x: 0.0, y: 0.0 })
}
*)
Parameter boxed_origin :
    M
        (M.Val
          (alloc.boxed.Box.t box_stack_heap.Point.t alloc.boxed.Box.Default.A)).

(*
fn main() {
    // (all the type annotations are superfluous)
    // Stack allocated variables
    let point: Point = origin();
    let rectangle: Rectangle = Rectangle {
        top_left: origin(),
        bottom_right: Point { x: 3.0, y: -4.0 },
    };

    // Heap allocated rectangle
    let boxed_rectangle: Box<Rectangle> = Box::new(Rectangle {
        top_left: origin(),
        bottom_right: Point { x: 3.0, y: -4.0 },
    });

    // The output of functions can be boxed
    let boxed_point: Box<Point> = Box::new(origin());

    // Double indirection
    let box_in_a_box: Box<Box<Point>> = Box::new(boxed_origin());

    println!(
        "Point occupies {} bytes on the stack",
        mem::size_of_val(&point)
    );
    println!(
        "Rectangle occupies {} bytes on the stack",
        mem::size_of_val(&rectangle)
    );

    // box size == pointer size
    println!(
        "Boxed point occupies {} bytes on the stack",
        mem::size_of_val(&boxed_point)
    );
    println!(
        "Boxed rectangle occupies {} bytes on the stack",
        mem::size_of_val(&boxed_rectangle)
    );
    println!(
        "Boxed box occupies {} bytes on the stack",
        mem::size_of_val(&box_in_a_box)
    );

    // Copy the data contained in `boxed_point` into `unboxed_point`
    let unboxed_point: Point = *boxed_point;
    println!(
        "Unboxed point occupies {} bytes on the stack",
        mem::size_of_val(&unboxed_point)
    );
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
