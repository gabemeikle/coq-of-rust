(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Sheep";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "Cow";
    ty_params := [];
  } *)

(* Trait *)
Module Animal.
  
End Animal.

Module Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Sheep.
  Definition Self : Ty.t := Ty.path "returning_traits_with_dyn::Sheep".
  
  Parameter noise : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "returning_traits_with_dyn::Animal"
      (* Self *) (Ty.path "returning_traits_with_dyn::Sheep")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("noise", InstanceField.Method noise) ].
End Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Sheep.

Module Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Cow.
  Definition Self : Ty.t := Ty.path "returning_traits_with_dyn::Cow".
  
  Parameter noise : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "returning_traits_with_dyn::Animal"
      (* Self *) (Ty.path "returning_traits_with_dyn::Cow")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("noise", InstanceField.Method noise) ].
End Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Cow.

Parameter random_animal : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
