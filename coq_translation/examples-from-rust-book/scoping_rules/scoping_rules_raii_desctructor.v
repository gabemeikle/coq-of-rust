(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Error Struct.

(* Impl [ToDrop] of trait [Drop]*)
Module ImplToDrop.
  Definition drop (self : ref Self) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1 ["ToDrop is being dropped\n"] []) ;;
    tt ;;
    tt.
End ImplToDrop.
(* End impl [ToDrop] *)

Definition main (_ : unit) :=
  let x := ToDrop in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Made a ToDrop!\n"] []) ;;
  tt ;;
  tt.