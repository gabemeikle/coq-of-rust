(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn drink(beverage: &str) {
    // You shouldn't drink too much sugary beverages.
    if beverage == "lemonade" {
        panic!("AAAaaaaa!!!!");
    }

    println!("Some refreshing {} is all I need.", beverage);
}
*)
Definition drink (beverage : ref str.t) : M unit :=
  let* beverage : M.Val (ref str.t) := M.alloc beverage in
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : ref (ref str.t) := borrow beverage in
      let* α1 : ref (ref str.t) := borrow (mk_str "lemonade") in
      let* α2 : bool.t :=
        (core.cmp.PartialEq.eq (Self := ref str.t) (Trait := ltac:(refine _)))
          α0
          α1 in
      let* α3 : M.Val bool.t := M.alloc α2 in
      let* α4 : M.Val bool.t := use α3 in
      let* α5 : bool.t := M.read α4 in
      if (α5 : bool) then
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "AAAaaaaa!!!!") in
          let* α1 : never.t := std.panicking.begin_panic α0 in
          let* α2 : M.Val never.t := M.alloc α1 in
          never_to_any α2 in
        let* α0 : M.Val unit := M.alloc tt in
        never_to_any α0
      else
        M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Some refreshing "; mk_str " is all I need.
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (ref str.t) := borrow beverage in
        let* α8 : M.Val (ref str.t) := deref α7 in
        let* α9 : ref (ref str.t) := borrow α8 in
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
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).

(*
fn main() {
    drink("water");
    drink("lemonade");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "water") in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : unit := panic.drink α2 in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "lemonade") in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : unit := panic.drink α2 in
      M.alloc α3 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
