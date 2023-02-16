(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition multiply (_ : unit) :=
  let first_number := match branch (parse first_number_str) with
  | {| Break.0 := residual; |} => Return (from_residual residual)
  | {| Continue.0 := val; |} => val
  end in
  let second_number := match branch (parse second_number_str) with
  | {| Break.0 := residual; |} => Return (from_residual residual)
  | {| Continue.0 := val; |} => val
  end in
  Ok (mul first_number second_number).

Definition print (_ : unit) :=
  match result with
  | Ok (n) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["n is ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_display n]) ;;
    tt
  | Err (e) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["Error: ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_display e]) ;;
    tt
  end.

Definition main (_ : unit) :=
  print (multiply "10" "2") ;;
  print (multiply "t" "2") ;;
  tt.