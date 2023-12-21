(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn is_odd(n: u32) -> bool {
    n % 2 == 1
}
*)
Definition is_odd (n : u32.t) : M bool.t :=
  let* n := M.alloc n in
  let* α0 : u32.t := M.read n in
  let* α1 : u32.t := BinOp.Panic.rem α0 (Integer.of_Z 2) in
  M.pure (BinOp.Pure.eq α1 (Integer.of_Z 1)).

(*
fn main() {
    println!("Find the sum of all the squared odd numbers under 1000");
    let upper = 1000;

    // Imperative approach
    // Declare accumulator variable
    let mut acc = 0;
    // Iterate: 0, 1, 2, ... to infinity
    for n in 0.. {
        // Square the number
        let n_squared = n * n;

        if n_squared >= upper {
            // Break loop if exceeded the upper limit
            break;
        } else if is_odd(n_squared) {
            // Accumulate value, if it's odd
            acc += n_squared;
        }
    }
    println!("imperative style: {}", acc);

    // Functional approach
    let sum_of_squared_odd_numbers: u32 = (0..)
        .map(|n| n * n) // All natural numbers squared
        .take_while(|&n_squared| n_squared < upper) // Below upper limit
        .filter(|&n_squared| is_odd(n_squared)) // That are odd
        .sum(); // Sum them
    println!("functional style: {}", sum_of_squared_odd_numbers);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t :=
        M.read
          (mk_str "Find the sum of all the squared odd numbers under 1000
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
  let* upper : M.Val u32.t := M.alloc (Integer.of_Z 1000) in
  let* acc : M.Val u32.t := M.alloc (Integer.of_Z 0) in
  let* _ : M.Val unit :=
    let* α0 : core.ops.range.RangeFrom.t u32.t :=
      M.call
        ((core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.ops.range.RangeFrom.t u32.t)
            (Trait := ltac:(refine _)))
          {| core.ops.range.RangeFrom.start := Integer.of_Z 0; |}) in
    let* α1 : M.Val unit :=
      match α0 with
      | iter =>
        let* iter := M.alloc iter in
        loop
          (let* _ : M.Val unit :=
            let* α0 : core.option.Option.t u32.t :=
              M.call
                ((core.iter.traits.iterator.Iterator.next
                    (Self := core.ops.range.RangeFrom.t u32.t)
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
              let* n_squared : M.Val u32.t :=
                let* α0 : u32.t := M.read n in
                let* α1 : u32.t := M.read n in
                let* α2 : u32.t := BinOp.Panic.mul α0 α1 in
                M.alloc α2 in
              let* α0 : u32.t := M.read n_squared in
              let* α1 : u32.t := M.read upper in
              let* α2 : M.Val bool.t := M.alloc (BinOp.Pure.ge α0 α1) in
              let* α3 : bool.t := M.read (use α2) in
              if α3 then
                let* _ : M.Val never.t := Break in
                let* α0 : M.Val unit := M.alloc tt in
                let* α1 := M.read α0 in
                let* α2 : unit := never_to_any α1 in
                M.alloc α2
              else
                let* α0 : u32.t := M.read n_squared in
                let* α1 : bool.t := M.call (higher_order_functions.is_odd α0) in
                let* α2 : M.Val bool.t := M.alloc α1 in
                let* α3 : bool.t := M.read (use α2) in
                if α3 then
                  let* _ : M.Val unit :=
                    let β : M.Val u32.t := acc in
                    let* α0 := M.read β in
                    let* α1 : u32.t := M.read n_squared in
                    let* α2 := BinOp.Panic.add α0 α1 in
                    assign β α2 in
                  M.alloc tt
                else
                  M.alloc tt
            end in
          M.alloc tt)
      end in
    M.pure (use α1) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "imperative style: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow acc)) in
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
  let* sum_of_squared_odd_numbers : M.Val u32.t :=
    let* α0 :
        core.iter.adapters.map.Map.t
          (core.ops.range.RangeFrom.t u32.t)
          (u32.t -> M u32.t) :=
      M.call
        ((core.iter.traits.iterator.Iterator.map
            (Self := core.ops.range.RangeFrom.t u32.t)
            (Trait := ltac:(refine _)))
          {| core.ops.range.RangeFrom.start := Integer.of_Z 0; |}
          (fun (n : u32.t) =>
            (let* n := M.alloc n in
            let* α0 : u32.t := M.read n in
            let* α1 : u32.t := M.read n in
            BinOp.Panic.mul α0 α1) :
            M u32.t)) in
    let* α1 :
        core.iter.adapters.take_while.TakeWhile.t
          (core.iter.adapters.map.Map.t
            (core.ops.range.RangeFrom.t u32.t)
            (u32.t -> M u32.t))
          ((ref u32.t) -> M bool.t) :=
      M.call
        ((core.iter.traits.iterator.Iterator.take_while
            (Self :=
              core.iter.adapters.map.Map.t
                (core.ops.range.RangeFrom.t u32.t)
                (u32.t -> M u32.t))
            (Trait := ltac:(refine _)))
          α0
          (fun (n_squared : ref u32.t) =>
            (let* n_squared := M.alloc n_squared in
            let* α0 : u32.t := M.read n_squared in
            let* α1 : u32.t := M.read upper in
            M.pure (BinOp.Pure.lt α0 α1)) :
            M bool.t)) in
    let* α2 :
        core.iter.adapters.filter.Filter.t
          (core.iter.adapters.take_while.TakeWhile.t
            (core.iter.adapters.map.Map.t
              (core.ops.range.RangeFrom.t u32.t)
              (u32.t -> M u32.t))
            ((ref u32.t) -> M bool.t))
          ((ref u32.t) -> M bool.t) :=
      M.call
        ((core.iter.traits.iterator.Iterator.filter
            (Self :=
              core.iter.adapters.take_while.TakeWhile.t
                (core.iter.adapters.map.Map.t
                  (core.ops.range.RangeFrom.t u32.t)
                  (u32.t -> M u32.t))
                ((ref u32.t) -> M bool.t))
            (Trait := ltac:(refine _)))
          α1
          (fun (n_squared : ref u32.t) =>
            (let* n_squared := M.alloc n_squared in
            let* α0 : u32.t := M.read n_squared in
            M.call (higher_order_functions.is_odd α0)) :
            M bool.t)) in
    let* α3 : u32.t :=
      M.call
        ((core.iter.traits.iterator.Iterator.sum
            (Self :=
              core.iter.adapters.filter.Filter.t
                (core.iter.adapters.take_while.TakeWhile.t
                  (core.iter.adapters.map.Map.t
                    (core.ops.range.RangeFrom.t u32.t)
                    (u32.t -> M u32.t))
                  ((ref u32.t) -> M bool.t))
                ((ref u32.t) -> M bool.t))
            (Trait := ltac:(refine _)))
          α2) in
    M.alloc α3 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "functional style: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow sum_of_squared_odd_numbers)) in
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
