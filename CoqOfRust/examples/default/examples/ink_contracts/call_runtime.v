(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_call_runtime_AccountId.
  Definition Self : Ty.t := Ty.path "call_runtime::AccountId".
  
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
      M.pure (call_runtime.AccountId.Build_t α1)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_call_runtime_AccountId.

Module Impl_core_clone_Clone_for_call_runtime_AccountId.
  Definition Self : Ty.t := Ty.path "call_runtime::AccountId".
  
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
              Ty.path "call_runtime::AccountId"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_call_runtime_AccountId.

Module Impl_core_marker_Copy_for_call_runtime_AccountId.
  Definition Self : Ty.t := Ty.path "call_runtime::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_call_runtime_AccountId.

Axiom Balance : (Ty.path "call_runtime::Balance") = (Ty.path "u128").

(* Enum Env *)

(* Enum MultiAddress *)

Module Impl_core_convert_From_call_runtime_AccountId_for_call_runtime_MultiAddress_call_runtime_AccountId_Tuple_.
  Definition Self : Ty.t :=
    Ty.apply
      (Ty.path "call_runtime::MultiAddress")
      [Ty.path "call_runtime::AccountId"; Ty.tuple []].
  
  (*
      fn from(_value: AccountId) -> Self {
          unimplemented!()
      }
  *)
  Definition from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [_value] =>
      let* _value := M.alloc _value in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("from", InstanceField.Method from)].
End Impl_core_convert_From_call_runtime_AccountId_for_call_runtime_MultiAddress_call_runtime_AccountId_Tuple_.

(* Enum BalancesCall *)

(* Enum RuntimeCall *)

(* Struct RuntimeCaller *)

Module Impl_core_default_Default_for_call_runtime_RuntimeCaller.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeCaller".
  
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] => M.pure call_runtime.RuntimeCaller.Build
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_call_runtime_RuntimeCaller.

(* Enum RuntimeError *)

Module Impl_core_fmt_Debug_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "CallRuntimeFailed") in
      M.call ((Ty.path "core::fmt::Formatter")::["write_str"] α0 α1)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Debug_for_call_runtime_RuntimeError.

Module Impl_core_marker_StructuralPartialEq_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralPartialEq_for_call_runtime_RuntimeError.

Module Impl_core_cmp_PartialEq_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  (*
  PartialEq
  *)
  Definition eq (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; other] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      M.pure true
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("eq", InstanceField.Method eq)].
End Impl_core_cmp_PartialEq_for_call_runtime_RuntimeError.

Module Impl_core_marker_StructuralEq_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralEq_for_call_runtime_RuntimeError.

Module Impl_core_cmp_Eq_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  (*
  Eq
  *)
  Definition assert_receiver_is_total_eq
      (𝜏 : list Ty.t)
      (α : list Value.t)
      : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      M.pure tt
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t :=
    [("assert_receiver_is_total_eq",
        InstanceField.Method assert_receiver_is_total_eq)].
End Impl_core_cmp_Eq_for_call_runtime_RuntimeError.

(* Enum EnvError *)

Module Impl_core_convert_From_call_runtime_EnvError_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  (*
      fn from(e: EnvError) -> Self {
          match e {
              EnvError::CallRuntimeFailed => RuntimeError::CallRuntimeFailed,
              _ => panic!("Unexpected error from `pallet-contracts`."),
          }
      }
  *)
  Definition from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [e] =>
      let* e := M.alloc e in
      let* α0 :=
        match_operator
          e
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | call_runtime.EnvError.CallRuntimeFailed =>
                M.alloc call_runtime.RuntimeError.CallRuntimeFailed
              | _ => M.break_match
              end) :
              Ty.path "call_runtime::RuntimeError";
            fun γ =>
              (let* α0 :=
                M.read (mk_str "Unexpected error from `pallet-contracts`.") in
              let* α1 := M.call ((M.var "std::panicking::begin_panic") α0) in
              let* α2 := never_to_any α1 in
              M.alloc α2) :
              Ty.path "call_runtime::RuntimeError"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("from", InstanceField.Method from)].
End Impl_core_convert_From_call_runtime_EnvError_for_call_runtime_RuntimeError.

Module Impl_call_runtime_Env.
  Definition Self : Ty.t := Ty.path "call_runtime::Env".
  
  (*
      fn call_runtime<Call>(&self, _call: &Call) -> Result<(), EnvError> {
          unimplemented!()
      }
  *)
  Definition call_runtime (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [Call], [self; _call] =>
      let* self := M.alloc self in
      let* _call := M.alloc _call in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
End Impl_call_runtime_Env.

Module Impl_call_runtime_RuntimeCaller.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeCaller".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
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
    | [], [self] =>
      let* self := M.alloc self in
      M.call (Ty.path "call_runtime::RuntimeCaller")::["init_env"]
    | _, _ => M.impossible
    end.
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.path "call_runtime::RuntimeCaller")
            (Trait := ℐ))) in
      M.call α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn transfer_through_runtime(
          &mut self,
          receiver: AccountId,
          value: Balance,
      ) -> Result<(), RuntimeError> {
          self.env()
              .call_runtime(&RuntimeCall::Balances(BalancesCall::Transfer {
                  dest: receiver.into(),
                  value,
              }))
              .map_err(Into::into)
      }
  *)
  Definition transfer_through_runtime (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; receiver; value] =>
      let* self := M.alloc self in
      let* receiver := M.alloc receiver in
      let* value := M.alloc value in
      let* α0 := M.read self in
      let* α1 :=
        M.call
          ((Ty.path "call_runtime::RuntimeCaller")::["env"]
            (borrow (deref α0))) in
      let* α2 := M.alloc α1 in
      let* α3 :=
        ltac:(M.get_method (fun ℐ =>
          core.convert.Into.into
            (Self := Ty.path "call_runtime::AccountId")
            (T :=
              Ty.apply
                (Ty.path "call_runtime::MultiAddress")
                [Ty.path "call_runtime::AccountId"; Ty.tuple []])
            (Trait := ℐ))) in
      let* α4 := M.read receiver in
      let* α5 := M.call (α3 α4) in
      let* α6 := M.read value in
      let* α7 :=
        M.alloc
          (call_runtime.RuntimeCall.Balances
            (call_runtime.BalancesCall.Transfer
              {|
              call_runtime.BalancesCall.Transfer.dest := α5;
              call_runtime.BalancesCall.Transfer.value := α6;
            |})) in
      let* α8 :=
        M.call
          ((Ty.path "call_runtime::Env")::["call_runtime"]
            (borrow α2)
            (borrow α7)) in
      let* α9 :=
        ltac:(M.get_method (fun ℐ =>
          core.convert.Into.into
            (Self := Ty.path "call_runtime::EnvError")
            (T := Ty.path "call_runtime::RuntimeError")
            (Trait := ℐ))) in
      M.call
        ((Ty.apply
              (Ty.path "core::result::Result")
              [Ty.tuple []; Ty.path "call_runtime::EnvError"])::["map_err"]
          α8
          α9)
    | _, _ => M.impossible
    end.
  
  (*
      pub fn call_nonexistent_extrinsic(&mut self) -> Result<(), RuntimeError> {
          self.env().call_runtime(&()).map_err(Into::into)
      }
  *)
  Definition call_nonexistent_extrinsic
      (𝜏 : list Ty.t)
      (α : list Value.t)
      : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 :=
        M.call
          ((Ty.path "call_runtime::RuntimeCaller")::["env"]
            (borrow (deref α0))) in
      let* α2 := M.alloc α1 in
      let* α3 := M.alloc tt in
      let* α4 :=
        M.call
          ((Ty.path "call_runtime::Env")::["call_runtime"]
            (borrow α2)
            (borrow α3)) in
      let* α5 :=
        ltac:(M.get_method (fun ℐ =>
          core.convert.Into.into
            (Self := Ty.path "call_runtime::EnvError")
            (T := Ty.path "call_runtime::RuntimeError")
            (Trait := ℐ))) in
      M.call
        ((Ty.apply
              (Ty.path "core::result::Result")
              [Ty.tuple []; Ty.path "call_runtime::EnvError"])::["map_err"]
          α4
          α5)
    | _, _ => M.impossible
    end.
End Impl_call_runtime_RuntimeCaller.
