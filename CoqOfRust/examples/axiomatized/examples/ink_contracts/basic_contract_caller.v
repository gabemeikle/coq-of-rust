(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "basic_contract_caller::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_basic_contract_caller_AccountId.

Module Impl_core_clone_Clone_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "basic_contract_caller::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_basic_contract_caller_AccountId.

Module Impl_core_marker_Copy_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "basic_contract_caller::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_basic_contract_caller_AccountId.

Axiom Hash :
  (Ty.path "basic_contract_caller::Hash") =
    (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* Enum Error *)
(* {
  ty_params := [];
  variants := [];
} *)

(* StructRecord
  {
    name := "OtherContract";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

Module Impl_basic_contract_caller_OtherContract.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::OtherContract".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter flip : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_basic_contract_caller_OtherContract.

(* StructRecord
  {
    name := "BasicContractCaller";
    ty_params := [];
    fields :=
      [ ("other_contract", Ty.path "basic_contract_caller::OtherContract") ];
  } *)

Module Impl_basic_contract_caller_BasicContractCaller.
  Definition Self : Ty.t :=
    Ty.path "basic_contract_caller::BasicContractCaller".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter flip_and_get : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_flip_and_get :
    M.IsAssociatedFunction Self "flip_and_get" flip_and_get.
End Impl_basic_contract_caller_BasicContractCaller.
