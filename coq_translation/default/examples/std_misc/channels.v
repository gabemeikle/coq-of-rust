(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition NTHREADS : i32.t := M.run (M.alloc 3).

(*
fn main() {
    // Channels have two endpoints: the `Sender<T>` and the `Receiver<T>`,
    // where `T` is the type of the message to be transferred
    // (type annotation is superfluous)
    let (tx, rx): (Sender<i32>, Receiver<i32>) = mpsc::channel();
    let mut children = Vec::new();

    for id in 0..NTHREADS {
        // The sender endpoint can be copied
        let thread_tx = tx.clone();

        // Each thread will send its id via the channel
        let child = thread::spawn(move || {
            // The thread takes ownership over `thread_tx`
            // Each thread queues a message in the channel
            thread_tx.send(id).unwrap();

            // Sending is a non-blocking operation, the thread will continue
            // immediately after sending its message
            println!("thread {} finished", id);
        });

        children.push(child);
    }

    // Here, all the messages are collected
    let mut ids = Vec::with_capacity(NTHREADS as usize);
    for _ in 0..NTHREADS {
        // The `recv` method picks a message from the channel
        // `recv` will block the current thread if there are no messages available
        ids.push(rx.recv());
    }

    // Wait for the threads to complete any remaining work
    for child in children {
        child.join().expect("oops! the child thread panicked");
    }

    // Show the order in which the messages were sent
    println!("{:?}", ids);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* '(tx, rx) :
        ltac:(refine
          (M.Val
            ((std.sync.mpsc.Sender.t i32.t)
            *
            (std.sync.mpsc.Receiver.t i32.t)))) :=
      std.sync.mpsc.channel in
    let* children :
        ltac:(refine
          (M.Val
            (alloc.vec.Vec.t
              (std.thread.JoinHandle.t unit)
              alloc.alloc.Global.t))) :=
      (alloc.vec.Vec.t
          (std.thread.JoinHandle.t unit)
          alloc.alloc.Global.t)::["new"] in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
      let* α1 := M.read α0 in
      let* α2 : ltac:(refine (M.Val i32.t)) := deref channels.NTHREADS in
      let* α3 := M.read α2 in
      let* α4 : ltac:(refine (M.Val (core.ops.range.Range.t i32.t))) :=
        M.alloc
          {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α3;
          |} in
      let* α5 : ltac:(refine (M.Val (core.ops.range.Range.t i32.t))) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.ops.range.Range.t i32.t)
            (Trait := ltac:(refine _)))
          α4 in
      let* α6 := M.read α5 in
      let* α7 : ltac:(refine (M.Val unit)) :=
        match α6 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : ltac:(refine (M.Val unit)) :=
              let* α0 :
                  ltac:(refine
                    (M.Val (mut_ref (core.ops.range.Range.t i32.t)))) :=
                borrow_mut iter in
              let* α1 : ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := core.ops.range.Range.t i32.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 := M.read α1 in
              match α2 with
              | core.option.Option.None  =>
                let* α0 : ltac:(refine (M.Val never.t)) := Break in
                never_to_any α0
              | core.option.Option.Some id =>
                let* id := M.alloc id in
                let* thread_tx :
                    ltac:(refine (M.Val (std.sync.mpsc.Sender.t i32.t))) :=
                  let* α0 :
                      ltac:(refine
                        (M.Val (ref (std.sync.mpsc.Sender.t i32.t)))) :=
                    borrow tx in
                  (core.clone.Clone.clone
                      (Self := std.sync.mpsc.Sender.t i32.t)
                      (Trait := ltac:(refine _)))
                    α0 in
                let* child :
                    ltac:(refine (M.Val (std.thread.JoinHandle.t unit))) :=
                  std.thread.spawn
                    (let* _ : ltac:(refine (M.Val unit)) :=
                      let* α0 :
                          ltac:(refine
                            (M.Val (ref (std.sync.mpsc.Sender.t i32.t)))) :=
                        borrow thread_tx in
                      let* α1 :
                          ltac:(refine
                            (M.Val
                              (core.result.Result.t
                                unit
                                (std.sync.mpsc.SendError.t i32.t)))) :=
                        (std.sync.mpsc.Sender.t i32.t)::["send"] α0 id in
                      (core.result.Result.t
                            unit
                            (std.sync.mpsc.SendError.t i32.t))::["unwrap"]
                        α1 in
                    let* _ : ltac:(refine (M.Val unit)) :=
                      let* _ : ltac:(refine (M.Val unit)) :=
                        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
                          M.alloc [ mk_str "thread "; mk_str " finished
" ] in
                        let* α1 :
                            ltac:(refine (M.Val (ref (array (ref str.t))))) :=
                          borrow α0 in
                        let* α2 :
                            ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
                          pointer_coercion "Unsize" α1 in
                        let* α3 : ltac:(refine (M.Val (ref i32.t))) :=
                          borrow id in
                        let* α4 :
                            ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                          core.fmt.rt.Argument.t::["new_display"] α3 in
                        let* α5 :
                            ltac:(refine
                              (M.Val (array core.fmt.rt.Argument.t))) :=
                          M.alloc [ α4 ] in
                        let* α6 :
                            ltac:(refine
                              (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
                          borrow α5 in
                        let* α7 :
                            ltac:(refine
                              (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
                          pointer_coercion "Unsize" α6 in
                        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
                          core.fmt.Arguments.t::["new_v1"] α2 α7 in
                        std.io.stdio._print α8 in
                      M.alloc tt in
                    M.alloc tt) in
                let* _ : ltac:(refine (M.Val unit)) :=
                  let* α0 :
                      ltac:(refine
                        (M.Val
                          (mut_ref
                            (alloc.vec.Vec.t
                              (std.thread.JoinHandle.t unit)
                              alloc.alloc.Global.t)))) :=
                    borrow_mut children in
                  (alloc.vec.Vec.t
                        (std.thread.JoinHandle.t unit)
                        alloc.alloc.Global.t)::["push"]
                    α0
                    child in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α7 in
    let* ids :
        ltac:(refine
          (M.Val
            (alloc.vec.Vec.t
              (core.result.Result.t i32.t std.sync.mpsc.RecvError.t)
              alloc.alloc.Global.t))) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := deref channels.NTHREADS in
      let* α1 : ltac:(refine (M.Val usize.t)) := cast α0 in
      (alloc.vec.Vec.t
            (core.result.Result.t i32.t std.sync.mpsc.RecvError.t)
            alloc.alloc.Global.t)::["with_capacity"]
        α1 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
      let* α1 := M.read α0 in
      let* α2 : ltac:(refine (M.Val i32.t)) := deref channels.NTHREADS in
      let* α3 := M.read α2 in
      let* α4 : ltac:(refine (M.Val (core.ops.range.Range.t i32.t))) :=
        M.alloc
          {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α3;
          |} in
      let* α5 : ltac:(refine (M.Val (core.ops.range.Range.t i32.t))) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.ops.range.Range.t i32.t)
            (Trait := ltac:(refine _)))
          α4 in
      let* α6 := M.read α5 in
      let* α7 : ltac:(refine (M.Val unit)) :=
        match α6 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : ltac:(refine (M.Val unit)) :=
              let* α0 :
                  ltac:(refine
                    (M.Val (mut_ref (core.ops.range.Range.t i32.t)))) :=
                borrow_mut iter in
              let* α1 : ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := core.ops.range.Range.t i32.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 := M.read α1 in
              match α2 with
              | core.option.Option.None  =>
                let* α0 : ltac:(refine (M.Val never.t)) := Break in
                never_to_any α0
              | core.option.Option.Some _ =>
                let* _ : ltac:(refine (M.Val unit)) :=
                  let* α0 :
                      ltac:(refine
                        (M.Val
                          (mut_ref
                            (alloc.vec.Vec.t
                              (core.result.Result.t
                                i32.t
                                std.sync.mpsc.RecvError.t)
                              alloc.alloc.Global.t)))) :=
                    borrow_mut ids in
                  let* α1 :
                      ltac:(refine
                        (M.Val (ref (std.sync.mpsc.Receiver.t i32.t)))) :=
                    borrow rx in
                  let* α2 :
                      ltac:(refine
                        (M.Val
                          (core.result.Result.t
                            i32.t
                            std.sync.mpsc.RecvError.t))) :=
                    (std.sync.mpsc.Receiver.t i32.t)::["recv"] α1 in
                  (alloc.vec.Vec.t
                        (core.result.Result.t i32.t std.sync.mpsc.RecvError.t)
                        alloc.alloc.Global.t)::["push"]
                    α0
                    α2 in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α7 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (alloc.vec.into_iter.IntoIter.t
                (std.thread.JoinHandle.t unit)
                alloc.alloc.Global.t))) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              alloc.vec.Vec.t
                (std.thread.JoinHandle.t unit)
                alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          children in
      let* α1 := M.read α0 in
      let* α2 : ltac:(refine (M.Val unit)) :=
        match α1 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : ltac:(refine (M.Val unit)) :=
              let* α0 :
                  ltac:(refine
                    (M.Val
                      (mut_ref
                        (alloc.vec.into_iter.IntoIter.t
                          (std.thread.JoinHandle.t unit)
                          alloc.alloc.Global.t)))) :=
                borrow_mut iter in
              let* α1 :
                  ltac:(refine
                    (M.Val
                      (core.option.Option.t (std.thread.JoinHandle.t unit)))) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self :=
                      alloc.vec.into_iter.IntoIter.t
                        (std.thread.JoinHandle.t unit)
                        alloc.alloc.Global.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 := M.read α1 in
              match α2 with
              | core.option.Option.None  =>
                let* α0 : ltac:(refine (M.Val never.t)) := Break in
                never_to_any α0
              | core.option.Option.Some child =>
                let* child := M.alloc child in
                let* _ : ltac:(refine (M.Val unit)) :=
                  let* α0 :
                      ltac:(refine
                        (M.Val
                          (core.result.Result.t
                            unit
                            (alloc.boxed.Box.t
                              type not implemented
                              alloc.alloc.Global.t)))) :=
                    (std.thread.JoinHandle.t unit)::["join"] child in
                  let* α1 : ltac:(refine (M.Val str.t)) :=
                    deref (mk_str "oops! the child thread panicked") in
                  let* α2 : ltac:(refine (M.Val (ref str.t))) := borrow α1 in
                  (core.result.Result.t
                        unit
                        (alloc.boxed.Box.t
                          type not implemented
                          alloc.alloc.Global.t))::["expect"]
                    α0
                    α2 in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α2 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str ""; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (alloc.vec.Vec.t
                    (core.result.Result.t i32.t std.sync.mpsc.RecvError.t)
                    alloc.alloc.Global.t)))) :=
          borrow ids in
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
    M.alloc tt).
