(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_contract_terminate_AccountId_t.
Section Impl_core_default_Default_for_contract_terminate_AccountId_t.
  Ltac Self := exact contract_terminate.AccountId.t.
  
  (*
  Default
  *)
  Parameter default : M contract_terminate.AccountId.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon ltac:(Self) "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_contract_terminate_AccountId_t.
End Impl_core_default_Default_for_contract_terminate_AccountId_t.

Module  Impl_core_clone_Clone_for_contract_terminate_AccountId_t.
Section Impl_core_clone_Clone_for_contract_terminate_AccountId_t.
  Ltac Self := exact contract_terminate.AccountId.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref ltac:(Self)) -> M contract_terminate.AccountId.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_contract_terminate_AccountId_t.
End Impl_core_clone_Clone_for_contract_terminate_AccountId_t.

Module  Impl_core_marker_Copy_for_contract_terminate_AccountId_t.
Section Impl_core_marker_Copy_for_contract_terminate_AccountId_t.
  Ltac Self := exact contract_terminate.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_contract_terminate_AccountId_t.
End Impl_core_marker_Copy_for_contract_terminate_AccountId_t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : contract_terminate.AccountId.t;
  }.
  
  Global Instance Get_caller : Notations.Dot "caller" := {
    Notations.dot :=
      Ref.map (fun x => x.(caller)) (fun v x => x <| caller := v |>);
  }.
  Global Instance Get_AF_caller : Notations.DoubleColon t "caller" := {
    Notations.double_colon (x : M.Val t) := x.["caller"];
  }.
End Env.
End Env.

Module  Impl_contract_terminate_Env_t.
Section Impl_contract_terminate_Env_t.
  Ltac Self := exact contract_terminate.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Parameter caller : (ref ltac:(Self)) -> M contract_terminate.AccountId.t.
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon ltac:(Self) "caller" := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn terminate_contract(&self, _account: AccountId) {
          unimplemented!()
      }
  *)
  Parameter terminate_contract :
      (ref ltac:(Self)) -> contract_terminate.AccountId.t -> M unit.
  
  Global Instance AssociatedFunction_terminate_contract :
    Notations.DoubleColon ltac:(Self) "terminate_contract" := {
    Notations.double_colon := terminate_contract;
  }.
End Impl_contract_terminate_Env_t.
End Impl_contract_terminate_Env_t.

Module  JustTerminate.
Section JustTerminate.
  Record t : Set := { }.
End JustTerminate.
End JustTerminate.

Module  Impl_contract_terminate_JustTerminate_t.
Section Impl_contract_terminate_JustTerminate_t.
  Ltac Self := exact contract_terminate.JustTerminate.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : M contract_terminate.Env.t.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon ltac:(Self) "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Parameter env : (ref ltac:(Self)) -> M contract_terminate.Env.t.
  
  Global Instance AssociatedFunction_env :
    Notations.DoubleColon ltac:(Self) "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new() -> Self {
          Self {}
      }
  *)
  Parameter new : M ltac:(Self).
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn terminate_me(&mut self) {
          self.env().terminate_contract(self.env().caller());
      }
  *)
  Parameter terminate_me : (mut_ref ltac:(Self)) -> M unit.
  
  Global Instance AssociatedFunction_terminate_me :
    Notations.DoubleColon ltac:(Self) "terminate_me" := {
    Notations.double_colon := terminate_me;
  }.
End Impl_contract_terminate_JustTerminate_t.
End Impl_contract_terminate_JustTerminate_t.
