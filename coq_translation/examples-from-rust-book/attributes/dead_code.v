(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition used_function (_ : unit) :=
  tt.

Definition unused_function (_ : unit) :=
  tt.

Definition noisy_unused_function (_ : unit) :=
  tt.

Definition main (_ : unit) :=
  used_function tt ;;
  tt.