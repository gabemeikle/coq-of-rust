(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Mapping *)

Module Impl_core_default_Default_for_erc20_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "erc20::Mapping") [K; V].
  
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
      M.pure {| erc20.Mapping._key := α1; erc20.Mapping._value := α3; |}
    | _, _ => M.impossible
    end.
  
  Definition ℐ (K V : Ty.t) : Instance.t :=
    [("default", InstanceField.Method (default K V))].
End Impl_core_default_Default_for_erc20_Mapping_K_V.

Module Impl_erc20_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "erc20::Mapping") [K; V].
  
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
      fn insert(&mut self, _key: K, _value: V) {
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
End Impl_erc20_Mapping_K_V.

(* Struct AccountId *)

Module Impl_core_default_Default_for_erc20_AccountId.
  Definition Self : Ty.t := Ty.path "erc20::AccountId".
  
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
      M.pure (erc20.AccountId.Build_t α1)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_erc20_AccountId.

Module Impl_core_clone_Clone_for_erc20_AccountId.
  Definition Self : Ty.t := Ty.path "erc20::AccountId".
  
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
              Ty.path "erc20::AccountId"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
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
      let* α2 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self :=
              Ty.apply
                (Ty.path "erc20::Mapping")
                [Ty.path "erc20::AccountId"; Ty.path "u128"])
            (Trait := ℐ))) in
      let* α3 := M.call α2 in
      let* α4 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self :=
              Ty.apply
                (Ty.path "erc20::Mapping")
                [Ty.tuple
                    [Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId"];
                  Ty.path "u128"])
            (Trait := ℐ))) in
      let* α5 := M.call α4 in
      M.pure
        {|
          erc20.Erc20.total_supply := α1;
          erc20.Erc20.balances := α3;
          erc20.Erc20.allowances := α5;
        |}
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_erc20_Erc20.

(* Enum Transfer *)

(* Enum Approval *)

(* Enum Event *)

(* Enum Error *)

Axiom Result :
  forall (T : Ty.t),
  (Ty.path "erc20::Result") =
    (Ty.apply (Ty.path "core::result::Result") [T; Ty.path "erc20::Error"]).

Module Impl_erc20_Env.
  Definition Self : Ty.t := Ty.path "erc20::Env".
  
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
      M.read ((M.var "erc20::Env::Get_caller") (deref α0))
    | _, _ => M.impossible
    end.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Definition emit_event (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _event] =>
      let* self := M.alloc self in
      let* _event := M.alloc _event in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
End Impl_erc20_Env.

Module Impl_erc20_Erc20.
  Definition Self : Ty.t := Ty.path "erc20::Erc20".
  
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
      M.call (Ty.path "erc20::Erc20")::["init_env"]
    | _, _ => M.impossible
    end.
End Impl_erc20_Erc20.

Module Impl_erc20_Erc20_2.
  Definition Self : Ty.t := Ty.path "erc20::Erc20".
  
  (*
      fn new(total_supply: Balance) -> Self {
          let mut balances = Mapping::default();
          let caller = Self::init_env().caller();
          balances.insert(caller, total_supply);
          Self::init_env().emit_event(Event::Transfer(Transfer {
              from: None,
              to: Some(caller),
              value: total_supply,
          }));
          Self {
              total_supply,
              balances,
              allowances: Default::default(),
          }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [total_supply] =>
      let* total_supply := M.alloc total_supply in
      let* balances :=
        let* α0 :=
          ltac:(M.get_method (fun ℐ =>
            core.default.Default.default
              (Self :=
                Ty.apply
                  (Ty.path "erc20::Mapping")
                  [Ty.path "erc20::AccountId"; Ty.path "u128"])
              (Trait := ℐ))) in
        let* α1 := M.call α0 in
        M.alloc α1 in
      let* caller :=
        let* α0 := M.call (Ty.path "erc20::Erc20")::["init_env"] in
        let* α1 := M.alloc α0 in
        let* α2 := M.call ((Ty.path "erc20::Env")::["caller"] (borrow α1)) in
        M.alloc α2 in
      let* _ :=
        let* α0 := M.read caller in
        let* α1 := M.read total_supply in
        let* α2 :=
          M.call
            ((Ty.apply
                  (Ty.path "erc20::Mapping")
                  [Ty.path "erc20::AccountId"; Ty.path "u128"])::["insert"]
              (borrow_mut balances)
              α0
              α1) in
        M.alloc α2 in
      let* _ :=
        let* α0 := M.call (Ty.path "erc20::Erc20")::["init_env"] in
        let* α1 := M.alloc α0 in
        let* α2 := M.read caller in
        let* α3 := M.read total_supply in
        let* α4 :=
          M.call
            ((Ty.path "erc20::Env")::["emit_event"]
              (borrow α1)
              (erc20.Event.Transfer
                {|
                  erc20.Transfer.from := core.option.Option.None;
                  erc20.Transfer.to := core.option.Option.Some α2;
                  erc20.Transfer.value := α3;
                |})) in
        M.alloc α4 in
      let* α0 := M.read total_supply in
      let* α1 := M.read balances in
      let* α2 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self :=
              Ty.apply
                (Ty.path "erc20::Mapping")
                [Ty.tuple
                    [Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId"];
                  Ty.path "u128"])
            (Trait := ℐ))) in
      let* α3 := M.call α2 in
      let* α0 :=
        M.alloc
          {|
            erc20.Erc20.total_supply := α0;
            erc20.Erc20.balances := α1;
            erc20.Erc20.allowances := α3;
          |} in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      fn total_supply(&self) -> Balance {
          self.total_supply
      }
  *)
  Definition total_supply (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read ((M.var "erc20::Erc20::Get_total_supply") (deref α0))
    | _, _ => M.impossible
    end.
  
  (*
      fn balance_of_impl(&self, owner: &AccountId) -> Balance {
          self.balances.get(owner).unwrap_or_default()
      }
  *)
  Definition balance_of_impl (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; owner] =>
      let* self := M.alloc self in
      let* owner := M.alloc owner in
      let* α0 := M.read self in
      let* α1 := M.read owner in
      let* α2 :=
        M.call
          ((Ty.apply
                (Ty.path "erc20::Mapping")
                [Ty.path "erc20::AccountId"; Ty.path "u128"])::["get"]
            (borrow ((M.var "erc20::Erc20::Get_balances") (deref α0)))
            α1) in
      M.call
        ((Ty.apply
              (Ty.path "core::option::Option")
              [Ty.path "u128"])::["unwrap_or_default"]
          α2)
    | _, _ => M.impossible
    end.
  
  (*
      fn balance_of(&self, owner: AccountId) -> Balance {
          self.balance_of_impl(&owner)
      }
  *)
  Definition balance_of (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; owner] =>
      let* self := M.alloc self in
      let* owner := M.alloc owner in
      let* α0 := M.read self in
      M.call ((Ty.path "erc20::Erc20")::["balance_of_impl"] α0 (borrow owner))
    | _, _ => M.impossible
    end.
  
  (*
      fn allowance_impl(&self, owner: &AccountId, spender: &AccountId) -> Balance {
          self.allowances.get(&( *owner, *spender)).unwrap_or_default()
      }
  *)
  Definition allowance_impl (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; owner; spender] =>
      let* self := M.alloc self in
      let* owner := M.alloc owner in
      let* spender := M.alloc spender in
      let* α0 := M.read self in
      let* α1 := M.read owner in
      let* α2 := M.read (deref α1) in
      let* α3 := M.read spender in
      let* α4 := M.read (deref α3) in
      let* α5 := M.alloc (α2, α4) in
      let* α6 :=
        M.call
          ((Ty.apply
                (Ty.path "erc20::Mapping")
                [Ty.tuple
                    [Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId"];
                  Ty.path "u128"])::["get"]
            (borrow ((M.var "erc20::Erc20::Get_allowances") (deref α0)))
            (borrow α5)) in
      M.call
        ((Ty.apply
              (Ty.path "core::option::Option")
              [Ty.path "u128"])::["unwrap_or_default"]
          α6)
    | _, _ => M.impossible
    end.
  
  (*
      fn allowance(&self, owner: AccountId, spender: AccountId) -> Balance {
          self.allowance_impl(&owner, &spender)
      }
  *)
  Definition allowance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; owner; spender] =>
      let* self := M.alloc self in
      let* owner := M.alloc owner in
      let* spender := M.alloc spender in
      let* α0 := M.read self in
      M.call
        ((Ty.path "erc20::Erc20")::["allowance_impl"]
          α0
          (borrow owner)
          (borrow spender))
    | _, _ => M.impossible
    end.
  
  (*
      fn transfer_from_to(&mut self, from: &AccountId, to: &AccountId, value: Balance) -> Result<()> {
          let from_balance = self.balance_of_impl(from);
          if from_balance < value {
              return Err(Error::InsufficientBalance);
          }
  
          self.balances.insert( *from, from_balance - value);
          let to_balance = self.balance_of_impl(to);
          self.balances.insert( *to, to_balance + value);
          self.env().emit_event(Event::Transfer(Transfer {
              from: Some( *from),
              to: Some( *to),
              value,
          }));
          Ok(())
      }
  *)
  Definition transfer_from_to (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; from; to; value] =>
      let* self := M.alloc self in
      let* from := M.alloc from in
      let* to := M.alloc to in
      let* value := M.alloc value in
      let return_ :=
        M.return_
          (R :=
            Ty.apply
              (Ty.path "core::result::Result")
              [Ty.tuple []; Ty.path "erc20::Error"]) in
      M.catch_return
        (let* from_balance :=
          let* α0 := M.read self in
          let* α1 := M.read from in
          let* α2 :=
            M.call
              ((Ty.path "erc20::Erc20")::["balance_of_impl"]
                (borrow (deref α0))
                α1) in
          M.alloc α2 in
        let* _ :=
          let* α0 := M.read from_balance in
          let* α1 := M.read value in
          let* α2 := M.alloc ((M.var "BinOp::Pure::lt") α0 α1) in
          let* α3 := M.read (use α2) in
          if α3 then
            let* α0 :=
              return_
                (core.result.Result.Err erc20.Error.InsufficientBalance) in
            let* α1 := M.read α0 in
            let* α2 := never_to_any α1 in
            M.alloc α2
          else
            M.alloc tt in
        let* _ :=
          let* α0 := M.read self in
          let* α1 := M.read from in
          let* α2 := M.read (deref α1) in
          let* α3 := M.read from_balance in
          let* α4 := M.read value in
          let* α5 := (M.var "BinOp::Panic::sub") α3 α4 in
          let* α6 :=
            M.call
              ((Ty.apply
                    (Ty.path "erc20::Mapping")
                    [Ty.path "erc20::AccountId"; Ty.path "u128"])::["insert"]
                (borrow_mut ((M.var "erc20::Erc20::Get_balances") (deref α0)))
                α2
                α5) in
          M.alloc α6 in
        let* to_balance :=
          let* α0 := M.read self in
          let* α1 := M.read to in
          let* α2 :=
            M.call
              ((Ty.path "erc20::Erc20")::["balance_of_impl"]
                (borrow (deref α0))
                α1) in
          M.alloc α2 in
        let* _ :=
          let* α0 := M.read self in
          let* α1 := M.read to in
          let* α2 := M.read (deref α1) in
          let* α3 := M.read to_balance in
          let* α4 := M.read value in
          let* α5 := (M.var "BinOp::Panic::add") α3 α4 in
          let* α6 :=
            M.call
              ((Ty.apply
                    (Ty.path "erc20::Mapping")
                    [Ty.path "erc20::AccountId"; Ty.path "u128"])::["insert"]
                (borrow_mut ((M.var "erc20::Erc20::Get_balances") (deref α0)))
                α2
                α5) in
          M.alloc α6 in
        let* _ :=
          let* α0 := M.read self in
          let* α1 :=
            M.call ((Ty.path "erc20::Erc20")::["env"] (borrow (deref α0))) in
          let* α2 := M.alloc α1 in
          let* α3 := M.read from in
          let* α4 := M.read (deref α3) in
          let* α5 := M.read to in
          let* α6 := M.read (deref α5) in
          let* α7 := M.read value in
          let* α8 :=
            M.call
              ((Ty.path "erc20::Env")::["emit_event"]
                (borrow α2)
                (erc20.Event.Transfer
                  {|
                    erc20.Transfer.from := core.option.Option.Some α4;
                    erc20.Transfer.to := core.option.Option.Some α6;
                    erc20.Transfer.value := α7;
                  |})) in
          M.alloc α8 in
        let* α0 := M.alloc (core.result.Result.Ok tt) in
        M.read α0)
    | _, _ => M.impossible
    end.
  
  (*
      fn transfer(&mut self, to: AccountId, value: Balance) -> Result<()> {
          let from = self.env().caller();
          self.transfer_from_to(&from, &to, value)
      }
  *)
  Definition transfer (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; to; value] =>
      let* self := M.alloc self in
      let* to := M.alloc to in
      let* value := M.alloc value in
      let* from :=
        let* α0 := M.read self in
        let* α1 :=
          M.call ((Ty.path "erc20::Erc20")::["env"] (borrow (deref α0))) in
        let* α2 := M.alloc α1 in
        let* α3 := M.call ((Ty.path "erc20::Env")::["caller"] (borrow α2)) in
        M.alloc α3 in
      let* α0 := M.read self in
      let* α1 := M.read value in
      let* α2 :=
        M.call
          ((Ty.path "erc20::Erc20")::["transfer_from_to"]
            α0
            (borrow from)
            (borrow to)
            α1) in
      let* α0 := M.alloc α2 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      fn approve(&mut self, spender: AccountId, value: Balance) -> Result<()> {
          let owner = self.env().caller();
          self.allowances.insert((owner, spender), value);
          self.env().emit_event(Event::Approval(Approval {
              owner,
              spender,
              value,
          }));
          Ok(())
      }
  *)
  Definition approve (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; spender; value] =>
      let* self := M.alloc self in
      let* spender := M.alloc spender in
      let* value := M.alloc value in
      let* owner :=
        let* α0 := M.read self in
        let* α1 :=
          M.call ((Ty.path "erc20::Erc20")::["env"] (borrow (deref α0))) in
        let* α2 := M.alloc α1 in
        let* α3 := M.call ((Ty.path "erc20::Env")::["caller"] (borrow α2)) in
        M.alloc α3 in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read owner in
        let* α2 := M.read spender in
        let* α3 := M.read value in
        let* α4 :=
          M.call
            ((Ty.apply
                  (Ty.path "erc20::Mapping")
                  [Ty.tuple
                      [Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId"];
                    Ty.path "u128"])::["insert"]
              (borrow_mut ((M.var "erc20::Erc20::Get_allowances") (deref α0)))
              (α1, α2)
              α3) in
        M.alloc α4 in
      let* _ :=
        let* α0 := M.read self in
        let* α1 :=
          M.call ((Ty.path "erc20::Erc20")::["env"] (borrow (deref α0))) in
        let* α2 := M.alloc α1 in
        let* α3 := M.read owner in
        let* α4 := M.read spender in
        let* α5 := M.read value in
        let* α6 :=
          M.call
            ((Ty.path "erc20::Env")::["emit_event"]
              (borrow α2)
              (erc20.Event.Approval
                {|
                  erc20.Approval.owner := α3;
                  erc20.Approval.spender := α4;
                  erc20.Approval.value := α5;
                |})) in
        M.alloc α6 in
      let* α0 := M.alloc (core.result.Result.Ok tt) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      fn transfer_from(&mut self, from: AccountId, to: AccountId, value: Balance) -> Result<()> {
          let caller = self.env().caller();
          let allowance = self.allowance_impl(&from, &caller);
          if allowance < value {
              return Err(Error::InsufficientAllowance);
          }
          self.transfer_from_to(&from, &to, value)?;
          self.allowances.insert((from, caller), allowance - value);
          Ok(())
      }
  *)
  Definition transfer_from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; from; to; value] =>
      let* self := M.alloc self in
      let* from := M.alloc from in
      let* to := M.alloc to in
      let* value := M.alloc value in
      let return_ :=
        M.return_
          (R :=
            Ty.apply
              (Ty.path "core::result::Result")
              [Ty.tuple []; Ty.path "erc20::Error"]) in
      M.catch_return
        (let* caller :=
          let* α0 := M.read self in
          let* α1 :=
            M.call ((Ty.path "erc20::Erc20")::["env"] (borrow (deref α0))) in
          let* α2 := M.alloc α1 in
          let* α3 := M.call ((Ty.path "erc20::Env")::["caller"] (borrow α2)) in
          M.alloc α3 in
        let* allowance :=
          let* α0 := M.read self in
          let* α1 :=
            M.call
              ((Ty.path "erc20::Erc20")::["allowance_impl"]
                (borrow (deref α0))
                (borrow from)
                (borrow caller)) in
          M.alloc α1 in
        let* _ :=
          let* α0 := M.read allowance in
          let* α1 := M.read value in
          let* α2 := M.alloc ((M.var "BinOp::Pure::lt") α0 α1) in
          let* α3 := M.read (use α2) in
          if α3 then
            let* α0 :=
              return_
                (core.result.Result.Err erc20.Error.InsufficientAllowance) in
            let* α1 := M.read α0 in
            let* α2 := never_to_any α1 in
            M.alloc α2
          else
            M.alloc tt in
        let* _ :=
          let* α0 :=
            ltac:(M.get_method (fun ℐ =>
              core.ops.try_trait.Try.branch
                (Self :=
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [Ty.tuple []; Ty.path "erc20::Error"])
                (Trait := ℐ))) in
          let* α1 := M.read self in
          let* α2 := M.read value in
          let* α3 :=
            M.call
              ((Ty.path "erc20::Erc20")::["transfer_from_to"]
                α1
                (borrow from)
                (borrow to)
                α2) in
          let* α4 := M.call (α0 α3) in
          let* α5 := M.alloc α4 in
          match_operator
            α5
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Break _ =>
                  let γ0_0 :=
                    (M.var "core::ops::control_flow::ControlFlow::Get_Break_0")
                      γ in
                  let* residual := M.copy γ0_0 in
                  let* α0 :=
                    ltac:(M.get_method (fun ℐ =>
                      core.ops.try_trait.FromResidual.from_residual
                        (Self :=
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [Ty.tuple []; Ty.path "erc20::Error"])
                        (R :=
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [Ty.path "core::convert::Infallible";
                              Ty.path "erc20::Error"])
                        (Trait := ℐ))) in
                  let* α1 := M.read residual in
                  let* α2 := M.call (α0 α1) in
                  let* α3 := return_ α2 in
                  let* α4 := M.read α3 in
                  let* α5 := never_to_any α4 in
                  M.alloc α5
                | _ => M.break_match
                end) :
                Ty.tuple [];
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Continue _ =>
                  let γ0_0 :=
                    (M.var
                        "core::ops::control_flow::ControlFlow::Get_Continue_0")
                      γ in
                  let* val := M.copy γ0_0 in
                  M.pure val
                | _ => M.break_match
                end) :
                Ty.tuple []
            ] in
        let* _ :=
          let* α0 := M.read self in
          let* α1 := M.read from in
          let* α2 := M.read caller in
          let* α3 := M.read allowance in
          let* α4 := M.read value in
          let* α5 := (M.var "BinOp::Panic::sub") α3 α4 in
          let* α6 :=
            M.call
              ((Ty.apply
                    (Ty.path "erc20::Mapping")
                    [Ty.tuple
                        [Ty.path "erc20::AccountId";
                          Ty.path "erc20::AccountId"];
                      Ty.path "u128"])::["insert"]
                (borrow_mut ((M.var "erc20::Erc20::Get_allowances") (deref α0)))
                (α1, α2)
                α5) in
          M.alloc α6 in
        let* α0 := M.alloc (core.result.Result.Ok tt) in
        M.read α0)
    | _, _ => M.impossible
    end.
End Impl_erc20_Erc20_2.
