(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition checked_division
    `{ℋ : State.Trait}
    (dividend : i32)
    (divisor : i32)
    : M (core.option.Option i32) :=
  let* α0 := M.alloc 0 in
  let* α1 := BinOp.eq divisor α0 in
  let* α2 := use α1 in
  if (α2 : bool) then
    M.alloc core.option.Option.None
  else
    let* α0 := BinOp.div dividend divisor in
    M.alloc (core.option.Option.Some α0).

Definition try_division
    `{ℋ : State.Trait}
    (dividend : i32)
    (divisor : i32)
    : M unit :=
  let* α0 := option.checked_division dividend divisor in
  match α0 with
  | core.option.Option  =>
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str ""; mk_str " / "; mk_str " failed!
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow dividend i32 in
      let* α5 := deref α4 i32 in
      let* α6 := borrow α5 i32 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow divisor i32 in
      let* α9 := deref α8 i32 in
      let* α10 := borrow α9 i32 in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α7; α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    M.alloc tt
  | core.option.Option quotient =>
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str ""; mk_str " / "; mk_str " = "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow dividend i32 in
      let* α5 := deref α4 i32 in
      let* α6 := borrow α5 i32 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow divisor i32 in
      let* α9 := deref α8 i32 in
      let* α10 := borrow α9 i32 in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow quotient i32 in
      let* α13 := deref α12 i32 in
      let* α14 := borrow α13 i32 in
      let* α15 := core.fmt.rt.Argument::["new_display"] α14 in
      let* α16 := borrow [ α7; α11; α15 ] (list core.fmt.rt.Argument) in
      let* α17 := deref α16 (list core.fmt.rt.Argument) in
      let* α18 := borrow α17 (list core.fmt.rt.Argument) in
      let* α19 := pointer_coercion "Unsize" α18 in
      let* α20 := core.fmt.Arguments::["new_v1"] α3 α19 in
      std.io.stdio._print α20 in
    M.alloc tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* _ :=
    let* α0 := M.alloc 4 in
    let* α1 := M.alloc 2 in
    option.try_division α0 α1 in
  let* _ :=
    let* α0 := M.alloc 1 in
    let* α1 := M.alloc 0 in
    option.try_division α0 α1 in
  let* none := M.alloc core.option.Option.None in
  let* _equivalent_none := M.alloc core.option.Option.None in
  let* optional_float :=
    let* α0 := M.alloc 0 (* 0 *) in
    M.alloc (core.option.Option.Some α0) in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str ""; mk_str " unwraps to "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow optional_float (core.option.Option f32) in
      let* α5 := deref α4 (core.option.Option f32) in
      let* α6 := borrow α5 (core.option.Option f32) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := (core.option.Option f32)::["unwrap"] optional_float in
      let* α9 := borrow α8 f32 in
      let* α10 := deref α9 f32 in
      let* α11 := borrow α10 f32 in
      let* α12 := core.fmt.rt.Argument::["new_debug"] α11 in
      let* α13 := borrow [ α7; α12 ] (list core.fmt.rt.Argument) in
      let* α14 := deref α13 (list core.fmt.rt.Argument) in
      let* α15 := borrow α14 (list core.fmt.rt.Argument) in
      let* α16 := pointer_coercion "Unsize" α15 in
      let* α17 := core.fmt.Arguments::["new_v1"] α3 α16 in
      std.io.stdio._print α17 in
    M.alloc tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str ""; mk_str " unwraps to "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow none (core.option.Option i32) in
      let* α5 := deref α4 (core.option.Option i32) in
      let* α6 := borrow α5 (core.option.Option i32) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := (core.option.Option i32)::["unwrap"] none in
      let* α9 := borrow α8 i32 in
      let* α10 := deref α9 i32 in
      let* α11 := borrow α10 i32 in
      let* α12 := core.fmt.rt.Argument::["new_debug"] α11 in
      let* α13 := borrow [ α7; α12 ] (list core.fmt.rt.Argument) in
      let* α14 := deref α13 (list core.fmt.rt.Argument) in
      let* α15 := borrow α14 (list core.fmt.rt.Argument) in
      let* α16 := pointer_coercion "Unsize" α15 in
      let* α17 := core.fmt.Arguments::["new_v1"] α3 α16 in
      std.io.stdio._print α17 in
    M.alloc tt in
  M.alloc tt.
