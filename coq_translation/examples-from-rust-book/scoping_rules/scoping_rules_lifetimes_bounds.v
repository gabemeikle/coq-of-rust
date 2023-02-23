(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Ref.
  Inductive t : Set := Build (_ : ref T).
  
  Global Instance Get_0 : IndexedField.Class t 0 ref T := {|
    IndexedField.get '(Build x0) := x0;
  |}.
End Ref.
Definition Ref := Ref.t.

Module Impl__crate_fmt_Debug_for_Ref.
  Definition Self := Ref.
  
  Global Instance I : _crate.fmt.Debug.Class Self := {|
    _crate.fmt.Debug.fmt
        (self : ref Ref<'a, T>)
        (f : mut_ref _crate.fmt.Formatter) :=
      _crate.fmt.ImplFormatter.debug_tuple_field1_finish
        f
        "Ref"
        (IndexedField.get (index := 0) self);
  |}.
Module ImplRef.

Definition print {T : Set} `{Debug.Class T} (t : T) : unit :=
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "`print`: t is "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug t ]) ;;
  tt ;;
  tt.

Definition print_ref {T : Set} `{Debug.Class T} (t : ref T) : unit :=
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "`print_ref`: t is "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug t ]) ;;
  tt ;;
  tt.

Definition main (_ : unit) : unit :=
  let x := 7 in
  let ref_x := Ref.Build x in
  print_ref ref_x ;;
  print ref_x ;;
  tt.
