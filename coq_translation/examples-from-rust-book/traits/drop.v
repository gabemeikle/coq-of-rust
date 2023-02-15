(* Generated by coq-of-rust *)
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Module Droppable.
  Record t : Set := {
    name : ref str;
  }.
End Droppable.
Definition Droppable : Set := Droppable.t.

(* Impl [Droppable] of trait [Drop]*)
Module ImplDroppable.
  Definition drop (self : ref Self) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["> Dropping ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_display self.name]) ;;
    tt ;;
    tt.
End ImplDroppable.
(* End impl [Droppable] *)

Definition main (_ : unit) :=
  let _a := {| Droppable.name := "a"; |} in
  let _b := {| Droppable.name := "b"; |} in
  let _c := {| Droppable.name := "c"; |} in
  let _d := {| Droppable.name := "d"; |} in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Exiting block B\n"] []) ;;
  tt ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Just exited block B\n"] []) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Exiting block A\n"] []) ;;
  tt ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Just exited block A\n"] []) ;;
  tt ;;
  drop _a ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["end of the main function\n"] []) ;;
  tt ;;
  tt.