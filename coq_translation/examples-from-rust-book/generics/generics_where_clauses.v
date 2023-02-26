(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Debug := std.fmt.Debug.

Module PrintInOption.
  Class Class (Self : Set) : Set := {
    print_in_option : Self -> _;
  }.
  
  Global Instance Method_print_in_option `(Class)
    : Method "print_in_option" _ := {|
    method := print_in_option;
  |}.
End PrintInOption.

Module Impl_PrintInOption_for_T.
  Definition Self := T.
  
  Global Instance I : PrintInOption.Class Self := {|
    PrintInOption.print_in_option (self : T) :=
      _crate.io._print
        (_crate.fmt.ImplArguments.new_v1
          [ ""; "\n" ]
          [ _crate.fmt.ImplArgumentV1.new_debug (Some self) ]) ;;
      tt ;;
      tt;
  |}.
Module ImplT.

Definition main (_ : unit) : unit :=
  let vec := ComplexTypePath.into_vec [ 1; 2; 3 ] in
  method "print_in_option" vec ;;
  tt.
