(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_contract_terminate_AccountId.
  Definition Self : Ty.t := Ty.path "contract_terminate::AccountId".
  
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        M.get_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "u128" ] in
      let* α1 := M.call α0 [] in
      M.pure (contract_terminate.AccountId.Build_t α1)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_contract_terminate_AccountId.

Module Impl_core_clone_Clone_for_contract_terminate_AccountId.
  Definition Self : Ty.t := Ty.path "contract_terminate::AccountId".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          (DeclaredButUndefinedVariable
            (A :=
              Ty.apply
                (Ty.path "core::clone::AssertParamIsClone")
                [ Ty.path "u128" ]))
          [
            fun γ =>
              (let* α0 := M.read self in
              M.pure (deref α0)) :
              Ty.path "contract_terminate::AccountId"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_contract_terminate_AccountId.

Module Impl_core_marker_Copy_for_contract_terminate_AccountId.
  Definition Self : Ty.t := Ty.path "contract_terminate::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_contract_terminate_AccountId.

(* Enum Env *)

Module Impl_contract_terminate_Env.
  Definition Self : Ty.t := Ty.path "contract_terminate::Env".
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read ((M.var "contract_terminate::Env::Get_caller") (deref α0))
    | _, _ => M.impossible
    end.
  
  (*
      fn terminate_contract(&self, _account: AccountId) {
          unimplemented!()
      }
  *)
  Definition terminate_contract (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; _account ] =>
      let* self := M.alloc self in
      let* _account := M.alloc _account in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call (M.var "core::panicking::panic") [ α0 ] in
      never_to_any α1
    | _, _ => M.impossible
    end.
End Impl_contract_terminate_Env.

(* Struct JustTerminate *)

Module Impl_contract_terminate_JustTerminate.
  Definition Self : Ty.t := Ty.path "contract_terminate::JustTerminate".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call (M.var "core::panicking::panic") [ α0 ] in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      M.call (Ty.path "contract_terminate::JustTerminate")::["init_env"] []
    | _, _ => M.impossible
    end.
  
  (*
      pub fn new() -> Self {
          Self {}
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] => M.pure contract_terminate.JustTerminate.Build
    | _, _ => M.impossible
    end.
  
  (*
      pub fn terminate_me(&mut self) {
          self.env().terminate_contract(self.env().caller());
      }
  *)
  Definition terminate_me (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 :=
          M.call
            (Ty.path "contract_terminate::JustTerminate")::["env"]
            [ borrow (deref α0) ] in
        let* α2 := M.alloc α1 in
        let* α3 := M.read self in
        let* α4 :=
          M.call
            (Ty.path "contract_terminate::JustTerminate")::["env"]
            [ borrow (deref α3) ] in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call
            (Ty.path "contract_terminate::Env")::["caller"]
            [ borrow α5 ] in
        let* α7 :=
          M.call
            (Ty.path "contract_terminate::Env")::["terminate_contract"]
            [ borrow α2; α6 ] in
        M.alloc α7 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
End Impl_contract_terminate_JustTerminate.
