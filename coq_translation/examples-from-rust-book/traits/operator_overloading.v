(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module ops := std.ops.

Error StructUnit.

Error StructUnit.

Error StructUnit.

Module Impl__crate_fmt_Debug_for_FooBar.
  Definition Self := FooBar.
  
  Global Instance I : _crate.fmt.Debug.Class Self := {|
    _crate.fmt.Debug.fmt (self : ref Self) (f : mut_ref _crate.fmt.Formatter) :=
      _crate.fmt.ImplFormatter.write_str f "FooBar";
  |}.
End Impl__crate_fmt_Debug_for_FooBar.

Error StructUnit.

Module Impl__crate_fmt_Debug_for_BarFoo.
  Definition Self := BarFoo.
  
  Global Instance I : _crate.fmt.Debug.Class Self := {|
    _crate.fmt.Debug.fmt (self : ref Self) (f : mut_ref _crate.fmt.Formatter) :=
      _crate.fmt.ImplFormatter.write_str f "BarFoo";
  |}.
End Impl__crate_fmt_Debug_for_BarFoo.

Module Impl_ops_Add_for_Foo.
  Definition Self := Foo.
  
  Global Instance I : ops.Add.Class Bar Self := {|
    ops.Add.Output := FooBar;
    ops.Add.add (self : Self) (_rhs : Bar) :=
      _crate.io._print
        (_crate.fmt.ImplArguments.new_v1
          [ "> Foo.add(Bar) was called\n" ]
          [  ]) ;;
      tt ;;
      FooBar;
  |}.
End Impl_ops_Add_for_Foo.

Module Impl_ops_Add_for_Bar.
  Definition Self := Bar.
  
  Global Instance I : ops.Add.Class Foo Self := {|
    ops.Add.Output := BarFoo;
    ops.Add.add (self : Self) (_rhs : Foo) :=
      _crate.io._print
        (_crate.fmt.ImplArguments.new_v1
          [ "> Bar.add(Foo) was called\n" ]
          [  ]) ;;
      tt ;;
      BarFoo;
  |}.
End Impl_ops_Add_for_Bar.

Definition main (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Foo + Bar = "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug (add Foo Bar) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Bar + Foo = "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug (add Bar Foo) ]) ;;
  tt ;;
  tt.
