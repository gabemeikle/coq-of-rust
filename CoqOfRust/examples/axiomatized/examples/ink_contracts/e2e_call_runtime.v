(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_e2e_call_runtime_AccountId_t.
Section Impl_core_default_Default_for_e2e_call_runtime_AccountId_t.
  Definition Self : Set := e2e_call_runtime.AccountId.t.
  
  (*
  Default
  *)
  Parameter default : M e2e_call_runtime.AccountId.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_e2e_call_runtime_AccountId_t.
End Impl_core_default_Default_for_e2e_call_runtime_AccountId_t.

Module  Impl_core_clone_Clone_for_e2e_call_runtime_AccountId_t.
Section Impl_core_clone_Clone_for_e2e_call_runtime_AccountId_t.
  Definition Self : Set := e2e_call_runtime.AccountId.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M e2e_call_runtime.AccountId.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_e2e_call_runtime_AccountId_t.
End Impl_core_clone_Clone_for_e2e_call_runtime_AccountId_t.

Module  Impl_core_marker_Copy_for_e2e_call_runtime_AccountId_t.
Section Impl_core_marker_Copy_for_e2e_call_runtime_AccountId_t.
  Definition Self : Set := e2e_call_runtime.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_e2e_call_runtime_AccountId_t.
End Impl_core_marker_Copy_for_e2e_call_runtime_AccountId_t.

Ltac Balance := exact u128.t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : e2e_call_runtime.AccountId.t;
  }.
  
  Definition Get_caller :=
    Ref.map (fun α => Some α.(caller)) (fun β α => Some (α <| caller := β |>)).
End Env.
End Env.

Module  Impl_e2e_call_runtime_Env_t.
Section Impl_e2e_call_runtime_Env_t.
  Definition Self : Set := e2e_call_runtime.Env.t.
  
  (*
      fn balance(&self) -> Balance {
          unimplemented!()
      }
  *)
  Parameter balance : (ref Self) -> M ltac:(e2e_call_runtime.Balance).
  
  Global Instance AssociatedFunction_balance :
    Notations.DoubleColon Self "balance" := {
    Notations.double_colon := balance;
  }.
End Impl_e2e_call_runtime_Env_t.
End Impl_e2e_call_runtime_Env_t.

Module  Contract.
Section Contract.
  Inductive t : Set := Build.
End Contract.
End Contract.

Module  Impl_core_default_Default_for_e2e_call_runtime_Contract_t.
Section Impl_core_default_Default_for_e2e_call_runtime_Contract_t.
  Definition Self : Set := e2e_call_runtime.Contract.t.
  
  (*
  Default
  *)
  Parameter default : M e2e_call_runtime.Contract.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_e2e_call_runtime_Contract_t.
End Impl_core_default_Default_for_e2e_call_runtime_Contract_t.

Module  Impl_e2e_call_runtime_Contract_t.
Section Impl_e2e_call_runtime_Contract_t.
  Definition Self : Set := e2e_call_runtime.Contract.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : M e2e_call_runtime.Env.t.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon Self "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Parameter env : (ref Self) -> M e2e_call_runtime.Env.t.
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new() -> Self {
          Self {}
      }
  *)
  Parameter new : M Self.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn get_contract_balance(&self) -> Balance {
          self.env().balance()
      }
  *)
  Parameter get_contract_balance :
      (ref Self) -> M ltac:(e2e_call_runtime.Balance).
  
  Global Instance AssociatedFunction_get_contract_balance :
    Notations.DoubleColon Self "get_contract_balance" := {
    Notations.double_colon := get_contract_balance;
  }.
End Impl_e2e_call_runtime_Contract_t.
End Impl_e2e_call_runtime_Contract_t.
