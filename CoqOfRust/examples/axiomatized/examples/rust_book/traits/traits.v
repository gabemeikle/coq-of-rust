(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Sheep *)

(* Trait *)
Module Animal.
  Parameter talk : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom ProvidedMethod_talk : M.IsProvidedMethod "traits::Animal" talk.
End Animal.

Module Impl_traits_Sheep.
  Definition Self : Ty.t := Ty.path "traits::Sheep".
  
  Parameter is_naked : (list Ty.t) -> (list Value.t) -> M.
End Impl_traits_Sheep.

Module Impl_traits_Animal_for_traits_Sheep.
  Definition Self : Ty.t := Ty.path "traits::Sheep".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter name : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter noise : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter talk : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t :=
    [("new", InstanceField.Method new);
      ("name", InstanceField.Method name);
      ("noise", InstanceField.Method noise);
      ("talk", InstanceField.Method talk)].
End Impl_traits_Animal_for_traits_Sheep.

Module Impl_traits_Sheep_2.
  Definition Self : Ty.t := Ty.path "traits::Sheep".
  
  Parameter shear : (list Ty.t) -> (list Value.t) -> M.
End Impl_traits_Sheep_2.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
