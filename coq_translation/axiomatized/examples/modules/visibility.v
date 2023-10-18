(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my_mod.
  Parameter private_function : forall `{State.Trait}, M unit.
  
  Parameter function : forall `{State.Trait}, M unit.
  
  Parameter indirect_access : forall `{State.Trait}, M unit.
  
  Module nested.
    Parameter function : forall `{State.Trait}, M unit.
    
    (* #[allow(dead_code)] - function was ignored by the compiler *)
    Parameter private_function : forall `{State.Trait}, M unit.
    
    Parameter public_function_in_my_mod : forall `{State.Trait}, M unit.
    
    Parameter public_function_in_nested : forall `{State.Trait}, M unit.
    
    Parameter public_function_in_super_mod : forall `{State.Trait}, M unit.
  End nested.
  
  Parameter call_public_function_in_my_mod : forall `{State.Trait}, M unit.
  
  Parameter public_function_in_crate : forall `{State.Trait}, M unit.
  
  Module private_nested.
    (* #[allow(dead_code)] - function was ignored by the compiler *)
    Parameter function : forall `{State.Trait}, M unit.
    
    (* #[allow(dead_code)] - function was ignored by the compiler *)
    Parameter restricted_function : forall `{State.Trait}, M unit.
  End private_nested.
End my_mod.

Parameter private_function : forall `{State.Trait}, M unit.

Parameter function : forall `{State.Trait}, M unit.

Parameter indirect_access : forall `{State.Trait}, M unit.

Module nested.
  Parameter function : forall `{State.Trait}, M unit.
  
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Parameter private_function : forall `{State.Trait}, M unit.
  
  Parameter public_function_in_my_mod : forall `{State.Trait}, M unit.
  
  Parameter public_function_in_nested : forall `{State.Trait}, M unit.
  
  Parameter public_function_in_super_mod : forall `{State.Trait}, M unit.
End nested.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter private_function : forall `{State.Trait}, M unit.

Parameter public_function_in_my_mod : forall `{State.Trait}, M unit.

Parameter public_function_in_nested : forall `{State.Trait}, M unit.

Parameter public_function_in_super_mod : forall `{State.Trait}, M unit.

Parameter call_public_function_in_my_mod : forall `{State.Trait}, M unit.

Parameter public_function_in_crate : forall `{State.Trait}, M unit.

Module private_nested.
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Parameter function : forall `{State.Trait}, M unit.
  
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Parameter restricted_function : forall `{State.Trait}, M unit.
End private_nested.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter function : forall `{State.Trait}, M unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter restricted_function : forall `{State.Trait}, M unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
