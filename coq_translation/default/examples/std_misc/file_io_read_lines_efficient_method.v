(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* α0 :=
    file_io_read_lines_efficient_method.read_lines (mk_str "./hosts") in
  let* α1 := let_if core.result.Result lines := α0 in
  if (α1 : bool) then
    let* α0 :=
      (core.iter.traits.collect.IntoIterator.into_iter
          (Self :=
            (std.io.Lines (std.io.buffered.bufreader.BufReader std.fs.File))))
        lines in
    let* α1 :=
      match α0 with
      | iter =>
        loop
          (let* _ :=
            let* α0 :=
              borrow_mut
                iter
                (std.io.Lines
                  (std.io.buffered.bufreader.BufReader std.fs.File)) in
            let* α1 :=
              deref
                α0
                (std.io.Lines
                  (std.io.buffered.bufreader.BufReader std.fs.File)) in
            let* α2 :=
              borrow_mut
                α1
                (std.io.Lines
                  (std.io.buffered.bufreader.BufReader std.fs.File)) in
            let* α3 :=
              (core.iter.traits.iterator.Iterator.next
                  (Self :=
                    (std.io.Lines
                      (std.io.buffered.bufreader.BufReader std.fs.File))))
                α2 in
            match α3 with
            | core.option.Option  =>
              let* α0 := Break in
              never_to_any α0
            | core.option.Option line =>
              let* α0 := let_if core.result.Result ip := line in
              if (α0 : bool) then
                let* _ :=
                  let* _ :=
                    let* α0 :=
                      borrow [ mk_str ""; mk_str "
" ] (list (ref str)) in
                    let* α1 := deref α0 (list (ref str)) in
                    let* α2 := borrow α1 (list (ref str)) in
                    let* α3 := pointer_coercion "Unsize" α2 in
                    let* α4 := borrow ip alloc.string.String in
                    let* α5 := deref α4 alloc.string.String in
                    let* α6 := borrow α5 alloc.string.String in
                    let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
                    let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
                    let* α9 := deref α8 (list core.fmt.rt.Argument) in
                    let* α10 := borrow α9 (list core.fmt.rt.Argument) in
                    let* α11 := pointer_coercion "Unsize" α10 in
                    let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
                    std.io.stdio._print α12 in
                  M.alloc tt in
                M.alloc tt
              else
                M.alloc tt
            end in
          M.alloc tt)
      end in
    use α1
  else
    M.alloc tt.

Definition read_lines
    `{ℋ : State.Trait}
    {P : Set}
    {ℋ_0 : core.convert.AsRef.Trait P (T := std.path.Path)}
    (filename : P)
    :
      M
        ltac:(std.io.error.Result
          constr:(std.io.Lines
            (std.io.buffered.bufreader.BufReader std.fs.File))) :=
  let* file :=
    let* α0 := std.fs.File::["open"] filename in
    let* α1 :=
      (core.ops.try_trait.Try.branch
          (Self := (core.result.Result std.fs.File std.io.error.Error)))
        α0 in
    match α1 with
    | core.ops.control_flow.ControlFlow residual =>
      let* α0 :=
        (core.ops.try_trait.FromResidual.from_residual
            (Self :=
              (core.result.Result
                (std.io.Lines (std.io.buffered.bufreader.BufReader std.fs.File))
                std.io.error.Error)))
          residual in
      let* α1 := Return α0 in
      never_to_any α1
    | core.ops.control_flow.ControlFlow val => Pure val
    end in
  let* α0 := (std.io.buffered.bufreader.BufReader R)::["new"] file in
  let* α1 :=
    (std.io.BufRead.lines
        (Self := (std.io.buffered.bufreader.BufReader std.fs.File)))
      α0 in
  M.alloc (core.result.Result.Ok α1).
