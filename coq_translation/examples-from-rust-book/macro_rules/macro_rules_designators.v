(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition foo (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["You called ";"()\n"]
      [_crate::fmt::ImplArgumentV1.new_debug "foo"]) ;;
  tt ;;
  tt.

Definition bar (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["You called ";"()\n"]
      [_crate::fmt::ImplArgumentV1.new_debug "bar"]) ;;
  tt ;;
  tt.

Definition main (_ : unit) :=
  foo tt ;;
  bar tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";" = ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug
        "1u32 + 1";_crate::fmt::ImplArgumentV1.new_debug (add 1 1)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";" = ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug
        "{ let x = 1u32; x * x + 2 * x - 1 }";_crate::fmt::ImplArgumentV1.new_debug
        let x := 1 in
        sub (add (mul x x) (mul 2 x)) 1]) ;;
  tt ;;
  tt.
