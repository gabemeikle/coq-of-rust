(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn double_first(vec: Vec<&str>) -> i32 {
    let first = vec.first().unwrap(); // Generate error 1
    2 * first.parse::<i32>().unwrap() // Generate error 2
}
*)
Definition double_first
    (vec : alloc.vec.Vec.t (ref str.t) alloc.vec.Vec.Default.A)
    : M i32.t :=
  let* vec : M.Val (alloc.vec.Vec.t (ref str.t) alloc.vec.Vec.Default.A) :=
    M.alloc vec in
  M.function_body
    (let* first : M.Val (ref (ref str.t)) :=
      let* α0 : ref (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
        borrow vec in
      let* α1 : ref (slice (ref str.t)) :=
        (core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : M.Val (slice (ref str.t)) := deref α1 in
      let* α3 : ref (slice (ref str.t)) := borrow α2 in
      let* α4 : core.option.Option.t (ref (ref str.t)) :=
        (slice (ref str.t))::["first"] α3 in
      let* α5 : ref (ref str.t) :=
        (core.option.Option.t (ref (ref str.t)))::["unwrap"] α4 in
      M.alloc α5 in
    let* α0 : M.Val i32.t := M.alloc 2 in
    let* α1 : ref (ref str.t) := M.read first in
    let* α2 : M.Val (ref str.t) := deref α1 in
    let* α3 : ref str.t := M.read α2 in
    let* α4 : M.Val str.t := deref α3 in
    let* α5 : ref str.t := borrow α4 in
    let* α6 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
      str.t::["parse"] α5 in
    let* α7 : i32.t :=
      (core.result.Result.t i32.t core.num.error.ParseIntError.t)::["unwrap"]
        α6 in
    let* α8 : M.Val i32.t := M.alloc α7 in
    let* α0 : M.Val i32.t := BinOp.mul α0 α8 in
    M.read α0).

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    println!("The first doubled is {}", double_first(numbers));

    println!("The first doubled is {}", double_first(empty));
    // Error 1: the input vector is empty

    println!("The first doubled is {}", double_first(strings));
    // Error 2: the element doesn't parse to a number
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* numbers : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
      let* α0 : ref str.t := M.read (mk_str "93") in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : M.Val (ref str.t) := M.alloc α2 in
      let* α4 : ref str.t := M.read (mk_str "18") in
      let* α5 : M.Val str.t := deref α4 in
      let* α6 : ref str.t := borrow α5 in
      let* α7 : M.Val (ref str.t) := M.alloc α6 in
      let* α8 : M.Val (array (ref str.t)) := M.alloc [ mk_str "42"; α3; α7 ] in
      let* α9 :
          M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α8 in
      let* α10 :
          M.Val (alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t) :=
        pointer_coercion "Unsize" α9 in
      let* α11 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
        M.read α10 in
      let* α12 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        (slice (ref str.t))::["into_vec"] α11 in
      M.alloc α12 in
    let* empty : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
      let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)::["new"] in
      M.alloc α0 in
    let* strings : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
      let* α0 : ref str.t := M.read (mk_str "93") in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : M.Val (ref str.t) := M.alloc α2 in
      let* α4 : ref str.t := M.read (mk_str "18") in
      let* α5 : M.Val str.t := deref α4 in
      let* α6 : ref str.t := borrow α5 in
      let* α7 : M.Val (ref str.t) := M.alloc α6 in
      let* α8 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "tofu"; α3; α7 ] in
      let* α9 :
          M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α8 in
      let* α10 :
          M.Val (alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t) :=
        pointer_coercion "Unsize" α9 in
      let* α11 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
        M.read α10 in
      let* α12 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        (slice (ref str.t))::["into_vec"] α11 in
      M.alloc α12 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "The first doubled is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
          M.read numbers in
        let* α6 : i32.t := multiple_error_types.double_first α5 in
        let* α7 : M.Val i32.t := M.alloc α6 in
        let* α8 : ref i32.t := borrow α7 in
        let* α9 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α8 in
        let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
        let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
        let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
        let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α12 in
        let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
        let* α16 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α15 in
        let* α17 : unit := std.io.stdio._print α16 in
        M.alloc α17 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "The first doubled is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
          M.read empty in
        let* α6 : i32.t := multiple_error_types.double_first α5 in
        let* α7 : M.Val i32.t := M.alloc α6 in
        let* α8 : ref i32.t := borrow α7 in
        let* α9 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α8 in
        let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
        let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
        let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
        let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α12 in
        let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
        let* α16 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α15 in
        let* α17 : unit := std.io.stdio._print α16 in
        M.alloc α17 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "The first doubled is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
          M.read strings in
        let* α6 : i32.t := multiple_error_types.double_first α5 in
        let* α7 : M.Val i32.t := M.alloc α6 in
        let* α8 : ref i32.t := borrow α7 in
        let* α9 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α8 in
        let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
        let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
        let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
        let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α12 in
        let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
        let* α16 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α15 in
        let* α17 : unit := std.io.stdio._print α16 in
        M.alloc α17 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
