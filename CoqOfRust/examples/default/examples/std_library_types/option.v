(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn checked_division(dividend: i32, divisor: i32) -> Option<i32> {
    if divisor == 0 {
        // Failure is represented as the `None` variant
        None
    } else {
        // Result is wrapped in a `Some` variant
        Some(dividend / divisor)
    }
}
*)
Definition checked_division
    (dividend : i32.t)
    (divisor : i32.t)
    : M (core.option.Option.t i32.t) :=
  let* dividend : M.Val i32.t := M.alloc dividend in
  let* divisor : M.Val i32.t := M.alloc divisor in
  M.function_body
    (let* α0 : M.Val i32.t := M.alloc 0 in
    let* α1 : M.Val bool.t := BinOp.eq divisor α0 in
    let* α2 : M.Val bool.t := use α1 in
    let* α3 : bool.t := M.read α2 in
    let* α4 : M.Val (core.option.Option.t i32.t) :=
      if (α3 : bool) then
        M.alloc core.option.Option.None
      else
        let* α0 : M.Val i32.t := BinOp.div dividend divisor in
        let* α1 : i32.t := M.read α0 in
        M.alloc (core.option.Option.Some α1) in
    M.read α4).

(*
fn try_division(dividend: i32, divisor: i32) {
    // `Option` values can be pattern matched, just like other enums
    match checked_division(dividend, divisor) {
        None => println!("{} / {} failed!", dividend, divisor),
        Some(quotient) => {
            println!("{} / {} = {}", dividend, divisor, quotient)
        }
    }
}
*)
Definition try_division (dividend : i32.t) (divisor : i32.t) : M unit :=
  let* dividend : M.Val i32.t := M.alloc dividend in
  let* divisor : M.Val i32.t := M.alloc divisor in
  M.function_body
    (let* α0 : i32.t := M.read dividend in
    let* α1 : i32.t := M.read divisor in
    let* α2 : core.option.Option.t i32.t := option.checked_division α0 α1 in
    let* α3 : M.Val (core.option.Option.t i32.t) := M.alloc α2 in
    let* α4 := M.read α3 in
    let* α5 : M.Val unit :=
      match α4 with
      | core.option.Option.None  =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str ""; mk_str " / "; mk_str " failed!
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (array (ref str.t)) := deref α1 in
          let* α3 : ref (array (ref str.t)) := borrow α2 in
          let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
          let* α5 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α4 in
          let* α6 : ref (slice (ref str.t)) := M.read α5 in
          let* α7 : ref i32.t := borrow dividend in
          let* α8 : M.Val i32.t := deref α7 in
          let* α9 : ref i32.t := borrow α8 in
          let* α10 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α9 in
          let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
          let* α12 : ref i32.t := borrow divisor in
          let* α13 : M.Val i32.t := deref α12 in
          let* α14 : ref i32.t := borrow α13 in
          let* α15 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α14 in
          let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
          let* α17 : M.Val (array core.fmt.rt.Argument.t) :=
            M.alloc [ α11; α16 ] in
          let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
          let* α19 : M.Val (array core.fmt.rt.Argument.t) := deref α18 in
          let* α20 : ref (array core.fmt.rt.Argument.t) := borrow α19 in
          let* α21 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α20 in
          let* α22 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α21 in
          let* α23 : ref (slice core.fmt.rt.Argument.t) := M.read α22 in
          let* α24 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α6 α23 in
          let* α25 : unit := std.io.stdio._print α24 in
          M.alloc α25 in
        M.alloc tt
      | core.option.Option.Some quotient =>
        let* quotient := M.alloc quotient in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str ""; mk_str " / "; mk_str " = "; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (array (ref str.t)) := deref α1 in
          let* α3 : ref (array (ref str.t)) := borrow α2 in
          let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
          let* α5 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α4 in
          let* α6 : ref (slice (ref str.t)) := M.read α5 in
          let* α7 : ref i32.t := borrow dividend in
          let* α8 : M.Val i32.t := deref α7 in
          let* α9 : ref i32.t := borrow α8 in
          let* α10 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α9 in
          let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
          let* α12 : ref i32.t := borrow divisor in
          let* α13 : M.Val i32.t := deref α12 in
          let* α14 : ref i32.t := borrow α13 in
          let* α15 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α14 in
          let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
          let* α17 : ref i32.t := borrow quotient in
          let* α18 : M.Val i32.t := deref α17 in
          let* α19 : ref i32.t := borrow α18 in
          let* α20 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α19 in
          let* α21 : M.Val core.fmt.rt.Argument.t := M.alloc α20 in
          let* α22 : M.Val (array core.fmt.rt.Argument.t) :=
            M.alloc [ α11; α16; α21 ] in
          let* α23 : ref (array core.fmt.rt.Argument.t) := borrow α22 in
          let* α24 : M.Val (array core.fmt.rt.Argument.t) := deref α23 in
          let* α25 : ref (array core.fmt.rt.Argument.t) := borrow α24 in
          let* α26 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α25 in
          let* α27 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α26 in
          let* α28 : ref (slice core.fmt.rt.Argument.t) := M.read α27 in
          let* α29 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α6 α28 in
          let* α30 : unit := std.io.stdio._print α29 in
          M.alloc α30 in
        M.alloc tt
      end in
    M.read α5).

(*
fn main() {
    try_division(4, 2);
    try_division(1, 0);

    // Binding `None` to a variable needs to be type annotated
    let none: Option<i32> = None;
    let _equivalent_none = None::<i32>;

    let optional_float = Some(0f32);

    // Unwrapping a `Some` variant will extract the value wrapped.
    println!(
        "{:?} unwraps to {:?}",
        optional_float,
        optional_float.unwrap()
    );

    // Unwrapping a `None` variant will `panic!`
    println!("{:?} unwraps to {:?}", none, none.unwrap());
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : M.Val i32.t := M.alloc 4 in
      let* α1 : i32.t := M.read α0 in
      let* α2 : M.Val i32.t := M.alloc 2 in
      let* α3 : i32.t := M.read α2 in
      let* α4 : unit := option.try_division α1 α3 in
      M.alloc α4 in
    let* _ : M.Val unit :=
      let* α0 : M.Val i32.t := M.alloc 1 in
      let* α1 : i32.t := M.read α0 in
      let* α2 : M.Val i32.t := M.alloc 0 in
      let* α3 : i32.t := M.read α2 in
      let* α4 : unit := option.try_division α1 α3 in
      M.alloc α4 in
    let* none : M.Val (core.option.Option.t i32.t) :=
      M.alloc core.option.Option.None in
    let* _equivalent_none : M.Val (core.option.Option.t i32.t) :=
      M.alloc core.option.Option.None in
    let* optional_float : M.Val (core.option.Option.t f32.t) :=
      let* α0 : M.Val f32.t := M.alloc 0 (* 0 *) in
      let* α1 : f32.t := M.read α0 in
      M.alloc (core.option.Option.Some α1) in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str ""; mk_str " unwraps to "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (core.option.Option.t f32.t) := borrow optional_float in
        let* α8 : M.Val (core.option.Option.t f32.t) := deref α7 in
        let* α9 : ref (core.option.Option.t f32.t) := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : core.option.Option.t f32.t := M.read optional_float in
        let* α13 : f32.t := (core.option.Option.t f32.t)::["unwrap"] α12 in
        let* α14 : M.Val f32.t := M.alloc α13 in
        let* α15 : ref f32.t := borrow α14 in
        let* α16 : M.Val f32.t := deref α15 in
        let* α17 : ref f32.t := borrow α16 in
        let* α18 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α17 in
        let* α19 : M.Val core.fmt.rt.Argument.t := M.alloc α18 in
        let* α20 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α11; α19 ] in
        let* α21 : ref (array core.fmt.rt.Argument.t) := borrow α20 in
        let* α22 : M.Val (array core.fmt.rt.Argument.t) := deref α21 in
        let* α23 : ref (array core.fmt.rt.Argument.t) := borrow α22 in
        let* α24 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α23 in
        let* α25 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α24 in
        let* α26 : ref (slice core.fmt.rt.Argument.t) := M.read α25 in
        let* α27 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α26 in
        let* α28 : unit := std.io.stdio._print α27 in
        M.alloc α28 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str ""; mk_str " unwraps to "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (core.option.Option.t i32.t) := borrow none in
        let* α8 : M.Val (core.option.Option.t i32.t) := deref α7 in
        let* α9 : ref (core.option.Option.t i32.t) := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : core.option.Option.t i32.t := M.read none in
        let* α13 : i32.t := (core.option.Option.t i32.t)::["unwrap"] α12 in
        let* α14 : M.Val i32.t := M.alloc α13 in
        let* α15 : ref i32.t := borrow α14 in
        let* α16 : M.Val i32.t := deref α15 in
        let* α17 : ref i32.t := borrow α16 in
        let* α18 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α17 in
        let* α19 : M.Val core.fmt.rt.Argument.t := M.alloc α18 in
        let* α20 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α11; α19 ] in
        let* α21 : ref (array core.fmt.rt.Argument.t) := borrow α20 in
        let* α22 : M.Val (array core.fmt.rt.Argument.t) := deref α21 in
        let* α23 : ref (array core.fmt.rt.Argument.t) := borrow α22 in
        let* α24 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α23 in
        let* α25 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α24 in
        let* α26 : ref (slice core.fmt.rt.Argument.t) := M.read α25 in
        let* α27 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α26 in
        let* α28 : unit := std.io.stdio._print α27 in
        M.alloc α28 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
