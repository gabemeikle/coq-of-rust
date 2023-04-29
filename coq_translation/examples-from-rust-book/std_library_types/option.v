(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition checked_division (dividend : i32) (divisor : i32) : Option i32 :=
  if (divisor.["eq"] 0 : bool) then
    None
  else
    Some (dividend.["div"] divisor).

Definition try_division (dividend : i32) (divisor : i32) : unit :=
  match checked_division dividend divisor with
  | None =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ ""; " / "; " failed!
" ]
        [
          _crate.fmt.ArgumentV1::["new_display"] dividend;
          _crate.fmt.ArgumentV1::["new_display"] divisor
        ]) ;;
    tt
  | Some quotient =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ ""; " / "; " = "; "
" ]
        [
          _crate.fmt.ArgumentV1::["new_display"] dividend;
          _crate.fmt.ArgumentV1::["new_display"] divisor;
          _crate.fmt.ArgumentV1::["new_display"] quotient
        ]) ;;
    tt
  end.

Definition main (_ : unit) : unit :=
  try_division 4 2 ;;
  try_division 1 0 ;;
  let none := None in
  let _equivalent_none := None in
  let optional_float := Some 0 (* 0 *) in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; " unwraps to "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_debug"] optional_float;
        _crate.fmt.ArgumentV1::["new_debug"] optional_float.["unwrap"]
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; " unwraps to "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_debug"] none;
        _crate.fmt.ArgumentV1::["new_debug"] none.["unwrap"]
      ]) ;;
  tt ;;
  tt.
