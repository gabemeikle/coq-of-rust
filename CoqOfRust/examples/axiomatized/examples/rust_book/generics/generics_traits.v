(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.





Module  DoubleDrop.
Section DoubleDrop.
  Class Trait (Self : Set) {T : Set} : Type := {
    double_drop : Ty.function [Self; T] (Ty.path "unit");
  }.
  
End DoubleDrop.
End DoubleDrop.

Module  Impl_generics_traits_DoubleDrop_T_for_U.
Section Impl_generics_traits_DoubleDrop_T_for_U.
  Context {T U : Set}.
  
  Definition Self : Ty.t := U.
  
  Parameter double_drop : U -> T -> Ty.path "unit".
  
  Definition AssociatedFunction_double_drop : Instance.t := {
    Notations.double_colon := double_drop;
  }.
  
  Definition ℐ : Instance.t := [("double_drop", double_drop)].
End Impl_generics_traits_DoubleDrop_T_for_U.
End Impl_generics_traits_DoubleDrop_T_for_U.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : Ty.path "unit".
