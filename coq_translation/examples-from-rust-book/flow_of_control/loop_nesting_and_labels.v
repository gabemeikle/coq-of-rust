(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  loop
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"] [ "Entered the outer loop\n" ] [  ]) ;;
    tt ;;
    loop
      _crate.io._print
        (_crate.fmt.Arguments::["new_v1"]
          [ "Entered the inner loop\n" ]
          [  ]) ;;
      tt ;;
      Break ;;
      tt
      from
      loop ;;
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "This point will never be reached\n" ]
        [  ]) ;;
    tt ;;
    tt
    from
    loop ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"] [ "Exited the outer loop\n" ] [  ]) ;;
  tt ;;
  tt.
