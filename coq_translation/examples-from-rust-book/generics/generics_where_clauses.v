(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Class PrintInOption : Set := {
  print_in_option : Self -> _;
}.

Module Impl_PrintInOption_for_T.
  Definition Self := T.
  
  #[global] Instance I : PrintInOption.Class Self := {|
    print_in_option
      (self : T) :=
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["";"\n"]
          [_crate::fmt::ImplArgumentV1.new_debug (Some self)]) ;;
      tt ;;
      tt;
  |}.
Module ImplT.

Definition main (_ : unit) :=
  let vec := ComplexTypePath.into_vec [1;2;3] in
  print_in_option vec ;;
  tt.
