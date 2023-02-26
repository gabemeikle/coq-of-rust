(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Error Enum.

Definition main (_ : unit) : unit :=
  let a := Foo.Bar in
  let b := Foo.Baz in
  let c := Foo.Qux 100 in
  if let_if Foo.Bar := a then
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1 [ "a is foobar\n" ] [  ]) ;;
    tt ;;
    tt
  else
    tt ;;
  if let_if Foo.Bar := b then
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1 [ "b is foobar\n" ] [  ]) ;;
    tt ;;
    tt
  else
    tt ;;
  if let_if Foo.Qux (value) := c then
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "c is "; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_display value ]) ;;
    tt ;;
    tt
  else
    tt ;;
  if let_if Foo.Qux (value) := c then
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1 [ "c is one hundred\n" ] [  ]) ;;
    tt ;;
    tt
  else
    tt.
