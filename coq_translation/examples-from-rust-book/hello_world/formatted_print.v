(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; " days
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] 31 ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1_formatted"]
      [ ""; ", this is "; ". "; ", this is "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] "Alice";
        _crate.fmt.ArgumentV1::["new_display"] "Bob"
      ]
      [
        {|
          _crate.fmt.rt.v1.Argument.position := 0;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := " "%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Unknown;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width :=
                _crate.fmt.rt.v1.Count.Implied;
            |};
        |};
        {|
          _crate.fmt.rt.v1.Argument.position := 1;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := " "%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Unknown;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width :=
                _crate.fmt.rt.v1.Count.Implied;
            |};
        |};
        {|
          _crate.fmt.rt.v1.Argument.position := 1;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := " "%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Unknown;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width :=
                _crate.fmt.rt.v1.Count.Implied;
            |};
        |};
        {|
          _crate.fmt.rt.v1.Argument.position := 0;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := " "%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Unknown;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width :=
                _crate.fmt.rt.v1.Count.Implied;
            |};
        |}
      ]
      (_crate.fmt.UnsafeArg::["new"] tt)) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; " "; " "; "
" ]
      match ("the lazy dog", "the quick brown fox", "jumps over") with
      | args =>
        [
          _crate.fmt.ArgumentV1::["new_display"] (args.[1]);
          _crate.fmt.ArgumentV1::["new_display"] (args.[2]);
          _crate.fmt.ArgumentV1::["new_display"] (args.[0])
        ]
      end) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Base 10:               "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] 69420 ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Base 2 (binary):       "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_binary"] 69420 ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Base 8 (octal):        "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_octal"] 69420 ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Base 16 (hexadecimal): "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_lower_hex"] 69420 ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Base 16 (hexadecimal): "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_upper_hex"] 69420 ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1_formatted"]
      [ ""; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] 1 ]
      [
        {|
          _crate.fmt.rt.v1.Argument.position := 0;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := " "%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Right;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width := _crate.fmt.rt.v1.Count.Is 5;
            |};
        |}
      ]
      (_crate.fmt.UnsafeArg::["new"] tt)) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1_formatted"]
      [ ""; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] 1 ]
      [
        {|
          _crate.fmt.rt.v1.Argument.position := 0;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := "0"%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Left;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width := _crate.fmt.rt.v1.Count.Is 5;
            |};
        |}
      ]
      (_crate.fmt.UnsafeArg::["new"] tt)) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1_formatted"]
      [ ""; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] 1;
        _crate.fmt.ArgumentV1::["from_usize"] 5
      ]
      [
        {|
          _crate.fmt.rt.v1.Argument.position := 0;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := "0"%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Right;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width :=
                _crate.fmt.rt.v1.Count.Param 1;
            |};
        |}
      ]
      (_crate.fmt.UnsafeArg::["new"] tt)) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1_formatted"]
      [ "My name is "; ", "; " "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] "Bond";
        _crate.fmt.ArgumentV1::["new_display"] "James"
      ]
      [
        {|
          _crate.fmt.rt.v1.Argument.position := 0;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := " "%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Unknown;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width :=
                _crate.fmt.rt.v1.Count.Implied;
            |};
        |};
        {|
          _crate.fmt.rt.v1.Argument.position := 1;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := " "%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Unknown;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width :=
                _crate.fmt.rt.v1.Count.Implied;
            |};
        |};
        {|
          _crate.fmt.rt.v1.Argument.position := 0;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := " "%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Unknown;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width :=
                _crate.fmt.rt.v1.Count.Implied;
            |};
        |}
      ]
      (_crate.fmt.UnsafeArg::["new"] tt)) ;;
  tt ;;
  let number := 1 (* 1.0 *) in
  let width := 5 in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1_formatted"]
      [ ""; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] number;
        _crate.fmt.ArgumentV1::["from_usize"] width
      ]
      [
        {|
          _crate.fmt.rt.v1.Argument.position := 0;
          _crate.fmt.rt.v1.Argument.format :=
            {|
              _crate.fmt.rt.v1.FormatSpec.fill := " "%char;
              _crate.fmt.rt.v1.FormatSpec.align :=
                _crate.fmt.rt.v1.Alignment.Right;
              _crate.fmt.rt.v1.FormatSpec.flags := 0;
              _crate.fmt.rt.v1.FormatSpec.precision :=
                _crate.fmt.rt.v1.Count.Implied;
              _crate.fmt.rt.v1.FormatSpec.width :=
                _crate.fmt.rt.v1.Count.Param 1;
            |};
        |}
      ]
      (_crate.fmt.UnsafeArg::["new"] tt)) ;;
  tt ;;
  tt.

Module Structure.
  Record t : Set := { _ : i32;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Structure.
Definition Structure := Structure.t.
