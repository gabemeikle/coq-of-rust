(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // File hosts must exist in current path before this produces output
    if let Ok(lines) = read_lines("./hosts") {
        // Consumes the iterator, returns an (Optional) String
        for line in lines {
            if let Ok(ip) = line {
                println!("{}", ip);
            }
        }
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* α0 : ref str.t := M.read (mk_str "./hosts") in
    let* α1 :
        core.result.Result.t
          (std.io.Lines.t (std.io.buffered.bufreader.BufReader.t std.fs.File.t))
          std.io.error.Error.t :=
      file_io_read_lines_efficient_method.read_lines α0 in
    let* α2 :
        M.Val
          (core.result.Result.t
            (std.io.Lines.t
              (std.io.buffered.bufreader.BufReader.t std.fs.File.t))
            std.io.error.Error.t) :=
      M.alloc α1 in
    let* α3 : M.Val bool.t := let_if core.result.Result.Ok lines := α2 in
    let* α4 : bool.t := M.read α3 in
    let* α5 : M.Val unit :=
      if (α4 : bool) then
        let* α0 :
            std.io.Lines.t
              (std.io.buffered.bufreader.BufReader.t std.fs.File.t) :=
          M.read lines in
        let* α1 :
            std.io.Lines.t
              (std.io.buffered.bufreader.BufReader.t std.fs.File.t) :=
          (core.iter.traits.collect.IntoIterator.into_iter
              (Self :=
                std.io.Lines.t
                  (std.io.buffered.bufreader.BufReader.t std.fs.File.t))
              (Trait := ltac:(refine _)))
            α0 in
        let* α2 :
            M.Val
              (std.io.Lines.t
                (std.io.buffered.bufreader.BufReader.t std.fs.File.t)) :=
          M.alloc α1 in
        let* α3 := M.read α2 in
        let* α4 : M.Val unit :=
          match α3 with
          | iter =>
            let* iter := M.alloc iter in
            loop
              (let* _ : M.Val unit :=
                let* α0 :
                    mut_ref
                      (std.io.Lines.t
                        (std.io.buffered.bufreader.BufReader.t
                          std.fs.File.t)) :=
                  borrow_mut iter in
                let* α1 :
                    M.Val
                      (std.io.Lines.t
                        (std.io.buffered.bufreader.BufReader.t
                          std.fs.File.t)) :=
                  deref α0 in
                let* α2 :
                    mut_ref
                      (std.io.Lines.t
                        (std.io.buffered.bufreader.BufReader.t
                          std.fs.File.t)) :=
                  borrow_mut α1 in
                let* α3 :
                    core.option.Option.t
                      (core.result.Result.t
                        alloc.string.String.t
                        std.io.error.Error.t) :=
                  (core.iter.traits.iterator.Iterator.next
                      (Self :=
                        std.io.Lines.t
                          (std.io.buffered.bufreader.BufReader.t std.fs.File.t))
                      (Trait := ltac:(refine _)))
                    α2 in
                let* α4 :
                    M.Val
                      (core.option.Option.t
                        (core.result.Result.t
                          alloc.string.String.t
                          std.io.error.Error.t)) :=
                  M.alloc α3 in
                let* α5 := M.read α4 in
                match α5 with
                | core.option.Option.None  =>
                  let* α0 : M.Val never.t := Break in
                  never_to_any α0
                | core.option.Option.Some line =>
                  let* line := M.alloc line in
                  let* α0 : M.Val bool.t :=
                    let_if core.result.Result.Ok ip := line in
                  let* α1 : bool.t := M.read α0 in
                  if (α1 : bool) then
                    let* _ : M.Val unit :=
                      let* _ : M.Val unit :=
                        let* α0 : M.Val (array (ref str.t)) :=
                          M.alloc [ mk_str ""; mk_str "
" ] in
                        let* α1 : ref (array (ref str.t)) := borrow α0 in
                        let* α2 : M.Val (array (ref str.t)) := deref α1 in
                        let* α3 : ref (array (ref str.t)) := borrow α2 in
                        let* α4 : M.Val (ref (array (ref str.t))) :=
                          M.alloc α3 in
                        let* α5 : M.Val (ref (slice (ref str.t))) :=
                          pointer_coercion "Unsize" α4 in
                        let* α6 : ref (slice (ref str.t)) := M.read α5 in
                        let* α7 : ref alloc.string.String.t := borrow ip in
                        let* α8 : M.Val alloc.string.String.t := deref α7 in
                        let* α9 : ref alloc.string.String.t := borrow α8 in
                        let* α10 : core.fmt.rt.Argument.t :=
                          core.fmt.rt.Argument.t::["new_display"] α9 in
                        let* α11 : M.Val core.fmt.rt.Argument.t :=
                          M.alloc α10 in
                        let* α12 : M.Val (array core.fmt.rt.Argument.t) :=
                          M.alloc [ α11 ] in
                        let* α13 : ref (array core.fmt.rt.Argument.t) :=
                          borrow α12 in
                        let* α14 : M.Val (array core.fmt.rt.Argument.t) :=
                          deref α13 in
                        let* α15 : ref (array core.fmt.rt.Argument.t) :=
                          borrow α14 in
                        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                          M.alloc α15 in
                        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
                          pointer_coercion "Unsize" α16 in
                        let* α18 : ref (slice core.fmt.rt.Argument.t) :=
                          M.read α17 in
                        let* α19 : core.fmt.Arguments.t :=
                          core.fmt.Arguments.t::["new_v1"] α6 α18 in
                        let* α20 : unit := std.io.stdio._print α19 in
                        M.alloc α20 in
                      M.alloc tt in
                    M.alloc tt
                  else
                    M.alloc tt
                end in
              M.alloc tt)
          end in
        use α4
      else
        M.alloc tt in
    M.read α5).

(*
fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where
    P: AsRef<Path>,
{
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}
*)
Definition read_lines
    {P : Set}
    {ℋ_0 : core.convert.AsRef.Trait P (T := std.path.Path.t)}
    (filename : P)
    :
      M
        ltac:(std.io.error.Result
          (std.io.Lines.t
            (std.io.buffered.bufreader.BufReader.t std.fs.File.t))) :=
  let return_ :=
    M.return_
      (R :=
        ltac:(std.io.error.Result
          (std.io.Lines.t
            (std.io.buffered.bufreader.BufReader.t std.fs.File.t)))) in
  let* filename : M.Val P := M.alloc filename in
  M.function_body
    (let* file : M.Val std.fs.File.t :=
      let* α0 : P := M.read filename in
      let* α1 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
        std.fs.File.t::["open"] α0 in
      let* α2 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              std.io.error.Error.t)
            std.fs.File.t :=
        (core.ops.try_trait.Try.branch
            (Self := core.result.Result.t std.fs.File.t std.io.error.Error.t)
            (Trait := ltac:(refine _)))
          α1 in
      let* α3 :
          M.Val
            (core.ops.control_flow.ControlFlow.t
              (core.result.Result.t
                core.convert.Infallible.t
                std.io.error.Error.t)
              std.fs.File.t) :=
        M.alloc α2 in
      let* α4 := M.read α3 in
      let* α5 : M.Val std.fs.File.t :=
        match α4 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 :
              core.result.Result.t
                core.convert.Infallible.t
                std.io.error.Error.t :=
            M.read residual in
          let* α1 :
              core.result.Result.t
                (std.io.Lines.t
                  (std.io.buffered.bufreader.BufReader.t std.fs.File.t))
                std.io.error.Error.t :=
            (core.ops.try_trait.FromResidual.from_residual
                (Self :=
                  core.result.Result.t
                    (std.io.Lines.t
                      (std.io.buffered.bufreader.BufReader.t std.fs.File.t))
                    std.io.error.Error.t)
                (Trait := ltac:(refine _)))
              α0 in
          let* α2 : M.Val never.t := return_ α1 in
          never_to_any α2
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      M.copy α5 in
    let* α0 : std.fs.File.t := M.read file in
    let* α1 : std.io.buffered.bufreader.BufReader.t std.fs.File.t :=
      (std.io.buffered.bufreader.BufReader.t std.fs.File.t)::["new"] α0 in
    let* α2 :
        std.io.Lines.t (std.io.buffered.bufreader.BufReader.t std.fs.File.t) :=
      (std.io.BufRead.lines
          (Self := std.io.buffered.bufreader.BufReader.t std.fs.File.t)
          (Trait := ltac:(refine _)))
        α1 in
    let* α0 :
        M.Val
          (core.result.Result.t
            (std.io.Lines.t
              (std.io.buffered.bufreader.BufReader.t std.fs.File.t))
            std.io.error.Error.t) :=
      M.alloc (core.result.Result.Ok α2) in
    M.read α0).
