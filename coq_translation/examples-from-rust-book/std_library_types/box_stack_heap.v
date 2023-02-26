(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module mem := std.mem.

Module Point.
  Record t : Set := {
    x : f64;
    y : f64;
  }.
End Point.
Definition Point : Set := Point.t.

Module Impl__crate_fmt_Debug_for_Point.
  Definition Self := Point.
  
  Global Instance I : _crate.fmt.Debug.Class Self := {|
    _crate.fmt.Debug.fmt
        (self : ref Point)
        (f : mut_ref _crate.fmt.Formatter) :=
      _crate.fmt.ImplFormatter.debug_struct_field2_finish
        f
        "Point"
        "x"
        self.x
        "y"
        self.y;
  |}.
Module ImplPoint.

Module Impl__crate_clone_Clone_for_Point.
  Definition Self := Point.
  
  Global Instance I : _crate.clone.Clone.Class Self := {|
    _crate.clone.Clone.clone (self : ref Point) :=
      let _ := tt in
      deref self;
  |}.
Module ImplPoint.

Module Impl__crate_marker_Copy_for_Point.
  Definition Self := Point.
  
  Global Instance I : _crate.marker.Copy.Class Self :=
      _crate.marker.Copy.Build_Class _.
Module ImplPoint.

Module Rectangle.
  Record t : Set := {
    top_left : Point;
    bottom_right : Point;
  }.
End Rectangle.
Definition Rectangle : Set := Rectangle.t.

Definition origin (_ : unit) : Point :=
  {| Point.x := 0 (* 0.0 *); Point.y := 0 (* 0.0 *); |}.

Definition boxed_origin (_ : unit) : Box :=
  ImplBox.new {| Point.x := 0 (* 0.0 *); Point.y := 0 (* 0.0 *); |}.

Definition main (_ : unit) : unit :=
  let point := origin tt in
  let rectangle :=
    {|
      Rectangle.top_left := origin tt;
      Rectangle.bottom_right :=
        {| Point.x := 3 (* 3.0 *); Point.y := neg 4 (* 4.0 *); |};
    |} in
  let boxed_rectangle :=
    ImplBox.new
      {|
        Rectangle.top_left := origin tt;
        Rectangle.bottom_right :=
          {| Point.x := 3 (* 3.0 *); Point.y := neg 4 (* 4.0 *); |};
      |} in
  let boxed_point := ImplBox.new (origin tt) in
  let box_in_a_box := ImplBox.new (boxed_origin tt) in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Point occupies "; " bytes on the stack\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (mem.size_of_val point) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Rectangle occupies "; " bytes on the stack\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (mem.size_of_val rectangle) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Boxed point occupies "; " bytes on the stack\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (mem.size_of_val boxed_point)
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Boxed rectangle occupies "; " bytes on the stack\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (mem.size_of_val boxed_rectangle)
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Boxed box occupies "; " bytes on the stack\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (mem.size_of_val box_in_a_box)
      ]) ;;
  tt ;;
  let unboxed_point := deref boxed_point in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Unboxed point occupies "; " bytes on the stack\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (mem.size_of_val unboxed_point)
      ]) ;;
  tt ;;
  tt.
