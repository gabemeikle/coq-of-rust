(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn create_box() {
    // Allocate an integer on the heap
    let _box1 = Box::new(3i32);

    // `_box1` is destroyed here, and memory gets freed
}
*)
Definition create_box : M unit :=
  let* _box1 : M.Val (alloc.boxed.Box.t i32.t alloc.alloc.Global.t) :=
    let* α0 : alloc.boxed.Box.t i32.t alloc.alloc.Global.t :=
      M.call
        ((alloc.boxed.Box.t i32.t alloc.alloc.Global.t)::["new"]
          (Integer.of_Z 3)) in
    M.alloc α0 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn main() {
    // Allocate an integer on the heap
    let _box2 = Box::new(5i32);

    // A nested scope:
    {
        // Allocate an integer on the heap
        let _box3 = Box::new(4i32);

        // `_box3` is destroyed here, and memory gets freed
    }

    // Creating lots of boxes just for fun
    // There's no need to manually free memory!
    for _ in 0u32..1_000 {
        create_box();
    }

    // `_box2` is destroyed here, and memory gets freed
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _box2 : M.Val (alloc.boxed.Box.t i32.t alloc.alloc.Global.t) :=
    let* α0 : alloc.boxed.Box.t i32.t alloc.alloc.Global.t :=
      M.call
        ((alloc.boxed.Box.t i32.t alloc.alloc.Global.t)::["new"]
          (Integer.of_Z 5)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* _box3 : M.Val (alloc.boxed.Box.t i32.t alloc.alloc.Global.t) :=
      let* α0 : alloc.boxed.Box.t i32.t alloc.alloc.Global.t :=
        M.call
          ((alloc.boxed.Box.t i32.t alloc.alloc.Global.t)::["new"]
            (Integer.of_Z 4)) in
      M.alloc α0 in
    M.alloc tt in
  let* α0 : core.ops.range.Range.t u32.t :=
    M.call
      ((core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.ops.range.Range.t u32.t)
          (Trait := ltac:(refine _)))
        {|
          core.ops.range.Range.start := Integer.of_Z 0;
          core.ops.range.Range.end := Integer.of_Z 1000;
        |}) in
  let* α1 : M.Val unit :=
    match α0 with
    | iter =>
      let* iter := M.alloc iter in
      loop
        (let* _ : M.Val unit :=
          let* α0 : core.option.Option.t u32.t :=
            M.call
              ((core.iter.traits.iterator.Iterator.next
                  (Self := core.ops.range.Range.t u32.t)
                  (Trait := ltac:(refine _)))
                (borrow_mut iter)) in
          match α0 with
          | core.option.Option.None  =>
            let* α0 : M.Val never.t := Break in
            let* α1 := M.read α0 in
            let* α2 : unit := never_to_any α1 in
            M.alloc α2
          | core.option.Option.Some _ =>
            let* _ : M.Val unit :=
              let* α0 : unit := M.call scoping_rules_raii.create_box in
              M.alloc α0 in
            M.alloc tt
          end in
        M.alloc tt)
    end in
  M.read (use α1).
