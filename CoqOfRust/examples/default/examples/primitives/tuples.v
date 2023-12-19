(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn reverse(pair: (i32, bool)) -> (bool, i32) {
    // `let` can be used to bind the members of a tuple to variables
    let (int_param, bool_param) = pair;

    (bool_param, int_param)
}
*)
Definition reverse (pair : i32.t * bool.t) : M (bool.t * i32.t) :=
  let* pair : M.Val (i32.t * bool.t) := M.alloc pair in
  let* '(int_param, bool_param) : M.Val (i32.t * bool.t) := M.copy pair in
  let* α0 : bool.t := M.read bool_param in
  let* α1 : i32.t := M.read int_param in
  let* α0 : M.Val (bool.t * i32.t) := M.alloc (α0, α1) in
  M.read α0.

Module  Matrix.
Section Matrix.
  Record t : Set := {
    x0 : f32.t;
    x1 : f32.t;
    x2 : f32.t;
    x3 : f32.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
  Global Instance Get_1 : Notations.Dot "1" := {
    Notations.dot := Ref.map (fun x => x.(x1)) (fun v x => x <| x1 := v |>);
  }.
  Global Instance Get_2 : Notations.Dot "2" := {
    Notations.dot := Ref.map (fun x => x.(x2)) (fun v x => x <| x2 := v |>);
  }.
  Global Instance Get_3 : Notations.Dot "3" := {
    Notations.dot := Ref.map (fun x => x.(x3)) (fun v x => x <| x3 := v |>);
  }.
End Matrix.
End Matrix.

Module  Impl_core_fmt_Debug_for_tuples_Matrix_t.
Section Impl_core_fmt_Debug_for_tuples_Matrix_t.
  Ltac Self := exact tuples.Matrix.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "Matrix") in
    let* α2 : ref tuples.Matrix.t := M.read self in
    let* α3 : M.Val (ref f32.t) := M.alloc (borrow (deref α2).["0"]) in
    let* α4 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α3) in
    let* α5 : ref tuples.Matrix.t := M.read self in
    let* α6 : M.Val (ref f32.t) := M.alloc (borrow (deref α5).["1"]) in
    let* α7 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α6) in
    let* α8 : ref tuples.Matrix.t := M.read self in
    let* α9 : M.Val (ref f32.t) := M.alloc (borrow (deref α8).["2"]) in
    let* α10 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α9) in
    let* α11 : ref tuples.Matrix.t := M.read self in
    let* α12 : M.Val (ref f32.t) := M.alloc (borrow (deref α11).["3"]) in
    let* α13 : M.Val (ref (ref f32.t)) := M.alloc (borrow α12) in
    let* α14 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α13) in
    M.call
      (core.fmt.Formatter.t::["debug_tuple_field4_finish"] α0 α1 α4 α7 α10 α14).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_tuples_Matrix_t.
End Impl_core_fmt_Debug_for_tuples_Matrix_t.

(*
fn main() {
    // A tuple with a bunch of different types
    let long_tuple = (1u8, 2u16, 3u32, 4u64,
                      -1i8, -2i16, -3i32, -4i64,
                      0.1f32, 0.2f64,
                      'a', true);

    // Values can be extracted from the tuple using tuple indexing
    println!("long tuple first value: {}", long_tuple.0);
    println!("long tuple second value: {}", long_tuple.1);

    // Tuples can be tuple members
    let tuple_of_tuples = ((1u8, 2u16, 2u32), (4u64, -1i8), -2i16);

    // Tuples are printable
    println!("tuple of tuples: {:?}", tuple_of_tuples);
    
    // But long Tuples (more than 12 elements) cannot be printed
    // let too_long_tuple = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
    // println!("too long tuple: {:?}", too_long_tuple);
    // TODO ^ Uncomment the above 2 lines to see the compiler error

    let pair = (1, true);
    println!("pair is {:?}", pair);

    println!("the reversed pair is {:?}", reverse(pair));

    // To create one element tuples, the comma is required to tell them apart
    // from a literal surrounded by parentheses
    println!("one element tuple: {:?}", (5u32,));
    println!("just an integer: {:?}", (5u32));

    //tuples can be destructured to create bindings
    let tuple = (1, "hello", 4.5, true);

    let (a, b, c, d) = tuple;
    println!("{:?}, {:?}, {:?}, {:?}", a, b, c, d);

    let matrix = Matrix(1.1, 1.2, 2.1, 2.2);
    println!("{:?}", matrix);

}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* long_tuple :
      M.Val
        (((((((((((u8.t * u16.t) * u32.t) * u64.t) * i8.t) * i16.t) * i32.t)
        *
        i64.t)
        *
        f32.t)
        *
        f64.t)
        *
        char.t)
        *
        bool.t) :=
    let* α0 : f32.t := M.read UnsupportedLiteral in
    let* α1 : f64.t := M.read UnsupportedLiteral in
    M.alloc
      (Integer.of_Z 1,
        Integer.of_Z 2,
        Integer.of_Z 3,
        Integer.of_Z 4,
        Integer.of_Z (-1),
        Integer.of_Z (-2),
        Integer.of_Z (-3),
        Integer.of_Z (-4),
        α0,
        α1,
        "a"%char,
        true) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "long tuple first value: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"] (borrow "Unknown Field")) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "long tuple second value: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"] (borrow "Unknown Field")) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* tuple_of_tuples :
      M.Val ((((u8.t * u16.t) * u32.t) * (u64.t * i8.t)) * i16.t) :=
    M.alloc
      ((Integer.of_Z 1, Integer.of_Z 2, Integer.of_Z 2),
        (Integer.of_Z 4, Integer.of_Z (-1)),
        Integer.of_Z (-2)) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "tuple of tuples: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_debug"] (borrow tuple_of_tuples)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* pair : M.Val (i32.t * bool.t) := M.alloc (Integer.of_Z 1, true) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "pair is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow pair)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "the reversed pair is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : i32.t * bool.t := M.read pair in
      let* α6 : bool.t * i32.t := M.call (tuples.reverse α5) in
      let* α7 : M.Val (bool.t * i32.t) := M.alloc α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow α7)) in
      let* α9 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8 ] in
      let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α9) in
      let* α11 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α10) in
      let* α12 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
      let* α13 : unit := M.call (std.io.stdio._print α12) in
      M.alloc α13 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "one element tuple: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : M.Val u32.t := M.alloc (Integer.of_Z 5) in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow α5)) in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α7) in
      let* α9 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α8) in
      let* α10 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α9) in
      let* α11 : unit := M.call (std.io.stdio._print α10) in
      M.alloc α11 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "just an integer: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : M.Val u32.t := M.alloc (Integer.of_Z 5) in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow α5)) in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α7) in
      let* α9 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α8) in
      let* α10 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α9) in
      let* α11 : unit := M.call (std.io.stdio._print α10) in
      M.alloc α11 in
    M.alloc tt in
  let* tuple : M.Val (((i32.t * (ref str.t)) * f64.t) * bool.t) :=
    let* α0 : ref str.t := M.read (mk_str "hello") in
    let* α1 : f64.t := M.read UnsupportedLiteral in
    M.alloc (Integer.of_Z 1, α0, α1, true) in
  let* '(a, b, c, d) : M.Val (((i32.t * (ref str.t)) * f64.t) * bool.t) :=
    M.copy tuple in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "") in
      let* α1 : ref str.t := M.read (mk_str ", ") in
      let* α2 : ref str.t := M.read (mk_str ", ") in
      let* α3 : ref str.t := M.read (mk_str ", ") in
      let* α4 : ref str.t := M.read (mk_str "
") in
      let* α5 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2; α3; α4 ] in
      let* α6 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α5) in
      let* α7 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α6) in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow a)) in
      let* α9 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow b)) in
      let* α10 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow c)) in
      let* α11 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow d)) in
      let* α12 : M.Val (array core.fmt.rt.Argument.t) :=
        M.alloc [ α8; α9; α10; α11 ] in
      let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α12) in
      let* α14 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α13) in
      let* α15 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α7 α14) in
      let* α16 : unit := M.call (std.io.stdio._print α15) in
      M.alloc α16 in
    M.alloc tt in
  let* matrix : M.Val tuples.Matrix.t :=
    let* α0 : f32.t := M.read UnsupportedLiteral in
    let* α1 : f32.t := M.read UnsupportedLiteral in
    let* α2 : f32.t := M.read UnsupportedLiteral in
    let* α3 : f32.t := M.read UnsupportedLiteral in
    M.alloc (tuples.Matrix.Build_t α0 α1 α2 α3) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow matrix)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
