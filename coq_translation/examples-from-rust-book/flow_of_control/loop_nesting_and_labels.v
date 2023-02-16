(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition main (_ : unit) :=
  loop _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Entered the outer loop\n"] []) ;;
  tt ;;
  loop _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Entered the inner loop\n"] []) ;;
  tt ;;
  Break ;;
  tt from loop ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["This point will never be reached\n"]
      []) ;;
  tt ;;
  tt from loop ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Exited the outer loop\n"] []) ;;
  tt ;;
  tt.