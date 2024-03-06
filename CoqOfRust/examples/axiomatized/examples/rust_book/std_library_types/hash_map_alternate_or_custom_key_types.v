(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Account *)

Module Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t :=
    Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t :=
    Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("eq", InstanceField.Method eq)].
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t :=
    Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t :=
    Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("assert_receiver_is_total_eq",
      InstanceField.Method assert_receiver_is_total_eq)].
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t :=
    Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Parameter hash : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("hash", InstanceField.Method hash)].
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.

(* Enum AccountInfo *)

Axiom Accounts :
    (Ty.path "hash_map_alternate_or_custom_key_types::Accounts") =
      (Ty.apply
        (Ty.path "std::collections::hash::map::HashMap")
        [Ty.path "hash_map_alternate_or_custom_key_types::Account";
          Ty.path "hash_map_alternate_or_custom_key_types::AccountInfo";
          Ty.path "std::hash::random::RandomState"]).

Parameter try_logon : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
