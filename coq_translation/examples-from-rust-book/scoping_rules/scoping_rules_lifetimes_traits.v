(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Borrowed.
  Record t : Set := {
    x : ref i32;
  }.
End Borrowed.
Definition Borrowed : Set := Borrowed.t.

Module Impl__crate_fmt_Debug_for_Borrowed.
  Definition Self := Borrowed.
  
  Global Instance I 'a : _crate.fmt.Debug.Class Self := {|
    _crate.fmt.Debug.fmt (self : ref Self) (f : mut_ref _crate.fmt.Formatter) :=
      _crate.fmt.ImplFormatter.debug_struct_field1_finish
        f
        "Borrowed"
        "x"
        self.x;
  |}.
End Impl__crate_fmt_Debug_for_Borrowed.

Module Impl_Default_for_Borrowed.
  Definition Self := Borrowed.
  
  Global Instance I 'a : Default.Class Self := {|
    Default.default tt := {| Self.x := 10; |};
  |}.
End Impl_Default_for_Borrowed.

Definition main (_ : unit) : unit :=
  let b := Default.default tt in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "b is "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug b ]) ;;
  tt ;;
  tt.
