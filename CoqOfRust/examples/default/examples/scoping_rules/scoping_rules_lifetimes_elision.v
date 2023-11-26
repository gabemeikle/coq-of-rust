(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn elided_input(x: &i32) {
    println!("`elided_input`: {}", x);
}
*)
Definition elided_input (x : ref i32.t) : M unit :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  M.function_body
    (let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "`elided_input`: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (ref i32.t) := borrow x in
        let* α8 : M.Val (ref i32.t) := deref α7 in
        let* α9 : ref (ref i32.t) := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
        let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    M.alloc tt).

(*
fn annotated_input<'a>(x: &'a i32) {
    println!("`annotated_input`: {}", x);
}
*)
Definition annotated_input (x : ref i32.t) : M unit :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  M.function_body
    (let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "`annotated_input`: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (ref i32.t) := borrow x in
        let* α8 : M.Val (ref i32.t) := deref α7 in
        let* α9 : ref (ref i32.t) := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
        let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    M.alloc tt).

(*
fn elided_pass(x: &i32) -> &i32 {
    x
}
*)
Definition elided_pass (x : ref i32.t) : M (ref i32.t) :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  M.function_body (M.pure x).

(*
fn annotated_pass<'a>(x: &'a i32) -> &'a i32 {
    x
}
*)
Definition annotated_pass (x : ref i32.t) : M (ref i32.t) :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  M.function_body (M.pure x).

(*
fn main() {
    let x = 3;

    elided_input(&x);
    annotated_input(&x);

    println!("`elided_pass`: {}", elided_pass(&x));
    println!("`annotated_pass`: {}", annotated_pass(&x));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* x : M.Val i32.t :=
      let* α0 : M.Val i32.t := M.alloc 3 in
      M.copy α0 in
    let* _ : M.Val unit :=
      let* α0 : ref i32.t := borrow x in
      let* α1 : M.Val i32.t := deref α0 in
      let* α2 : ref i32.t := borrow α1 in
      let* α3 : unit := scoping_rules_lifetimes_elision.elided_input α2 in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* α0 : ref i32.t := borrow x in
      let* α1 : M.Val i32.t := deref α0 in
      let* α2 : ref i32.t := borrow α1 in
      let* α3 : unit := scoping_rules_lifetimes_elision.annotated_input α2 in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "`elided_pass`: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref i32.t := borrow x in
        let* α8 : M.Val i32.t := deref α7 in
        let* α9 : ref i32.t := borrow α8 in
        let* α10 : ref i32.t :=
          scoping_rules_lifetimes_elision.elided_pass α9 in
        let* α11 : M.Val (ref i32.t) := M.alloc α10 in
        let* α12 : ref (ref i32.t) := borrow α11 in
        let* α13 : M.Val (ref i32.t) := deref α12 in
        let* α14 : ref (ref i32.t) := borrow α13 in
        let* α15 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α14 in
        let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α16 ] in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (array core.fmt.rt.Argument.t) := deref α18 in
        let* α20 : ref (array core.fmt.rt.Argument.t) := borrow α19 in
        let* α21 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α20 in
        let* α22 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α21 in
        let* α23 : ref (slice core.fmt.rt.Argument.t) := M.read α22 in
        let* α24 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α23 in
        let* α25 : unit := std.io.stdio._print α24 in
        M.alloc α25 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "`annotated_pass`: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref i32.t := borrow x in
        let* α8 : M.Val i32.t := deref α7 in
        let* α9 : ref i32.t := borrow α8 in
        let* α10 : ref i32.t :=
          scoping_rules_lifetimes_elision.annotated_pass α9 in
        let* α11 : M.Val (ref i32.t) := M.alloc α10 in
        let* α12 : ref (ref i32.t) := borrow α11 in
        let* α13 : M.Val (ref i32.t) := deref α12 in
        let* α14 : ref (ref i32.t) := borrow α13 in
        let* α15 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α14 in
        let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α16 ] in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (array core.fmt.rt.Argument.t) := deref α18 in
        let* α20 : ref (array core.fmt.rt.Argument.t) := borrow α19 in
        let* α21 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α20 in
        let* α22 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α21 in
        let* α23 : ref (slice core.fmt.rt.Argument.t) := M.read α22 in
        let* α24 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α23 in
        let* α25 : unit := std.io.stdio._print α24 in
        M.alloc α25 in
      M.alloc tt in
    M.alloc tt).
