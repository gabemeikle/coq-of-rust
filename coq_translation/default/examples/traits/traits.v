(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Sheep.
Section Sheep.
  Context `{ℋ : State.Trait}.
  
  Record t : Set := {
    naked : bool;
    name : ref str;
  }.
  
  Global Instance Get_naked : Notation.Dot "naked" := {
    Notation.dot x := let* x := M.read x in M.pure x.(naked) : M _;
  }.
  Global Instance Get_AF_naked : Notation.DoubleColon t "naked" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(naked) : M _;
  }.
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot x := let* x := M.read x in M.pure x.(name) : M _;
  }.
  Global Instance Get_AF_name : Notation.DoubleColon t "name" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(name) : M _;
  }.
End Sheep.
End Sheep.
Definition Sheep `{ℋ : State.Trait} : Set := M.Val Sheep.t.

Module  Animal.
Section Animal.
  Context `{ℋ : State.Trait}.
  
  Class Trait (Self : Set) : Type := {
    new : (ref str) -> M Self;
    name : (ref Self) -> M (ref str);
    noise : (ref Self) -> M (ref str);
  }.
  
End Animal.
End Animal.

Module  Impl_traits_Sheep.
Section Impl_traits_Sheep.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := traits.Sheep.
  
  Definition is_naked (self : ref Self) : M bool :=
    M.function_body
      (let* α0 : ltac:(refine traits.Sheep) := deref self in
      α0.["naked"]).
  
  Global Instance AssociatedFunction_is_naked :
    Notation.DoubleColon Self "is_naked" := {
    Notation.double_colon := is_naked;
  }.
End Impl_traits_Sheep.
End Impl_traits_Sheep.

Module  Impl_traits_Animal_for_traits_Sheep.
Section Impl_traits_Animal_for_traits_Sheep.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := traits.Sheep.
  
  Definition new (name : ref str) : M traits.Sheep :=
    M.function_body
      (let* α0 : ltac:(refine bool) := M.alloc false in
      M.alloc {| traits.Sheep.name := name; traits.Sheep.naked := α0; |}).
  
  Global Instance AssociatedFunction_new : Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
  
  Definition name (self : ref Self) : M (ref str) :=
    M.function_body
      (let* α0 : ltac:(refine traits.Sheep) := deref self in
      α0.["name"]).
  
  Global Instance AssociatedFunction_name :
    Notation.DoubleColon Self "name" := {
    Notation.double_colon := name;
  }.
  
  Definition noise (self : ref Self) : M (ref str) :=
    M.function_body
      (let* α0 : ltac:(refine traits.Sheep) := deref self in
      let* α1 : ltac:(refine (ref traits.Sheep)) := borrow α0 in
      let* α2 : ltac:(refine bool) := traits.Sheep::["is_naked"] α1 in
      let* α3 : ltac:(refine bool) := use α2 in
      if (α3 : bool) then
        M.pure (mk_str "baaaaah?")
      else
        M.pure (mk_str "baaaaah!")).
  
  Global Instance AssociatedFunction_noise :
    Notation.DoubleColon Self "noise" := {
    Notation.double_colon := noise;
  }.
  
  Definition talk (self : ref Self) : M unit :=
    M.function_body
      (let* _ : ltac:(refine unit) :=
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine (array (ref str))) :=
            M.alloc [ mk_str ""; mk_str " pauses briefly... "; mk_str "
" ] in
          let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
          let* α2 : ltac:(refine (array (ref str))) := deref α1 in
          let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
          let* α4 : ltac:(refine (ref (slice (ref str)))) :=
            pointer_coercion "Unsize" α3 in
          let* α5 : ltac:(refine traits.Sheep) := deref self in
          let* α6 : ltac:(refine (ref str)) := α5.["name"] in
          let* α7 : ltac:(refine (ref (ref str))) := borrow α6 in
          let* α8 : ltac:(refine (ref str)) := deref α7 in
          let* α9 : ltac:(refine (ref (ref str))) := borrow α8 in
          let* α10 : ltac:(refine core.fmt.rt.Argument) :=
            core.fmt.rt.Argument::["new_display"] α9 in
          let* α11 : ltac:(refine traits.Sheep) := deref self in
          let* α12 : ltac:(refine (ref traits.Sheep)) := borrow α11 in
          let* α13 : ltac:(refine (ref str)) :=
            (traits.Animal.noise
                (Self := traits.Sheep)
                (Trait := ltac:(refine _)))
              α12 in
          let* α14 : ltac:(refine (ref (ref str))) := borrow α13 in
          let* α15 : ltac:(refine (ref str)) := deref α14 in
          let* α16 : ltac:(refine (ref (ref str))) := borrow α15 in
          let* α17 : ltac:(refine core.fmt.rt.Argument) :=
            core.fmt.rt.Argument::["new_display"] α16 in
          let* α18 : ltac:(refine (array core.fmt.rt.Argument)) :=
            M.alloc [ α10; α17 ] in
          let* α19 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
            borrow α18 in
          let* α20 : ltac:(refine (array core.fmt.rt.Argument)) := deref α19 in
          let* α21 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
            borrow α20 in
          let* α22 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
            pointer_coercion "Unsize" α21 in
          let* α23 : ltac:(refine core.fmt.Arguments) :=
            core.fmt.Arguments::["new_v1"] α4 α22 in
          std.io.stdio._print α23 in
        M.alloc tt in
      M.alloc tt).
  
  Global Instance AssociatedFunction_talk :
    Notation.DoubleColon Self "talk" := {
    Notation.double_colon := talk;
  }.
  
  Global Instance ℐ : traits.Animal.Required.Trait Self := {
    traits.Animal.new := new;
    traits.Animal.name := name;
    traits.Animal.noise := noise;
    traits.Animal.talk := Datatypes.Some talk;
  }.
End Impl_traits_Animal_for_traits_Sheep.
End Impl_traits_Animal_for_traits_Sheep.

Module  Impl_traits_Sheep_2.
Section Impl_traits_Sheep_2.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := traits.Sheep.
  
  Definition shear (self : mut_ref Self) : M unit :=
    M.function_body
      (let* α0 : ltac:(refine traits.Sheep) := deref self in
      let* α1 : ltac:(refine (ref traits.Sheep)) := borrow α0 in
      let* α2 : ltac:(refine bool) := traits.Sheep::["is_naked"] α1 in
      let* α3 : ltac:(refine bool) := use α2 in
      if (α3 : bool) then
        let* _ : ltac:(refine unit) :=
          let* _ : ltac:(refine unit) :=
            let* α0 : ltac:(refine (array (ref str))) :=
              M.alloc [ mk_str ""; mk_str " is already naked...
" ] in
            let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
            let* α2 : ltac:(refine (array (ref str))) := deref α1 in
            let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
            let* α4 : ltac:(refine (ref (slice (ref str)))) :=
              pointer_coercion "Unsize" α3 in
            let* α5 : ltac:(refine traits.Sheep) := deref self in
            let* α6 : ltac:(refine (ref traits.Sheep)) := borrow α5 in
            let* α7 : ltac:(refine (ref str)) :=
              (traits.Animal.name
                  (Self := traits.Sheep)
                  (Trait := ltac:(refine _)))
                α6 in
            let* α8 : ltac:(refine (ref (ref str))) := borrow α7 in
            let* α9 : ltac:(refine (ref str)) := deref α8 in
            let* α10 : ltac:(refine (ref (ref str))) := borrow α9 in
            let* α11 : ltac:(refine core.fmt.rt.Argument) :=
              core.fmt.rt.Argument::["new_display"] α10 in
            let* α12 : ltac:(refine (array core.fmt.rt.Argument)) :=
              M.alloc [ α11 ] in
            let* α13 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
              borrow α12 in
            let* α14 : ltac:(refine (array core.fmt.rt.Argument)) :=
              deref α13 in
            let* α15 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
              borrow α14 in
            let* α16 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
              pointer_coercion "Unsize" α15 in
            let* α17 : ltac:(refine core.fmt.Arguments) :=
              core.fmt.Arguments::["new_v1"] α4 α16 in
            std.io.stdio._print α17 in
          M.alloc tt in
        M.alloc tt
      else
        let* _ : ltac:(refine unit) :=
          let* _ : ltac:(refine unit) :=
            let* α0 : ltac:(refine (array (ref str))) :=
              M.alloc [ mk_str ""; mk_str " gets a haircut!
" ] in
            let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
            let* α2 : ltac:(refine (array (ref str))) := deref α1 in
            let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
            let* α4 : ltac:(refine (ref (slice (ref str)))) :=
              pointer_coercion "Unsize" α3 in
            let* α5 : ltac:(refine traits.Sheep) := deref self in
            let* α6 : ltac:(refine (ref str)) := α5.["name"] in
            let* α7 : ltac:(refine (ref (ref str))) := borrow α6 in
            let* α8 : ltac:(refine (ref str)) := deref α7 in
            let* α9 : ltac:(refine (ref (ref str))) := borrow α8 in
            let* α10 : ltac:(refine core.fmt.rt.Argument) :=
              core.fmt.rt.Argument::["new_display"] α9 in
            let* α11 : ltac:(refine (array core.fmt.rt.Argument)) :=
              M.alloc [ α10 ] in
            let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
              borrow α11 in
            let* α13 : ltac:(refine (array core.fmt.rt.Argument)) :=
              deref α12 in
            let* α14 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
              borrow α13 in
            let* α15 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
              pointer_coercion "Unsize" α14 in
            let* α16 : ltac:(refine core.fmt.Arguments) :=
              core.fmt.Arguments::["new_v1"] α4 α15 in
            std.io.stdio._print α16 in
          M.alloc tt in
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine traits.Sheep) := deref self in
          let* α1 : ltac:(refine bool) := α0.["naked"] in
          let* α2 : ltac:(refine bool) := M.alloc true in
          assign α1 α2 in
        M.alloc tt).
  
  Global Instance AssociatedFunction_shear :
    Notation.DoubleColon Self "shear" := {
    Notation.double_colon := shear;
  }.
End Impl_traits_Sheep_2.
End Impl_traits_Sheep_2.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* dolly : ltac:(refine traits.Sheep) :=
      (traits.Animal.new (Self := traits.Sheep) (Trait := ltac:(refine _)))
        (mk_str "Dolly") in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref traits.Sheep)) := borrow dolly in
      (traits.Animal.talk (Self := traits.Sheep) (Trait := ltac:(refine _)))
        α0 in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (mut_ref traits.Sheep)) := borrow_mut dolly in
      traits.Sheep::["shear"] α0 in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref traits.Sheep)) := borrow dolly in
      (traits.Animal.talk (Self := traits.Sheep) (Trait := ltac:(refine _)))
        α0 in
    M.alloc tt).
