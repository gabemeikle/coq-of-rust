(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "CustomAllocator";
    ty_params := [];
    fields :=
      [
        ("value",
          Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "bool"; Ty.path "alloc::alloc::Global" ])
      ];
  } *)

Module Impl_custom_allocator_CustomAllocator.
  Definition Self : Ty.t := Ty.path "custom_allocator::CustomAllocator".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_default :
    M.IsAssociatedFunction Self "default" default.
  
  Parameter flip : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_custom_allocator_CustomAllocator.
