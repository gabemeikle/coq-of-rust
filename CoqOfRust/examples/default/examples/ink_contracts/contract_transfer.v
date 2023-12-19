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

Module  Impl_core_default_Default_for_contract_transfer_AccountId_t.
Section Impl_core_default_Default_for_contract_transfer_AccountId_t.
  Ltac Self := exact contract_transfer.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M contract_transfer.AccountId.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    M.pure (contract_transfer.AccountId.Build_t α0).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon ltac:(Self) "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_contract_transfer_AccountId_t.
End Impl_core_default_Default_for_contract_transfer_AccountId_t.

Module  Impl_core_clone_Clone_for_contract_transfer_AccountId_t.
Section Impl_core_clone_Clone_for_contract_transfer_AccountId_t.
  Ltac Self := exact contract_transfer.AccountId.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref ltac:(Self)) : M contract_transfer.AccountId.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* _ : M.Val unit := M.alloc tt in
    let* α0 : ref contract_transfer.AccountId.t := M.read self in
    M.read (deref α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_contract_transfer_AccountId_t.
End Impl_core_clone_Clone_for_contract_transfer_AccountId_t.

Module  Impl_core_marker_Copy_for_contract_transfer_AccountId_t.
Section Impl_core_marker_Copy_for_contract_transfer_AccountId_t.
  Ltac Self := exact contract_transfer.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_contract_transfer_AccountId_t.
End Impl_core_marker_Copy_for_contract_transfer_AccountId_t.

Ltac Balance := exact u128.t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : contract_transfer.AccountId.t;
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

Module  Impl_contract_transfer_Env_t.
Section Impl_contract_transfer_Env_t.
  Ltac Self := exact contract_transfer.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller
      (self : ref ltac:(Self))
      : M contract_transfer.AccountId.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref contract_transfer.Env.t := M.read self in
    M.read (deref α0).["caller"].
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon ltac:(Self) "caller" := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn balance(&self) -> Balance {
          unimplemented!()
      }
  *)
  Definition balance
      (self : ref ltac:(Self))
      : M ltac:(contract_transfer.Balance) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_balance :
    Notations.DoubleColon ltac:(Self) "balance" := {
    Notations.double_colon := balance;
  }.
  
  (*
      fn transfer(&mut self, _to: AccountId, _value: Balance) -> Result<(), ()> {
          unimplemented!()
      }
  *)
  Definition transfer
      (self : mut_ref ltac:(Self))
      (_to : contract_transfer.AccountId.t)
      (_value : ltac:(contract_transfer.Balance))
      : M (core.result.Result.t unit unit) :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* _to : M.Val contract_transfer.AccountId.t := M.alloc _to in
    let* _value : M.Val ltac:(contract_transfer.Balance) := M.alloc _value in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_transfer :
    Notations.DoubleColon ltac:(Self) "transfer" := {
    Notations.double_colon := transfer;
  }.
  
  (*
      fn transferred_value(&self) -> Balance {
          unimplemented!()
      }
  *)
  Definition transferred_value
      (self : ref ltac:(Self))
      : M ltac:(contract_transfer.Balance) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_transferred_value :
    Notations.DoubleColon ltac:(Self) "transferred_value" := {
    Notations.double_colon := transferred_value;
  }.
End Impl_contract_transfer_Env_t.
End Impl_contract_transfer_Env_t.

Module  GiveMe.
Section GiveMe.
  Inductive t : Set := Build.
End GiveMe.
End GiveMe.

Module  Impl_contract_transfer_GiveMe_t.
Section Impl_contract_transfer_GiveMe_t.
  Ltac Self := exact contract_transfer.GiveMe.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env : M contract_transfer.Env.t :=
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon ltac:(Self) "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (self : ref ltac:(Self)) : M contract_transfer.Env.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    M.call contract_transfer.GiveMe.t::["init_env"].
  
  Global Instance AssociatedFunction_env :
    Notations.DoubleColon ltac:(Self) "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new() -> Self {
          Self {}
      }
  *)
  Definition new : M ltac:(Self) := M.pure contract_transfer.GiveMe.Build.
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn give_me(&mut self, value: Balance) {
          println!("requested value: {}", value);
          println!("contract balance: {}", self.env().balance());
  
          assert!(value <= self.env().balance(), "insufficient funds!");
  
          if self.env().transfer(self.env().caller(), value).is_err() {
              panic!(
                  "requested transfer failed. this can be the case if the contract does not\
                   have sufficient free funds or if the transfer would have brought the\
                   contract's balance below minimum balance."
              )
          }
      }
  *)
  Definition give_me
      (self : mut_ref ltac:(Self))
      (value : ltac:(contract_transfer.Balance))
      : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* value : M.Val ltac:(contract_transfer.Balance) := M.alloc value in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "requested value: "; mk_str "
" ] in
        let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
        let* α2 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α1) in
        let* α3 : core.fmt.rt.Argument.t :=
          M.call (core.fmt.rt.Argument.t::["new_display"] (borrow value)) in
        let* α4 : M.Val core.fmt.rt.Argument.t := M.alloc α3 in
        let* α5 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α4 ] in
        let* α6 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
          M.alloc (borrow α5) in
        let* α7 : ref (slice core.fmt.rt.Argument.t) :=
          M.read (pointer_coercion "Unsize" α6) in
        let* α8 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_v1"] α2 α7) in
        let* α9 : unit := M.call (std.io.stdio._print α8) in
        M.alloc α9 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "contract balance: "; mk_str "
" ] in
        let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
        let* α2 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α1) in
        let* α3 : mut_ref contract_transfer.GiveMe.t := M.read self in
        let* α4 : contract_transfer.Env.t :=
          M.call (contract_transfer.GiveMe.t::["env"] (borrow (deref α3))) in
        let* α5 : M.Val contract_transfer.Env.t := M.alloc α4 in
        let* α6 : u128.t :=
          M.call (contract_transfer.Env.t::["balance"] (borrow α5)) in
        let* α7 : M.Val u128.t := M.alloc α6 in
        let* α8 : core.fmt.rt.Argument.t :=
          M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
        let* α9 : M.Val core.fmt.rt.Argument.t := M.alloc α8 in
        let* α10 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α9 ] in
        let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
          M.alloc (borrow α10) in
        let* α12 : ref (slice core.fmt.rt.Argument.t) :=
          M.read (pointer_coercion "Unsize" α11) in
        let* α13 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_v1"] α2 α12) in
        let* α14 : unit := M.call (std.io.stdio._print α13) in
        M.alloc α14 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* α0 : u128.t := M.read value in
      let* α1 : mut_ref contract_transfer.GiveMe.t := M.read self in
      let* α2 : contract_transfer.Env.t :=
        M.call (contract_transfer.GiveMe.t::["env"] (borrow (deref α1))) in
      let* α3 : M.Val contract_transfer.Env.t := M.alloc α2 in
      let* α4 : u128.t :=
        M.call (contract_transfer.Env.t::["balance"] (borrow α3)) in
      if (use (UnOp.not (BinOp.Pure.le α0 α4)) : bool) then
        let* α0 : ref str.t := M.read (mk_str "insufficient funds!") in
        let* α1 : never.t := M.call (std.panicking.begin_panic α0) in
        let* α2 : unit := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt in
    let* α0 : mut_ref contract_transfer.GiveMe.t := M.read self in
    let* α1 : contract_transfer.Env.t :=
      M.call (contract_transfer.GiveMe.t::["env"] (borrow (deref α0))) in
    let* α2 : M.Val contract_transfer.Env.t := M.alloc α1 in
    let* α3 : mut_ref contract_transfer.GiveMe.t := M.read self in
    let* α4 : contract_transfer.Env.t :=
      M.call (contract_transfer.GiveMe.t::["env"] (borrow (deref α3))) in
    let* α5 : M.Val contract_transfer.Env.t := M.alloc α4 in
    let* α6 : contract_transfer.AccountId.t :=
      M.call (contract_transfer.Env.t::["caller"] (borrow α5)) in
    let* α7 : u128.t := M.read value in
    let* α8 : core.result.Result.t unit unit :=
      M.call (contract_transfer.Env.t::["transfer"] (borrow_mut α2) α6 α7) in
    let* α9 : M.Val (core.result.Result.t unit unit) := M.alloc α8 in
    let* α10 : bool.t :=
      M.call ((core.result.Result.t unit unit)::["is_err"] (borrow α9)) in
    let* α0 : M.Val unit :=
      if (use α10 : bool) then
        let* α0 : ref str.t :=
          M.read
            (mk_str
              "requested transfer failed. this can be the case if the contract does nothave sufficient free funds or if the transfer would have brought thecontract's balance below minimum balance.") in
        let* α1 : never.t := M.call (std.panicking.begin_panic α0) in
        let* α2 : unit := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_give_me :
    Notations.DoubleColon ltac:(Self) "give_me" := {
    Notations.double_colon := give_me;
  }.
  
  (*
      pub fn was_it_ten(&self) {
          println!("received payment: {}", self.env().transferred_value());
          assert!(self.env().transferred_value() == 10, "payment was not ten");
      }
  *)
  Definition was_it_ten (self : ref ltac:(Self)) : M unit :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "received payment: "; mk_str "
" ] in
        let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
        let* α2 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α1) in
        let* α3 : ref contract_transfer.GiveMe.t := M.read self in
        let* α4 : contract_transfer.Env.t :=
          M.call (contract_transfer.GiveMe.t::["env"] α3) in
        let* α5 : M.Val contract_transfer.Env.t := M.alloc α4 in
        let* α6 : u128.t :=
          M.call (contract_transfer.Env.t::["transferred_value"] (borrow α5)) in
        let* α7 : M.Val u128.t := M.alloc α6 in
        let* α8 : core.fmt.rt.Argument.t :=
          M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
        let* α9 : M.Val core.fmt.rt.Argument.t := M.alloc α8 in
        let* α10 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α9 ] in
        let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
          M.alloc (borrow α10) in
        let* α12 : ref (slice core.fmt.rt.Argument.t) :=
          M.read (pointer_coercion "Unsize" α11) in
        let* α13 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_v1"] α2 α12) in
        let* α14 : unit := M.call (std.io.stdio._print α13) in
        M.alloc α14 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* α0 : ref contract_transfer.GiveMe.t := M.read self in
      let* α1 : contract_transfer.Env.t :=
        M.call (contract_transfer.GiveMe.t::["env"] α0) in
      let* α2 : M.Val contract_transfer.Env.t := M.alloc α1 in
      let* α3 : u128.t :=
        M.call (contract_transfer.Env.t::["transferred_value"] (borrow α2)) in
      if (use (UnOp.not (BinOp.Pure.eq α3 (Integer.of_Z 10))) : bool) then
        let* α0 : ref str.t := M.read (mk_str "payment was not ten") in
        let* α1 : never.t := M.call (std.panicking.begin_panic α0) in
        let* α2 : unit := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_was_it_ten :
    Notations.DoubleColon ltac:(Self) "was_it_ten" := {
    Notations.double_colon := was_it_ten;
  }.
End Impl_contract_transfer_GiveMe_t.
End Impl_contract_transfer_GiveMe_t.
