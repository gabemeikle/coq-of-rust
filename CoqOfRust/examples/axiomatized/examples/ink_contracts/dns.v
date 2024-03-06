(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Mapping *)

Module Impl_core_default_Default_for_dns_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "dns::Mapping") [K; V].
  
  Parameter default : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ (K V : Ty.t) : Instance.t :=
    [("default", InstanceField.Method (default K V))].
End Impl_core_default_Default_for_dns_Mapping_K_V.

Module Impl_dns_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "dns::Mapping") [K; V].
  
  Parameter contains : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Parameter insert : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Parameter new : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Parameter remove : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Parameter size : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Parameter take : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
End Impl_dns_Mapping_K_V.

(* Struct AccountId *)

Module Impl_core_default_Default_for_dns_AccountId.
  Definition Self : Ty.t := Ty.path "dns::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_dns_AccountId.

Module Impl_core_clone_Clone_for_dns_AccountId.
  Definition Self : Ty.t := Ty.path "dns::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_dns_AccountId.

Module Impl_core_marker_Copy_for_dns_AccountId.
  Definition Self : Ty.t := Ty.path "dns::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_dns_AccountId.

Module Impl_core_marker_StructuralPartialEq_for_dns_AccountId.
  Definition Self : Ty.t := Ty.path "dns::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralPartialEq_for_dns_AccountId.

Module Impl_core_cmp_PartialEq_for_dns_AccountId.
  Definition Self : Ty.t := Ty.path "dns::AccountId".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("eq", InstanceField.Method eq)].
End Impl_core_cmp_PartialEq_for_dns_AccountId.

Module Impl_core_convert_From_array_u8_for_dns_AccountId.
  Definition Self : Ty.t := Ty.path "dns::AccountId".
  
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("from", InstanceField.Method from)].
End Impl_core_convert_From_array_u8_for_dns_AccountId.

Axiom Balance : (Ty.path "dns::Balance") = (Ty.path "u128").

Axiom Hash :
  (Ty.path "dns::Hash") = (Ty.apply (Ty.path "array") [Ty.path "u8"]).

(* Enum Env *)

(* Enum Register *)

(* Enum SetAddress *)

(* Enum Transfer *)

(* Enum Event *)

Module Impl_dns_Env.
  Definition Self : Ty.t := Ty.path "dns::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
End Impl_dns_Env.

(* Enum DomainNameService *)

Parameter zero_address : (list Ty.t) -> (list Value.t) -> M.

Module Impl_core_default_Default_for_dns_DomainNameService.
  Definition Self : Ty.t := Ty.path "dns::DomainNameService".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_dns_DomainNameService.

(* Enum Error *)

Module Impl_core_marker_StructuralPartialEq_for_dns_Error.
  Definition Self : Ty.t := Ty.path "dns::Error".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralPartialEq_for_dns_Error.

Module Impl_core_cmp_PartialEq_for_dns_Error.
  Definition Self : Ty.t := Ty.path "dns::Error".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("eq", InstanceField.Method eq)].
End Impl_core_cmp_PartialEq_for_dns_Error.

Module Impl_core_marker_StructuralEq_for_dns_Error.
  Definition Self : Ty.t := Ty.path "dns::Error".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralEq_for_dns_Error.

Module Impl_core_cmp_Eq_for_dns_Error.
  Definition Self : Ty.t := Ty.path "dns::Error".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t :=
    [("assert_receiver_is_total_eq",
        InstanceField.Method assert_receiver_is_total_eq)].
End Impl_core_cmp_Eq_for_dns_Error.

Axiom Result :
  forall (T : Ty.t),
  (Ty.path "dns::Result") =
    (Ty.apply (Ty.path "core::result::Result") [T; Ty.path "dns::Error"]).

Module Impl_dns_DomainNameService.
  Definition Self : Ty.t := Ty.path "dns::DomainNameService".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter register : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get_owner_or_default : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter set_address : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter transfer : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get_address_or_default : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get_address : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get_owner : (list Ty.t) -> (list Value.t) -> M.
End Impl_dns_DomainNameService.
