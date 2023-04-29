(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let shadowed_binding := 1 in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "before being shadowed: "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_display"] shadowed_binding ]) ;;
  tt ;;
  let shadowed_binding := "abc" in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "shadowed in inner block: "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_display"] shadowed_binding ]) ;;
  tt ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "outside inner block: "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_display"] shadowed_binding ]) ;;
  tt ;;
  let shadowed_binding := 2 in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "shadowed in outer block: "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_display"] shadowed_binding ]) ;;
  tt ;;
  tt.
