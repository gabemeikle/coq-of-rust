(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn read_lines(filename: String) -> io::Lines<BufReader<File>> {
    // Open the file in read-only mode.
    let file = File::open(filename).unwrap();
    // Read the file line by line, and return an iterator of the lines of the file.
    return io::BufReader::new(file).lines();
}
*)
Definition read_lines
    (filename : alloc.string.String.t)
    :
      M
        (std.io.Lines.t
          (std.io.buffered.bufreader.BufReader.t std.fs.File.t)) :=
  let* filename := M.alloc filename in
  let return_ :=
    M.return_
      (R :=
        std.io.Lines.t (std.io.buffered.bufreader.BufReader.t std.fs.File.t)) in
  M.catch_return
    (let* file : M.Val std.fs.File.t :=
      let* α0 : alloc.string.String.t := M.read filename in
      let* α1 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
        M.call (std.fs.File.t::["open"] α0) in
      let* α2 : std.fs.File.t :=
        M.call
          ((core.result.Result.t std.fs.File.t std.io.error.Error.t)::["unwrap"]
            α1) in
      M.alloc α2 in
    let* _ : M.Val never.t :=
      let* α0 : _ :=
        ltac:(M.get_method (fun ℐ =>
          std.io.BufRead.lines
            (Self := std.io.buffered.bufreader.BufReader.t std.fs.File.t)
            (Trait := ℐ))) in
      let* α1 : std.fs.File.t := M.read file in
      let* α2 : std.io.buffered.bufreader.BufReader.t std.fs.File.t :=
        M.call
          ((std.io.buffered.bufreader.BufReader.t std.fs.File.t)::["new"] α1) in
      let* α3 :
          std.io.Lines.t
            (std.io.buffered.bufreader.BufReader.t std.fs.File.t) :=
        M.call (α0 α2) in
      return_ α3 in
    let* α0 : M.Val unit := M.alloc tt in
    let* α1 := M.read α0 in
    never_to_any α1).

(*
fn main() {
    // Stores the iterator of lines of the file in lines variable.
    let lines = read_lines("./hosts".to_string());
    // Iterate over the lines of the file, and in this case print them.
    for line in lines {
        println!("{}", line.unwrap());
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* lines :
      M.Val
        (std.io.Lines.t
          (std.io.buffered.bufreader.BufReader.t std.fs.File.t)) :=
    let* α0 : _ :=
      ltac:(M.get_method (fun ℐ =>
        alloc.string.ToString.to_string (Self := str.t) (Trait := ℐ))) in
    let* α1 : ref str.t := M.read (mk_str "./hosts") in
    let* α2 : alloc.string.String.t := M.call (α0 α1) in
    let* α3 :
        std.io.Lines.t (std.io.buffered.bufreader.BufReader.t std.fs.File.t) :=
      M.call (file_io_read_lines.read_lines α2) in
    M.alloc α3 in
  let* α0 : _ :=
    ltac:(M.get_method (fun ℐ =>
      core.iter.traits.collect.IntoIterator.into_iter
        (Self :=
          std.io.Lines.t (std.io.buffered.bufreader.BufReader.t std.fs.File.t))
        (Trait := ℐ))) in
  let* α1 :
      std.io.Lines.t (std.io.buffered.bufreader.BufReader.t std.fs.File.t) :=
    M.read lines in
  let* α2 :
      std.io.Lines.t (std.io.buffered.bufreader.BufReader.t std.fs.File.t) :=
    M.call (α0 α1) in
  let* α3 :
      M.Val
        (std.io.Lines.t
          (std.io.buffered.bufreader.BufReader.t std.fs.File.t)) :=
    M.alloc α2 in
  let* α4 : M.Val unit :=
    match_operator
      α3
      [
        fun γ =>
          (let* iter := M.copy γ in
          M.loop
            (let* _ : M.Val unit :=
              let* α0 : _ :=
                ltac:(M.get_method (fun ℐ =>
                  core.iter.traits.iterator.Iterator.next
                    (Self :=
                      std.io.Lines.t
                        (std.io.buffered.bufreader.BufReader.t std.fs.File.t))
                    (Trait := ℐ))) in
              let* α1 :
                  core.option.Option.t
                    (core.result.Result.t
                      alloc.string.String.t
                      std.io.error.Error.t) :=
                M.call (α0 (borrow_mut iter)) in
              let* α2 :
                  M.Val
                    (core.option.Option.t
                      (core.result.Result.t
                        alloc.string.String.t
                        std.io.error.Error.t)) :=
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
                      let* line := M.copy γ0_0 in
                      let* _ : M.Val unit :=
                        let* _ : M.Val unit :=
                          let* α0 : ref str.t := M.read (mk_str "") in
                          let* α1 : ref str.t := M.read (mk_str "
") in
                          let* α2 : M.Val (array (ref str.t)) :=
                            M.alloc [ α0; α1 ] in
                          let* α3 : M.Val (ref (array (ref str.t))) :=
                            M.alloc (borrow α2) in
                          let* α4 : ref (slice (ref str.t)) :=
                            M.read (pointer_coercion "Unsize" α3) in
                          let* α5 :
                              core.result.Result.t
                                alloc.string.String.t
                                std.io.error.Error.t :=
                            M.read line in
                          let* α6 : alloc.string.String.t :=
                            M.call
                              ((core.result.Result.t
                                    alloc.string.String.t
                                    std.io.error.Error.t)::["unwrap"]
                                α5) in
                          let* α7 : M.Val alloc.string.String.t := M.alloc α6 in
                          let* α8 : core.fmt.rt.Argument.t :=
                            M.call
                              (core.fmt.rt.Argument.t::["new_display"]
                                (borrow α7)) in
                          let* α9 : M.Val (array core.fmt.rt.Argument.t) :=
                            M.alloc [ α8 ] in
                          let* α10 :
                              M.Val (ref (array core.fmt.rt.Argument.t)) :=
                            M.alloc (borrow α9) in
                          let* α11 : ref (slice core.fmt.rt.Argument.t) :=
                            M.read (pointer_coercion "Unsize" α10) in
                          let* α12 : core.fmt.Arguments.t :=
                            M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
                          let* α13 : unit := M.call (std.io.stdio._print α12) in
                          M.alloc α13 in
                        M.alloc tt in
                      M.alloc tt
                    | _ => M.break_match
                    end) :
                    M (M.Val unit)
                ] in
            M.alloc tt)) :
          M (M.Val unit)
      ] in
  M.read (use α4).
