(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition LANGUAGE (_ : unit) := "Rust".

Definition THRESHOLD (_ : unit) := 10.

Definition is_big (n : i32) : bool := gt n THRESHOLD.

Definition main (_ : unit) : unit :=
  let n := 16 in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "This is "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display LANGUAGE ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "The threshold is "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display THRESHOLD ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ ""; " is "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_display n;
        _crate.fmt.ImplArgumentV1.new_display
          (if is_big n then
            "big"
          else
            "small")
      ]) ;;
  tt ;;
  tt.
