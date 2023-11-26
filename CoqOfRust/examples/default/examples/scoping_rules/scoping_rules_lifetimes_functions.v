(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn print_one<'a>(x: &'a i32) {
    println!("`print_one`: x is {}", x);
}
*)
Definition print_one (x : ref i32.t) : M unit :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  M.function_body
    (let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "`print_one`: x is "; mk_str "
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
fn add_one<'a>(x: &'a mut i32) {
    *x += 1;
}
*)
Definition add_one (x : mut_ref i32.t) : M unit :=
  let* x : M.Val (mut_ref i32.t) := M.alloc x in
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : mut_ref i32.t := M.read x in
      let* α1 : M.Val i32.t := deref α0 in
      let* α2 : M.Val i32.t := M.alloc 1 in
      assign_op add α1 α2 in
    M.alloc tt).

(*
fn print_multi<'a, 'b>(x: &'a i32, y: &'b i32) {
    println!("`print_multi`: x is {}, y is {}", x, y);
}
*)
Definition print_multi (x : ref i32.t) (y : ref i32.t) : M unit :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  let* y : M.Val (ref i32.t) := M.alloc y in
  M.function_body
    (let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc
            [ mk_str "`print_multi`: x is "; mk_str ", y is "; mk_str "
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
        let* α12 : ref (ref i32.t) := borrow y in
        let* α13 : M.Val (ref i32.t) := deref α12 in
        let* α14 : ref (ref i32.t) := borrow α13 in
        let* α15 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α14 in
        let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α11; α16 ] in
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

(*
fn pass_x<'a, 'b>(x: &'a i32, _: &'b i32) -> &'a i32 {
    x
}
*)
Definition pass_x (x : ref i32.t) (arg : ref i32.t) : M (ref i32.t) :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  let* arg : M.Val (ref i32.t) := M.alloc arg in
  M.function_body (M.pure x).

(*
fn main() {
    let x = 7;
    let y = 9;

    print_one(&x);
    print_multi(&x, &y);

    let z = pass_x(&x, &y);
    print_one(z);

    let mut t = 3;
    add_one(&mut t);
    print_one(&t);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* x : M.Val i32.t :=
      let* α0 : M.Val i32.t := M.alloc 7 in
      M.copy α0 in
    let* y : M.Val i32.t :=
      let* α0 : M.Val i32.t := M.alloc 9 in
      M.copy α0 in
    let* _ : M.Val unit :=
      let* α0 : ref i32.t := borrow x in
      let* α1 : M.Val i32.t := deref α0 in
      let* α2 : ref i32.t := borrow α1 in
      let* α3 : unit := scoping_rules_lifetimes_functions.print_one α2 in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* α0 : ref i32.t := borrow x in
      let* α1 : M.Val i32.t := deref α0 in
      let* α2 : ref i32.t := borrow α1 in
      let* α3 : ref i32.t := borrow y in
      let* α4 : M.Val i32.t := deref α3 in
      let* α5 : ref i32.t := borrow α4 in
      let* α6 : unit := scoping_rules_lifetimes_functions.print_multi α2 α5 in
      M.alloc α6 in
    let* z : M.Val (ref i32.t) :=
      let* α0 : ref i32.t := borrow x in
      let* α1 : M.Val i32.t := deref α0 in
      let* α2 : ref i32.t := borrow α1 in
      let* α3 : ref i32.t := borrow y in
      let* α4 : M.Val i32.t := deref α3 in
      let* α5 : ref i32.t := borrow α4 in
      let* α6 : ref i32.t := scoping_rules_lifetimes_functions.pass_x α2 α5 in
      M.alloc α6 in
    let* _ : M.Val unit :=
      let* α0 : ref i32.t := M.read z in
      let* α1 : M.Val i32.t := deref α0 in
      let* α2 : ref i32.t := borrow α1 in
      let* α3 : unit := scoping_rules_lifetimes_functions.print_one α2 in
      M.alloc α3 in
    let* t : M.Val i32.t :=
      let* α0 : M.Val i32.t := M.alloc 3 in
      M.copy α0 in
    let* _ : M.Val unit :=
      let* α0 : mut_ref i32.t := borrow_mut t in
      let* α1 : M.Val i32.t := deref α0 in
      let* α2 : mut_ref i32.t := borrow_mut α1 in
      let* α3 : unit := scoping_rules_lifetimes_functions.add_one α2 in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* α0 : ref i32.t := borrow t in
      let* α1 : M.Val i32.t := deref α0 in
      let* α2 : ref i32.t := borrow α1 in
      let* α3 : unit := scoping_rules_lifetimes_functions.print_one α2 in
      M.alloc α3 in
    M.alloc tt).
