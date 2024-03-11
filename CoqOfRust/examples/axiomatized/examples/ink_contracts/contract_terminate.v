(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_contract_terminate_AccountId.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "contract_terminate::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_contract_terminate_AccountId.

Module Impl_core_clone_Clone_for_contract_terminate_AccountId.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "contract_terminate::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_contract_terminate_AccountId.

Module Impl_core_marker_Copy_for_contract_terminate_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "contract_terminate::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_contract_terminate_AccountId.

(* Struct
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "contract_terminate::AccountId") ];
  } *)

Module Impl_contract_terminate_Env.
  Definition Self : Ty.t := Ty.path "contract_terminate::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_caller :
    M.IsAssociatedFunction Self "caller" caller [].
  
  Parameter terminate_contract : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_terminate_contract :
    M.IsAssociatedFunction Self "terminate_contract" terminate_contract [].
End Impl_contract_terminate_Env.

(* Struct
  {
    name := "JustTerminate";
    ty_params := [];
  } *)

Module Impl_contract_terminate_JustTerminate.
  Definition Self : Ty.t := Ty.path "contract_terminate::JustTerminate".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env [].
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env [].
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  Parameter terminate_me : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_terminate_me :
    M.IsAssociatedFunction Self "terminate_me" terminate_me [].
End Impl_contract_terminate_JustTerminate.
