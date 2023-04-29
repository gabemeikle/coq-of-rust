(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Years.
  Record t : Set := { _ : i64;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Years.
Definition Years := Years.t.

Module Days.
  Record t : Set := { _ : i64;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Days.
Definition Days := Days.t.

Module ImplYears.
  Definition Self := Years.
  
  Definition to_days (self : ref Self) : Days :=
    Days.Build_t ((self.[0]).["mul"] 365).
  
  Global Instance Method_to_days : Notation.Dot "to_days" := {
    Notation.dot := to_days;
  }.
End ImplYears.

Module ImplDays.
  Definition Self := Days.
  
  Definition to_years (self : ref Self) : Years :=
    Years.Build_t ((self.[0]).["div"] 365).
  
  Global Instance Method_to_years : Notation.Dot "to_years" := {
    Notation.dot := to_years;
  }.
End ImplDays.

Definition old_enough (age : ref Years) : bool := (age.[0]).["ge"] 18.

Definition main (_ : unit) : unit :=
  let age := Years.Build_t 5 in
  let age_days := age.["to_days"] in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Old enough "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_display"] (old_enough age) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Old enough "; "\n" ]
      [
        _crate.fmt.ArgumentV1::["new_display"]
          (old_enough age_days.["to_years"])
      ]) ;;
  tt ;;
  tt.
