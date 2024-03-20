(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my_mod.
  Parameter private_function : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter function : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter indirect_access : (list Ty.t) -> (list Value.t) -> M.
  
  Module nested.
    Parameter function : (list Ty.t) -> (list Value.t) -> M.
    
    Parameter private_function : (list Ty.t) -> (list Value.t) -> M.
    
    Parameter public_function_in_my_mod : (list Ty.t) -> (list Value.t) -> M.
    
    Parameter public_function_in_nested : (list Ty.t) -> (list Value.t) -> M.
    
    Parameter public_function_in_super_mod : (list Ty.t) -> (list Value.t) -> M.
  End nested.
  
  Parameter call_public_function_in_my_mod : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter public_function_in_crate : (list Ty.t) -> (list Value.t) -> M.
  
  Module private_nested.
    Parameter function : (list Ty.t) -> (list Value.t) -> M.
    
    Parameter restricted_function : (list Ty.t) -> (list Value.t) -> M.
  End private_nested.
End my_mod.

Parameter function : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
