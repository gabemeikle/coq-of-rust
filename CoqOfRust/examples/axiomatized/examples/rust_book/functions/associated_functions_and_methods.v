(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Point *)

Module Impl_associated_functions_and_methods_Point.
  Definition Self : Ty.t := Ty.path "associated_functions_and_methods::Point".
  
  Parameter origin : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_origin :
    M.IsAssociatedFunction Self "origin" origin [].
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
End Impl_associated_functions_and_methods_Point.

(* Struct Rectangle *)

Module Impl_associated_functions_and_methods_Rectangle.
  Definition Self : Ty.t :=
    Ty.path "associated_functions_and_methods::Rectangle".
  
  Parameter get_p1 : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get_p1 :
    M.IsAssociatedFunction Self "get_p1" get_p1 [].
  
  Parameter area : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_area : M.IsAssociatedFunction Self "area" area [].
  
  Parameter perimeter : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_perimeter :
    M.IsAssociatedFunction Self "perimeter" perimeter [].
  
  Parameter translate : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_translate :
    M.IsAssociatedFunction Self "translate" translate [].
End Impl_associated_functions_and_methods_Rectangle.

(* Struct Pair *)

Module Impl_associated_functions_and_methods_Pair.
  Definition Self : Ty.t := Ty.path "associated_functions_and_methods::Pair".
  
  Parameter destroy : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_destroy :
    M.IsAssociatedFunction Self "destroy" destroy [].
End Impl_associated_functions_and_methods_Pair.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
