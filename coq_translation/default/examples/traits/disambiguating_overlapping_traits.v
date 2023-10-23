(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module UsernameWidget.
  Section UsernameWidget.
    Context `{State.Trait}.
    
    Class Trait (Self : Set) : Type := {
      get : (ref Self) -> M alloc.string.String;
    }.
    
  End UsernameWidget.
End UsernameWidget.

Module AgeWidget.
  Section AgeWidget.
    Context `{State.Trait}.
    
    Class Trait (Self : Set) : Type := {
      get : (ref Self) -> M u8;
    }.
    
  End AgeWidget.
End AgeWidget.

Module Form.
  Section Form.
    Context `{State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      username : alloc.string.String;
      age : u8;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_username : Notation.Dot "username" := {
      Notation.dot x := let* x := M.read x in Pure x.(username) : M _;
    }.
    Global Instance Get_AF_username : Notation.DoubleColon t "username" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(username) : M _;
    }.
    Global Instance Get_age : Notation.Dot "age" := {
      Notation.dot x := let* x := M.read x in Pure x.(age) : M _;
    }.
    Global Instance Get_AF_age : Notation.DoubleColon t "age" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(age) : M _;
    }.
  End Form.
End Form.
Definition Form `{State.Trait} : Set := M.val Form.t.

Module
  Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.
  Section
    Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.
    Context `{State.Trait}.
    
    Definition Self : Set := disambiguating_overlapping_traits.Form.
    
    Definition get (self : ref Self) : M alloc.string.String :=
      let* α0 := deref self disambiguating_overlapping_traits.Form in
      let* α1 := α0.["username"] in
      let* α2 := borrow α1 alloc.string.String in
      core.clone.Clone.clone α2.
    
    Global Instance AssociatedFunction_get :
      Notation.DoubleColon Self "get" := {
      Notation.double_colon := get;
    }.
    
    Global Instance I
      : disambiguating_overlapping_traits.UsernameWidget.Trait Self := {
      disambiguating_overlapping_traits.UsernameWidget.get := get;
    }.
  End
    Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.
  Global Hint Resolve I : core.
End
  Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.

Module
  Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.
  Section
    Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.
    Context `{State.Trait}.
    
    Definition Self : Set := disambiguating_overlapping_traits.Form.
    
    Definition get (self : ref Self) : M u8 :=
      let* α0 := deref self disambiguating_overlapping_traits.Form in
      α0.["age"].
    
    Global Instance AssociatedFunction_get :
      Notation.DoubleColon Self "get" := {
      Notation.double_colon := get;
    }.
    
    Global Instance I
      : disambiguating_overlapping_traits.AgeWidget.Trait Self := {
      disambiguating_overlapping_traits.AgeWidget.get := get;
    }.
  End
    Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.
  Global Hint Resolve I : core.
End
  Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* form :=
    let* α0 := deref (mk_str "rustacean") str in
    let* α1 := borrow α0 str in
    let* α2 := alloc.borrow.ToOwned.to_owned α1 in
    let* α3 := M.alloc 28 in
    M.alloc
      {|
        disambiguating_overlapping_traits.Form.username := α2;
        disambiguating_overlapping_traits.Form.age := α3;
      |} in
  let* username :=
    let* α0 := borrow form disambiguating_overlapping_traits.Form in
    let* α1 := deref α0 disambiguating_overlapping_traits.Form in
    let* α2 := borrow α1 disambiguating_overlapping_traits.Form in
    disambiguating_overlapping_traits.UsernameWidget.get α2 in
  let* _ :=
    let* α0 := deref (mk_str "rustacean") str in
    let* α1 := borrow α0 str in
    let* α2 := alloc.string.ToString.to_string α1 in
    let* α3 := borrow α2 alloc.string.String in
    let* α4 := borrow username alloc.string.String in
    match (α3, α4) with
    | (left_val, right_val) =>
      let* α0 := deref left_val alloc.string.String in
      let* α1 := borrow α0 alloc.string.String in
      let* α2 := deref right_val alloc.string.String in
      let* α3 := borrow α2 alloc.string.String in
      let* α4 := core.cmp.PartialEq.eq α1 α3 in
      let* α5 := not α4 in
      let* α6 := use α5 in
      if (α6 : bool) then
        let kind := core.panicking.AssertKind.Eq tt in
        let* _ :=
          let* α0 := deref left_val alloc.string.String in
          let* α1 := borrow α0 alloc.string.String in
          let* α2 := deref α1 alloc.string.String in
          let* α3 := borrow α2 alloc.string.String in
          let* α4 := deref right_val alloc.string.String in
          let* α5 := borrow α4 alloc.string.String in
          let* α6 := deref α5 alloc.string.String in
          let* α7 := borrow α6 alloc.string.String in
          core.panicking.assert_failed
            kind
            α3
            α7
            (core.option.Option.None tt) in
        never_to_any tt
      else
        Pure tt
    end in
  let* age :=
    let* α0 := borrow form disambiguating_overlapping_traits.Form in
    let* α1 := deref α0 disambiguating_overlapping_traits.Form in
    let* α2 := borrow α1 disambiguating_overlapping_traits.Form in
    disambiguating_overlapping_traits.AgeWidget.get α2 in
  let* _ :=
    let* α0 := M.alloc 28 in
    let* α1 := borrow α0 u8 in
    let* α2 := borrow age u8 in
    match (α1, α2) with
    | (left_val, right_val) =>
      let* α0 := deref left_val u8 in
      let* α1 := deref right_val u8 in
      let* α2 := eq α0 α1 in
      let* α3 := not α2 in
      let* α4 := use α3 in
      if (α4 : bool) then
        let kind := core.panicking.AssertKind.Eq tt in
        let* _ :=
          let* α0 := deref left_val u8 in
          let* α1 := borrow α0 u8 in
          let* α2 := deref α1 u8 in
          let* α3 := borrow α2 u8 in
          let* α4 := deref right_val u8 in
          let* α5 := borrow α4 u8 in
          let* α6 := deref α5 u8 in
          let* α7 := borrow α6 u8 in
          core.panicking.assert_failed
            kind
            α3
            α7
            (core.option.Option.None tt) in
        never_to_any tt
      else
        Pure tt
    end in
  Pure tt.
