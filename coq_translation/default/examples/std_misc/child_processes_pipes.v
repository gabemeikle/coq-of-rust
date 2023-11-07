(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition PANGRAM `{ℋ : State.Trait} : ref str :=
  M.run (M.pure (mk_str "the quick brown fox jumped over the lazy dog
")).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* process : ltac:(refine std.process.Child) :=
      let* α0 : ltac:(refine std.process.Command) :=
        std.process.Command::["new"] (mk_str "wc") in
      let* α1 : ltac:(refine (mut_ref std.process.Command)) := borrow_mut α0 in
      let* α2 : ltac:(refine std.process.Stdio) :=
        std.process.Stdio::["piped"] in
      let* α3 : ltac:(refine (mut_ref std.process.Command)) :=
        std.process.Command::["stdin"] α1 α2 in
      let* α4 : ltac:(refine std.process.Command) := deref α3 in
      let* α5 : ltac:(refine (mut_ref std.process.Command)) := borrow_mut α4 in
      let* α6 : ltac:(refine std.process.Stdio) :=
        std.process.Stdio::["piped"] in
      let* α7 : ltac:(refine (mut_ref std.process.Command)) :=
        std.process.Command::["stdout"] α5 α6 in
      let* α8 : ltac:(refine std.process.Command) := deref α7 in
      let* α9 : ltac:(refine (mut_ref std.process.Command)) := borrow_mut α8 in
      let* α10 :
          ltac:(refine
            (core.result.Result std.process.Child std.io.error.Error)) :=
        std.process.Command::["spawn"] α9 in
      let* α11 := M.read α10 in
      match α11 with
      | core.result.Result.Err why =>
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "couldn't spawn wc: " ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref std.io.error.Error)) := borrow why in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α3 in
        let* α5 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α5 in
        let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α7 in
        let* α9 : ltac:(refine never) := core.panicking.panic_fmt α8 in
        never_to_any α9
      | core.result.Result.Ok process => M.pure process
      end in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (core.option.Option std.process.ChildStdin)) :=
        process.["stdin"] in
      let* α1 : ltac:(refine std.process.ChildStdin) :=
        (core.option.Option std.process.ChildStdin)::["unwrap"] α0 in
      let* α2 : ltac:(refine (mut_ref std.process.ChildStdin)) :=
        borrow_mut α1 in
      let* α3 : ltac:(refine (ref str)) :=
        deref child_processes_pipes.PANGRAM in
      let* α4 : ltac:(refine str) := deref α3 in
      let* α5 : ltac:(refine (ref str)) := borrow α4 in
      let* α6 : ltac:(refine (ref (slice u8))) := str::["as_bytes"] α5 in
      let* α7 : ltac:(refine (slice u8)) := deref α6 in
      let* α8 : ltac:(refine (ref (slice u8))) := borrow α7 in
      let* α9 : ltac:(refine (core.result.Result unit std.io.error.Error)) :=
        (std.io.Write.write_all
            (Self := std.process.ChildStdin)
            (Trait := ltac:(refine _)))
          α2
          α8 in
      let* α10 := M.read α9 in
      match α10 with
      | core.result.Result.Err why =>
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "couldn't write to wc stdin: " ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref std.io.error.Error)) := borrow why in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α3 in
        let* α5 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α5 in
        let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α7 in
        let* α9 : ltac:(refine never) := core.panicking.panic_fmt α8 in
        never_to_any α9
      | core.result.Result.Ok _ =>
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine (array (ref str))) :=
            M.alloc [ mk_str "sent pangram to wc
" ] in
          let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
          let* α2 : ltac:(refine (ref (slice (ref str)))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine core.fmt.Arguments) :=
            core.fmt.Arguments::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt
      end in
    let* s : ltac:(refine alloc.string.String) :=
      alloc.string.String::["new"] in
    let* α0 : ltac:(refine (core.option.Option std.process.ChildStdout)) :=
      process.["stdout"] in
    let* α1 : ltac:(refine std.process.ChildStdout) :=
      (core.option.Option std.process.ChildStdout)::["unwrap"] α0 in
    let* α2 : ltac:(refine (mut_ref std.process.ChildStdout)) :=
      borrow_mut α1 in
    let* α3 : ltac:(refine (mut_ref alloc.string.String)) := borrow_mut s in
    let* α4 : ltac:(refine (core.result.Result usize std.io.error.Error)) :=
      (std.io.Read.read_to_string
          (Self := std.process.ChildStdout)
          (Trait := ltac:(refine _)))
        α2
        α3 in
    let* α5 := M.read α4 in
    match α5 with
    | core.result.Result.Err why =>
      let* α0 : ltac:(refine (array (ref str))) :=
        M.alloc [ mk_str "couldn't read wc stdout: " ] in
      let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
      let* α2 : ltac:(refine (ref (slice (ref str)))) :=
        pointer_coercion "Unsize" α1 in
      let* α3 : ltac:(refine (ref std.io.error.Error)) := borrow why in
      let* α4 : ltac:(refine core.fmt.rt.Argument) :=
        core.fmt.rt.Argument::["new_display"] α3 in
      let* α5 : ltac:(refine (array core.fmt.rt.Argument)) := M.alloc [ α4 ] in
      let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) := borrow α5 in
      let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
        pointer_coercion "Unsize" α6 in
      let* α8 : ltac:(refine core.fmt.Arguments) :=
        core.fmt.Arguments::["new_v1"] α2 α7 in
      let* α9 : ltac:(refine never) := core.panicking.panic_fmt α8 in
      never_to_any α9
    | core.result.Result.Ok _ =>
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "wc responded with:
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref alloc.string.String)) := borrow s in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α3 in
        let* α5 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α5 in
        let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt
    end).
