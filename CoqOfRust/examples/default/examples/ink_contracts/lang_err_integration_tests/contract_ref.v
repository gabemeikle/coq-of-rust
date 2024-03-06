(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_contract_ref_AccountId.
  Definition Self : Ty.t := Ty.path "contract_ref::AccountId".
  
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
      M.pure (contract_ref.AccountId.Build_t α1)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_contract_ref_AccountId.

Module Impl_core_clone_Clone_for_contract_ref_AccountId.
  Definition Self : Ty.t := Ty.path "contract_ref::AccountId".
  
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
              Ty.path "contract_ref::AccountId"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_contract_ref_AccountId.

Module Impl_core_marker_Copy_for_contract_ref_AccountId.
  Definition Self : Ty.t := Ty.path "contract_ref::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_contract_ref_AccountId.

Axiom Balance : (Ty.path "contract_ref::Balance") = (Ty.path "u128").

Axiom Hash :
  (Ty.path "contract_ref::Hash") = (Ty.apply (Ty.path "array") [Ty.path "u8"]).

(* Enum Env *)

(* Enum FlipperRef *)

(* Struct FlipperError *)

Module Impl_core_fmt_Debug_for_contract_ref_FlipperError.
  Definition Self : Ty.t := Ty.path "contract_ref::FlipperError".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "FlipperError") in
      M.call ((Ty.path "core::fmt::Formatter")::["write_str"] α0 α1)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Debug_for_contract_ref_FlipperError.

Module Impl_contract_ref_FlipperRef.
  Definition Self : Ty.t := Ty.path "contract_ref::FlipperRef".
  
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
      M.call (Ty.path "contract_ref::FlipperRef")::["init_env"]
    | _, _ => M.impossible
    end.
  
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
      M.pure {| contract_ref.FlipperRef.value := α0; |}
    | _, _ => M.impossible
    end.
  
  (*
      pub fn new_default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition new_default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.path "bool")
            (Trait := ℐ))) in
      let* α1 := M.call α0 in
      M.call ((Ty.path "contract_ref::FlipperRef")::["new"] α1)
    | _, _ => M.impossible
    end.
  
  (*
      pub fn try_new(succeed: bool) -> Result<Self, FlipperError> {
          if succeed {
              Ok(Self::new(true))
          } else {
              Err(FlipperError)
          }
      }
  *)
  Definition try_new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [succeed] =>
      let* succeed := M.alloc succeed in
      let* α0 := M.read (use succeed) in
      let* α1 :=
        if α0 then
          let* α0 :=
            M.call ((Ty.path "contract_ref::FlipperRef")::["new"] true) in
          M.alloc (core.result.Result.Ok α0)
        else
          M.alloc (core.result.Result.Err contract_ref.FlipperError.Build) in
      M.read α1
    | _, _ => M.impossible
    end.
  
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
          M.read ((M.var "contract_ref::FlipperRef::Get_value") (deref α1)) in
        assign
          ((M.var "contract_ref::FlipperRef::Get_value") (deref α0))
          ((M.var "UnOp::not") α2) in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
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
      M.read ((M.var "contract_ref::FlipperRef::Get_value") (deref α0))
    | _, _ => M.impossible
    end.
End Impl_contract_ref_FlipperRef.

(* Enum ContractRef *)

Module Impl_contract_ref_ContractRef.
  Definition Self : Ty.t := Ty.path "contract_ref::ContractRef".
  
  (*
      pub fn new(version: u32, flipper_code_hash: Hash) -> Self {
          let salt = version.to_le_bytes();
          let flipper = FlipperRef::new_default();
          // .endowment(0)
          // .code_hash(flipper_code_hash)
          // .salt_bytes(salt)
          // .instantiate();
  
          Self { flipper }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [version; flipper_code_hash] =>
      let* version := M.alloc version in
      let* flipper_code_hash := M.alloc flipper_code_hash in
      let* salt :=
        let* α0 := M.read version in
        let* α1 := M.call ((Ty.path "u32")::["to_le_bytes"] α0) in
        M.alloc α1 in
      let* flipper :=
        let* α0 :=
          M.call (Ty.path "contract_ref::FlipperRef")::["new_default"] in
        M.alloc α0 in
      let* α0 := M.read flipper in
      let* α0 := M.alloc {| contract_ref.ContractRef.flipper := α0; |} in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn try_new(version: u32, flipper_code_hash: Hash, succeed: bool) -> Self {
          let salt = version.to_le_bytes();
          let flipper = FlipperRef::try_new(succeed).unwrap();
          // .endowment(0)
          // .code_hash(flipper_code_hash)
          // .salt_bytes(salt)
          // .instantiate()
          // .unwrap_or_else(|error| {
          //     panic!(
          //         "Received an error from the Flipper constructor while instantiating \
          //              Flipper {error:?}"
          //     )
          // });
  
          Self { flipper }
      }
  *)
  Definition try_new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [version; flipper_code_hash; succeed] =>
      let* version := M.alloc version in
      let* flipper_code_hash := M.alloc flipper_code_hash in
      let* succeed := M.alloc succeed in
      let* salt :=
        let* α0 := M.read version in
        let* α1 := M.call ((Ty.path "u32")::["to_le_bytes"] α0) in
        M.alloc α1 in
      let* flipper :=
        let* α0 := M.read succeed in
        let* α1 :=
          M.call ((Ty.path "contract_ref::FlipperRef")::["try_new"] α0) in
        let* α2 :=
          M.call
            ((Ty.apply
                  (Ty.path "core::result::Result")
                  [Ty.path "contract_ref::FlipperRef";
                    Ty.path "contract_ref::FlipperError"])::["unwrap"]
              α1) in
        M.alloc α2 in
      let* α0 := M.read flipper in
      let* α0 := M.alloc {| contract_ref.ContractRef.flipper := α0; |} in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn flip(&mut self) {
          self.flipper.flip();
      }
  *)
  Definition flip (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 :=
          M.call
            ((Ty.path "contract_ref::FlipperRef")::["flip"]
              (borrow_mut
                ((M.var "contract_ref::ContractRef::Get_flipper")
                  (deref α0)))) in
        M.alloc α1 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn get(&mut self) -> bool {
          self.flipper.get()
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.call
        ((Ty.path "contract_ref::FlipperRef")::["get"]
          (borrow
            ((M.var "contract_ref::ContractRef::Get_flipper") (deref α0))))
    | _, _ => M.impossible
    end.
End Impl_contract_ref_ContractRef.
