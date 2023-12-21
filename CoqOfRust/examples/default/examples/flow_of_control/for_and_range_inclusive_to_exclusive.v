(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // `n` will take the values: 1, 2, ..., 100 in each iteration
    for n in 1..101 {
        if n % 15 == 0 {
            println!("fizzbuzz");
        } else if n % 3 == 0 {
            println!("fizz");
        } else if n % 5 == 0 {
            println!("buzz");
        } else {
            println!("{}", n);
        }
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* α0 : core.ops.range.Range.t i32.t :=
    M.call
      ((core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.ops.range.Range.t i32.t)
          (Trait := ltac:(refine _)))
        {|
          core.ops.range.Range.start := Integer.of_Z 1;
          core.ops.range.Range.end := Integer.of_Z 101;
        |}) in
  let* α1 : M.Val unit :=
    match α0 with
    | iter =>
      let* iter := M.alloc iter in
      loop
        (let* _ : M.Val unit :=
          let* α0 : core.option.Option.t i32.t :=
            M.call
              ((core.iter.traits.iterator.Iterator.next
                  (Self := core.ops.range.Range.t i32.t)
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
            let* α0 : i32.t := M.read n in
            let* α1 : i32.t := BinOp.Panic.rem α0 (Integer.of_Z 15) in
            let* α2 : M.Val bool.t :=
              M.alloc (BinOp.Pure.eq α1 (Integer.of_Z 0)) in
            let* α3 : bool.t := M.read (use α2) in
            if α3 then
              let* _ : M.Val unit :=
                let* _ : M.Val unit :=
                  let* α0 : ref str.t := M.read (mk_str "fizzbuzz
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
              let* α0 : i32.t := M.read n in
              let* α1 : i32.t := BinOp.Panic.rem α0 (Integer.of_Z 3) in
              let* α2 : M.Val bool.t :=
                M.alloc (BinOp.Pure.eq α1 (Integer.of_Z 0)) in
              let* α3 : bool.t := M.read (use α2) in
              if α3 then
                let* _ : M.Val unit :=
                  let* _ : M.Val unit :=
                    let* α0 : ref str.t := M.read (mk_str "fizz
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
                let* α0 : i32.t := M.read n in
                let* α1 : i32.t := BinOp.Panic.rem α0 (Integer.of_Z 5) in
                let* α2 : M.Val bool.t :=
                  M.alloc (BinOp.Pure.eq α1 (Integer.of_Z 0)) in
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
                      let* α2 : M.Val (array (ref str.t)) :=
                        M.alloc [ α0; α1 ] in
                      let* α3 : M.Val (ref (array (ref str.t))) :=
                        M.alloc (borrow α2) in
                      let* α4 : ref (slice (ref str.t)) :=
                        M.read (pointer_coercion "Unsize" α3) in
                      let* α5 : core.fmt.rt.Argument.t :=
                        M.call
                          (core.fmt.rt.Argument.t::["new_display"]
                            (borrow n)) in
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
                  M.alloc tt
          end in
        M.alloc tt)
    end in
  M.read (use α1).
