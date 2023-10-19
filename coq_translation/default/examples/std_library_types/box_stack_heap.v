(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module Point.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    x : f64;
    y : f64;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_x `{State.Trait} : Notation.Dot "x" := {
    Notation.dot x := let* x' := M.read x' in Pure x'.(x) : M _;
  }.
  Global Instance Get_AF_x `{State.Trait} : Notation.DoubleColon t "x" := {
    Notation.double_colon x := let* x' := M.read x' in Pure x'.(x) : M _;
  }.
  Global Instance Get_y `{State.Trait} : Notation.Dot "y" := {
    Notation.dot x := let* x := M.read x in Pure x.(y) : M _;
  }.
  Global Instance Get_AF_y `{State.Trait} : Notation.DoubleColon t "y" := {
    Notation.double_colon x := let* x := M.read x in Pure x.(y) : M _;
  }.
End Point.
Definition Point `{State.Trait} : Set := M.val (Point.t).

Module Impl_core_fmt_Debug_for_box_stack_heap_Point.
  Definition Self `{State.Trait} := box_stack_heap.Point.
  
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Parameter struct_parameter_for_fmt :
      core.fmt.Formatter ->
        string -> string -> f64 -> string -> f64 -> M core.fmt.Result.
  
  Global Instance Deb_struct_parameter_for_fmt : Notation.DoubleColon
    core.fmt.Formatter "struct_parameter_for_fmt" := {
    Notation.double_colon := struct_parameter_for_fmt; }.
  
  Definition fmt
      `{State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M core.fmt.Result :=
    let* α0 := deref f core.fmt.Formatter in
    let* α1 := borrow_mut α0 core.fmt.Formatter in
    let* α2 := deref (mk_str "Point") str in
    let* α3 := borrow α2 str in
    let* α4 := deref (mk_str "x") str in
    let* α5 := borrow α4 str in
    let* α6 := deref self box_stack_heap.Point in
    let* α7 := α6.["x"] in
    let* α8 := borrow α7 f64 in
    let* α9 := deref α8 f64 in
    let* α10 := borrow α9 f64 in
    let* α11 := pointer_coercion "Unsize" α10 in
    let* α12 := deref (mk_str "y") str in
    let* α13 := borrow α12 str in
    let* α14 := deref self box_stack_heap.Point in
    let* α15 := α14.["y"] in
    let* α16 := borrow α15 f64 in
    let* α17 := borrow α16 (ref f64) in
    let* α18 := deref α17 (ref f64) in
    let* α19 := borrow α18 (ref f64) in
    let* α20 := pointer_coercion "Unsize" α19 in
    core.fmt.Formatter::["debug_struct_field2_finish"] α1 α3 α5 α11 α13 α20.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_box_stack_heap_Point.

Module Impl_core_clone_Clone_for_box_stack_heap_Point.
  Definition Self `{State.Trait} := box_stack_heap.Point.
  
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition clone `{State.Trait} (self : ref Self) : M box_stack_heap.Point :=
    let _ := tt in
    deref self box_stack_heap.Point.
  
  Global Instance Method_clone `{State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I `{State.Trait} : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone := clone;
  }.
  Global Hint Resolve I : core.
End Impl_core_clone_Clone_for_box_stack_heap_Point.

Module Impl_core_marker_Copy_for_box_stack_heap_Point.
  Definition Self `{State.Trait} := box_stack_heap.Point.
  
  Global Instance I `{State.Trait} : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End Impl_core_marker_Copy_for_box_stack_heap_Point.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module Rectangle.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    top_left : box_stack_heap.Point;
    bottom_right : box_stack_heap.Point;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_top_left `{State.Trait} : Notation.Dot "top_left" := {
    Notation.dot x := let* x := M.read x in Pure x.(top_left) : M _;
  }.
  Global Instance Get_AF_top_left `{State.Trait}
    : Notation.DoubleColon t "top_left" := {
    Notation.double_colon x := let* x := M.read x in Pure x.(top_left) : M _;
  }.
  Global Instance Get_bottom_right `{State.Trait}
    : Notation.Dot "bottom_right" := {
    Notation.dot x := let* x := M.read x in Pure x.(bottom_right) : M _;
  }.
  Global Instance Get_AF_bottom_right `{State.Trait}
    : Notation.DoubleColon t "bottom_right" := {
    Notation.double_colon x
      :=
      let* x := M.read x in Pure x.(bottom_right) : M _;
  }.
End Rectangle.
Definition Rectangle `{State.Trait} : Set := M.val (Rectangle.t).

Definition origin `{State.Trait} : M box_stack_heap.Point :=
  let* α0 := M.alloc 0 (* 0.0 *) in
  let* α1 := M.alloc 0 (* 0.0 *) in
  M.alloc {| box_stack_heap.Point.x := α0; box_stack_heap.Point.y := α1; |}.

Definition boxed_origin
    `{State.Trait}
    : M (alloc.boxed.Box box_stack_heap.Point alloc.boxed.Box.Default.A) :=
  let* α0 := M.alloc 0 (* 0.0 *) in
  let* α1 := M.alloc 0 (* 0.0 *) in
  let* α2 :=
    M.alloc {| box_stack_heap.Point.x := α0; box_stack_heap.Point.y := α1; |} in
  (alloc.boxed.Box _ alloc.alloc.Global)::["new"] α2.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* point := box_stack_heap.origin in
  let* rectangle :=
    let* α0 := box_stack_heap.origin in
    let* α1 := M.alloc 3 (* 3.0 *) in
    let* α2 := M.alloc (- 4 (* 4.0 *)) in
    let* α3 :=
      M.alloc
        {| box_stack_heap.Point.x := α1; box_stack_heap.Point.y := α2; |} in
    M.alloc
      {|
        box_stack_heap.Rectangle.top_left := α0;
        box_stack_heap.Rectangle.bottom_right := α3;
      |} in
  let* boxed_rectangle :=
    let* α0 := box_stack_heap.origin in
    let* α1 := M.alloc 3 (* 3.0 *) in
    let* α2 := M.alloc (- 4 (* 4.0 *)) in
    let* α3 :=
      M.alloc
        {| box_stack_heap.Point.x := α1; box_stack_heap.Point.y := α2; |} in
    let* α4 :=
      M.alloc
        {|
          box_stack_heap.Rectangle.top_left := α0;
          box_stack_heap.Rectangle.bottom_right := α3;
        |} in
    (alloc.boxed.Box _ alloc.alloc.Global)::["new"] α4 in
  let* boxed_point :=
    let* α0 := box_stack_heap.origin in
    (alloc.boxed.Box _ alloc.alloc.Global)::["new"] α0 in
  let* box_in_a_box :=
    let* α0 := box_stack_heap.boxed_origin in
    (alloc.boxed.Box _ alloc.alloc.Global)::["new"] α0 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Point occupies "; mk_str " bytes on the stack
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow point box_stack_heap.Point in
      let* α5 := deref α4 box_stack_heap.Point in
      let* α6 := borrow α5 box_stack_heap.Point in
      let* α7 := core.mem.size_of_val α6 in
      let* α8 := borrow α7 usize in
      let* α9 := deref α8 usize in
      let* α10 := borrow α9 usize in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Rectangle occupies "; mk_str " bytes on the stack
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow rectangle box_stack_heap.Rectangle in
      let* α5 := deref α4 box_stack_heap.Rectangle in
      let* α6 := borrow α5 box_stack_heap.Rectangle in
      let* α7 := core.mem.size_of_val α6 in
      let* α8 := borrow α7 usize in
      let* α9 := deref α8 usize in
      let* α10 := borrow α9 usize in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Boxed point occupies "; mk_str " bytes on the stack
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow
          boxed_point
          (alloc.boxed.Box box_stack_heap.Point alloc.alloc.Global) in
      let* α5 :=
        deref α4 (alloc.boxed.Box box_stack_heap.Point alloc.alloc.Global) in
      let* α6 :=
        borrow α5 (alloc.boxed.Box box_stack_heap.Point alloc.alloc.Global) in
      let* α7 := core.mem.size_of_val α6 in
      let* α8 := borrow α7 usize in
      let* α9 := deref α8 usize in
      let* α10 := borrow α9 usize in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Boxed rectangle occupies "; mk_str " bytes on the stack
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow
          boxed_rectangle
          (alloc.boxed.Box box_stack_heap.Rectangle alloc.alloc.Global) in
      let* α5 :=
        deref
          α4
          (alloc.boxed.Box box_stack_heap.Rectangle alloc.alloc.Global) in
      let* α6 :=
        borrow
          α5
          (alloc.boxed.Box box_stack_heap.Rectangle alloc.alloc.Global) in
      let* α7 := core.mem.size_of_val α6 in
      let* α8 := borrow α7 usize in
      let* α9 := deref α8 usize in
      let* α10 := borrow α9 usize in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Boxed box occupies "; mk_str " bytes on the stack
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow
          box_in_a_box
          (alloc.boxed.Box
            (alloc.boxed.Box box_stack_heap.Point alloc.alloc.Global)
            alloc.alloc.Global) in
      let* α5 :=
        deref
          α4
          (alloc.boxed.Box
            (alloc.boxed.Box box_stack_heap.Point alloc.alloc.Global)
            alloc.alloc.Global) in
      let* α6 :=
        borrow
          α5
          (alloc.boxed.Box
            (alloc.boxed.Box box_stack_heap.Point alloc.alloc.Global)
            alloc.alloc.Global) in
      let* α7 := core.mem.size_of_val α6 in
      let* α8 := borrow α7 usize in
      let* α9 := deref α8 usize in
      let* α10 := borrow α9 usize in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    Pure tt in
  let* unboxed_point := deref boxed_point box_stack_heap.Point in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Unboxed point occupies "; mk_str " bytes on the stack
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow unboxed_point box_stack_heap.Point in
      let* α5 := deref α4 box_stack_heap.Point in
      let* α6 := borrow α5 box_stack_heap.Point in
      let* α7 := core.mem.size_of_val α6 in
      let* α8 := borrow α7 usize in
      let* α9 := deref α8 usize in
      let* α10 := borrow α9 usize in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    Pure tt in
  Pure tt.
