(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module VeryVerboseEnumOfThingsToDoWithNumbers.
  Inductive t `{State.Trait} : Set :=
  | Add
  | Subtract.
End VeryVerboseEnumOfThingsToDoWithNumbers.
Definition VeryVerboseEnumOfThingsToDoWithNumbers `{State.Trait} : Set :=
  VeryVerboseEnumOfThingsToDoWithNumbers.t.

Definition Operations `{State.Trait} : Set :=
  enums_type_aliases_v1.VeryVerboseEnumOfThingsToDoWithNumbers.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let x :=
    enums_type_aliases_v1.VeryVerboseEnumOfThingsToDoWithNumbers.Add tt in
  Pure tt.
