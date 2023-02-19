(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Number.
  Record t : Set := {
    value : i32;
  }.
End Number.
Definition Number : Set := Number.t.

Module Impl__crate_fmt_Debug_for_Number.
  Definition Self := Number.
  
  #[global] Instance I : _crate.fmt.Debug.Class Self := {|
    fmt
      (self : static_ref Number)
      (f : mut_ref _crate.fmt.Formatter) :=
      _crate::fmt::ImplFormatter.debug_struct_field1_finish
        f
        "Number"
        "value"
        self.value;
  |}.
Module ImplNumber.

Module Impl_From_for_Number.
  Definition Self := Number.
  
  #[global] Instance I : From.Class Self := {|
    from (item : i32) := {| Number.value := item; |};
  |}.
Module ImplNumber.

Definition main (_ : unit) :=
  let int := 5 in
  let num := into int in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["My number is ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug num]) ;;
  tt ;;
  tt.
