(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  UsernameWidget.
Section UsernameWidget.
  Class Trait (Self : Set) : Type := {
    get : (ref Self) -> M alloc.string.String.t;
  }.
  
End UsernameWidget.
End UsernameWidget.

Module  AgeWidget.
Section AgeWidget.
  Class Trait (Self : Set) : Type := {
    get : (ref Self) -> M u8.t;
  }.
  
End AgeWidget.
End AgeWidget.

Module  Form.
Section Form.
  Record t : Set := {
    username : alloc.string.String.t;
    age : u8.t;
  }.
  
  Global Instance Get_username : Notations.Dot "username" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(username))
        (fun β α => Some (α <| username := β |>));
  }.
  Global Instance Get_AF_username : Notations.DoubleColon t "username" := {
    Notations.double_colon (α : M.Val t) := α.["username"];
  }.
  Global Instance Get_age : Notations.Dot "age" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(age)) (fun β α => Some (α <| age := β |>));
  }.
  Global Instance Get_AF_age : Notations.DoubleColon t "age" := {
    Notations.double_colon (α : M.Val t) := α.["age"];
  }.
End Form.
End Form.

Module  Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form_t.
Section Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form_t.
  Definition Self : Set := disambiguating_overlapping_traits.Form.t.
  
  (*
      fn get(&self) -> String {
          self.username.clone()
      }
  *)
  Parameter get : (ref Self) -> M alloc.string.String.t.
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
  
  Global Instance ℐ :
    disambiguating_overlapping_traits.UsernameWidget.Trait Self := {
    disambiguating_overlapping_traits.UsernameWidget.get := get;
  }.
End Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form_t.
End Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form_t.

Module  Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form_t.
Section Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form_t.
  Definition Self : Set := disambiguating_overlapping_traits.Form.t.
  
  (*
      fn get(&self) -> u8 {
          self.age
      }
  *)
  Parameter get : (ref Self) -> M u8.t.
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
  
  Global Instance ℐ :
    disambiguating_overlapping_traits.AgeWidget.Trait Self := {
    disambiguating_overlapping_traits.AgeWidget.get := get;
  }.
End Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form_t.
End Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form_t.

(*
fn main() {
    let form = Form {
        username: "rustacean".to_owned(),
        age: 28,
    };

    // If you uncomment this line, you'll get an error saying
    // "multiple `get` found". Because, after all, there are multiple methods
    // named `get`.
    // println!("{}", form.get());

    let username = <Form as UsernameWidget>::get(&form);
    assert_eq!(("rustacean".to_string()), username);
    let age = <Form as AgeWidget>::get(&form);
    assert_eq!(28, age);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M unit.
