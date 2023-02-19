(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition Container : Set :=
  i32 * i32.

Class Contains : Set := {
  contains : static_ref Self -> static_ref A -> static_ref B -> bool;
  first : static_ref Self -> i32;
  last : static_ref Self -> i32;
}.

Module Impl_Contains_for_Container.
  Definition Self := Container.
  
  #[global] Instance I : Contains.Class Self := {|
    contains
      (self : static_ref Container)
      (number_1 : static_ref i32)
      (number_2 : static_ref i32) :=
      and (eq self.0 number_1) (eq self.1 number_2);
    first (self : static_ref Container) := self.0;
    last (self : static_ref Container) := self.1;
  |}.
Module ImplContainer.

Definition difference (_ : unit) := sub (last container) (first container).

Definition main (_ : unit) :=
  let number_1 := 3 in
  let number_2 := 10 in
  let container := Container number_1 number_2 in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Does container contain ";" and ";": ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display
        number_1;_crate::fmt::ImplArgumentV1.new_display
        number_2;_crate::fmt::ImplArgumentV1.new_display
        (contains container number_1 number_2)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["First number: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display (first container)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Last number: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display (last container)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["The difference is: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display (difference container)]) ;;
  tt ;;
  tt.
