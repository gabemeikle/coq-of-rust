(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "Flipper";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

Module Impl_flipper_Flipper.
  Definition Self : Ty.t := Ty.path "flipper::Flipper".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter new_default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_default :
    M.IsAssociatedFunction Self "new_default" new_default.
  
  Parameter flip : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_flipper_Flipper.
