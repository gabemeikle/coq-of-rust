(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "Account";
    ty_params := [];
    fields :=
      [
        ("username", Ty.apply (Ty.path "&") [ Ty.path "str" ]);
        ("password", Ty.apply (Ty.path "&") [ Ty.path "str" ])
      ];
  } *)

Module Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t :=
    Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "hash_map_alternate_or_custom_key_types::Account")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t :=
    Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "hash_map_alternate_or_custom_key_types::Account")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t :=
    Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "hash_map_alternate_or_custom_key_types::Account")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t :=
    Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      (* Self *) (Ty.path "hash_map_alternate_or_custom_key_types::Account")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ].
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t :=
    Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Parameter hash : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::hash::Hash"
      (* Self *) (Ty.path "hash_map_alternate_or_custom_key_types::Account")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("hash", InstanceField.Method hash) ].
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.

(* Struct
  {
    name := "AccountInfo";
    ty_params := [];
    fields :=
      [
        ("name", Ty.apply (Ty.path "&") [ Ty.path "str" ]);
        ("email", Ty.apply (Ty.path "&") [ Ty.path "str" ])
      ];
  } *)

Axiom Accounts :
  (Ty.path "hash_map_alternate_or_custom_key_types::Accounts") =
    (Ty.apply
      (Ty.path "std::collections::hash::map::HashMap")
      [
        Ty.path "hash_map_alternate_or_custom_key_types::Account";
        Ty.path "hash_map_alternate_or_custom_key_types::AccountInfo";
        Ty.path "std::hash::random::RandomState"
      ]).

Parameter try_logon : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
