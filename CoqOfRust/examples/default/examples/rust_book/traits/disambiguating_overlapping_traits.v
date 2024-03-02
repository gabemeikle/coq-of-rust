(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  UsernameWidget.
Section UsernameWidget.
  Class Trait (Self : Set) : Type := {
    get :
      Ty.function
        [Ty.apply (Ty.path "ref") [Self]]
        (Ty.apply (Ty.path "alloc::string::String") []);
  }.
  
End UsernameWidget.
End UsernameWidget.

Module  AgeWidget.
Section AgeWidget.
  Class Trait (Self : Set) : Type := {
    get : Ty.function [Ty.apply (Ty.path "ref") [Self]] (Ty.path "u8");
  }.
  
End AgeWidget.
End AgeWidget.



Module  Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.
Section Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "disambiguating_overlapping_traits::Form") [].
  
  (*
      fn get(&self) -> String {
          self.username.clone()
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.clone.Clone.clone
            (Self := Ty.apply (Ty.path "alloc::string::String") [])
            (Trait := ℐ))) in
      let* α1 := M.read self in
      M.call
        (α0
          (borrow
            ((M.var "disambiguating_overlapping_traits::Form::Get_username")
              (deref α1))))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_get : Instance.t := {
    Notations.double_colon := get;
  }.
  
  Definition ℐ : Instance.t := [("get", get)].
End Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.
End Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.

Module  Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.
Section Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "disambiguating_overlapping_traits::Form") [].
  
  (*
      fn get(&self) -> u8 {
          self.age
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read
        ((M.var "disambiguating_overlapping_traits::Form::Get_age") (deref α0))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_get : Instance.t := {
    Notations.double_colon := get;
  }.
  
  Definition ℐ : Instance.t := [("get", get)].
End Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.
End Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.

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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* form :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          alloc.borrow.ToOwned.to_owned
            (Self := Ty.path "str")
            (Trait := ℐ))) in
      let* α1 := M.read (mk_str "rustacean") in
      let* α2 := M.call (α0 α1) in
      M.alloc
        {|
          disambiguating_overlapping_traits.Form.username := α2;
          disambiguating_overlapping_traits.Form.age :=
            (Integer.of_Z 28) : Ty.path "u8";
        |} in
    let* username :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          disambiguating_overlapping_traits.UsernameWidget.get
            (Self :=
              Ty.apply (Ty.path "disambiguating_overlapping_traits::Form") [])
            (Trait := ℐ))) in
      let* α1 := M.call (α0 (borrow form)) in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          alloc.string.ToString.to_string
            (Self := Ty.path "str")
            (Trait := ℐ))) in
      let* α1 := M.read (mk_str "rustacean") in
      let* α2 := M.call (α0 α1) in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (borrow α3, borrow username) in
      match_operator
        α4
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 :=
                ltac:(M.get_method (fun ℐ =>
                  core.cmp.PartialEq.eq
                    (Self := Ty.apply (Ty.path "alloc::string::String") [])
                    (Rhs := Ty.apply (Ty.path "alloc::string::String") [])
                    (Trait := ℐ))) in
              let* α1 := M.read left_val in
              let* α2 := M.read right_val in
              let* α3 := M.call (α0 α1 α2) in
              let* α4 := M.alloc ((M.var "UnOp::not") α3) in
              let* α5 := M.read (use α4) in
              if α5 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.read kind in
                let* α1 := M.read left_val in
                let* α2 := M.read right_val in
                let* α3 :=
                  M.call
                    ((M.var "core::panicking::assert_failed")
                      α0
                      α1
                      α2
                      core.option.Option.None) in
                let* α0 := M.alloc α3 in
                let* α1 := M.read α0 in
                let* α2 := never_to_any α1 in
                M.alloc α2
              else
                M.alloc tt
            end) :
            Ty.tuple
        ] in
    let* age :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          disambiguating_overlapping_traits.AgeWidget.get
            (Self :=
              Ty.apply (Ty.path "disambiguating_overlapping_traits::Form") [])
            (Trait := ℐ))) in
      let* α1 := M.call (α0 (borrow form)) in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.alloc ((Integer.of_Z 28) : Ty.path "u8") in
      let* α1 := M.alloc (borrow α0, borrow age) in
      match_operator
        α1
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 := M.read left_val in
              let* α1 := M.read (deref α0) in
              let* α2 := M.read right_val in
              let* α3 := M.read (deref α2) in
              let* α4 :=
                M.alloc
                  ((M.var "UnOp::not") ((M.var "BinOp::Pure::eq") α1 α3)) in
              let* α5 := M.read (use α4) in
              if α5 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.read kind in
                let* α1 := M.read left_val in
                let* α2 := M.read right_val in
                let* α3 :=
                  M.call
                    ((M.var "core::panicking::assert_failed")
                      α0
                      α1
                      α2
                      core.option.Option.None) in
                let* α0 := M.alloc α3 in
                let* α1 := M.read α0 in
                let* α2 := never_to_any α1 in
                M.alloc α2
              else
                M.alloc tt
            end) :
            Ty.tuple
        ] in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
