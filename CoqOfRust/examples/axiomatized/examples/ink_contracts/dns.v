(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Mapping *)

Module Impl_core_default_Default_for_dns_Mapping_K_V.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (K V : Ty.t),
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.apply (Ty.path "dns::Mapping") [ K; V ])
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [ K; V ].
End Impl_core_default_Default_for_dns_Mapping_K_V.

Module Impl_dns_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "dns::Mapping") [ K; V ].
  
  Parameter contains : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_contains :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "contains" contains [ K; V ].
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "get" get [ K; V ].
  
  Parameter insert : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_insert :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "insert" insert [ K; V ].
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "new" new [ K; V ].
  
  Parameter remove : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_remove :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "remove" remove [ K; V ].
  
  Parameter size : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_size :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "size" size [ K; V ].
  
  Parameter take : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_take :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "take" take [ K; V ].
End Impl_dns_Mapping_K_V.

(* Struct AccountId *)

Module Impl_core_default_Default_for_dns_AccountId.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "dns::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_dns_AccountId.

Module Impl_core_clone_Clone_for_dns_AccountId.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "dns::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_dns_AccountId.

Module Impl_core_marker_Copy_for_dns_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "dns::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_dns_AccountId.

Module Impl_core_marker_StructuralPartialEq_for_dns_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "dns::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_dns_AccountId.

Module Impl_core_cmp_PartialEq_for_dns_AccountId.
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "dns::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_dns_AccountId.

Module Impl_core_convert_From_array_u8_for_dns_AccountId.
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      (* Self *) (Ty.path "dns::AccountId")
      (* Trait polymorphic types *)
        [ (* T *) Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]
      (* Instance *) [ ("from", InstanceField.Method from) ]
      (* Instance polymorphic types *) [].
End Impl_core_convert_From_array_u8_for_dns_AccountId.

Axiom Balance : (Ty.path "dns::Balance") = (Ty.path "u128").

Axiom Hash :
  (Ty.path "dns::Hash") = (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* Struct Env *)

(* Struct Register *)

(* Struct SetAddress *)

(* Struct Transfer *)

(* Enum Event *)

Module Impl_dns_Env.
  Definition Self : Ty.t := Ty.path "dns::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_caller :
    M.IsAssociatedFunction Self "caller" caller [].
  
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_emit_event :
    M.IsAssociatedFunction Self "emit_event" emit_event [].
End Impl_dns_Env.

(* Struct DomainNameService *)

Parameter zero_address : (list Ty.t) -> (list Value.t) -> M.

Module Impl_core_default_Default_for_dns_DomainNameService.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "dns::DomainNameService")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_dns_DomainNameService.

(* Enum Error *)

Module Impl_core_marker_StructuralPartialEq_for_dns_Error.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "dns::Error")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_dns_Error.

Module Impl_core_cmp_PartialEq_for_dns_Error.
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "dns::Error")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_dns_Error.

Module Impl_core_marker_StructuralEq_for_dns_Error.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "dns::Error")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralEq_for_dns_Error.

Module Impl_core_cmp_Eq_for_dns_Error.
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      (* Self *) (Ty.path "dns::Error")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_Eq_for_dns_Error.

Axiom Result :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "dns::Result") [ T ]) =
    (Ty.apply (Ty.path "core::result::Result") [ T; Ty.path "dns::Error" ]).

Module Impl_dns_DomainNameService.
  Definition Self : Ty.t := Ty.path "dns::DomainNameService".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env [].
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env [].
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  Parameter register : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_register :
    M.IsAssociatedFunction Self "register" register [].
  
  Parameter get_owner_or_default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get_owner_or_default :
    M.IsAssociatedFunction Self "get_owner_or_default" get_owner_or_default [].
  
  Parameter set_address : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_set_address :
    M.IsAssociatedFunction Self "set_address" set_address [].
  
  Parameter transfer : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_transfer :
    M.IsAssociatedFunction Self "transfer" transfer [].
  
  Parameter get_address_or_default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get_address_or_default :
    M.IsAssociatedFunction
      Self
      "get_address_or_default"
      get_address_or_default
      [].
  
  Parameter get_address : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get_address :
    M.IsAssociatedFunction Self "get_address" get_address [].
  
  Parameter get_owner : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get_owner :
    M.IsAssociatedFunction Self "get_owner" get_owner [].
End Impl_dns_DomainNameService.
