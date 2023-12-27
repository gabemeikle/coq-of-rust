(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>));
  }.
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_basic_contract_caller_AccountId_t.
Section Impl_core_default_Default_for_basic_contract_caller_AccountId_t.
  Definition Self : Set := basic_contract_caller.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M basic_contract_caller.AccountId.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    M.pure (basic_contract_caller.AccountId.Build_t α0).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_basic_contract_caller_AccountId_t.
End Impl_core_default_Default_for_basic_contract_caller_AccountId_t.

Module  Impl_core_clone_Clone_for_basic_contract_caller_AccountId_t.
Section Impl_core_clone_Clone_for_basic_contract_caller_AccountId_t.
  Definition Self : Set := basic_contract_caller.AccountId.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref Self) : M basic_contract_caller.AccountId.t :=
    let* self := M.alloc self in
    let* α0 : M.Val basic_contract_caller.AccountId.t :=
      match tt with
      | _ =>
        let* α0 : ref basic_contract_caller.AccountId.t := M.read self in
        M.pure (deref α0)
      end in
    M.read α0.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_basic_contract_caller_AccountId_t.
End Impl_core_clone_Clone_for_basic_contract_caller_AccountId_t.

Module  Impl_core_marker_Copy_for_basic_contract_caller_AccountId_t.
Section Impl_core_marker_Copy_for_basic_contract_caller_AccountId_t.
  Definition Self : Set := basic_contract_caller.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
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
      Ref.map (fun α => Some α.(value)) (fun β α => Some (α <| value := β |>));
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (α : M.Val t) := α.["value"];
  }.
End OtherContract.
End OtherContract.

Module  Impl_basic_contract_caller_OtherContract_t.
Section Impl_basic_contract_caller_OtherContract_t.
  Definition Self : Set := basic_contract_caller.OtherContract.t.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (init_value : bool.t) : M Self :=
    let* init_value := M.alloc init_value in
    let* α0 : bool.t := M.read init_value in
    M.pure {| basic_contract_caller.OtherContract.value := α0; |}.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (self : mut_ref Self) : M unit :=
    let* self := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref basic_contract_caller.OtherContract.t := M.read self in
      let* α1 : mut_ref basic_contract_caller.OtherContract.t := M.read self in
      let* α2 : bool.t := M.read (deref α1).["value"] in
      assign (deref α0).["value"] (UnOp.not α2) in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon Self "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (self : ref Self) : M bool.t :=
    let* self := M.alloc self in
    let* α0 : ref basic_contract_caller.OtherContract.t := M.read self in
    M.read (deref α0).["value"].
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
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
        (fun α => Some α.(other_contract))
        (fun β α => Some (α <| other_contract := β |>));
  }.
  Global Instance Get_AF_other_contract :
    Notations.DoubleColon t "other_contract" := {
    Notations.double_colon (α : M.Val t) := α.["other_contract"];
  }.
End BasicContractCaller.
End BasicContractCaller.

Module  Impl_basic_contract_caller_BasicContractCaller_t.
Section Impl_basic_contract_caller_BasicContractCaller_t.
  Definition Self : Set := basic_contract_caller.BasicContractCaller.t.
  
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
  Definition new
      (other_contract_code_hash : ltac:(basic_contract_caller.Hash))
      : M Self :=
    let* other_contract_code_hash := M.alloc other_contract_code_hash in
    let* other_contract : M.Val basic_contract_caller.OtherContract.t :=
      let* α0 : ref str.t := M.read (mk_str "not yet implemented") in
      let* α1 : never.t := M.call (core.panicking.panic α0) in
      let* α2 : basic_contract_caller.OtherContract.t := never_to_any α1 in
      M.alloc α2 in
    let* α0 : basic_contract_caller.OtherContract.t := M.read other_contract in
    let* α0 : M.Val basic_contract_caller.BasicContractCaller.t :=
      M.alloc
        {| basic_contract_caller.BasicContractCaller.other_contract := α0; |} in
    M.read α0.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn flip_and_get(&mut self) -> bool {
          self.other_contract.flip();
          self.other_contract.get()
      }
  *)
  Definition flip_and_get (self : mut_ref Self) : M bool.t :=
    let* self := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref basic_contract_caller.BasicContractCaller.t :=
        M.read self in
      let* α1 : unit :=
        M.call
          (basic_contract_caller.OtherContract.t::["flip"]
            (borrow_mut (deref α0).["other_contract"])) in
      M.alloc α1 in
    let* α0 : mut_ref basic_contract_caller.BasicContractCaller.t :=
      M.read self in
    let* α1 : bool.t :=
      M.call
        (basic_contract_caller.OtherContract.t::["get"]
          (borrow (deref α0).["other_contract"])) in
    let* α0 : M.Val bool.t := M.alloc α1 in
    M.read α0.
  
  Global Instance AssociatedFunction_flip_and_get :
    Notations.DoubleColon Self "flip_and_get" := {
    Notations.double_colon := flip_and_get;
  }.
End Impl_basic_contract_caller_BasicContractCaller_t.
End Impl_basic_contract_caller_BasicContractCaller_t.
