(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition main (_ : unit) :=
  let haystack := ComplexTypePath.into_vec [1;2;3] in
  let contains := fun needle => contains haystack needle in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display (contains 1)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display (contains 4)]) ;;
  tt ;;
  tt.