(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_call_builder_AccountId.
  Definition Self : Ty.t := Ty.path "call_builder::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_call_builder_AccountId.

Module Impl_core_clone_Clone_for_call_builder_AccountId.
  Definition Self : Ty.t := Ty.path "call_builder::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_call_builder_AccountId.

Module Impl_core_marker_Copy_for_call_builder_AccountId.
  Definition Self : Ty.t := Ty.path "call_builder::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_call_builder_AccountId.

Axiom Balance : (Ty.path "call_builder::Balance") = (Ty.path "u128").

Axiom Hash :
  (Ty.path "call_builder::Hash") =
    (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* Enum LangError *)

(* Struct Selector *)

Module Impl_call_builder_Selector.
  Definition Self : Ty.t := Ty.path "call_builder::Selector".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
End Impl_call_builder_Selector.

(* Struct CallBuilderTest *)

Module Impl_core_default_Default_for_call_builder_CallBuilderTest.
  Definition Self : Ty.t := Ty.path "call_builder::CallBuilderTest".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_call_builder_CallBuilderTest.

Module Impl_call_builder_CallBuilderTest.
  Definition Self : Ty.t := Ty.path "call_builder::CallBuilderTest".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter call : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter invoke : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter call_instantiate : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter call_instantiate_fallible : (list Ty.t) -> (list Value.t) -> M.
End Impl_call_builder_CallBuilderTest.
