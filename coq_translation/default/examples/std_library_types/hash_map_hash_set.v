(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut a: HashSet<i32> = vec![1i32, 2, 3].into_iter().collect();
    let mut b: HashSet<i32> = vec![2i32, 3, 4].into_iter().collect();

    assert!(a.insert(4));
    assert!(a.contains(&4));

    // `HashSet::insert()` returns false if
    // there was a value already present.
    // assert!(b.insert(4), "Value 4 is already in set B!");
    // FIXME ^ Comment out this line

    b.insert(5);

    // If a collection's element type implements `Debug`,
    // then the collection implements `Debug`.
    // It usually prints its elements in the format `[elem1, elem2, ...]`
    println!("A: {:?}", a);
    println!("B: {:?}", b);

    // Print [1, 2, 3, 4, 5] in arbitrary order
    println!("Union: {:?}", a.union(&b).collect::<Vec<&i32>>());

    // This should print [1]
    println!("Difference: {:?}", a.difference(&b).collect::<Vec<&i32>>());

    // Print [2, 3, 4] in arbitrary order.
    println!(
        "Intersection: {:?}",
        a.intersection(&b).collect::<Vec<&i32>>()
    );

    // Print [1, 5]
    println!(
        "Symmetric Difference: {:?}",
        a.symmetric_difference(&b).collect::<Vec<&i32>>()
    );
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* a :
        ltac:(refine
          (M.Val
            (std.collections.hash.set.HashSet.t
              i32.t
              std.collections.hash.map.RandomState.t))) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 1 in
      let* α1 : ltac:(refine (M.Val i32.t)) := M.alloc 2 in
      let* α2 : ltac:(refine (M.Val i32.t)) := M.alloc 3 in
      let* α3 : ltac:(refine (M.Val (array i32.t))) := M.alloc [ α0; α1; α2 ] in
      let* α4 :
          ltac:(refine
            (M.Val (alloc.boxed.Box.t (array i32.t) alloc.alloc.Global.t))) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3 in
      let* α5 :
          ltac:(refine
            (M.Val (alloc.boxed.Box.t (slice i32.t) alloc.alloc.Global.t))) :=
        pointer_coercion "Unsize" α4 in
      let* α6 :
          ltac:(refine (M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t))) :=
        (slice i32.t)::["into_vec"] α5 in
      let* α7 :
          ltac:(refine
            (M.Val
              (alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t))) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α6 in
      (core.iter.traits.iterator.Iterator.collect
          (Self := alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t)
          (Trait := ltac:(refine _)))
        α7 in
    let* b :
        ltac:(refine
          (M.Val
            (std.collections.hash.set.HashSet.t
              i32.t
              std.collections.hash.map.RandomState.t))) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 2 in
      let* α1 : ltac:(refine (M.Val i32.t)) := M.alloc 3 in
      let* α2 : ltac:(refine (M.Val i32.t)) := M.alloc 4 in
      let* α3 : ltac:(refine (M.Val (array i32.t))) := M.alloc [ α0; α1; α2 ] in
      let* α4 :
          ltac:(refine
            (M.Val (alloc.boxed.Box.t (array i32.t) alloc.alloc.Global.t))) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3 in
      let* α5 :
          ltac:(refine
            (M.Val (alloc.boxed.Box.t (slice i32.t) alloc.alloc.Global.t))) :=
        pointer_coercion "Unsize" α4 in
      let* α6 :
          ltac:(refine (M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t))) :=
        (slice i32.t)::["into_vec"] α5 in
      let* α7 :
          ltac:(refine
            (M.Val
              (alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t))) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α6 in
      (core.iter.traits.iterator.Iterator.collect
          (Self := alloc.vec.into_iter.IntoIter.t i32.t alloc.alloc.Global.t)
          (Trait := ltac:(refine _)))
        α7 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (mut_ref
                (std.collections.hash.set.HashSet.t
                  i32.t
                  std.collections.hash.map.RandomState.t)))) :=
        borrow_mut a in
      let* α1 : ltac:(refine (M.Val i32.t)) := M.alloc 4 in
      let* α2 : ltac:(refine (M.Val bool.t)) :=
        (std.collections.hash.set.HashSet.t
              i32.t
              std.collections.hash.map.RandomState.t)::["insert"]
          α0
          α1 in
      let* α3 : ltac:(refine (M.Val bool.t)) := UnOp.not α2 in
      let* α4 : ltac:(refine (M.Val bool.t)) := use α3 in
      let* α5 := M.read α4 in
      if (α5 : bool) then
        let* α0 : ltac:(refine (M.Val never.t)) :=
          core.panicking.panic (mk_str "assertion failed: a.insert(4)") in
        never_to_any α0
      else
        M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (ref
                (std.collections.hash.set.HashSet.t
                  i32.t
                  std.collections.hash.map.RandomState.t)))) :=
        borrow a in
      let* α1 : ltac:(refine (M.Val i32.t)) := M.alloc 4 in
      let* α2 : ltac:(refine (M.Val (ref i32.t))) := borrow α1 in
      let* α3 : ltac:(refine (M.Val bool.t)) :=
        (std.collections.hash.set.HashSet.t
              i32.t
              std.collections.hash.map.RandomState.t)::["contains"]
          α0
          α2 in
      let* α4 : ltac:(refine (M.Val bool.t)) := UnOp.not α3 in
      let* α5 : ltac:(refine (M.Val bool.t)) := use α4 in
      let* α6 := M.read α5 in
      if (α6 : bool) then
        let* α0 : ltac:(refine (M.Val never.t)) :=
          core.panicking.panic (mk_str "assertion failed: a.contains(&4)") in
        never_to_any α0
      else
        M.alloc tt in
    let* _ : ltac:(refine (M.Val bool.t)) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (mut_ref
                (std.collections.hash.set.HashSet.t
                  i32.t
                  std.collections.hash.map.RandomState.t)))) :=
        borrow_mut b in
      let* α1 : ltac:(refine (M.Val i32.t)) := M.alloc 5 in
      (std.collections.hash.set.HashSet.t
            i32.t
            std.collections.hash.map.RandomState.t)::["insert"]
        α0
        α1 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "A: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (std.collections.hash.set.HashSet.t
                    i32.t
                    std.collections.hash.map.RandomState.t)))) :=
          borrow a in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "B: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (std.collections.hash.set.HashSet.t
                    i32.t
                    std.collections.hash.map.RandomState.t)))) :=
          borrow b in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Union: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (std.collections.hash.set.HashSet.t
                    i32.t
                    std.collections.hash.map.RandomState.t)))) :=
          borrow a in
        let* α4 :
            ltac:(refine
              (M.Val
                (ref
                  (std.collections.hash.set.HashSet.t
                    i32.t
                    std.collections.hash.map.RandomState.t)))) :=
          borrow b in
        let* α5 :
            ltac:(refine
              (M.Val
                (std.collections.hash.set.Union.t
                  i32.t
                  std.collections.hash.map.RandomState.t))) :=
          (std.collections.hash.set.HashSet.t
                i32.t
                std.collections.hash.map.RandomState.t)::["union"]
            α3
            α4 in
        let* α6 :
            ltac:(refine
              (M.Val (alloc.vec.Vec.t (ref i32.t) alloc.alloc.Global.t))) :=
          (core.iter.traits.iterator.Iterator.collect
              (Self :=
                std.collections.hash.set.Union.t
                  i32.t
                  std.collections.hash.map.RandomState.t)
              (Trait := ltac:(refine _)))
            α5 in
        let* α7 :
            ltac:(refine
              (M.Val
                (ref (alloc.vec.Vec.t (ref i32.t) alloc.alloc.Global.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α7 in
        let* α9 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α9 in
        let* α11 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α11 in
        std.io.stdio._print α12 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Difference: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (std.collections.hash.set.HashSet.t
                    i32.t
                    std.collections.hash.map.RandomState.t)))) :=
          borrow a in
        let* α4 :
            ltac:(refine
              (M.Val
                (ref
                  (std.collections.hash.set.HashSet.t
                    i32.t
                    std.collections.hash.map.RandomState.t)))) :=
          borrow b in
        let* α5 :
            ltac:(refine
              (M.Val
                (std.collections.hash.set.Difference.t
                  i32.t
                  std.collections.hash.map.RandomState.t))) :=
          (std.collections.hash.set.HashSet.t
                i32.t
                std.collections.hash.map.RandomState.t)::["difference"]
            α3
            α4 in
        let* α6 :
            ltac:(refine
              (M.Val (alloc.vec.Vec.t (ref i32.t) alloc.alloc.Global.t))) :=
          (core.iter.traits.iterator.Iterator.collect
              (Self :=
                std.collections.hash.set.Difference.t
                  i32.t
                  std.collections.hash.map.RandomState.t)
              (Trait := ltac:(refine _)))
            α5 in
        let* α7 :
            ltac:(refine
              (M.Val
                (ref (alloc.vec.Vec.t (ref i32.t) alloc.alloc.Global.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α7 in
        let* α9 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α9 in
        let* α11 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α11 in
        std.io.stdio._print α12 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Intersection: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (std.collections.hash.set.HashSet.t
                    i32.t
                    std.collections.hash.map.RandomState.t)))) :=
          borrow a in
        let* α4 :
            ltac:(refine
              (M.Val
                (ref
                  (std.collections.hash.set.HashSet.t
                    i32.t
                    std.collections.hash.map.RandomState.t)))) :=
          borrow b in
        let* α5 :
            ltac:(refine
              (M.Val
                (std.collections.hash.set.Intersection.t
                  i32.t
                  std.collections.hash.map.RandomState.t))) :=
          (std.collections.hash.set.HashSet.t
                i32.t
                std.collections.hash.map.RandomState.t)::["intersection"]
            α3
            α4 in
        let* α6 :
            ltac:(refine
              (M.Val (alloc.vec.Vec.t (ref i32.t) alloc.alloc.Global.t))) :=
          (core.iter.traits.iterator.Iterator.collect
              (Self :=
                std.collections.hash.set.Intersection.t
                  i32.t
                  std.collections.hash.map.RandomState.t)
              (Trait := ltac:(refine _)))
            α5 in
        let* α7 :
            ltac:(refine
              (M.Val
                (ref (alloc.vec.Vec.t (ref i32.t) alloc.alloc.Global.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α7 in
        let* α9 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α9 in
        let* α11 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α11 in
        std.io.stdio._print α12 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Symmetric Difference: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (std.collections.hash.set.HashSet.t
                    i32.t
                    std.collections.hash.map.RandomState.t)))) :=
          borrow a in
        let* α4 :
            ltac:(refine
              (M.Val
                (ref
                  (std.collections.hash.set.HashSet.t
                    i32.t
                    std.collections.hash.map.RandomState.t)))) :=
          borrow b in
        let* α5 :
            ltac:(refine
              (M.Val
                (std.collections.hash.set.SymmetricDifference.t
                  i32.t
                  std.collections.hash.map.RandomState.t))) :=
          (std.collections.hash.set.HashSet.t
                i32.t
                std.collections.hash.map.RandomState.t)::["symmetric_difference"]
            α3
            α4 in
        let* α6 :
            ltac:(refine
              (M.Val (alloc.vec.Vec.t (ref i32.t) alloc.alloc.Global.t))) :=
          (core.iter.traits.iterator.Iterator.collect
              (Self :=
                std.collections.hash.set.SymmetricDifference.t
                  i32.t
                  std.collections.hash.map.RandomState.t)
              (Trait := ltac:(refine _)))
            α5 in
        let* α7 :
            ltac:(refine
              (M.Val
                (ref (alloc.vec.Vec.t (ref i32.t) alloc.alloc.Global.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α7 in
        let* α9 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α9 in
        let* α11 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α11 in
        std.io.stdio._print α12 in
      M.alloc tt in
    M.alloc tt).
