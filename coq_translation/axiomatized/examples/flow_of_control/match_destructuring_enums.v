(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Color.
  Inductive t : Set :=
  | Red
  | Blue
  | Green
  | RGB (_ : u32) (_ : u32) (_ : u32)
  | HSV (_ : u32) (_ : u32) (_ : u32)
  | HSL (_ : u32) (_ : u32) (_ : u32)
  | CMY (_ : u32) (_ : u32) (_ : u32)
  | CMYK (_ : u32) (_ : u32) (_ : u32) (_ : u32).
End Color.
Definition Color := Color.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, unit -> M (H := H) unit.
