(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let vec1 = vec![1, 2, 3];
    let vec2 = vec![4, 5, 6];

    // `iter()` for vecs yields `&i32`. Destructure to `i32`.
    println!("2 in vec1: {}", vec1.iter().any(|&x| x == 2));
    // `into_iter()` for vecs yields `i32`. No destructuring required.
    println!("2 in vec2: {}", vec2.into_iter().any(|x| x == 2));

    // `iter()` only borrows `vec1` and its elements, so they can be used again
    println!("vec1 len: {}", vec1.len());
    println!("First element of vec1 is: {}", vec1[0]);
    // `into_iter()` does move `vec2` and its elements, so they cannot be used again
    // println!("First element of vec2 is: {}", vec2[0]);
    // println!("vec2 len: {}", vec2.len());
    // TODO: uncomment two lines above and see compiler errors.

    let array1 = [1, 2, 3];
    let array2 = [4, 5, 6];

    // `iter()` for arrays yields `&i32`.
    println!("2 in array1: {}", array1.iter().any(|&x| x == 2));
    // `into_iter()` for arrays yields `i32`.
    println!("2 in array2: {}", array2.into_iter().any(|x| *x == 2));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* vec1 : M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
    let* α0 : M.Val (array i32.t) :=
      M.alloc
        [
          (Integer.of_Z 1) : i32.t;
          (Integer.of_Z 2) : i32.t;
          (Integer.of_Z 3) : i32.t
        ] in
    let* α1 : M.Val (alloc.boxed.Box.t (array i32.t) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"] α0) in
    let* α2 : alloc.boxed.Box.t (array i32.t) alloc.alloc.Global.t :=
      M.read α1 in
    let* α3 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t :=
      M.call ((slice i32.t)::["into_vec"] (pointer_coercion "Unsize" α2)) in
    M.alloc α3 in
  let* vec2 : M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
    let* α0 : M.Val (array i32.t) :=
      M.alloc
        [
          (Integer.of_Z 4) : i32.t;
          (Integer.of_Z 5) : i32.t;
          (Integer.of_Z 6) : i32.t
        ] in
    let* α1 : M.Val (alloc.boxed.Box.t (array i32.t) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"] α0) in
    let* α2 : alloc.boxed.Box.t (array i32.t) alloc.alloc.Global.t :=
      M.read α1 in
    let* α3 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t :=
      M.call ((slice i32.t)::["into_vec"] (pointer_coercion "Unsize" α2)) in
    M.alloc α3 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "2 in vec1: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 :
          (mut_ref (core.slice.iter.Iter.t i32.t)) ->
            ((ref i32.t) -> M bool.t) ->
            M bool.t :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.iterator.Iterator.any
            (Self := core.slice.iter.Iter.t i32.t)
            (F := (ref i32.t) -> M bool.t)
            (Trait := ℐ))) in
      let* α4 :
          (ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t)) -> M (ref _) :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ℐ))) in
      let* α5 : ref (slice i32.t) := M.call (α4 (borrow vec1)) in
      let* α6 : core.slice.iter.Iter.t i32.t :=
        M.call ((slice i32.t)::["iter"] α5) in
      let* α7 : M.Val (core.slice.iter.Iter.t i32.t) := M.alloc α6 in
      let* α8 : bool.t :=
        M.call
          (α3
            (borrow_mut α7)
            (fun (α0 : ref i32.t) =>
              (let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    (let* γ :=
                      let* α0 := M.read γ in
                      M.pure (deref α0) in
                    let* x := M.copy γ in
                    let* α0 : i32.t := M.read x in
                    M.pure (BinOp.Pure.eq α0 ((Integer.of_Z 2) : i32.t))) :
                    M bool.t
                ]) :
              M bool.t)) in
      let* α9 : M.Val bool.t := M.alloc α8 in
      let* α10 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α9)) in
      let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
      let* α12 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α11))) in
      let* α13 : unit := M.call (std.io.stdio._print α12) in
      M.alloc α13 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "2 in vec2: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 :
          (mut_ref (alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t))
            ->
            (i32.t -> M bool.t) ->
            M bool.t :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.iterator.Iterator.any
            (Self := alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t)
            (F := i32.t -> M bool.t)
            (Trait := ℐ))) in
      let* α4 : (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) -> M _ :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.collect.IntoIterator.into_iter
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ℐ))) in
      let* α5 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t := M.read vec2 in
      let* α6 : alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t :=
        M.call (α4 α5) in
      let* α7 :
          M.Val (alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t) :=
        M.alloc α6 in
      let* α8 : bool.t :=
        M.call
          (α3
            (borrow_mut α7)
            (fun (α0 : i32.t) =>
              (let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    (let* x := M.copy γ in
                    let* α0 : i32.t := M.read x in
                    M.pure (BinOp.Pure.eq α0 ((Integer.of_Z 2) : i32.t))) :
                    M bool.t
                ]) :
              M bool.t)) in
      let* α9 : M.Val bool.t := M.alloc α8 in
      let* α10 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α9)) in
      let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
      let* α12 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α11))) in
      let* α13 : unit := M.call (std.io.stdio._print α12) in
      M.alloc α13 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "vec1 len: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : usize.t :=
        M.call
          ((alloc.vec.Vec.t i32.t alloc.alloc.Global.t)::["len"]
            (borrow vec1)) in
      let* α4 : M.Val usize.t := M.alloc α3 in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α4)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α6))) in
      let* α8 : unit := M.call (std.io.stdio._print α7) in
      M.alloc α8 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "First element of vec1 is: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 :
          (ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t)) ->
            usize.t ->
            M (ref _) :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.index.Index.index
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Idx := usize.t)
            (Trait := ℐ))) in
      let* α4 : ref i32.t :=
        M.call (α3 (borrow vec1) ((Integer.of_Z 0) : usize.t)) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] α4) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α6))) in
      let* α8 : unit := M.call (std.io.stdio._print α7) in
      M.alloc α8 in
    M.alloc tt in
  let* array1 : M.Val (array i32.t) :=
    M.alloc
      [
        (Integer.of_Z 1) : i32.t;
        (Integer.of_Z 2) : i32.t;
        (Integer.of_Z 3) : i32.t
      ] in
  let* array2 : M.Val (array i32.t) :=
    M.alloc
      [
        (Integer.of_Z 4) : i32.t;
        (Integer.of_Z 5) : i32.t;
        (Integer.of_Z 6) : i32.t
      ] in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "2 in array1: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 :
          (mut_ref (core.slice.iter.Iter.t i32.t)) ->
            ((ref i32.t) -> M bool.t) ->
            M bool.t :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.iterator.Iterator.any
            (Self := core.slice.iter.Iter.t i32.t)
            (F := (ref i32.t) -> M bool.t)
            (Trait := ℐ))) in
      let* α4 : core.slice.iter.Iter.t i32.t :=
        M.call
          ((slice i32.t)::["iter"]
            (pointer_coercion "Unsize" (borrow array1))) in
      let* α5 : M.Val (core.slice.iter.Iter.t i32.t) := M.alloc α4 in
      let* α6 : bool.t :=
        M.call
          (α3
            (borrow_mut α5)
            (fun (α0 : ref i32.t) =>
              (let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    (let* γ :=
                      let* α0 := M.read γ in
                      M.pure (deref α0) in
                    let* x := M.copy γ in
                    let* α0 : i32.t := M.read x in
                    M.pure (BinOp.Pure.eq α0 ((Integer.of_Z 2) : i32.t))) :
                    M bool.t
                ]) :
              M bool.t)) in
      let* α7 : M.Val bool.t := M.alloc α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
      let* α9 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8 ] in
      let* α10 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α9))) in
      let* α11 : unit := M.call (std.io.stdio._print α10) in
      M.alloc α11 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "2 in array2: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 :
          (mut_ref (core.slice.iter.Iter.t i32.t)) ->
            ((ref i32.t) -> M bool.t) ->
            M bool.t :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.iterator.Iterator.any
            (Self := core.slice.iter.Iter.t i32.t)
            (F := (ref i32.t) -> M bool.t)
            (Trait := ℐ))) in
      let* α4 : (ref (array i32.t)) -> M _ :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.collect.IntoIterator.into_iter
            (Self := ref (array i32.t))
            (Trait := ℐ))) in
      let* α5 : core.slice.iter.Iter.t i32.t := M.call (α4 (borrow array2)) in
      let* α6 : M.Val (core.slice.iter.Iter.t i32.t) := M.alloc α5 in
      let* α7 : bool.t :=
        M.call
          (α3
            (borrow_mut α6)
            (fun (α0 : ref i32.t) =>
              (let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    (let* x := M.copy γ in
                    let* α0 : ref i32.t := M.read x in
                    let* α1 : i32.t := M.read (deref α0) in
                    M.pure (BinOp.Pure.eq α1 ((Integer.of_Z 2) : i32.t))) :
                    M bool.t
                ]) :
              M bool.t)) in
      let* α8 : M.Val bool.t := M.alloc α7 in
      let* α9 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α8)) in
      let* α10 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α9 ] in
      let* α11 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α10))) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
