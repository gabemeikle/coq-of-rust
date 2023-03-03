(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module fmt := std.fmt.

Module Circle.
  Record t : Set := {
    radius : i32;
  }.
End Circle.
Definition Circle : Set := Circle.t.

Module Impl_fmt_Display_for_Circle.
  Definition Self := Circle.
  
  Global Instance I : fmt.Display.Class Self := {|
    fmt.Display.fmt (self : ref Self) (f : mut_ref fmt.Formatter) :=
      method
        "write_fmt"
        f
        (_crate.fmt.ImplArguments.new_v1
          [ "Circle of radius " ]
          [ _crate.fmt.ImplArgumentV1.new_display self.radius ]);
  |}.
End Impl_fmt_Display_for_Circle.

Definition main (_ : unit) : unit :=
  let circle := {| Circle.radius := 6; |} in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ ""; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (method "to_string" circle) ]) ;;
  tt ;;
  tt.
