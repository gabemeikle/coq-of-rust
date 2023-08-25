(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module Point.
  Unset Primitive Projections.
  Record t : Set := {
    x : f64;
    y : f64;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Point.
Definition Point : Set := @Point.t.

Module Impl_core_fmt_Debug_for_box_stack_heap_Point.
  Definition Self := box_stack_heap.Point.
  
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Parameter debug_struct_field2_finish : core.fmt.Formatter ->
    string ->
    string -> f64 -> 
    string -> f64 -> 
    M (H := H) core.fmt.Result.
  
  Global Instance Deb_debug_struct_field2_finish : Notation.DoubleColon
    core.fmt.Formatter "debug_struct_field2_finish" := {
    Notation.double_colon := debug_struct_field2_finish; }.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.fmt.Formatter::["debug_struct_field2_finish"]
      f
      "Point"
      "x"
      (addr_of self.["x"])
      "y"
      (addr_of (addr_of self.["y"])).
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_box_stack_heap_Point.

Module Impl_core_clone_Clone_for_box_stack_heap_Point.
  Definition Self := box_stack_heap.Point.
  
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition clone
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) box_stack_heap.Point :=
    let _ : core.clone.AssertParamIsClone f64 := tt in
    self.["deref"].
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_box_stack_heap_Point.

Module Impl_core_marker_Copy_for_box_stack_heap_Point.
  Definition Self := box_stack_heap.Point.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End Impl_core_marker_Copy_for_box_stack_heap_Point.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module Rectangle.
  Unset Primitive Projections.
  Record t : Set := {
    top_left : box_stack_heap.Point;
    bottom_right : box_stack_heap.Point;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_top_left : Notation.Dot "top_left" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_bottom_right : Notation.Dot "bottom_right" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Rectangle.
Definition Rectangle : Set := @Rectangle.t.

Definition origin `{H : State.Trait} : M (H := H) box_stack_heap.Point :=
  Pure
    {|
      box_stack_heap.Point.x := 0 (* 0.0 *);
      box_stack_heap.Point.y := 0 (* 0.0 *);
    |}.

Definition boxed_origin
    `{H : State.Trait}
    : M (H := H) (alloc.boxed.Box box_stack_heap.Point) :=
  alloc.boxed.Box::["new"]
    {|
      box_stack_heap.Point.x := 0 (* 0.0 *);
      box_stack_heap.Point.y := 0 (* 0.0 *);
    |}.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* point := box_stack_heap.origin in
  let* rectangle :=
    let* α0 := box_stack_heap.origin in
    let* α1 := 4 (* 4.0 *).["neg"] in
    Pure
      {|
        box_stack_heap.Rectangle.top_left := α0;
        box_stack_heap.Rectangle.bottom_right :=
          {|
            box_stack_heap.Point.x := 3 (* 3.0 *);
            box_stack_heap.Point.y := α1;
          |};
      |} in
  let* boxed_rectangle :=
    let* α0 := box_stack_heap.origin in
    let* α1 := 4 (* 4.0 *).["neg"] in
    alloc.boxed.Box::["new"]
      {|
        box_stack_heap.Rectangle.top_left := α0;
        box_stack_heap.Rectangle.bottom_right :=
          {|
            box_stack_heap.Point.x := 3 (* 3.0 *);
            box_stack_heap.Point.y := α1;
          |};
      |} in
  let* boxed_point :=
    let* α0 := box_stack_heap.origin in
    alloc.boxed.Box::["new"] α0 in
  let* box_in_a_box :=
    let* α0 := box_stack_heap.boxed_origin in
    alloc.boxed.Box::["new"] α0 in
  let* _ :=
    let* _ :=
      let* α0 := core.mem.size_of_val (addr_of point) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Point occupies "; " bytes on the stack
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := core.mem.size_of_val (addr_of rectangle) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Rectangle occupies "; " bytes on the stack
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := core.mem.size_of_val (addr_of boxed_point) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Boxed point occupies "; " bytes on the stack
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := core.mem.size_of_val (addr_of boxed_rectangle) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Boxed rectangle occupies "; " bytes on the stack
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := core.mem.size_of_val (addr_of box_in_a_box) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Boxed box occupies "; " bytes on the stack
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* unboxed_point := boxed_point.["deref"] in
  let* _ :=
    let* _ :=
      let* α0 := core.mem.size_of_val (addr_of unboxed_point) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Unboxed point occupies "; " bytes on the stack
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.
