(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Mapping *)

Module Impl_core_default_Default_for_erc20_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "erc20::Mapping") [ K; V ].
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ (K V : Ty.t) : Instance.t :=
    [ ("default", InstanceField.Method (default K V)) ].
End Impl_core_default_Default_for_erc20_Mapping_K_V.

Module Impl_erc20_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "erc20::Mapping") [ K; V ].
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter insert : (list Ty.t) -> (list Value.t) -> M.
End Impl_erc20_Mapping_K_V.

(* Struct AccountId *)

Module Impl_core_default_Default_for_erc20_AccountId.
  Definition Self : Ty.t := Ty.path "erc20::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_erc20_AccountId.

Module Impl_core_clone_Clone_for_erc20_AccountId.
  Definition Self : Ty.t := Ty.path "erc20::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_erc20_AccountId.

Module Impl_core_marker_Copy_for_erc20_AccountId.
  Definition Self : Ty.t := Ty.path "erc20::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_erc20_AccountId.

Axiom Balance : (Ty.path "erc20::Balance") = (Ty.path "u128").

(* Enum Env *)

(* Enum Erc20 *)

Module Impl_core_default_Default_for_erc20_Erc20.
  Definition Self : Ty.t := Ty.path "erc20::Erc20".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_erc20_Erc20.

(* Enum Transfer *)

(* Enum Approval *)

(* Enum Event *)

(* Enum Error *)

Axiom Result :
  forall (T : Ty.t),
  (Ty.path "erc20::Result") =
    (Ty.apply (Ty.path "core::result::Result") [ T; Ty.path "erc20::Error" ]).

Module Impl_erc20_Env.
  Definition Self : Ty.t := Ty.path "erc20::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
End Impl_erc20_Env.

Module Impl_erc20_Erc20.
  Definition Self : Ty.t := Ty.path "erc20::Erc20".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
End Impl_erc20_Erc20.

Module Impl_erc20_Erc20_2.
  Definition Self : Ty.t := Ty.path "erc20::Erc20".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter total_supply : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter balance_of_impl : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter balance_of : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter allowance_impl : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter allowance : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter transfer_from_to : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter transfer : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter approve : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter transfer_from : (list Ty.t) -> (list Value.t) -> M.
End Impl_erc20_Erc20_2.
