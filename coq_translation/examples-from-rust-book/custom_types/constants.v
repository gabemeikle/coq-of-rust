(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

(* Approximation *)

Definition u8 : Set := Z.
Definition u16 : Set := Z.
Definition u32 : Set := Z.
Definition u64 : Set := Z.
Definition u128 : Set := Z.

Definition i8 : Set := Z.
Definition i16 : Set := Z.
Definition i32 : Set := Z.
Definition i64 : Set := Z.
Definition i128 : Set := Z.

Definition f32 : Set := Z.
Definition f64 : Set := Z.

Definition LANGUAGE (_ : unit) :=
  "Rust".

Definition THRESHOLD (_ : unit) :=
  10.

Definition is_big (_ : unit) :=
  gt n THRESHOLD.

Definition main (_ : unit) :=
  let n := 16 in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["This is ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display LANGUAGE]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["The threshold is ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display THRESHOLD]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";" is ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display
        n;_crate::fmt::ImplArgumentV1.new_display
        (if is_big n then
          "big"
        else
          "small")]) ;;
  tt ;;
  tt.