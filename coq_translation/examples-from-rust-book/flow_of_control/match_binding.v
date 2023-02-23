(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition age (_ : unit) : u32 := 15.

Definition main (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Tell me what type of person you are\n" ]
      [  ]) ;;
  tt ;;
  match age tt with
  | Int(0, Unsuffixed) =>
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "I haven't celebrated my first birthday yet\n" ]
        [  ]) ;;
    tt
  | n =>
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "I'm a child of age "; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_debug n ]) ;;
    tt
  | n =>
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "I'm a teen of age "; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_debug n ]) ;;
    tt
  | n =>
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "I'm an old person of age "; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_debug n ]) ;;
    tt
  end.
