(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // This variable declaration is where its value is specified.
    let apple = Arc::new("the same apple");

    for _ in 0..10 {
        // Here there is no value specification as it is a pointer to a
        // reference in the memory heap.
        let apple = Arc::clone(&apple);

        thread::spawn(move || {
            // As Arc was used, threads can be spawned using the value allocated
            // in the Arc variable pointer's location.
            println!("{:?}", apple);
        });
    }

    // Make sure all Arc instances are printed from spawned threads.
    thread::sleep(Duration::from_secs(1));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* apple : M.Val (alloc.sync.Arc.t (ref str.t)) :=
    let* α0 : ref str.t := M.read (mk_str "the same apple") in
    let* α1 : alloc.sync.Arc.t (ref str.t) :=
      M.call ((alloc.sync.Arc.t (ref str.t))::["new"] α0) in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* α0 : core.ops.range.Range.t i32.t :=
      M.call
        ((core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.ops.range.Range.t i32.t)
            (Trait := ltac:(refine _)))
          {|
            core.ops.range.Range.start := Integer.of_Z 0;
            core.ops.range.Range.end_ := Integer.of_Z 10;
          |}) in
    let* α1 : M.Val (core.ops.range.Range.t i32.t) := M.alloc α0 in
    let* α2 : M.Val unit :=
      match_operator
        α1
        [
          fun γ =>
            (let* iter := M.copy γ in
            M.loop
              (let* _ : M.Val unit :=
                let* α0 : core.option.Option.t i32.t :=
                  M.call
                    ((core.iter.traits.iterator.Iterator.next
                        (Self := core.ops.range.Range.t i32.t)
                        (Trait := ltac:(refine _)))
                      (borrow_mut iter)) in
                let* α1 : M.Val (core.option.Option.t i32.t) := M.alloc α0 in
                match_operator
                  α1
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
                        let γ0 := γ.["Some.0"] in
                        let* apple : M.Val (alloc.sync.Arc.t (ref str.t)) :=
                          let* α0 : alloc.sync.Arc.t (ref str.t) :=
                            M.call
                              ((core.clone.Clone.clone
                                  (Self := alloc.sync.Arc.t (ref str.t))
                                  (Trait := ltac:(refine _)))
                                (borrow apple)) in
                          M.alloc α0 in
                        let* _ : M.Val (std.thread.JoinHandle.t unit) :=
                          let* α0 : std.thread.JoinHandle.t unit :=
                            M.call
                              (std.thread.spawn
                                ((let* _ : M.Val unit :=
                                  let* _ : M.Val unit :=
                                    let* α0 : ref str.t := M.read (mk_str "") in
                                    let* α1 : ref str.t :=
                                      M.read (mk_str "
") in
                                    let* α2 : M.Val (array (ref str.t)) :=
                                      M.alloc [ α0; α1 ] in
                                    let* α3 : M.Val (ref (array (ref str.t))) :=
                                      M.alloc (borrow α2) in
                                    let* α4 : ref (slice (ref str.t)) :=
                                      M.read (pointer_coercion "Unsize" α3) in
                                    let* α5 : core.fmt.rt.Argument.t :=
                                      M.call
                                        (core.fmt.rt.Argument.t::["new_debug"]
                                          (borrow apple)) in
                                    let* α6 :
                                        M.Val (array core.fmt.rt.Argument.t) :=
                                      M.alloc [ α5 ] in
                                    let* α7 :
                                        M.Val
                                          (ref
                                            (array core.fmt.rt.Argument.t)) :=
                                      M.alloc (borrow α6) in
                                    let* α8 :
                                        ref (slice core.fmt.rt.Argument.t) :=
                                      M.read (pointer_coercion "Unsize" α7) in
                                    let* α9 : core.fmt.Arguments.t :=
                                      M.call
                                        (core.fmt.Arguments.t::["new_v1"]
                                          α4
                                          α8) in
                                    let* α10 : unit :=
                                      M.call (std.io.stdio._print α9) in
                                    M.alloc α10 in
                                  M.alloc tt in
                                let* α0 : M.Val unit := M.alloc tt in
                                M.read α0) :
                                M unit)) in
                          M.alloc α0 in
                        M.alloc tt
                      | _ => M.break_match
                      end) :
                      M (M.Val unit)
                  ] in
              M.alloc tt)) :
            M (M.Val unit)
        ] in
    M.pure (use α2) in
  let* _ : M.Val unit :=
    let* α0 : core.time.Duration.t :=
      M.call (core.time.Duration.t::["from_secs"] (Integer.of_Z 1)) in
    let* α1 : unit := M.call (std.thread.sleep α0) in
    M.alloc α1 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
