(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit := apply.

Definition apply {F : Set} `{FnOnce.Class () F} (f : F) : unit :=
  f tt ;;
  tt.
