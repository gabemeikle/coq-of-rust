(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let array := [ 1; neg 2; 6 ] in
  match array with
  | _ =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "array[0] = 0, array[1] = "; ", array[2] = "; "\n" ]
        [
          _crate.fmt.ArgumentV1::["new_display"] second;
          _crate.fmt.ArgumentV1::["new_display"] third
        ]) ;;
    tt
  | _ =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "array[0] = 1, array[2] = "; " and array[1] was ignored\n" ]
        [ _crate.fmt.ArgumentV1::["new_display"] third ]) ;;
    tt
  | _ =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "array[0] = -1, array[1] = "; " and all the other ones were ignored\n"
        ]
        [ _crate.fmt.ArgumentV1::["new_display"] second ]) ;;
    tt
  | _ =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "array[0] = 3, array[1] = "; " and the other elements were "; "\n" ]
        [
          _crate.fmt.ArgumentV1::["new_display"] second;
          _crate.fmt.ArgumentV1::["new_debug"] tail
        ]) ;;
    tt
  | _ =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "array[0] = "; ", middle = "; ", array[2] = "; "\n" ]
        [
          _crate.fmt.ArgumentV1::["new_display"] first;
          _crate.fmt.ArgumentV1::["new_debug"] middle;
          _crate.fmt.ArgumentV1::["new_display"] last
        ]) ;;
    tt
  end.
