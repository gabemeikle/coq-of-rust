(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let vec1 = vec![1, 2, 3];
    let vec2 = vec![4, 5, 6];

    // `iter()` for vecs yields `&i32`.
    let mut iter = vec1.iter();
    // `into_iter()` for vecs yields `i32`.
    let mut into_iter = vec2.into_iter();

    // `iter()` for vecs yields `&i32`, and we want to reference one of its
    // items, so we have to destructure `&&i32` to `i32`
    println!("Find 2 in vec1: {:?}", iter.find(|&&x| x == 2));
    // `into_iter()` for vecs yields `i32`, and we want to reference one of
    // its items, so we have to destructure `&i32` to `i32`
    println!("Find 2 in vec2: {:?}", into_iter.find(|&x| x == 2));

    let array1 = [1, 2, 3];
    let array2 = [4, 5, 6];

    // `iter()` for arrays yields `&i32`
    println!("Find 2 in array1: {:?}", array1.iter().find(|&&x| x == 2));
    // `into_iter()` for arrays yields `i32`
    println!(
        "Find 2 in array2: {:?}",
        array2.into_iter().find(|&x| *x == 2)
    );
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* vec1 : M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
      let* α0 : M.Val i32.t := M.alloc 1 in
      let* α1 : M.Val i32.t := M.alloc 2 in
      let* α2 : M.Val i32.t := M.alloc 3 in
      let* α3 : M.Val (array i32.t) := M.alloc [ α0; α1; α2 ] in
      let* α4 : M.Val (alloc.boxed.Box.t (array i32.t) alloc.alloc.Global.t) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3 in
      let* α5 : M.Val (alloc.boxed.Box.t (slice i32.t) alloc.alloc.Global.t) :=
        pointer_coercion "Unsize" α4 in
      let* α6 : alloc.boxed.Box.t (slice i32.t) alloc.alloc.Global.t :=
        M.read α5 in
      let* α7 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t :=
        (slice i32.t)::["into_vec"] α6 in
      M.alloc α7 in
    let* vec2 : M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
      let* α0 : M.Val i32.t := M.alloc 4 in
      let* α1 : M.Val i32.t := M.alloc 5 in
      let* α2 : M.Val i32.t := M.alloc 6 in
      let* α3 : M.Val (array i32.t) := M.alloc [ α0; α1; α2 ] in
      let* α4 : M.Val (alloc.boxed.Box.t (array i32.t) alloc.alloc.Global.t) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3 in
      let* α5 : M.Val (alloc.boxed.Box.t (slice i32.t) alloc.alloc.Global.t) :=
        pointer_coercion "Unsize" α4 in
      let* α6 : alloc.boxed.Box.t (slice i32.t) alloc.alloc.Global.t :=
        M.read α5 in
      let* α7 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t :=
        (slice i32.t)::["into_vec"] α6 in
      M.alloc α7 in
    let* iter : M.Val (core.slice.iter.Iter.t i32.t) :=
      let* α0 : ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
        borrow vec1 in
      let* α1 : ref (slice i32.t) :=
        (core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : M.Val (slice i32.t) := deref α1 in
      let* α3 : ref (slice i32.t) := borrow α2 in
      let* α4 : core.slice.iter.Iter.t i32.t := (slice i32.t)::["iter"] α3 in
      M.alloc α4 in
    let* into_iter :
        M.Val (alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t) :=
      let* α0 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t := M.read vec2 in
      let* α1 : alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      M.alloc α1 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Find 2 in vec1: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : mut_ref (core.slice.iter.Iter.t i32.t) := borrow_mut iter in
        let* α8 : type not implemented :=
          M.read
            (let* α0 : M.Val i32.t := M.alloc 2 in
            BinOp.eq x α0) in
        let* α9 : core.option.Option.t (ref i32.t) :=
          (core.iter.traits.iterator.Iterator.find
              (Self := core.slice.iter.Iter.t i32.t)
              (Trait := ltac:(refine _)))
            α7
            α8 in
        let* α10 : M.Val (core.option.Option.t (ref i32.t)) := M.alloc α9 in
        let* α11 : ref (core.option.Option.t (ref i32.t)) := borrow α10 in
        let* α12 : M.Val (core.option.Option.t (ref i32.t)) := deref α11 in
        let* α13 : ref (core.option.Option.t (ref i32.t)) := borrow α12 in
        let* α14 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α13 in
        let* α15 : M.Val core.fmt.rt.Argument.t := M.alloc α14 in
        let* α16 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α15 ] in
        let* α17 : ref (array core.fmt.rt.Argument.t) := borrow α16 in
        let* α18 : M.Val (array core.fmt.rt.Argument.t) := deref α17 in
        let* α19 : ref (array core.fmt.rt.Argument.t) := borrow α18 in
        let* α20 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α19 in
        let* α21 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α20 in
        let* α22 : ref (slice core.fmt.rt.Argument.t) := M.read α21 in
        let* α23 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α22 in
        let* α24 : unit := std.io.stdio._print α23 in
        M.alloc α24 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Find 2 in vec2: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 :
            mut_ref
              (alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t) :=
          borrow_mut into_iter in
        let* α8 : type not implemented :=
          M.read
            (let* α0 : M.Val i32.t := M.alloc 2 in
            BinOp.eq x α0) in
        let* α9 : core.option.Option.t i32.t :=
          (core.iter.traits.iterator.Iterator.find
              (Self :=
                alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t)
              (Trait := ltac:(refine _)))
            α7
            α8 in
        let* α10 : M.Val (core.option.Option.t i32.t) := M.alloc α9 in
        let* α11 : ref (core.option.Option.t i32.t) := borrow α10 in
        let* α12 : M.Val (core.option.Option.t i32.t) := deref α11 in
        let* α13 : ref (core.option.Option.t i32.t) := borrow α12 in
        let* α14 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α13 in
        let* α15 : M.Val core.fmt.rt.Argument.t := M.alloc α14 in
        let* α16 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α15 ] in
        let* α17 : ref (array core.fmt.rt.Argument.t) := borrow α16 in
        let* α18 : M.Val (array core.fmt.rt.Argument.t) := deref α17 in
        let* α19 : ref (array core.fmt.rt.Argument.t) := borrow α18 in
        let* α20 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α19 in
        let* α21 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α20 in
        let* α22 : ref (slice core.fmt.rt.Argument.t) := M.read α21 in
        let* α23 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α22 in
        let* α24 : unit := std.io.stdio._print α23 in
        M.alloc α24 in
      M.alloc tt in
    let* array1 : M.Val (array i32.t) :=
      let* α0 : M.Val i32.t := M.alloc 1 in
      let* α1 : M.Val i32.t := M.alloc 2 in
      let* α2 : M.Val i32.t := M.alloc 3 in
      M.alloc [ α0; α1; α2 ] in
    let* array2 : M.Val (array i32.t) :=
      let* α0 : M.Val i32.t := M.alloc 4 in
      let* α1 : M.Val i32.t := M.alloc 5 in
      let* α2 : M.Val i32.t := M.alloc 6 in
      M.alloc [ α0; α1; α2 ] in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Find 2 in array1: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (array i32.t) := borrow array1 in
        let* α8 : M.Val (ref (array i32.t)) := M.alloc α7 in
        let* α9 : M.Val (ref (slice i32.t)) := pointer_coercion "Unsize" α8 in
        let* α10 : ref (slice i32.t) := M.read α9 in
        let* α11 : core.slice.iter.Iter.t i32.t :=
          (slice i32.t)::["iter"] α10 in
        let* α12 : M.Val (core.slice.iter.Iter.t i32.t) := M.alloc α11 in
        let* α13 : mut_ref (core.slice.iter.Iter.t i32.t) := borrow_mut α12 in
        let* α14 : type not implemented :=
          M.read
            (let* α0 : M.Val i32.t := M.alloc 2 in
            BinOp.eq x α0) in
        let* α15 : core.option.Option.t (ref i32.t) :=
          (core.iter.traits.iterator.Iterator.find
              (Self := core.slice.iter.Iter.t i32.t)
              (Trait := ltac:(refine _)))
            α13
            α14 in
        let* α16 : M.Val (core.option.Option.t (ref i32.t)) := M.alloc α15 in
        let* α17 : ref (core.option.Option.t (ref i32.t)) := borrow α16 in
        let* α18 : M.Val (core.option.Option.t (ref i32.t)) := deref α17 in
        let* α19 : ref (core.option.Option.t (ref i32.t)) := borrow α18 in
        let* α20 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α19 in
        let* α21 : M.Val core.fmt.rt.Argument.t := M.alloc α20 in
        let* α22 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α21 ] in
        let* α23 : ref (array core.fmt.rt.Argument.t) := borrow α22 in
        let* α24 : M.Val (array core.fmt.rt.Argument.t) := deref α23 in
        let* α25 : ref (array core.fmt.rt.Argument.t) := borrow α24 in
        let* α26 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α25 in
        let* α27 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α26 in
        let* α28 : ref (slice core.fmt.rt.Argument.t) := M.read α27 in
        let* α29 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α28 in
        let* α30 : unit := std.io.stdio._print α29 in
        M.alloc α30 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Find 2 in array2: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (array i32.t) := borrow array2 in
        let* α8 : core.slice.iter.Iter.t i32.t :=
          (core.iter.traits.collect.IntoIterator.into_iter
              (Self := ref (array i32.t))
              (Trait := ltac:(refine _)))
            α7 in
        let* α9 : M.Val (core.slice.iter.Iter.t i32.t) := M.alloc α8 in
        let* α10 : mut_ref (core.slice.iter.Iter.t i32.t) := borrow_mut α9 in
        let* α11 : type not implemented :=
          M.read
            (let* α0 : ref i32.t := M.read x in
            let* α1 : M.Val i32.t := deref α0 in
            let* α2 : M.Val i32.t := M.alloc 2 in
            BinOp.eq α1 α2) in
        let* α12 : core.option.Option.t (ref i32.t) :=
          (core.iter.traits.iterator.Iterator.find
              (Self := core.slice.iter.Iter.t i32.t)
              (Trait := ltac:(refine _)))
            α10
            α11 in
        let* α13 : M.Val (core.option.Option.t (ref i32.t)) := M.alloc α12 in
        let* α14 : ref (core.option.Option.t (ref i32.t)) := borrow α13 in
        let* α15 : M.Val (core.option.Option.t (ref i32.t)) := deref α14 in
        let* α16 : ref (core.option.Option.t (ref i32.t)) := borrow α15 in
        let* α17 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α16 in
        let* α18 : M.Val core.fmt.rt.Argument.t := M.alloc α17 in
        let* α19 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α18 ] in
        let* α20 : ref (array core.fmt.rt.Argument.t) := borrow α19 in
        let* α21 : M.Val (array core.fmt.rt.Argument.t) := deref α20 in
        let* α22 : ref (array core.fmt.rt.Argument.t) := borrow α21 in
        let* α23 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α22 in
        let* α24 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α23 in
        let* α25 : ref (slice core.fmt.rt.Argument.t) := M.read α24 in
        let* α26 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α25 in
        let* α27 : unit := std.io.stdio._print α26 in
        M.alloc α27 in
      M.alloc tt in
    M.alloc tt).
