(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition main (_ : unit) : unit :=
  let val := add 1 2 in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ ""; " = "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_display "1 + 2";
        _crate.fmt.ImplArgumentV1.new_display val
      ]) ;;
  tt ;;
  tt ;;
  let val := mul (add 1 2) (div 3 4) in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ ""; " = "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_display "(1 + 2) * (3 / 4)";
        _crate.fmt.ImplArgumentV1.new_display val
      ]) ;;
  tt ;;
  tt.
