(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_default_Default_for_basic_contract_caller_AccountId.
Section Impl_core_default_Default_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "basic_contract_caller::AccountId") [].
  
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.path "u128")
            (Trait := ℐ))) in
      let* α1 := M.call α0 in
      M.pure (basic_contract_caller.AccountId.Build_t α1)
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  Definition ℐ : Instance.t := [("default", default)].
End Impl_core_default_Default_for_basic_contract_caller_AccountId.
End Impl_core_default_Default_for_basic_contract_caller_AccountId.

Module  Impl_core_clone_Clone_for_basic_contract_caller_AccountId.
Section Impl_core_clone_Clone_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "basic_contract_caller::AccountId") [].
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          (DeclaredButUndefinedVariable
            (A :=
              Ty.apply
                (Ty.path "core::clone::AssertParamIsClone")
                [Ty.path "u128"]))
          [
            fun γ =>
              (let* α0 := M.read self in
              M.pure (deref α0)) :
              Ty.apply (Ty.path "basic_contract_caller::AccountId") []
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_clone : Instance.t := {
    Notations.double_colon := clone;
  }.
  
  Definition ℐ : Instance.t := [("clone", clone); ("clone_from", clone_from)].
End Impl_core_clone_Clone_for_basic_contract_caller_AccountId.
End Impl_core_clone_Clone_for_basic_contract_caller_AccountId.

Module  Impl_core_marker_Copy_for_basic_contract_caller_AccountId.
Section Impl_core_marker_Copy_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "basic_contract_caller::AccountId") [].
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_basic_contract_caller_AccountId.
End Impl_core_marker_Copy_for_basic_contract_caller_AccountId.

Axiom Hash : Ty.apply (Ty.path "array") [Ty.path "u8"].





Module  Impl_basic_contract_caller_OtherContract.
Section Impl_basic_contract_caller_OtherContract.
  Definition Self : Set :=
    Ty.apply (Ty.path "basic_contract_caller::OtherContract") [].
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [init_value] =>
      let* init_value := M.alloc init_value in
      let* α0 := M.read init_value in
      M.pure {| basic_contract_caller.OtherContract.value := α0; |}
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_new : Instance.t := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read self in
        let* α2 :=
          M.read
            ((M.var "basic_contract_caller::OtherContract::Get_value")
              (deref α1)) in
        assign
          ((M.var "basic_contract_caller::OtherContract::Get_value") (deref α0))
          ((M.var "UnOp::not") α2) in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_flip : Instance.t := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read
        ((M.var "basic_contract_caller::OtherContract::Get_value") (deref α0))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_get : Instance.t := {
    Notations.double_colon := get;
  }.
End Impl_basic_contract_caller_OtherContract.
End Impl_basic_contract_caller_OtherContract.



Module  Impl_basic_contract_caller_BasicContractCaller.
Section Impl_basic_contract_caller_BasicContractCaller.
  Definition Self : Set :=
    Ty.apply (Ty.path "basic_contract_caller::BasicContractCaller") [].
  
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
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [other_contract_code_hash] =>
      let* other_contract_code_hash := M.alloc other_contract_code_hash in
      let* other_contract :=
        let* α0 := M.read (mk_str "not yet implemented") in
        let* α1 := M.call ((M.var "core::panicking::panic") α0) in
        let* α2 := never_to_any α1 in
        M.alloc α2 in
      let* α0 := M.read other_contract in
      let* α0 :=
        M.alloc
          {| basic_contract_caller.BasicContractCaller.other_contract := α0;
          |} in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_new : Instance.t := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn flip_and_get(&mut self) -> bool {
          self.other_contract.flip();
          self.other_contract.get()
      }
  *)
  Definition flip_and_get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 :=
          M.call
            ((Ty.apply
                  (Ty.path "basic_contract_caller::OtherContract")
                  [])::["flip"]
              (borrow_mut
                ((M.var
                    "basic_contract_caller::BasicContractCaller::Get_other_contract")
                  (deref α0)))) in
        M.alloc α1 in
      let* α0 := M.read self in
      let* α1 :=
        M.call
          ((Ty.apply
                (Ty.path "basic_contract_caller::OtherContract")
                [])::["get"]
            (borrow
              ((M.var
                  "basic_contract_caller::BasicContractCaller::Get_other_contract")
                (deref α0)))) in
      let* α0 := M.alloc α1 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_flip_and_get : Instance.t := {
    Notations.double_colon := flip_and_get;
  }.
End Impl_basic_contract_caller_BasicContractCaller.
End Impl_basic_contract_caller_BasicContractCaller.
