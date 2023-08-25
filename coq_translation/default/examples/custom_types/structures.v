(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Person.
  Unset Primitive Projections.
  Record t : Set := {
    name : alloc.string.String;
    age : u8;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_age : Notation.Dot "age" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Person.
Definition Person : Set := @Person.t.

Module Impl_core_fmt_Debug_for_structures_Person.
  Definition Self := structures.Person.
  
  Parameter debug_struct_field2_finish : core.fmt.Formatter ->
    string ->
    string -> alloc_string_String -> string -> u8 -> M (H := H) core.fmt.Result.
  
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
      "Person"
      "name"
      (addr_of self.["name"])
      "age"
      (addr_of (addr_of self.["age"])).
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_structures_Person.

Module Unit.
  Inductive t : Set := Build.
End Unit.
Definition Unit := @Unit.t.

Module Pair.
  Unset Primitive Projections.
  Record t : Set := {
    _ : i32;
    _ : f32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_1 : Notation.Dot 1 := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Pair.
Definition Pair := @Pair.t.

Module Point.
  Unset Primitive Projections.
  Record t : Set := {
    x : f32;
    y : f32;
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

Module Rectangle.
  Unset Primitive Projections.
  Record t : Set := {
    top_left : structures.Point;
    bottom_right : structures.Point;
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

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* name := alloc.string.String::["from"] "Peter" in
  let age := 27 in
  let peter :=
    {| structures.Person.name := name; structures.Person.age := age; |} in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of peter) in
      let* α1 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let point : structures.Point :=
    {| structures.Point.x := 10 (* 10.3 *); structures.Point.y := 0 (* 0.4 *);
    |} in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of point.["x"]) in
      let* α1 := format_argument::["new_display"] (addr_of point.["y"]) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "point coordinates: ("; ", "; ")
" ])
          (addr_of [ α0; α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let bottom_right := {| structures.Point.x := 5 (* 5.2 *); |} with point in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_display"] (addr_of bottom_right.["x"]) in
      let* α1 :=
        format_argument::["new_display"] (addr_of bottom_right.["y"]) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "second point: ("; ", "; ")
" ])
          (addr_of [ α0; α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let '{| structures.Point.x := left_edge; structures.Point.y := top_edge; |} :=
    point in
  let _rectangle :=
    {|
      structures.Rectangle.top_left :=
        {| structures.Point.x := left_edge; structures.Point.y := top_edge; |};
      structures.Rectangle.bottom_right := bottom_right;
    |} in
  let _unit := structures.Unit.Build in
  let pair := structures.Pair.Build_t 1 0 (* 0.1 *) in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of (pair.[0])) in
      let* α1 := format_argument::["new_debug"] (addr_of (pair.[1])) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "pair contains "; " and "; "
" ])
          (addr_of [ α0; α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let 'structures.Pair.Build_t integer decimal := pair in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of integer) in
      let* α1 := format_argument::["new_debug"] (addr_of decimal) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "pair contains "; " and "; "
" ])
          (addr_of [ α0; α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.
