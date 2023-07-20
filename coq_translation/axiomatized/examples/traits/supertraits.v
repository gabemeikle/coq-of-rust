(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Person.
  Class Trait (Self : Set) : Set := {
    name `{H : State.Trait} : (ref Self) -> (M (H := H) alloc.string.String);
  }.
  
  Global Instance Method_name `{H : State.Trait} `(Trait)
    : Notation.Dot "name" := {
    Notation.dot := name;
  }.
End Person.

Module Student.
  Class Trait (Self : Set) : Set := {
    university
      `{H : State.Trait}
      :
      (ref Self) -> (M (H := H) alloc.string.String);
  }.
  
  Global Instance Method_university `{H : State.Trait} `(Trait)
    : Notation.Dot "university" := {
    Notation.dot := university;
  }.
End Student.

Module Programmer.
  Class Trait (Self : Set) : Set := {
    fav_language
      `{H : State.Trait}
      :
      (ref Self) -> (M (H := H) alloc.string.String);
  }.
  
  Global Instance Method_fav_language `{H : State.Trait} `(Trait)
    : Notation.Dot "fav_language" := {
    Notation.dot := fav_language;
  }.
End Programmer.

Module CompSciStudent.
  Class Trait (Self : Set) : Set := {
    git_username
      `{H : State.Trait}
      :
      (ref Self) -> (M (H := H) alloc.string.String);
  }.
  
  Global Instance Method_git_username `{H : State.Trait} `(Trait)
    : Notation.Dot "git_username" := {
    Notation.dot := git_username;
  }.
End CompSciStudent.

Parameter comp_sci_student_greeting : forall `{H : State.Trait},
    ref TraitObject ->
    M (H := H) alloc.string.String.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, M (H := H) unit.
