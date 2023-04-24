(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Owner.
  Record t : Set := { _ : i32;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Owner.
Definition Owner := Owner.t.

Module ImplOwner.
  Definition Self := Owner.
  
  Definition add_one (self : mut_ref Self) :=
    (self .[ 0 ]).["add_assign"] 1 ;;
    tt.
  
  Global Instance Method_add_one : Notation.Dot "add_one" := {
    Notation.dot := add_one;
  }.
  
  Definition print (self : ref Self) :=
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "`print`: "; "\n" ]
        [ _crate.fmt.ArgumentV1::["new_display"] (self .[ 0 ]) ]) ;;
    tt ;;
    tt.
  
  Global Instance Method_print : Notation.Dot "print" := {
    Notation.dot := print;
  }.
End ImplOwner.

Definition main (_ : unit) : unit :=
  let owner := Owner.Build_t 18 in
  owner.["add_one"] ;;
  owner.["print"] ;;
  tt.
