(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition main (_ : unit) :=
  let an_integer := 1 in
  let a_boolean := true in
  let unit := () in
  let copied_integer := an_integer in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["An integer: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug copied_integer]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["A boolean: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug a_boolean]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Meet the unit value: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug unit]) ;;
  tt ;;
  let _unused_variable := 3 in
  let _noisy_unused_variable := 2 in
  tt.