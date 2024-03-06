(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_contract_ref_AccountId.
  Definition Self : Ty.t := Ty.path "contract_ref::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_contract_ref_AccountId.

Module Impl_core_clone_Clone_for_contract_ref_AccountId.
  Definition Self : Ty.t := Ty.path "contract_ref::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_contract_ref_AccountId.

Module Impl_core_marker_Copy_for_contract_ref_AccountId.
  Definition Self : Ty.t := Ty.path "contract_ref::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_contract_ref_AccountId.

Axiom Balance : (Ty.path "contract_ref::Balance") = (Ty.path "u128").

Axiom Hash :
    (Ty.path "contract_ref::Hash") =
      (Ty.apply (Ty.path "array") [Ty.path "u8"]).

(* Enum Env *)

(* Enum FlipperRef *)

(* Struct FlipperError *)

Module Impl_core_fmt_Debug_for_contract_ref_FlipperError.
  Definition Self : Ty.t := Ty.path "contract_ref::FlipperError".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Debug_for_contract_ref_FlipperError.

Module Impl_contract_ref_FlipperRef.
  Definition Self : Ty.t := Ty.path "contract_ref::FlipperRef".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter new_default : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter try_new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter flip : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
End Impl_contract_ref_FlipperRef.

(* Enum ContractRef *)

Module Impl_contract_ref_ContractRef.
  Definition Self : Ty.t := Ty.path "contract_ref::ContractRef".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter try_new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter flip : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
End Impl_contract_ref_ContractRef.
