(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let vec = vec![1, 9, 3, 3, 13, 2];

    // `iter()` for vecs yields `&i32` and `position()` does not take a reference, so
    // we have to destructure `&i32` to `i32`
    let index_of_first_even_number = vec.iter().position(|&x| x % 2 == 0);
    assert_eq!(index_of_first_even_number, Some(5));

    // `into_iter()` for vecs yields `i32` and `position()` does not take a reference, so
    // we do not have to destructure
    let index_of_first_negative_number = vec.into_iter().position(|x| x < 0);
    assert_eq!(index_of_first_negative_number, None);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* vec : M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
      let* α0 : M.Val i32.t := M.alloc 1 in
      let* α1 : M.Val i32.t := M.alloc 9 in
      let* α2 : M.Val i32.t := M.alloc 3 in
      let* α3 : M.Val i32.t := M.alloc 3 in
      let* α4 : M.Val i32.t := M.alloc 13 in
      let* α5 : M.Val i32.t := M.alloc 2 in
      let* α6 : M.Val (array i32.t) := M.alloc [ α0; α1; α2; α3; α4; α5 ] in
      let* α7 : M.Val (alloc.boxed.Box.t (array i32.t) alloc.alloc.Global.t) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α6 in
      let* α8 : M.Val (alloc.boxed.Box.t (slice i32.t) alloc.alloc.Global.t) :=
        pointer_coercion "Unsize" α7 in
      let* α9 : alloc.boxed.Box.t (slice i32.t) alloc.alloc.Global.t :=
        M.read α8 in
      let* α10 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t :=
        (slice i32.t)::["into_vec"] α9 in
      M.alloc α10 in
    let* index_of_first_even_number : M.Val (core.option.Option.t usize.t) :=
      let* α0 : ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
        borrow vec in
      let* α1 : ref (slice i32.t) :=
        (core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : M.Val (slice i32.t) := deref α1 in
      let* α3 : ref (slice i32.t) := borrow α2 in
      let* α4 : core.slice.iter.Iter.t i32.t := (slice i32.t)::["iter"] α3 in
      let* α5 : M.Val (core.slice.iter.Iter.t i32.t) := M.alloc α4 in
      let* α6 : mut_ref (core.slice.iter.Iter.t i32.t) := borrow_mut α5 in
      let* α7 : type not implemented :=
        M.read
          (let* α0 : M.Val i32.t := M.alloc 2 in
          let* α1 : M.Val i32.t := BinOp.rem x α0 in
          let* α2 : M.Val i32.t := M.alloc 0 in
          BinOp.eq α1 α2) in
      let* α8 : core.option.Option.t usize.t :=
        (core.iter.traits.iterator.Iterator.position
            (Self := core.slice.iter.Iter.t i32.t)
            (Trait := ltac:(refine _)))
          α6
          α7 in
      M.alloc α8 in
    let* _ : M.Val unit :=
      let* α0 : ref (core.option.Option.t usize.t) :=
        borrow index_of_first_even_number in
      let* α1 : M.Val usize.t := M.alloc 5 in
      let* α2 : usize.t := M.read α1 in
      let* α3 : M.Val (core.option.Option.t usize.t) :=
        M.alloc (core.option.Option.Some α2) in
      let* α4 : ref (core.option.Option.t usize.t) := borrow α3 in
      let* α5 :
          M.Val
            ((ref (core.option.Option.t usize.t))
            *
            (ref (core.option.Option.t usize.t))) :=
        M.alloc (α0, α4) in
      let* α6 := M.read α5 in
      match α6 with
      | (left_val, right_val) =>
        let* right_val := M.alloc right_val in
        let* left_val := M.alloc left_val in
        let* α0 : ref (core.option.Option.t usize.t) := M.read left_val in
        let* α1 : M.Val (core.option.Option.t usize.t) := deref α0 in
        let* α2 : ref (core.option.Option.t usize.t) := borrow α1 in
        let* α3 : ref (core.option.Option.t usize.t) := M.read right_val in
        let* α4 : M.Val (core.option.Option.t usize.t) := deref α3 in
        let* α5 : ref (core.option.Option.t usize.t) := borrow α4 in
        let* α6 : bool.t :=
          (core.cmp.PartialEq.eq
              (Self := core.option.Option.t usize.t)
              (Trait := ltac:(refine _)))
            α2
            α5 in
        let* α7 : M.Val bool.t := M.alloc α6 in
        let* α8 : M.Val bool.t := UnOp.not α7 in
        let* α9 : M.Val bool.t := use α8 in
        let* α10 : bool.t := M.read α9 in
        if (α10 : bool) then
          let* kind : M.Val core.panicking.AssertKind.t :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : M.Val never.t :=
            let* α0 : core.panicking.AssertKind.t := M.read kind in
            let* α1 : ref (core.option.Option.t usize.t) := M.read left_val in
            let* α2 : M.Val (core.option.Option.t usize.t) := deref α1 in
            let* α3 : ref (core.option.Option.t usize.t) := borrow α2 in
            let* α4 : ref (core.option.Option.t usize.t) := M.read right_val in
            let* α5 : M.Val (core.option.Option.t usize.t) := deref α4 in
            let* α6 : ref (core.option.Option.t usize.t) := borrow α5 in
            let* α7 : never.t :=
              core.panicking.assert_failed α0 α3 α6 core.option.Option.None in
            M.alloc α7 in
          let* α0 : M.Val unit := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    let* index_of_first_negative_number :
        M.Val (core.option.Option.t usize.t) :=
      let* α0 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t := M.read vec in
      let* α1 : alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 :
          M.Val (alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t) :=
        M.alloc α1 in
      let* α3 :
          mut_ref (alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t) :=
        borrow_mut α2 in
      let* α4 : type not implemented :=
        M.read
          (let* α0 : M.Val i32.t := M.alloc 0 in
          BinOp.lt x α0) in
      let* α5 : core.option.Option.t usize.t :=
        (core.iter.traits.iterator.Iterator.position
            (Self := alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α3
          α4 in
      M.alloc α5 in
    let* _ : M.Val unit :=
      let* α0 : ref (core.option.Option.t usize.t) :=
        borrow index_of_first_negative_number in
      let* α1 : M.Val (core.option.Option.t usize.t) :=
        M.alloc core.option.Option.None in
      let* α2 : ref (core.option.Option.t usize.t) := borrow α1 in
      let* α3 :
          M.Val
            ((ref (core.option.Option.t usize.t))
            *
            (ref (core.option.Option.t usize.t))) :=
        M.alloc (α0, α2) in
      let* α4 := M.read α3 in
      match α4 with
      | (left_val, right_val) =>
        let* right_val := M.alloc right_val in
        let* left_val := M.alloc left_val in
        let* α0 : ref (core.option.Option.t usize.t) := M.read left_val in
        let* α1 : M.Val (core.option.Option.t usize.t) := deref α0 in
        let* α2 : ref (core.option.Option.t usize.t) := borrow α1 in
        let* α3 : ref (core.option.Option.t usize.t) := M.read right_val in
        let* α4 : M.Val (core.option.Option.t usize.t) := deref α3 in
        let* α5 : ref (core.option.Option.t usize.t) := borrow α4 in
        let* α6 : bool.t :=
          (core.cmp.PartialEq.eq
              (Self := core.option.Option.t usize.t)
              (Trait := ltac:(refine _)))
            α2
            α5 in
        let* α7 : M.Val bool.t := M.alloc α6 in
        let* α8 : M.Val bool.t := UnOp.not α7 in
        let* α9 : M.Val bool.t := use α8 in
        let* α10 : bool.t := M.read α9 in
        if (α10 : bool) then
          let* kind : M.Val core.panicking.AssertKind.t :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : M.Val never.t :=
            let* α0 : core.panicking.AssertKind.t := M.read kind in
            let* α1 : ref (core.option.Option.t usize.t) := M.read left_val in
            let* α2 : M.Val (core.option.Option.t usize.t) := deref α1 in
            let* α3 : ref (core.option.Option.t usize.t) := borrow α2 in
            let* α4 : ref (core.option.Option.t usize.t) := M.read right_val in
            let* α5 : M.Val (core.option.Option.t usize.t) := deref α4 in
            let* α6 : ref (core.option.Option.t usize.t) := borrow α5 in
            let* α7 : never.t :=
              core.panicking.assert_failed α0 α3 α6 core.option.Option.None in
            M.alloc α7 in
          let* α0 : M.Val unit := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
