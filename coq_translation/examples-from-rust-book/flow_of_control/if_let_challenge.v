(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Error Enum.

Definition main (_ : unit) :=
  let a := Foo.Bar in
  if let_if Foo.Bar := a then
    _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["a is foobar\n"] []) ;;
    tt ;;
    tt
  else
    tt.