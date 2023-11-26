(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn multiply<'a>(first: &'a i32, second: &'a i32) -> i32 {
    first * second
}
*)
Definition multiply (first : ref i32.t) (second : ref i32.t) : M i32.t :=
  let* first : M.Val (ref i32.t) := M.alloc first in
  let* second : M.Val (ref i32.t) := M.alloc second in
  M.function_body
    (let* α0 : ref i32.t := M.read first in
    let* α1 : ref i32.t := M.read second in
    let* α2 : i32.t :=
      (core.ops.arith.Mul.mul (Self := ref i32.t) (Trait := ltac:(refine _)))
        α0
        α1 in
    M.alloc α2).

(*
fn choose_first<'a: 'b, 'b>(first: &'a i32, _: &'b i32) -> &'b i32 {
    first
}
*)
Definition choose_first (first : ref i32.t) (arg : ref i32.t) : M (ref i32.t) :=
  let* first : M.Val (ref i32.t) := M.alloc first in
  let* arg : M.Val (ref i32.t) := M.alloc arg in
  M.function_body
    (let* α0 : ref i32.t := M.read first in
    let* α1 : M.Val i32.t := deref α0 in
    let* α2 : ref i32.t := borrow α1 in
    M.alloc α2).

(*
fn main() {
    let first = 2; // Longer lifetime

    {
        let second = 3; // Shorter lifetime

        println!("The product is {}", multiply(&first, &second));
        println!("{} is the first", choose_first(&first, &second));
    };
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* first : M.Val i32.t :=
      let* α0 : M.Val i32.t := M.alloc 2 in
      M.copy α0 in
    let* _ : M.Val unit :=
      let* second : M.Val i32.t :=
        let* α0 : M.Val i32.t := M.alloc 3 in
        M.copy α0 in
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "The product is "; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (array (ref str.t)) := deref α1 in
          let* α3 : ref (array (ref str.t)) := borrow α2 in
          let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
          let* α5 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α4 in
          let* α6 : ref (slice (ref str.t)) := M.read α5 in
          let* α7 : ref i32.t := borrow first in
          let* α8 : M.Val i32.t := deref α7 in
          let* α9 : ref i32.t := borrow α8 in
          let* α10 : ref i32.t := borrow second in
          let* α11 : M.Val i32.t := deref α10 in
          let* α12 : ref i32.t := borrow α11 in
          let* α13 : i32.t :=
            scoping_rules_lifetimes_coercion.multiply α9 α12 in
          let* α14 : M.Val i32.t := M.alloc α13 in
          let* α15 : ref i32.t := borrow α14 in
          let* α16 : M.Val i32.t := deref α15 in
          let* α17 : ref i32.t := borrow α16 in
          let* α18 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α17 in
          let* α19 : M.Val core.fmt.rt.Argument.t := M.alloc α18 in
          let* α20 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α19 ] in
          let* α21 : ref (array core.fmt.rt.Argument.t) := borrow α20 in
          let* α22 : M.Val (array core.fmt.rt.Argument.t) := deref α21 in
          let* α23 : ref (array core.fmt.rt.Argument.t) := borrow α22 in
          let* α24 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α23 in
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
            M.alloc [ mk_str ""; mk_str " is the first
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (array (ref str.t)) := deref α1 in
          let* α3 : ref (array (ref str.t)) := borrow α2 in
          let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
          let* α5 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α4 in
          let* α6 : ref (slice (ref str.t)) := M.read α5 in
          let* α7 : ref i32.t := borrow first in
          let* α8 : M.Val i32.t := deref α7 in
          let* α9 : ref i32.t := borrow α8 in
          let* α10 : ref i32.t := borrow second in
          let* α11 : M.Val i32.t := deref α10 in
          let* α12 : ref i32.t := borrow α11 in
          let* α13 : ref i32.t :=
            scoping_rules_lifetimes_coercion.choose_first α9 α12 in
          let* α14 : M.Val (ref i32.t) := M.alloc α13 in
          let* α15 : ref (ref i32.t) := borrow α14 in
          let* α16 : M.Val (ref i32.t) := deref α15 in
          let* α17 : ref (ref i32.t) := borrow α16 in
          let* α18 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α17 in
          let* α19 : M.Val core.fmt.rt.Argument.t := M.alloc α18 in
          let* α20 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α19 ] in
          let* α21 : ref (array core.fmt.rt.Argument.t) := borrow α20 in
          let* α22 : M.Val (array core.fmt.rt.Argument.t) := deref α21 in
          let* α23 : ref (array core.fmt.rt.Argument.t) := borrow α22 in
          let* α24 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α23 in
          let* α25 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α24 in
          let* α26 : ref (slice core.fmt.rt.Argument.t) := M.read α25 in
          let* α27 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α6 α26 in
          let* α28 : unit := std.io.stdio._print α27 in
          M.alloc α28 in
        M.alloc tt in
      M.alloc tt in
    M.alloc tt).
