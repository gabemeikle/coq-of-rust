(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  (* Struct
    {
      name := "OpenBox";
      ty_params := [ ("T", None) ];
      fields := [ ("contents", T) ];
    } *)
  
  (* Struct
    {
      name := "ClosedBox";
      ty_params := [ ("T", None) ];
      fields := [ ("contents", T) ];
    } *)
  
  Module Impl_struct_visibility_my_ClosedBox_T.
    Definition Self (T : Ty.t) : Ty.t :=
      Ty.apply (Ty.path "struct_visibility::my::ClosedBox") [ T ].
    
    Parameter new : (list Ty.t) -> (list Value.t) -> M.
    
    Axiom AssociatedFunction_new :
      forall (T : Ty.t),
      M.IsAssociatedFunction (Self T) "new" new [ T ].
  End Impl_struct_visibility_my_ClosedBox_T.
End my.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
