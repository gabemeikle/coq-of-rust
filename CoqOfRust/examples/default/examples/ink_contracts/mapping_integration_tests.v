(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Mapping *)

Module Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.
  Context {K V : Set}.
  
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V].
  
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.apply (Ty.path "core::marker::PhantomData") [K])
            (Trait := ℐ))) in
      let* α1 := M.call α0 in
      let* α2 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.apply (Ty.path "core::marker::PhantomData") [V])
            (Trait := ℐ))) in
      let* α3 := M.call α2 in
      M.pure
        {|
          mapping_integration_tests.Mapping._key := α1;
          mapping_integration_tests.Mapping._value := α3;
        |}
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.

Module Impl_mapping_integration_tests_Mapping_K_V.
  Context {K V : Set}.
  
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V].
  
  (*
      fn contains(&self, _key: &K) -> bool {
          unimplemented!()
      }
  *)
  Definition contains (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _key] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  (*
      fn get(&self, _key: &K) -> Option<V> {
          unimplemented!()
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _key] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  (*
      fn insert(&mut self, _key: K, _value: V) -> Option<u32> {
          unimplemented!()
      }
  *)
  Definition insert (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _key; _value] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* _value := M.alloc _value in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  (*
      fn new() -> Mapping<K, V> {
          unimplemented!()
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  (*
      fn remove(&self, _key: K) {
          unimplemented!()
      }
  *)
  Definition remove (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _key] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  (*
      fn size(&self, _key: K) -> Option<u32> {
          unimplemented!()
      }
  *)
  Definition size (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _key] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  (*
      fn take(&self, _key: K) -> Option<V> {
          unimplemented!()
      }
  *)
  Definition take (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _key] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
End Impl_mapping_integration_tests_Mapping_K_V.

(* Struct AccountId *)

Module Impl_core_default_Default_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::AccountId".
  
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
      M.pure (mapping_integration_tests.AccountId.Build_t α1)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_mapping_integration_tests_AccountId.

Module Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::AccountId".
  
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
              Ty.path "mapping_integration_tests::AccountId"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.

Module Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.

Axiom Balance :
    (Ty.path "mapping_integration_tests::Balance") = (Ty.path "u128").

(* Enum Env *)

Module Impl_mapping_integration_tests_Env.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Env".
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read ((M.var "mapping_integration_tests::Env::Get_caller") (deref α0))
    | _, _ => M.impossible
    end.
End Impl_mapping_integration_tests_Env.

(* Enum Mappings *)

Module Impl_core_default_Default_for_mapping_integration_tests_Mappings.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Mappings".
  
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self :=
              Ty.apply
                (Ty.path "mapping_integration_tests::Mapping")
                [Ty.path "mapping_integration_tests::AccountId";
                  Ty.path "u128"])
            (Trait := ℐ))) in
      let* α1 := M.call α0 in
      M.pure {| mapping_integration_tests.Mappings.balances := α1; |}
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_mapping_integration_tests_Mappings.

Module Impl_mapping_integration_tests_Mappings.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Mappings".
  
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
      fn env() -> Env {
          unimplemented!()
      }
  *)
  Definition env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  (*
      pub fn new() -> Self {
          let balances = Mapping::default();
          Self { balances }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* balances :=
        let* α0 :=
          ltac:(M.get_method (fun ℐ =>
            core.default.Default.default
              (Self :=
                Ty.apply
                  (Ty.path "mapping_integration_tests::Mapping")
                  [Ty.path "mapping_integration_tests::AccountId";
                    Ty.path "u128"])
              (Trait := ℐ))) in
        let* α1 := M.call α0 in
        M.alloc α1 in
      let* α0 := M.read balances in
      let* α0 :=
        M.alloc {| mapping_integration_tests.Mappings.balances := α0; |} in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn get_balance(&self) -> Option<Balance> {
          let caller = Self::env().caller();
          self.balances.get(&caller)
      }
  *)
  Definition get_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            ((Ty.path "mapping_integration_tests::Env")::["caller"]
              (borrow α1)) in
        M.alloc α2 in
      let* α0 := M.read self in
      let* α1 :=
        M.call
          ((Ty.apply
                (Ty.path "mapping_integration_tests::Mapping")
                [Ty.path "mapping_integration_tests::AccountId";
                  Ty.path "u128"])::["get"]
            (borrow
              ((M.var "mapping_integration_tests::Mappings::Get_balances")
                (deref α0)))
            (borrow caller)) in
      let* α0 := M.alloc α1 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn insert_balance(&mut self, value: Balance) -> Option<u32> {
          let caller = Self::env().caller();
          self.balances.insert(caller, value)
      }
  *)
  Definition insert_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; value] =>
      let* self := M.alloc self in
      let* value := M.alloc value in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            ((Ty.path "mapping_integration_tests::Env")::["caller"]
              (borrow α1)) in
        M.alloc α2 in
      let* α0 := M.read self in
      let* α1 := M.read caller in
      let* α2 := M.read value in
      let* α3 :=
        M.call
          ((Ty.apply
                (Ty.path "mapping_integration_tests::Mapping")
                [Ty.path "mapping_integration_tests::AccountId";
                  Ty.path "u128"])::["insert"]
            (borrow_mut
              ((M.var "mapping_integration_tests::Mappings::Get_balances")
                (deref α0)))
            α1
            α2) in
      let* α0 := M.alloc α3 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn size_balance(&mut self) -> Option<u32> {
          let caller = Self::env().caller();
          self.balances.size(caller)
      }
  *)
  Definition size_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            ((Ty.path "mapping_integration_tests::Env")::["caller"]
              (borrow α1)) in
        M.alloc α2 in
      let* α0 := M.read self in
      let* α1 := M.read caller in
      let* α2 :=
        M.call
          ((Ty.apply
                (Ty.path "mapping_integration_tests::Mapping")
                [Ty.path "mapping_integration_tests::AccountId";
                  Ty.path "u128"])::["size"]
            (borrow
              ((M.var "mapping_integration_tests::Mappings::Get_balances")
                (deref α0)))
            α1) in
      let* α0 := M.alloc α2 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn contains_balance(&self) -> bool {
          let caller = Self::env().caller();
          self.balances.contains(&caller)
      }
  *)
  Definition contains_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            ((Ty.path "mapping_integration_tests::Env")::["caller"]
              (borrow α1)) in
        M.alloc α2 in
      let* α0 := M.read self in
      let* α1 :=
        M.call
          ((Ty.apply
                (Ty.path "mapping_integration_tests::Mapping")
                [Ty.path "mapping_integration_tests::AccountId";
                  Ty.path "u128"])::["contains"]
            (borrow
              ((M.var "mapping_integration_tests::Mappings::Get_balances")
                (deref α0)))
            (borrow caller)) in
      let* α0 := M.alloc α1 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn remove_balance(&mut self) {
          let caller = Self::env().caller();
          self.balances.remove(caller);
      }
  *)
  Definition remove_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            ((Ty.path "mapping_integration_tests::Env")::["caller"]
              (borrow α1)) in
        M.alloc α2 in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read caller in
        let* α2 :=
          M.call
            ((Ty.apply
                  (Ty.path "mapping_integration_tests::Mapping")
                  [Ty.path "mapping_integration_tests::AccountId";
                    Ty.path "u128"])::["remove"]
              (borrow
                ((M.var "mapping_integration_tests::Mappings::Get_balances")
                  (deref α0)))
              α1) in
        M.alloc α2 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn take_balance(&mut self) -> Option<Balance> {
          let caller = Self::env().caller();
          self.balances.take(caller)
      }
  *)
  Definition take_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            ((Ty.path "mapping_integration_tests::Env")::["caller"]
              (borrow α1)) in
        M.alloc α2 in
      let* α0 := M.read self in
      let* α1 := M.read caller in
      let* α2 :=
        M.call
          ((Ty.apply
                (Ty.path "mapping_integration_tests::Mapping")
                [Ty.path "mapping_integration_tests::AccountId";
                  Ty.path "u128"])::["take"]
            (borrow
              ((M.var "mapping_integration_tests::Mappings::Get_balances")
                (deref α0)))
            α1) in
      let* α0 := M.alloc α2 in
      M.read α0
    | _, _ => M.impossible
    end.
End Impl_mapping_integration_tests_Mappings.
