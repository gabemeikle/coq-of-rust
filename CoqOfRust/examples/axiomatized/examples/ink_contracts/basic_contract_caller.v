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

Module  Impl_core_default_Default_for_basic_contract_caller_AccountId_t.
Section Impl_core_default_Default_for_basic_contract_caller_AccountId_t.
  Ltac Self := exact basic_contract_caller.AccountId.t.
  
  (*
  Default
  *)
  Parameter default : M basic_contract_caller.AccountId.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon ltac:(Self) "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_basic_contract_caller_AccountId_t.
End Impl_core_default_Default_for_basic_contract_caller_AccountId_t.

Module  Impl_core_clone_Clone_for_basic_contract_caller_AccountId_t.
Section Impl_core_clone_Clone_for_basic_contract_caller_AccountId_t.
  Ltac Self := exact basic_contract_caller.AccountId.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref ltac:(Self)) -> M basic_contract_caller.AccountId.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_basic_contract_caller_AccountId_t.
End Impl_core_clone_Clone_for_basic_contract_caller_AccountId_t.

Module  Impl_core_marker_Copy_for_basic_contract_caller_AccountId_t.
Section Impl_core_marker_Copy_for_basic_contract_caller_AccountId_t.
  Ltac Self := exact basic_contract_caller.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_basic_contract_caller_AccountId_t.
End Impl_core_marker_Copy_for_basic_contract_caller_AccountId_t.

Ltac Hash := exact (array u8.t).

Module Error.
  Inductive t : Set :=
  .
End Error.

Module  OtherContract.
Section OtherContract.
  Record t : Set := {
    value : bool.t;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End OtherContract.
End OtherContract.

Module  Impl_basic_contract_caller_OtherContract_t.
Section Impl_basic_contract_caller_OtherContract_t.
  Ltac Self := exact basic_contract_caller.OtherContract.t.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Parameter new : bool.t -> M ltac:(Self).
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Parameter flip : (mut_ref ltac:(Self)) -> M unit.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon ltac:(Self) "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Parameter get : (ref ltac:(Self)) -> M bool.t.
  
  Global Instance AssociatedFunction_get :
    Notations.DoubleColon ltac:(Self) "get" := {
    Notations.double_colon := get;
  }.
End Impl_basic_contract_caller_OtherContract_t.
End Impl_basic_contract_caller_OtherContract_t.

Module  BasicContractCaller.
Section BasicContractCaller.
  Record t : Set := {
    other_contract : basic_contract_caller.OtherContract.t;
  }.
  
  Global Instance Get_other_contract : Notations.Dot "other_contract" := {
    Notations.dot :=
      Ref.map
        (fun x => x.(other_contract))
        (fun v x => x <| other_contract := v |>);
  }.
  Global Instance Get_AF_other_contract :
    Notations.DoubleColon t "other_contract" := {
    Notations.double_colon (x : M.Val t) := x.["other_contract"];
  }.
End BasicContractCaller.
End BasicContractCaller.

Module  Impl_basic_contract_caller_BasicContractCaller_t.
Section Impl_basic_contract_caller_BasicContractCaller_t.
  Ltac Self := exact basic_contract_caller.BasicContractCaller.t.
  
  (*
      pub fn new(other_contract_code_hash: Hash) -> Self {
          // let other_contract = OtherContract::new(true)
          //     .code_hash(other_contract_code_hash)
          //     .endowment(0)
          //     .salt_bytes([0xDE, 0xAD, 0xBE, 0xEF])
          //     .instantiate();
          let other_contract = todo!();
  
          Self { other_contract }
      }
  *)
  Parameter new : ltac:(basic_contract_caller.Hash) -> M ltac:(Self).
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn flip_and_get(&mut self) -> bool {
          self.other_contract.flip();
          self.other_contract.get()
      }
  *)
  Parameter flip_and_get : (mut_ref ltac:(Self)) -> M bool.t.
  
  Global Instance AssociatedFunction_flip_and_get :
    Notations.DoubleColon ltac:(Self) "flip_and_get" := {
    Notations.double_colon := flip_and_get;
  }.
End Impl_basic_contract_caller_BasicContractCaller_t.
End Impl_basic_contract_caller_BasicContractCaller_t.
