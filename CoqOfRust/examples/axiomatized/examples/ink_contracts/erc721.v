(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Mapping *)

Module Impl_core_default_Default_for_erc721_Mapping_K_V.
  Context {K V : Set}.
  
  Definition Self : Ty.t := Ty.apply (Ty.path "erc721::Mapping") [K; V].
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_erc721_Mapping_K_V.

Module Impl_erc721_Mapping_K_V.
  Context {K V : Set}.
  
  Definition Self : Ty.t := Ty.apply (Ty.path "erc721::Mapping") [K; V].
  
  Parameter contains : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter insert : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter remove : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter size : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter take : (list Ty.t) -> (list Value.t) -> M.
End Impl_erc721_Mapping_K_V.

(* Struct AccountId *)

Module Impl_core_default_Default_for_erc721_AccountId.
  Definition Self : Ty.t := Ty.path "erc721::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_erc721_AccountId.

Module Impl_core_clone_Clone_for_erc721_AccountId.
  Definition Self : Ty.t := Ty.path "erc721::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_erc721_AccountId.

Module Impl_core_marker_Copy_for_erc721_AccountId.
  Definition Self : Ty.t := Ty.path "erc721::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_erc721_AccountId.

Module Impl_core_marker_StructuralPartialEq_for_erc721_AccountId.
  Definition Self : Ty.t := Ty.path "erc721::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralPartialEq_for_erc721_AccountId.

Module Impl_core_cmp_PartialEq_for_erc721_AccountId.
  Definition Self : Ty.t := Ty.path "erc721::AccountId".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("eq", InstanceField.Method eq)].
End Impl_core_cmp_PartialEq_for_erc721_AccountId.

Module Impl_core_convert_From_array_u8_for_erc721_AccountId.
  Definition Self : Ty.t := Ty.path "erc721::AccountId".
  
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("from", InstanceField.Method from)].
End Impl_core_convert_From_array_u8_for_erc721_AccountId.

Axiom Balance : (Ty.path "erc721::Balance") = (Ty.path "u128").

(* Enum Env *)

Axiom TokenId : (Ty.path "erc721::TokenId") = (Ty.path "u32").

(* Enum Erc721 *)

Module Impl_core_default_Default_for_erc721_Erc721.
  Definition Self : Ty.t := Ty.path "erc721::Erc721".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_erc721_Erc721.

(* Enum Error *)

Module Impl_core_marker_StructuralPartialEq_for_erc721_Error.
  Definition Self : Ty.t := Ty.path "erc721::Error".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralPartialEq_for_erc721_Error.

Module Impl_core_cmp_PartialEq_for_erc721_Error.
  Definition Self : Ty.t := Ty.path "erc721::Error".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("eq", InstanceField.Method eq)].
End Impl_core_cmp_PartialEq_for_erc721_Error.

Module Impl_core_marker_StructuralEq_for_erc721_Error.
  Definition Self : Ty.t := Ty.path "erc721::Error".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralEq_for_erc721_Error.

Module Impl_core_cmp_Eq_for_erc721_Error.
  Definition Self : Ty.t := Ty.path "erc721::Error".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("assert_receiver_is_total_eq",
      InstanceField.Method assert_receiver_is_total_eq)].
End Impl_core_cmp_Eq_for_erc721_Error.

Module Impl_core_clone_Clone_for_erc721_Error.
  Definition Self : Ty.t := Ty.path "erc721::Error".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_erc721_Error.

Module Impl_core_marker_Copy_for_erc721_Error.
  Definition Self : Ty.t := Ty.path "erc721::Error".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_erc721_Error.

(* Enum Transfer *)

(* Enum Approval *)

(* Enum ApprovalForAll *)

(* Enum Event *)

Module Impl_erc721_Env.
  Definition Self : Ty.t := Ty.path "erc721::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
End Impl_erc721_Env.

Module Impl_erc721_Erc721.
  Definition Self : Ty.t := Ty.path "erc721::Erc721".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter balance_of_or_zero : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter clear_approval : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter approved_for_all : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter owner_of : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter approved_or_owner : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter exists_ : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter balance_of : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get_approved : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter is_approved_for_all : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter approve_for_all : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter set_approval_for_all : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter approve_for : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter approve : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter remove_token_from : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter add_token_to : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter transfer_token_from : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter transfer : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter transfer_from : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter mint : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter burn : (list Ty.t) -> (list Value.t) -> M.
End Impl_erc721_Erc721.
