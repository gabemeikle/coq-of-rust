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
  Definition get (self : ref Self) : M alloc.string.String.t :=
    let* self := M.alloc self in
    let* α0 : ref disambiguating_overlapping_traits.Form.t := M.read self in
    M.call
      ((core.clone.Clone.clone
          (Self := alloc.string.String.t)
          (Trait := ltac:(refine _)))
        (borrow (deref α0).["username"])).
  
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
  Definition get (self : ref Self) : M u8.t :=
    let* self := M.alloc self in
    let* α0 : ref disambiguating_overlapping_traits.Form.t := M.read self in
    M.read (deref α0).["age"].
  
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
Definition main : M unit :=
  let* form : M.Val disambiguating_overlapping_traits.Form.t :=
    let* α0 : ref str.t := M.read (mk_str "rustacean") in
    let* α1 : alloc.string.String.t :=
      M.call
        ((alloc.borrow.ToOwned.to_owned
            (Self := str.t)
            (Trait := ltac:(refine _)))
          α0) in
    M.alloc
      {|
        disambiguating_overlapping_traits.Form.username := α1;
        disambiguating_overlapping_traits.Form.age := Integer.of_Z 28;
      |} in
  let* username : M.Val alloc.string.String.t :=
    let* α0 : alloc.string.String.t :=
      M.call
        ((disambiguating_overlapping_traits.UsernameWidget.get
            (Self := disambiguating_overlapping_traits.Form.t)
            (Trait := ltac:(refine _)))
          (borrow form)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : ref str.t := M.read (mk_str "rustacean") in
    let* α1 : alloc.string.String.t :=
      M.call
        ((alloc.string.ToString.to_string
            (Self := str.t)
            (Trait := ltac:(refine _)))
          α0) in
    let* α2 : M.Val alloc.string.String.t := M.alloc α1 in
    match (borrow α2, borrow username) with
    | (left_val, right_val) =>
      let* left_val := M.alloc left_val in
      let* right_val := M.alloc right_val in
      let* α0 : ref alloc.string.String.t := M.read left_val in
      let* α1 : ref alloc.string.String.t := M.read right_val in
      let* α2 : bool.t :=
        M.call
          ((core.cmp.PartialEq.eq
              (Self := alloc.string.String.t)
              (Trait := ltac:(refine _)))
            α0
            α1) in
      let* α3 : M.Val bool.t := M.alloc (UnOp.not α2) in
      let* α4 : bool.t := M.read (use α3) in
      if α4 then
        let* kind : M.Val core.panicking.AssertKind.t :=
          M.alloc core.panicking.AssertKind.Eq in
        let* _ : M.Val never.t :=
          let* α0 : core.panicking.AssertKind.t := M.read kind in
          let* α1 : ref alloc.string.String.t := M.read left_val in
          let* α2 : ref alloc.string.String.t := M.read right_val in
          let* α3 : never.t :=
            M.call
              (core.panicking.assert_failed α0 α1 α2 core.option.Option.None) in
          M.alloc α3 in
        let* α0 : M.Val unit := M.alloc tt in
        let* α1 := M.read α0 in
        let* α2 : unit := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt
    end in
  let* age : M.Val u8.t :=
    let* α0 : u8.t :=
      M.call
        ((disambiguating_overlapping_traits.AgeWidget.get
            (Self := disambiguating_overlapping_traits.Form.t)
            (Trait := ltac:(refine _)))
          (borrow form)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : M.Val u8.t := M.alloc (Integer.of_Z 28) in
    match (borrow α0, borrow age) with
    | (left_val, right_val) =>
      let* left_val := M.alloc left_val in
      let* right_val := M.alloc right_val in
      let* α0 : ref u8.t := M.read left_val in
      let* α1 : u8.t := M.read (deref α0) in
      let* α2 : ref u8.t := M.read right_val in
      let* α3 : u8.t := M.read (deref α2) in
      let* α4 : M.Val bool.t := M.alloc (UnOp.not (BinOp.Pure.eq α1 α3)) in
      let* α5 : bool.t := M.read (use α4) in
      if α5 then
        let* kind : M.Val core.panicking.AssertKind.t :=
          M.alloc core.panicking.AssertKind.Eq in
        let* _ : M.Val never.t :=
          let* α0 : core.panicking.AssertKind.t := M.read kind in
          let* α1 : ref u8.t := M.read left_val in
          let* α2 : ref u8.t := M.read right_val in
          let* α3 : never.t :=
            M.call
              (core.panicking.assert_failed α0 α1 α2 core.option.Option.None) in
          M.alloc α3 in
        let* α0 : M.Val unit := M.alloc tt in
        let* α1 := M.read α0 in
        let* α2 : unit := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt
    end in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
