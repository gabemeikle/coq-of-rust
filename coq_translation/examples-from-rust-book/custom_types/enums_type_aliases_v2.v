(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error Enum.

(* Impl [VeryVerboseEnumOfThingsToDoWithNumbers] *)
Module ImplVeryVerboseEnumOfThingsToDoWithNumbers.
  Definition run
      (self : ref VeryVerboseEnumOfThingsToDoWithNumbers)
      (x : i32)
      (y : i32)
      : i32 :=
    match self with
    | ImplSelf.Add => add x y
    | ImplSelf.Subtract => sub x y
    end.
End ImplVeryVerboseEnumOfThingsToDoWithNumbers.
(* End impl [VeryVerboseEnumOfThingsToDoWithNumbers] *)
