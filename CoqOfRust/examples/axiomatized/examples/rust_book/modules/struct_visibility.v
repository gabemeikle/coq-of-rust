(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  
  
  
  
  Module  Impl_struct_visibility_my_ClosedBox_T.
  Section Impl_struct_visibility_my_ClosedBox_T.
    Context {T : Set}.
    
    Definition Self : Set :=
      Ty.apply (Ty.path "struct_visibility::my::ClosedBox") [T].
    
    Parameter new :
        T -> Ty.apply (Ty.path "struct_visibility::my::ClosedBox") [T].
    
    Definition AssociatedFunction_new : Instance.t := {
      Notations.double_colon := new;
    }.
  End Impl_struct_visibility_my_ClosedBox_T.
  End Impl_struct_visibility_my_ClosedBox_T.
End my.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : Ty.path "unit".
