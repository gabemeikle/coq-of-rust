(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Iterators can be collected into vectors
    let collected_iterator: Vec<i32> = (0..10).collect();
    println!("Collected (0..10) into: {:?}", collected_iterator);

    // The `vec!` macro can be used to initialize a vector
    let mut xs = vec![1i32, 2, 3];
    println!("Initial vector: {:?}", xs);

    // Insert new element at the end of the vector
    println!("Push 4 into the vector");
    xs.push(4);
    println!("Vector: {:?}", xs);

    // Error! Immutable vectors can't grow
    // collected_iterator.push(0);
    // FIXME ^ Comment out this line

    // The `len` method yields the number of elements currently stored in a vector
    println!("Vector length: {}", xs.len());

    // Indexing is done using the square brackets (indexing starts at 0)
    println!("Second element: {}", xs[1]);

    // `pop` removes the last element from the vector and returns it
    println!("Pop last element: {:?}", xs.pop());

    // Out of bounds indexing yields a panic
    // println!("Fourth element: {}", xs[3]);
    // FIXME ^ Comment out this line

    // `Vector`s can be easily iterated over
    println!("Contents of xs:");
    for x in xs.iter() {
        println!("> {}", x);
    }

    // A `Vector` can also be iterated over while the iteration
    // count is enumerated in a separate variable (`i`)
    for (i, x) in xs.iter().enumerate() {
        println!("In position {} we have value {}", i, x);
    }

    // Thanks to `iter_mut`, mutable `Vector`s can also be iterated
    // over in a way that allows modifying each value
    for x in xs.iter_mut() {
        *x *= 3;
    }
    println!("Updated vector: {:?}", xs);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* collected_iterator :
      M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
    let* α0 :
        (core.ops.range.Range.t i32.t) ->
          M (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
      ltac:(M.get_method (fun ℐ =>
        core.iter.traits.iterator.Iterator.collect
          (Self := core.ops.range.Range.t i32.t)
          (B := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
          (Trait := ℐ))) in
    let* α1 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t :=
      M.call
        (α0
          {|
            core.ops.range.Range.start := (Integer.of_Z 0) : i32.t;
            core.ops.range.Range.end_ := (Integer.of_Z 10) : i32.t;
          |}) in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Collected (0..10) into: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_debug"] (borrow collected_iterator)) in
      let* α4 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α3 ] in
      let* α5 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α4))) in
      let* α6 : unit := M.call (std.io.stdio._print α5) in
      M.alloc α6 in
    M.alloc tt in
  let* xs : M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
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
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Initial vector: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow xs)) in
      let* α4 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α3 ] in
      let* α5 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α4))) in
      let* α6 : unit := M.call (std.io.stdio._print α5) in
      M.alloc α6 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Push 4 into the vector
") in
      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
      let* α2 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_const"]
            (pointer_coercion "Unsize" (borrow α1))) in
      let* α3 : unit := M.call (std.io.stdio._print α2) in
      M.alloc α3 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      M.call
        ((alloc.vec.Vec.t i32.t alloc.alloc.Global.t)::["push"]
          (borrow_mut xs)
          ((Integer.of_Z 4) : i32.t)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Vector: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow xs)) in
      let* α4 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α3 ] in
      let* α5 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α4))) in
      let* α6 : unit := M.call (std.io.stdio._print α5) in
      M.alloc α6 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Vector length: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : usize.t :=
        M.call
          ((alloc.vec.Vec.t i32.t alloc.alloc.Global.t)::["len"] (borrow xs)) in
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
      let* α0 : ref str.t := M.read (mk_str "Second element: ") in
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
        M.call (α3 (borrow xs) ((Integer.of_Z 1) : usize.t)) in
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
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Pop last element: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : core.option.Option.t i32.t :=
        M.call
          ((alloc.vec.Vec.t i32.t alloc.alloc.Global.t)::["pop"]
            (borrow_mut xs)) in
      let* α4 : M.Val (core.option.Option.t i32.t) := M.alloc α3 in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow α4)) in
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
      let* α0 : ref str.t := M.read (mk_str "Contents of xs:
") in
      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
      let* α2 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_const"]
            (pointer_coercion "Unsize" (borrow α1))) in
      let* α3 : unit := M.call (std.io.stdio._print α2) in
      M.alloc α3 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* α0 : (core.slice.iter.Iter.t i32.t) -> M _ :=
      ltac:(M.get_method (fun ℐ =>
        core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.slice.iter.Iter.t i32.t)
          (Trait := ℐ))) in
    let* α1 : (ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t)) -> M (ref _) :=
      ltac:(M.get_method (fun ℐ =>
        core.ops.deref.Deref.deref
          (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
          (Trait := ℐ))) in
    let* α2 : ref (slice i32.t) := M.call (α1 (borrow xs)) in
    let* α3 : core.slice.iter.Iter.t i32.t :=
      M.call ((slice i32.t)::["iter"] α2) in
    let* α4 : core.slice.iter.Iter.t i32.t := M.call (α0 α3) in
    let* α5 : M.Val (core.slice.iter.Iter.t i32.t) := M.alloc α4 in
    let* α6 : M.Val unit :=
      match_operator
        α5
        [
          fun γ =>
            (let* iter := M.copy γ in
            M.loop
              (let* _ : M.Val unit :=
                let* α0 :
                    (mut_ref (core.slice.iter.Iter.t i32.t)) ->
                      M (core.option.Option.t _) :=
                  ltac:(M.get_method (fun ℐ =>
                    core.iter.traits.iterator.Iterator.next
                      (Self := core.slice.iter.Iter.t i32.t)
                      (Trait := ℐ))) in
                let* α1 : core.option.Option.t (ref i32.t) :=
                  M.call (α0 (borrow_mut iter)) in
                let* α2 : M.Val (core.option.Option.t (ref i32.t)) :=
                  M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.None =>
                        let* α0 : M.Val never.t := M.break in
                        let* α1 := M.read α0 in
                        let* α2 : unit := never_to_any α1 in
                        M.alloc α2
                      | _ => M.break_match
                      end) :
                      M (M.Val unit);
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.Some _ =>
                        let γ0_0 := core.option.Option.Get_Some_0 γ in
                        let* x := M.copy γ0_0 in
                        let* _ : M.Val unit :=
                          let* _ : M.Val unit :=
                            let* α0 : ref str.t := M.read (mk_str "> ") in
                            let* α1 : ref str.t := M.read (mk_str "
") in
                            let* α2 : M.Val (array (ref str.t)) :=
                              M.alloc [ α0; α1 ] in
                            let* α3 : core.fmt.rt.Argument.t :=
                              M.call
                                (core.fmt.rt.Argument.t::["new_display"]
                                  (borrow x)) in
                            let* α4 : M.Val (array core.fmt.rt.Argument.t) :=
                              M.alloc [ α3 ] in
                            let* α5 : core.fmt.Arguments.t :=
                              M.call
                                (core.fmt.Arguments.t::["new_v1"]
                                  (pointer_coercion "Unsize" (borrow α2))
                                  (pointer_coercion "Unsize" (borrow α4))) in
                            let* α6 : unit := M.call (std.io.stdio._print α5) in
                            M.alloc α6 in
                          M.alloc tt in
                        M.alloc tt
                      | _ => M.break_match
                      end) :
                      M (M.Val unit)
                  ] in
              M.alloc tt)) :
            M (M.Val unit)
        ] in
    M.pure (use α6) in
  let* _ : M.Val unit :=
    let* α0 :
        (core.iter.adapters.enumerate.Enumerate.t
            (core.slice.iter.Iter.t i32.t))
          ->
          M _ :=
      ltac:(M.get_method (fun ℐ =>
        core.iter.traits.collect.IntoIterator.into_iter
          (Self :=
            core.iter.adapters.enumerate.Enumerate.t
              (core.slice.iter.Iter.t i32.t))
          (Trait := ℐ))) in
    let* α1 :
        (core.slice.iter.Iter.t i32.t) ->
          M
            (core.iter.adapters.enumerate.Enumerate.t
              (core.slice.iter.Iter.t i32.t)) :=
      ltac:(M.get_method (fun ℐ =>
        core.iter.traits.iterator.Iterator.enumerate
          (Self := core.slice.iter.Iter.t i32.t)
          (Trait := ℐ))) in
    let* α2 : (ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t)) -> M (ref _) :=
      ltac:(M.get_method (fun ℐ =>
        core.ops.deref.Deref.deref
          (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
          (Trait := ℐ))) in
    let* α3 : ref (slice i32.t) := M.call (α2 (borrow xs)) in
    let* α4 : core.slice.iter.Iter.t i32.t :=
      M.call ((slice i32.t)::["iter"] α3) in
    let* α5 :
        core.iter.adapters.enumerate.Enumerate.t
          (core.slice.iter.Iter.t i32.t) :=
      M.call (α1 α4) in
    let* α6 :
        core.iter.adapters.enumerate.Enumerate.t
          (core.slice.iter.Iter.t i32.t) :=
      M.call (α0 α5) in
    let* α7 :
        M.Val
          (core.iter.adapters.enumerate.Enumerate.t
            (core.slice.iter.Iter.t i32.t)) :=
      M.alloc α6 in
    let* α8 : M.Val unit :=
      match_operator
        α7
        [
          fun γ =>
            (let* iter := M.copy γ in
            M.loop
              (let* _ : M.Val unit :=
                let* α0 :
                    (mut_ref
                        (core.iter.adapters.enumerate.Enumerate.t
                          (core.slice.iter.Iter.t i32.t)))
                      ->
                      M (core.option.Option.t _) :=
                  ltac:(M.get_method (fun ℐ =>
                    core.iter.traits.iterator.Iterator.next
                      (Self :=
                        core.iter.adapters.enumerate.Enumerate.t
                          (core.slice.iter.Iter.t i32.t))
                      (Trait := ℐ))) in
                let* α1 : core.option.Option.t (usize.t * (ref i32.t)) :=
                  M.call (α0 (borrow_mut iter)) in
                let* α2 :
                    M.Val (core.option.Option.t (usize.t * (ref i32.t))) :=
                  M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.None =>
                        let* α0 : M.Val never.t := M.break in
                        let* α1 := M.read α0 in
                        let* α2 : unit := never_to_any α1 in
                        M.alloc α2
                      | _ => M.break_match
                      end) :
                      M (M.Val unit);
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.Some _ =>
                        let γ0_0 := core.option.Option.Get_Some_0 γ in
                        let* α0 := M.read γ0_0 in
                        match α0 with
                        | (_, _) =>
                          let γ1_0 := Tuple.Access.left γ0_0 in
                          let γ1_1 := Tuple.Access.right γ0_0 in
                          let* i := M.copy γ1_0 in
                          let* x := M.copy γ1_1 in
                          let* _ : M.Val unit :=
                            let* _ : M.Val unit :=
                              let* α0 : ref str.t :=
                                M.read (mk_str "In position ") in
                              let* α1 : ref str.t :=
                                M.read (mk_str " we have value ") in
                              let* α2 : ref str.t := M.read (mk_str "
") in
                              let* α3 : M.Val (array (ref str.t)) :=
                                M.alloc [ α0; α1; α2 ] in
                              let* α4 : core.fmt.rt.Argument.t :=
                                M.call
                                  (core.fmt.rt.Argument.t::["new_display"]
                                    (borrow i)) in
                              let* α5 : core.fmt.rt.Argument.t :=
                                M.call
                                  (core.fmt.rt.Argument.t::["new_display"]
                                    (borrow x)) in
                              let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                                M.alloc [ α4; α5 ] in
                              let* α7 : core.fmt.Arguments.t :=
                                M.call
                                  (core.fmt.Arguments.t::["new_v1"]
                                    (pointer_coercion "Unsize" (borrow α3))
                                    (pointer_coercion "Unsize" (borrow α6))) in
                              let* α8 : unit :=
                                M.call (std.io.stdio._print α7) in
                              M.alloc α8 in
                            M.alloc tt in
                          M.alloc tt
                        end
                      | _ => M.break_match
                      end) :
                      M (M.Val unit)
                  ] in
              M.alloc tt)) :
            M (M.Val unit)
        ] in
    M.pure (use α8) in
  let* _ : M.Val unit :=
    let* α0 : (core.slice.iter.IterMut.t i32.t) -> M _ :=
      ltac:(M.get_method (fun ℐ =>
        core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.slice.iter.IterMut.t i32.t)
          (Trait := ℐ))) in
    let* α1 :
        (mut_ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t)) ->
          M (mut_ref _) :=
      ltac:(M.get_method (fun ℐ =>
        core.ops.deref.DerefMut.deref_mut
          (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
          (Trait := ℐ))) in
    let* α2 : mut_ref (slice i32.t) := M.call (α1 (borrow_mut xs)) in
    let* α3 : core.slice.iter.IterMut.t i32.t :=
      M.call ((slice i32.t)::["iter_mut"] α2) in
    let* α4 : core.slice.iter.IterMut.t i32.t := M.call (α0 α3) in
    let* α5 : M.Val (core.slice.iter.IterMut.t i32.t) := M.alloc α4 in
    let* α6 : M.Val unit :=
      match_operator
        α5
        [
          fun γ =>
            (let* iter := M.copy γ in
            M.loop
              (let* _ : M.Val unit :=
                let* α0 :
                    (mut_ref (core.slice.iter.IterMut.t i32.t)) ->
                      M (core.option.Option.t _) :=
                  ltac:(M.get_method (fun ℐ =>
                    core.iter.traits.iterator.Iterator.next
                      (Self := core.slice.iter.IterMut.t i32.t)
                      (Trait := ℐ))) in
                let* α1 : core.option.Option.t (mut_ref i32.t) :=
                  M.call (α0 (borrow_mut iter)) in
                let* α2 : M.Val (core.option.Option.t (mut_ref i32.t)) :=
                  M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.None =>
                        let* α0 : M.Val never.t := M.break in
                        let* α1 := M.read α0 in
                        let* α2 : unit := never_to_any α1 in
                        M.alloc α2
                      | _ => M.break_match
                      end) :
                      M (M.Val unit);
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.Some _ =>
                        let γ0_0 := core.option.Option.Get_Some_0 γ in
                        let* x := M.copy γ0_0 in
                        let* _ : M.Val unit :=
                          let* β : M.Val i32.t :=
                            let* α0 : mut_ref i32.t := M.read x in
                            M.pure (deref α0) in
                          let* α0 := M.read β in
                          let* α1 :=
                            BinOp.Panic.mul α0 ((Integer.of_Z 3) : i32.t) in
                          assign β α1 in
                        M.alloc tt
                      | _ => M.break_match
                      end) :
                      M (M.Val unit)
                  ] in
              M.alloc tt)) :
            M (M.Val unit)
        ] in
    M.pure (use α6) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Updated vector: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow xs)) in
      let* α4 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α3 ] in
      let* α5 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α4))) in
      let* α6 : unit := M.call (std.io.stdio._print α5) in
      M.alloc α6 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
