(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Years.
  Unset Primitive Projections.
  Record t : Set := {
    _ : i64;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Years.
Definition Years := @Years.t.

Module Days.
  Unset Primitive Projections.
  Record t : Set := {
    _ : i64;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Days.
Definition Days := @Days.t.

Module Impl_generics_new_type_idiom_Years.
  Definition Self := generics_new_type_idiom.Years.
  
  Definition to_days
      `{H : State.Trait}
      (self : ref It_is_here!)
      : M (H := H) generics_new_type_idiom.Days :=
    let* α0 := (self.[0]).["mul"] 365 in
    Pure (generics_new_type_idiom.Days.Build_t α0).
  
  Global Instance Method_to_days `{H : State.Trait} :
    Notation.Dot "to_days" := {
    Notation.dot := to_days;
  }.
End Impl_generics_new_type_idiom_Years.

Module Impl_generics_new_type_idiom_Days.
  Definition Self := generics_new_type_idiom.Days.
  
  Definition to_years
      `{H : State.Trait}
      (self : ref It_is_here!)
      : M (H := H) generics_new_type_idiom.Years :=
    let* α0 := (self.[0]).["div"] 365 in
    Pure (generics_new_type_idiom.Years.Build_t α0).
  
  Global Instance Method_to_years `{H : State.Trait} :
    Notation.Dot "to_years" := {
    Notation.dot := to_years;
  }.
End Impl_generics_new_type_idiom_Days.

Definition old_enough
    `{H : State.Trait}
    (age : ref generics_new_type_idiom.Years)
    : M (H := H) bool :=
  (age.[0]).["ge"] 18.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let age := generics_new_type_idiom.Years.Build_t 5 in
  let* age_days := age.["to_days"] in
  let* _ :=
    let* _ :=
      let* α0 := generics_new_type_idiom.old_enough (addr_of age) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Old enough "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := age_days.["to_years"] in
      let* α1 := generics_new_type_idiom.old_enough (addr_of α0) in
      let* α2 := format_argument::["new_display"] (addr_of α1) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Old enough "; "
" ])
          (addr_of [ α2 ]) in
      std.io.stdio._print α3 in
    Pure tt in
  Pure tt.
