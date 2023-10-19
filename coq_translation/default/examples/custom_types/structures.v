(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Person.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    name : alloc.string.String;
    age : u8;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_name `{State.Trait} : Notation.Dot "name" := {
    Notation.dot x := let* x := M.read x in Pure x.(name) : M _;
  }.
  Global Instance Get_AF_name `{State.Trait}
    : Notation.DoubleColon t "name" := {
    Notation.double_colon x := let* x := M.read x in Pure x.(name) : M _;
  }.
  Global Instance Get_age `{State.Trait} : Notation.Dot "age" := {
    Notation.dot x := let* x := M.read x in Pure x.(age) : M _;
  }.
  Global Instance Get_AF_age `{State.Trait} : Notation.DoubleColon t "age" := {
    Notation.double_colon x := let* x := M.read x in Pure x.(age) : M _;
  }.
End Person.
Definition Person `{State.Trait} : Set := M.val (Person.t).

Module Impl_core_fmt_Debug_for_structures_Person.
  Definition Self `{State.Trait} := structures.Person.
  
  Parameter struct_parameter_for_fmt :
      core.fmt.Formatter ->
        string ->
          string ->
          alloc_string_String ->
          string ->
          u8 ->
          M core.fmt.Result.
  
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
    let* α2 := deref (mk_str "Person") str in
    let* α3 := borrow α2 str in
    let* α4 := deref (mk_str "name") str in
    let* α5 := borrow α4 str in
    let* α6 := deref self structures.Person in
    let* α7 := α6.["name"] in
    let* α8 := borrow α7 alloc.string.String in
    let* α9 := deref α8 alloc.string.String in
    let* α10 := borrow α9 alloc.string.String in
    let* α11 := pointer_coercion "Unsize" α10 in
    let* α12 := deref (mk_str "age") str in
    let* α13 := borrow α12 str in
    let* α14 := deref self structures.Person in
    let* α15 := α14.["age"] in
    let* α16 := borrow α15 u8 in
    let* α17 := borrow α16 (ref u8) in
    let* α18 := deref α17 (ref u8) in
    let* α19 := borrow α18 (ref u8) in
    let* α20 := pointer_coercion "Unsize" α19 in
    core.fmt.Formatter::["debug_struct_field2_finish"] α1 α3 α5 α11 α13 α20.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_structures_Person.

Module Unit.
  Inductive t : Set := Build.
End Unit.
Definition Unit := @Unit.t.

Module Pair.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    x0 : i32;
    x1 : f32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 `{State.Trait} : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
  }.
  Global Instance Get_1 `{State.Trait} : Notation.Dot "1" := {
    Notation.dot x := let* x := M.read x in Pure x.(x1) : M _;
  }.
End Pair.
Definition Pair `{State.Trait} : Set := M.val Pair.t.

Module Point.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    x : f32;
    y : f32;
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

Module Rectangle.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    top_left : structures.Point;
    bottom_right : structures.Point;
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

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* name := core.convert.From.from (mk_str "Peter") in
  let* age := M.alloc 27 in
  let* peter :=
    M.alloc
      {| structures.Person.name := name; structures.Person.age := age; |} in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str ""; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow peter structures.Person in
      let* α5 := deref α4 structures.Person in
      let* α6 := borrow α5 structures.Person in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let* point :=
    let* α0 := M.alloc 10 (* 10.3 *) in
    let* α1 := M.alloc 0 (* 0.4 *) in
    M.alloc {| structures.Point.x := α0; structures.Point.y := α1; |} in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "point coordinates: ("; mk_str ", "; mk_str ")
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := point.["x"] in
      let* α5 := borrow α4 f32 in
      let* α6 := deref α5 f32 in
      let* α7 := borrow α6 f32 in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 := point.["y"] in
      let* α10 := borrow α9 f32 in
      let* α11 := deref α10 f32 in
      let* α12 := borrow α11 f32 in
      let* α13 := core.fmt.rt.Argument::["new_display"] α12 in
      let* α14 := borrow [ α8; α13 ] (list core.fmt.rt.Argument) in
      let* α15 := deref α14 (list core.fmt.rt.Argument) in
      let* α16 := borrow α15 (list core.fmt.rt.Argument) in
      let* α17 := pointer_coercion "Unsize" α16 in
      let* α18 := core.fmt.Arguments::["new_v1"] α3 α17 in
      std.io.stdio._print α18 in
    Pure tt in
  let* bottom_right :=
    let* α0 := M.alloc 5 (* 5.2 *) in
    M.alloc {| structures.Point.x := α0; |} in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "second point: ("; mk_str ", "; mk_str ")
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := bottom_right.["x"] in
      let* α5 := borrow α4 f32 in
      let* α6 := deref α5 f32 in
      let* α7 := borrow α6 f32 in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 := bottom_right.["y"] in
      let* α10 := borrow α9 f32 in
      let* α11 := deref α10 f32 in
      let* α12 := borrow α11 f32 in
      let* α13 := core.fmt.rt.Argument::["new_display"] α12 in
      let* α14 := borrow [ α8; α13 ] (list core.fmt.rt.Argument) in
      let* α15 := deref α14 (list core.fmt.rt.Argument) in
      let* α16 := borrow α15 (list core.fmt.rt.Argument) in
      let* α17 := pointer_coercion "Unsize" α16 in
      let* α18 := core.fmt.Arguments::["new_v1"] α3 α17 in
      std.io.stdio._print α18 in
    Pure tt in
  let '{| structures.Point.x := left_edge; structures.Point.y := top_edge; |} :=
    point in
  let* _rectangle :=
    let* α0 :=
      M.alloc
        {| structures.Point.x := left_edge; structures.Point.y := top_edge;
        |} in
    M.alloc
      {|
        structures.Rectangle.top_left := α0;
        structures.Rectangle.bottom_right := bottom_right;
      |} in
  let _unit := structures.Unit.Build_t tt in
  let* pair :=
    let* α0 := M.alloc 1 in
    let* α1 := M.alloc 0 (* 0.1 *) in
    Pure (structures.Pair.Build_t α0 α1) in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "pair contains "; mk_str " and "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := pair.["0"] in
      let* α5 := borrow α4 i32 in
      let* α6 := deref α5 i32 in
      let* α7 := borrow α6 i32 in
      let* α8 := core.fmt.rt.Argument::["new_debug"] α7 in
      let* α9 := pair.["1"] in
      let* α10 := borrow α9 f32 in
      let* α11 := deref α10 f32 in
      let* α12 := borrow α11 f32 in
      let* α13 := core.fmt.rt.Argument::["new_debug"] α12 in
      let* α14 := borrow [ α8; α13 ] (list core.fmt.rt.Argument) in
      let* α15 := deref α14 (list core.fmt.rt.Argument) in
      let* α16 := borrow α15 (list core.fmt.rt.Argument) in
      let* α17 := pointer_coercion "Unsize" α16 in
      let* α18 := core.fmt.Arguments::["new_v1"] α3 α17 in
      std.io.stdio._print α18 in
    Pure tt in
  let 'structures.Pair.Build_t integer decimal := pair in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "pair contains "; mk_str " and "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow integer i32 in
      let* α5 := deref α4 i32 in
      let* α6 := borrow α5 i32 in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow decimal f32 in
      let* α9 := deref α8 f32 in
      let* α10 := borrow α9 f32 in
      let* α11 := core.fmt.rt.Argument::["new_debug"] α10 in
      let* α12 := borrow [ α7; α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    Pure tt in
  Pure tt.
