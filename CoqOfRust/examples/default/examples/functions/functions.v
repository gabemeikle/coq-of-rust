(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // We can use this function here, and define it somewhere later
    fizzbuzz_to(100);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _ : M.Val unit :=
    let* α0 : unit := M.call (functions.fizzbuzz_to (Integer.of_Z 100)) in
    M.alloc α0 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn is_divisible_by(lhs: u32, rhs: u32) -> bool {
    // Corner case, early return
    if rhs == 0 {
        return false;
    }

    // This is an expression, the `return` keyword is not necessary here
    lhs % rhs == 0
}
*)
Definition is_divisible_by (lhs : u32.t) (rhs : u32.t) : M bool.t :=
  let* lhs := M.alloc lhs in
  let* rhs := M.alloc rhs in
  let return_ := M.return_ (R := bool.t) in
  M.catch_return
    (let* _ : M.Val unit :=
      let* α0 : u32.t := M.read rhs in
      let* α1 : M.Val bool.t := M.alloc (BinOp.Pure.eq α0 (Integer.of_Z 0)) in
      let* α2 : bool.t := M.read (use α1) in
      if α2 then
        let* _ : M.Val never.t := return_ false in
        let* α0 : M.Val unit := M.alloc tt in
        let* α1 := M.read α0 in
        let* α2 : unit := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt in
    let* α0 : u32.t := M.read lhs in
    let* α1 : u32.t := M.read rhs in
    let* α2 : u32.t := BinOp.Panic.rem α0 α1 in
    let* α0 : M.Val bool.t := M.alloc (BinOp.Pure.eq α2 (Integer.of_Z 0)) in
    M.read α0).

(*
fn fizzbuzz(n: u32) -> () {
    if is_divisible_by(n, 15) {
        println!("fizzbuzz");
    } else if is_divisible_by(n, 3) {
        println!("fizz");
    } else if is_divisible_by(n, 5) {
        println!("buzz");
    } else {
        println!("{}", n);
    }
}
*)
Definition fizzbuzz (n : u32.t) : M unit :=
  let* n := M.alloc n in
  let* α0 : u32.t := M.read n in
  let* α1 : bool.t := M.call (functions.is_divisible_by α0 (Integer.of_Z 15)) in
  let* α2 : M.Val bool.t := M.alloc α1 in
  let* α3 : bool.t := M.read (use α2) in
  let* α4 : M.Val unit :=
    if α3 then
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "fizzbuzz
") in
          let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
          let* α3 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α2) in
          let* α4 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_const"] α3) in
          let* α5 : unit := M.call (std.io.stdio._print α4) in
          M.alloc α5 in
        M.alloc tt in
      M.alloc tt
    else
      let* α0 : u32.t := M.read n in
      let* α1 : bool.t :=
        M.call (functions.is_divisible_by α0 (Integer.of_Z 3)) in
      let* α2 : M.Val bool.t := M.alloc α1 in
      let* α3 : bool.t := M.read (use α2) in
      if α3 then
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : ref str.t := M.read (mk_str "fizz
") in
            let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
            let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
            let* α3 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α2) in
            let* α4 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_const"] α3) in
            let* α5 : unit := M.call (std.io.stdio._print α4) in
            M.alloc α5 in
          M.alloc tt in
        M.alloc tt
      else
        let* α0 : u32.t := M.read n in
        let* α1 : bool.t :=
          M.call (functions.is_divisible_by α0 (Integer.of_Z 5)) in
        let* α2 : M.Val bool.t := M.alloc α1 in
        let* α3 : bool.t := M.read (use α2) in
        if α3 then
          let* _ : M.Val unit :=
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "buzz
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt in
          M.alloc tt
        else
          let* _ : M.Val unit :=
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "") in
              let* α1 : ref str.t := M.read (mk_str "
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α2) in
              let* α4 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α3) in
              let* α5 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow n)) in
              let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α5 ] in
              let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α6) in
              let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α7) in
              let* α9 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
              let* α10 : unit := M.call (std.io.stdio._print α9) in
              M.alloc α10 in
            M.alloc tt in
          M.alloc tt in
  M.read α4.

(*
fn fizzbuzz_to(n: u32) {
    for n in 1..=n {
        fizzbuzz(n);
    }
}
*)
Definition fizzbuzz_to (n : u32.t) : M unit :=
  let* n := M.alloc n in
  let* α0 : u32.t := M.read n in
  let* α1 : core.ops.range.RangeInclusive.t u32.t :=
    M.call
      ((core.ops.range.RangeInclusive.t u32.t)::["new"] (Integer.of_Z 1) α0) in
  let* α2 : core.ops.range.RangeInclusive.t u32.t :=
    M.call
      ((core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.ops.range.RangeInclusive.t u32.t)
          (Trait := ltac:(refine _)))
        α1) in
  let* α3 : M.Val unit :=
    match α2 with
    | iter =>
      let* iter := M.alloc iter in
      loop
        (let* _ : M.Val unit :=
          let* α0 : core.option.Option.t u32.t :=
            M.call
              ((core.iter.traits.iterator.Iterator.next
                  (Self := core.ops.range.RangeInclusive.t u32.t)
                  (Trait := ltac:(refine _)))
                (borrow_mut iter)) in
          match α0 with
          | core.option.Option.None  =>
            let* α0 : M.Val never.t := Break in
            let* α1 := M.read α0 in
            let* α2 : unit := never_to_any α1 in
            M.alloc α2
          | core.option.Option.Some n =>
            let* n := M.alloc n in
            let* _ : M.Val unit :=
              let* α0 : u32.t := M.read n in
              let* α1 : unit := M.call (functions.fizzbuzz α0) in
              M.alloc α1 in
            M.alloc tt
          end in
        M.alloc tt)
    end in
  M.read (use α3).
