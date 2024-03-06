(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
Module Person.
  
End Person.

(* Trait *)
Module Student.
  
End Student.

(* Trait *)
Module Programmer.
  
End Programmer.

(* Trait *)
Module CompSciStudent.
  
End CompSciStudent.

(*
fn comp_sci_student_greeting(student: &dyn CompSciStudent) -> String {
    format!(
        "My name is {} and I attend {}. My favorite language is {}. My Git username is {}",
        student.name(),
        student.university(),
        student.fav_language(),
        student.git_username()
    )
}
*)
Definition comp_sci_student_greeting (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [DynT], [student] =>
    let* student := M.alloc student in
    let* res :=
      let* α0 := M.read (mk_str "My name is ") in
      let* α1 := M.read (mk_str " and I attend ") in
      let* α2 := M.read (mk_str ". My favorite language is ") in
      let* α3 := M.read (mk_str ". My Git username is ") in
      let* α4 := M.alloc [ α0; α1; α2; α3 ] in
      let* α5 :=
        ltac:(M.get_method (fun ℐ =>
          supertraits.Person.name
            (Self := Ty.dyn [("supertraits::CompSciStudent::Trait", [])])
            (Trait := ℐ))) in
      let* α6 := M.read student in
      let* α7 := M.call (α5 α6) in
      let* α8 := M.alloc α7 in
      let* α9 :=
        M.call
          ((Ty.path "core::fmt::rt::Argument")::["new_display"] (borrow α8)) in
      let* α10 :=
        ltac:(M.get_method (fun ℐ =>
          supertraits.Student.university
            (Self := Ty.dyn [("supertraits::CompSciStudent::Trait", [])])
            (Trait := ℐ))) in
      let* α11 := M.read student in
      let* α12 := M.call (α10 α11) in
      let* α13 := M.alloc α12 in
      let* α14 :=
        M.call
          ((Ty.path "core::fmt::rt::Argument")::["new_display"] (borrow α13)) in
      let* α15 :=
        ltac:(M.get_method (fun ℐ =>
          supertraits.Programmer.fav_language
            (Self := Ty.dyn [("supertraits::CompSciStudent::Trait", [])])
            (Trait := ℐ))) in
      let* α16 := M.read student in
      let* α17 := M.call (α15 α16) in
      let* α18 := M.alloc α17 in
      let* α19 :=
        M.call
          ((Ty.path "core::fmt::rt::Argument")::["new_display"] (borrow α18)) in
      let* α20 :=
        ltac:(M.get_method (fun ℐ =>
          supertraits.CompSciStudent.git_username
            (Self := Ty.dyn [("supertraits::CompSciStudent::Trait", [])])
            (Trait := ℐ))) in
      let* α21 := M.read student in
      let* α22 := M.call (α20 α21) in
      let* α23 := M.alloc α22 in
      let* α24 :=
        M.call
          ((Ty.path "core::fmt::rt::Argument")::["new_display"] (borrow α23)) in
      let* α25 := M.alloc [ α9; α14; α19; α24 ] in
      let* α26 :=
        M.call
          ((Ty.path "core::fmt::Arguments")::["new_v1"]
            (pointer_coercion "Unsize" (borrow α4))
            (pointer_coercion "Unsize" (borrow α25))) in
      let* α27 := M.call ((M.var "alloc::fmt::format") α26) in
      M.alloc α27 in
    M.read res
  | _, _ => M.impossible
  end.

(*
fn main() {}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with | [], [] => M.pure tt | _, _ => M.impossible end.
