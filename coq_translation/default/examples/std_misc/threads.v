(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition NTHREADS `{ℋ : State.Trait} : u32 := M.run (M.alloc 10).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* children :
        ltac:(refine
          (alloc.vec.Vec (std.thread.JoinHandle unit) alloc.alloc.Global)) :=
      (alloc.vec.Vec
          (std.thread.JoinHandle unit)
          alloc.alloc.Global)::["new"] in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine u32) := M.alloc 0 in
      let* α1 : ltac:(refine (core.ops.range.Range u32)) :=
        M.alloc
          {|
            core.ops.range.Range.start := α0;
            core.ops.range.Range.end := threads.NTHREADS;
          |} in
      let* α2 : ltac:(refine (core.ops.range.Range u32)) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.ops.range.Range u32)
            (Trait := ltac:(refine _)))
          α1 in
      let* α3 := M.read α2 in
      let* α4 : ltac:(refine unit) :=
        match α3 with
        | iter =>
          loop
            (let* _ : ltac:(refine unit) :=
              let* α0 : ltac:(refine (mut_ref (core.ops.range.Range u32))) :=
                borrow_mut iter in
              let* α1 : ltac:(refine (core.ops.range.Range u32)) := deref α0 in
              let* α2 : ltac:(refine (mut_ref (core.ops.range.Range u32))) :=
                borrow_mut α1 in
              let* α3 : ltac:(refine (core.option.Option u32)) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := core.ops.range.Range u32)
                    (Trait := ltac:(refine _)))
                  α2 in
              let* α4 := M.read α3 in
              match α4 with
              | core.option.Option.None  =>
                let* α0 : ltac:(refine never) := Break in
                never_to_any α0
              | core.option.Option.Some i =>
                let* _ : ltac:(refine unit) :=
                  let* α0 :
                      ltac:(refine
                        (mut_ref
                          (alloc.vec.Vec
                            (std.thread.JoinHandle unit)
                            alloc.alloc.Global))) :=
                    borrow_mut children in
                  let* α1 : ltac:(refine (std.thread.JoinHandle unit)) :=
                    std.thread.spawn
                      (let* _ : ltac:(refine unit) :=
                        let* _ : ltac:(refine unit) :=
                          let* α0 : ltac:(refine (array (ref str))) :=
                            M.alloc
                              [ mk_str "this is thread number "; mk_str "
" ] in
                          let* α1 : ltac:(refine (ref (array (ref str)))) :=
                            borrow α0 in
                          let* α2 : ltac:(refine (array (ref str))) :=
                            deref α1 in
                          let* α3 : ltac:(refine (ref (array (ref str)))) :=
                            borrow α2 in
                          let* α4 : ltac:(refine (ref (slice (ref str)))) :=
                            pointer_coercion "Unsize" α3 in
                          let* α5 : ltac:(refine (ref u32)) := borrow i in
                          let* α6 : ltac:(refine u32) := deref α5 in
                          let* α7 : ltac:(refine (ref u32)) := borrow α6 in
                          let* α8 : ltac:(refine core.fmt.rt.Argument) :=
                            core.fmt.rt.Argument::["new_display"] α7 in
                          let* α9 :
                              ltac:(refine (array core.fmt.rt.Argument)) :=
                            M.alloc [ α8 ] in
                          let* α10 :
                              ltac:(refine
                                (ref (array core.fmt.rt.Argument))) :=
                            borrow α9 in
                          let* α11 :
                              ltac:(refine (array core.fmt.rt.Argument)) :=
                            deref α10 in
                          let* α12 :
                              ltac:(refine
                                (ref (array core.fmt.rt.Argument))) :=
                            borrow α11 in
                          let* α13 :
                              ltac:(refine
                                (ref (slice core.fmt.rt.Argument))) :=
                            pointer_coercion "Unsize" α12 in
                          let* α14 : ltac:(refine core.fmt.Arguments) :=
                            core.fmt.Arguments::["new_v1"] α4 α13 in
                          std.io.stdio._print α14 in
                        M.alloc tt in
                      M.alloc tt) in
                  (alloc.vec.Vec
                        (std.thread.JoinHandle unit)
                        alloc.alloc.Global)::["push"]
                    α0
                    α1 in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α4 in
    let* α0 :
        ltac:(refine
          (alloc.vec.into_iter.IntoIter
            (std.thread.JoinHandle unit)
            alloc.alloc.Global)) :=
      (core.iter.traits.collect.IntoIterator.into_iter
          (Self :=
            alloc.vec.Vec (std.thread.JoinHandle unit) alloc.alloc.Global)
          (Trait := ltac:(refine _)))
        children in
    let* α1 := M.read α0 in
    let* α2 : ltac:(refine unit) :=
      match α1 with
      | iter =>
        loop
          (let* _ : ltac:(refine unit) :=
            let* α0 :
                ltac:(refine
                  (mut_ref
                    (alloc.vec.into_iter.IntoIter
                      (std.thread.JoinHandle unit)
                      alloc.alloc.Global))) :=
              borrow_mut iter in
            let* α1 :
                ltac:(refine
                  (alloc.vec.into_iter.IntoIter
                    (std.thread.JoinHandle unit)
                    alloc.alloc.Global)) :=
              deref α0 in
            let* α2 :
                ltac:(refine
                  (mut_ref
                    (alloc.vec.into_iter.IntoIter
                      (std.thread.JoinHandle unit)
                      alloc.alloc.Global))) :=
              borrow_mut α1 in
            let* α3 :
                ltac:(refine
                  (core.option.Option (std.thread.JoinHandle unit))) :=
              (core.iter.traits.iterator.Iterator.next
                  (Self :=
                    alloc.vec.into_iter.IntoIter
                      (std.thread.JoinHandle unit)
                      alloc.alloc.Global)
                  (Trait := ltac:(refine _)))
                α2 in
            let* α4 := M.read α3 in
            match α4 with
            | core.option.Option.None  =>
              let* α0 : ltac:(refine never) := Break in
              never_to_any α0
            | core.option.Option.Some child =>
              let* _ :
                  ltac:(refine
                    (core.result.Result
                      unit
                      (alloc.boxed.Box
                        type not implemented
                        alloc.alloc.Global))) :=
                (std.thread.JoinHandle unit)::["join"] child in
              M.alloc tt
            end in
          M.alloc tt)
      end in
    use α2).
