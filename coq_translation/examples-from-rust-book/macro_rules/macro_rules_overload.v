(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ ""; " and "; " is "; "\n" ]
      match
        ("1i32 + 1 == 2i32",
          "2i32 * 2 == 4i32",
          andb (eqb (add 1 1) 2) (eqb (mul 2 2) 4))
      with
      | args =>
        [
          _crate.fmt.ImplArgumentV1.new_debug
            (IndexedField.get (index := 0) args);
          _crate.fmt.ImplArgumentV1.new_debug
            (IndexedField.get (index := 1) args);
          _crate.fmt.ImplArgumentV1.new_debug
            (IndexedField.get (index := 2) args)
        ]
      end) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ ""; " or "; " is "; "\n" ]
      match ("true", "false", or true false) with
      | args =>
        [
          _crate.fmt.ImplArgumentV1.new_debug
            (IndexedField.get (index := 0) args);
          _crate.fmt.ImplArgumentV1.new_debug
            (IndexedField.get (index := 1) args);
          _crate.fmt.ImplArgumentV1.new_debug
            (IndexedField.get (index := 2) args)
        ]
      end) ;;
  tt ;;
  tt.
