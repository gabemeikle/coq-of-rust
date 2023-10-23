(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition NTHREADS `{State.Trait} : u32 := run (M.alloc 10).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* children := (alloc.vec.Vec _ alloc.alloc.Global)::["new"] in
  let* _ :=
    let* α0 := M.alloc 0 in
    let* α1 :=
      M.alloc
        {|
          core.ops.range.Range.start := α0;
          core.ops.range.Range.end := threads.NTHREADS;
        |} in
    let* α2 := core.iter.traits.collect.IntoIterator.into_iter α1 in
    let* α3 :=
      match α2 with
      | iter =>
        loop
          (let* _ :=
            let* α0 := borrow_mut iter (core.ops.range.Range u32) in
            let* α1 := deref α0 (core.ops.range.Range u32) in
            let* α2 := borrow_mut α1 (core.ops.range.Range u32) in
            let* α3 := core.iter.traits.iterator.Iterator.next α2 in
            match α3 with
            | core.option.Option  =>
              let* α0 := Break in
              never_to_any α0
            | core.option.Option i =>
              let* _ :=
                let* α0 :=
                  borrow_mut
                    children
                    (alloc.vec.Vec
                      (std.thread.JoinHandle unit)
                      alloc.alloc.Global) in
                let* α1 :=
                  std.thread.spawn
                    let* _ :=
                      let* _ :=
                        let* α0 :=
                          borrow
                            [ mk_str "this is thread number "; mk_str "
" ]
                            (list (ref str)) in
                        let* α1 := deref α0 (list (ref str)) in
                        let* α2 := borrow α1 (list (ref str)) in
                        let* α3 := pointer_coercion "Unsize" α2 in
                        let* α4 := borrow i u32 in
                        let* α5 := deref α4 u32 in
                        let* α6 := borrow α5 u32 in
                        let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
                        let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
                        let* α9 := deref α8 (list core.fmt.rt.Argument) in
                        let* α10 := borrow α9 (list core.fmt.rt.Argument) in
                        let* α11 := pointer_coercion "Unsize" α10 in
                        let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
                        std.io.stdio._print α12 in
                      Pure tt in
                    Pure tt in
                (alloc.vec.Vec _ _)::["push"] α0 α1 in
              Pure tt
            end in
          Pure tt)
      end in
    use α3 in
  let* α0 := core.iter.traits.collect.IntoIterator.into_iter children in
  let* α1 :=
    match α0 with
    | iter =>
      loop
        (let* _ :=
          let* α0 :=
            borrow_mut
              iter
              (alloc.vec.into_iter.IntoIter
                (std.thread.JoinHandle unit)
                alloc.alloc.Global) in
          let* α1 :=
            deref
              α0
              (alloc.vec.into_iter.IntoIter
                (std.thread.JoinHandle unit)
                alloc.alloc.Global) in
          let* α2 :=
            borrow_mut
              α1
              (alloc.vec.into_iter.IntoIter
                (std.thread.JoinHandle unit)
                alloc.alloc.Global) in
          let* α3 := core.iter.traits.iterator.Iterator.next α2 in
          match α3 with
          | core.option.Option  =>
            let* α0 := Break in
            never_to_any α0
          | core.option.Option child =>
            let* _ := (std.thread.JoinHandle _)::["join"] child in
            Pure tt
          end in
        Pure tt)
    end in
  use α1.
