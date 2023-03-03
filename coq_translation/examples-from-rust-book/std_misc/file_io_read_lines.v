(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module File := std.fs.File.
Definition File := File.t.

Module io := std.io.

Module BufRead := std.io.BufRead.

Module BufReader := std.io.BufReader.
Definition BufReader := BufReader.t.

Definition read_lines (filename : String) : io.Lines :=
  let file := method "unwrap" (ImplFile.open filename) in
  Return (method "lines" (io.ImplBufReader.new file)) ;;
  tt.

Definition main (_ : unit) : unit :=
  let lines := read_lines (method "to_string" "./hosts") in
  match into_iter lines with
  | iter =>
    loop
      match next iter with
      | None => Break
      | Some {| Some.0 := line; |} =>
        _crate.io._print
          (_crate.fmt.ImplArguments.new_v1
            [ ""; "\n" ]
            [ _crate.fmt.ImplArgumentV1.new_display (method "unwrap" line) ]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end.
