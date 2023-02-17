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

Error Enum.

(* Impl [VeryVerboseEnumOfThingsToDoWithNumbers] *)
Module ImplVeryVerboseEnumOfThingsToDoWithNumbers.
  Definition
    run
    (self : static_ref VeryVerboseEnumOfThingsToDoWithNumbers)
    (x : i32)
    (y : i32)
    : i32 :=
    match self with
    | ImplSelf.Add => add x y
    | ImplSelf.Subtract => sub x y
    end.
End ImplVeryVerboseEnumOfThingsToDoWithNumbers.
(* End impl [VeryVerboseEnumOfThingsToDoWithNumbers] *)