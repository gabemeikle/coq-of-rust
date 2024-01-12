(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Mapping.
Section Mapping.
  Context (K V : Set).
  
  Record t : Set := {
    _key : core.marker.PhantomData.t K;
    _value : core.marker.PhantomData.t V;
  }.
  
  Definition Get__key :=
    Ref.map (fun α => Some α.(_key)) (fun β α => Some (α <| _key := β |>)).
  Definition Get__value :=
    Ref.map (fun α => Some α.(_value)) (fun β α => Some (α <| _value := β |>)).
End Mapping.
End Mapping.

Module  Impl_core_default_Default_for_erc721_Mapping_t_K_V.
Section Impl_core_default_Default_for_erc721_Mapping_t_K_V.
  Context {K V : Set}.
  
  Context
    {ℋ_0 : core.default.Default.Trait K}
    {ℋ_1 : core.default.Default.Trait V}.
  
  Definition Self : Set := erc721.Mapping.t K V.
  
  (*
  Default
  *)
  Parameter default : M (erc721.Mapping.t K V).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_erc721_Mapping_t_K_V.
End Impl_core_default_Default_for_erc721_Mapping_t_K_V.

Module  Impl_erc721_Mapping_t_K_V.
Section Impl_erc721_Mapping_t_K_V.
  Context {K V : Set}.
  
  Definition Self : Set := erc721.Mapping.t K V.
  
  (*
      fn contains(&self, _key: &K) -> bool {
          unimplemented!()
      }
  *)
  Parameter contains : (ref Self) -> (ref K) -> M bool.t.
  
  Global Instance AssociatedFunction_contains :
    Notations.DoubleColon Self "contains" := {
    Notations.double_colon := contains;
  }.
  
  (*
      fn get(&self, _key: &K) -> Option<V> {
          unimplemented!()
      }
  *)
  Parameter get : (ref Self) -> (ref K) -> M (core.option.Option.t V).
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
  
  (*
      fn insert(&mut self, _key: K, _value: V) -> Option<u32> {
          unimplemented!()
      }
  *)
  Parameter insert : (mut_ref Self) -> K -> V -> M (core.option.Option.t u32.t).
  
  Global Instance AssociatedFunction_insert :
    Notations.DoubleColon Self "insert" := {
    Notations.double_colon := insert;
  }.
  
  (*
      fn remove(&self, _key: K) {
          unimplemented!()
      }
  *)
  Parameter remove : (ref Self) -> K -> M unit.
  
  Global Instance AssociatedFunction_remove :
    Notations.DoubleColon Self "remove" := {
    Notations.double_colon := remove;
  }.
  
  (*
      fn size(&self, _key: K) -> Option<u32> {
          unimplemented!()
      }
  *)
  Parameter size : (ref Self) -> K -> M (core.option.Option.t u32.t).
  
  Global Instance AssociatedFunction_size :
    Notations.DoubleColon Self "size" := {
    Notations.double_colon := size;
  }.
  
  (*
      fn take(&self, _key: K) -> Option<V> {
          unimplemented!()
      }
  *)
  Parameter take : (ref Self) -> K -> M (core.option.Option.t V).
  
  Global Instance AssociatedFunction_take :
    Notations.DoubleColon Self "take" := {
    Notations.double_colon := take;
  }.
End Impl_erc721_Mapping_t_K_V.
End Impl_erc721_Mapping_t_K_V.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_erc721_AccountId_t.
Section Impl_core_default_Default_for_erc721_AccountId_t.
  Definition Self : Set := erc721.AccountId.t.
  
  (*
  Default
  *)
  Parameter default : M erc721.AccountId.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_erc721_AccountId_t.
End Impl_core_default_Default_for_erc721_AccountId_t.

Module  Impl_core_clone_Clone_for_erc721_AccountId_t.
Section Impl_core_clone_Clone_for_erc721_AccountId_t.
  Definition Self : Set := erc721.AccountId.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M erc721.AccountId.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_erc721_AccountId_t.
End Impl_core_clone_Clone_for_erc721_AccountId_t.

Module  Impl_core_marker_Copy_for_erc721_AccountId_t.
Section Impl_core_marker_Copy_for_erc721_AccountId_t.
  Definition Self : Set := erc721.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_erc721_AccountId_t.
End Impl_core_marker_Copy_for_erc721_AccountId_t.

Module  Impl_core_marker_StructuralPartialEq_for_erc721_AccountId_t.
Section Impl_core_marker_StructuralPartialEq_for_erc721_AccountId_t.
  Definition Self : Set := erc721.AccountId.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_erc721_AccountId_t.
End Impl_core_marker_StructuralPartialEq_for_erc721_AccountId_t.

Module  Impl_core_cmp_PartialEq_for_erc721_AccountId_t.
Section Impl_core_cmp_PartialEq_for_erc721_AccountId_t.
  Definition Self : Set := erc721.AccountId.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref Self) -> (ref erc721.AccountId.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_erc721_AccountId_t.
End Impl_core_cmp_PartialEq_for_erc721_AccountId_t.

Module  Impl_core_convert_From_array_u8_t_for_erc721_AccountId_t.
Section Impl_core_convert_From_array_u8_t_for_erc721_AccountId_t.
  Definition Self : Set := erc721.AccountId.t.
  
  (*
      fn from(_value: [u8; 32]) -> Self {
          unimplemented!()
      }
  *)
  Parameter from : (array u8.t) -> M Self.
  
  Global Instance AssociatedFunction_from :
    Notations.DoubleColon Self "from" := {
    Notations.double_colon := from;
  }.
  
  Global Instance ℐ : core.convert.From.Trait Self (T := array u8.t) := {
    core.convert.From.from := from;
  }.
End Impl_core_convert_From_array_u8_t_for_erc721_AccountId_t.
End Impl_core_convert_From_array_u8_t_for_erc721_AccountId_t.

Ltac Balance := exact u128.t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : erc721.AccountId.t;
  }.
  
  Definition Get_caller :=
    Ref.map (fun α => Some α.(caller)) (fun β α => Some (α <| caller := β |>)).
End Env.
End Env.

Ltac TokenId := exact u32.t.

Module  Erc721.
Section Erc721.
  Record t : Set := {
    token_owner : erc721.Mapping.t ltac:(erc721.TokenId) erc721.AccountId.t;
    token_approvals : erc721.Mapping.t ltac:(erc721.TokenId) erc721.AccountId.t;
    owned_tokens_count : erc721.Mapping.t erc721.AccountId.t u32.t;
    operator_approvals :
      erc721.Mapping.t (erc721.AccountId.t * erc721.AccountId.t) unit;
  }.
  
  Definition Get_token_owner :=
    Ref.map
      (fun α => Some α.(token_owner))
      (fun β α => Some (α <| token_owner := β |>)).
  Definition Get_token_approvals :=
    Ref.map
      (fun α => Some α.(token_approvals))
      (fun β α => Some (α <| token_approvals := β |>)).
  Definition Get_owned_tokens_count :=
    Ref.map
      (fun α => Some α.(owned_tokens_count))
      (fun β α => Some (α <| owned_tokens_count := β |>)).
  Definition Get_operator_approvals :=
    Ref.map
      (fun α => Some α.(operator_approvals))
      (fun β α => Some (α <| operator_approvals := β |>)).
End Erc721.
End Erc721.

Module  Impl_core_default_Default_for_erc721_Erc721_t.
Section Impl_core_default_Default_for_erc721_Erc721_t.
  Definition Self : Set := erc721.Erc721.t.
  
  (*
  Default
  *)
  Parameter default : M erc721.Erc721.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_erc721_Erc721_t.
End Impl_core_default_Default_for_erc721_Erc721_t.

Module Error.
  Inductive t : Set :=
  | NotOwner
  | NotApproved
  | TokenExists
  | TokenNotFound
  | CannotInsert
  | CannotFetchValue
  | NotAllowed.
End Error.

Module  Impl_core_marker_StructuralPartialEq_for_erc721_Error_t.
Section Impl_core_marker_StructuralPartialEq_for_erc721_Error_t.
  Definition Self : Set := erc721.Error.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_erc721_Error_t.
End Impl_core_marker_StructuralPartialEq_for_erc721_Error_t.

Module  Impl_core_cmp_PartialEq_for_erc721_Error_t.
Section Impl_core_cmp_PartialEq_for_erc721_Error_t.
  Definition Self : Set := erc721.Error.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref Self) -> (ref erc721.Error.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_erc721_Error_t.
End Impl_core_cmp_PartialEq_for_erc721_Error_t.

Module  Impl_core_marker_StructuralEq_for_erc721_Error_t.
Section Impl_core_marker_StructuralEq_for_erc721_Error_t.
  Definition Self : Set := erc721.Error.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_erc721_Error_t.
End Impl_core_marker_StructuralEq_for_erc721_Error_t.

Module  Impl_core_cmp_Eq_for_erc721_Error_t.
Section Impl_core_cmp_Eq_for_erc721_Error_t.
  Definition Self : Set := erc721.Error.t.
  
  (*
  Eq
  *)
  Parameter assert_receiver_is_total_eq : (ref Self) -> M unit.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_erc721_Error_t.
End Impl_core_cmp_Eq_for_erc721_Error_t.

Module  Impl_core_clone_Clone_for_erc721_Error_t.
Section Impl_core_clone_Clone_for_erc721_Error_t.
  Definition Self : Set := erc721.Error.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M erc721.Error.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_erc721_Error_t.
End Impl_core_clone_Clone_for_erc721_Error_t.

Module  Impl_core_marker_Copy_for_erc721_Error_t.
Section Impl_core_marker_Copy_for_erc721_Error_t.
  Definition Self : Set := erc721.Error.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_erc721_Error_t.
End Impl_core_marker_Copy_for_erc721_Error_t.

Module  Transfer.
Section Transfer.
  Record t : Set := {
    from : core.option.Option.t erc721.AccountId.t;
    to : core.option.Option.t erc721.AccountId.t;
    id : ltac:(erc721.TokenId);
  }.
  
  Definition Get_from :=
    Ref.map (fun α => Some α.(from)) (fun β α => Some (α <| from := β |>)).
  Definition Get_to :=
    Ref.map (fun α => Some α.(to)) (fun β α => Some (α <| to := β |>)).
  Definition Get_id :=
    Ref.map (fun α => Some α.(id)) (fun β α => Some (α <| id := β |>)).
End Transfer.
End Transfer.

Module  Approval.
Section Approval.
  Record t : Set := {
    from : erc721.AccountId.t;
    to : erc721.AccountId.t;
    id : ltac:(erc721.TokenId);
  }.
  
  Definition Get_from :=
    Ref.map (fun α => Some α.(from)) (fun β α => Some (α <| from := β |>)).
  Definition Get_to :=
    Ref.map (fun α => Some α.(to)) (fun β α => Some (α <| to := β |>)).
  Definition Get_id :=
    Ref.map (fun α => Some α.(id)) (fun β α => Some (α <| id := β |>)).
End Approval.
End Approval.

Module  ApprovalForAll.
Section ApprovalForAll.
  Record t : Set := {
    owner : erc721.AccountId.t;
    operator : erc721.AccountId.t;
    approved : bool.t;
  }.
  
  Definition Get_owner :=
    Ref.map (fun α => Some α.(owner)) (fun β α => Some (α <| owner := β |>)).
  Definition Get_operator :=
    Ref.map
      (fun α => Some α.(operator))
      (fun β α => Some (α <| operator := β |>)).
  Definition Get_approved :=
    Ref.map
      (fun α => Some α.(approved))
      (fun β α => Some (α <| approved := β |>)).
End ApprovalForAll.
End ApprovalForAll.

Module Event.
  Inductive t : Set :=
  | Transfer (_ : erc721.Transfer.t)
  | Approval (_ : erc721.Approval.t)
  | ApprovalForAll (_ : erc721.ApprovalForAll.t).
  
  Definition Get_Transfer_0 :=
    Ref.map
      (fun α => match α with | Transfer α0 => Some α0 | _ => None end)
      (fun β α =>
        match α with | Transfer _ => Some (Transfer β) | _ => None end).
  
  Definition Get_Approval_0 :=
    Ref.map
      (fun α => match α with | Approval α0 => Some α0 | _ => None end)
      (fun β α =>
        match α with | Approval _ => Some (Approval β) | _ => None end).
  
  Definition Get_ApprovalForAll_0 :=
    Ref.map
      (fun α => match α with | ApprovalForAll α0 => Some α0 | _ => None end)
      (fun β α =>
        match α with
        | ApprovalForAll _ => Some (ApprovalForAll β)
        | _ => None
        end).
End Event.

Module  Impl_erc721_Env_t.
Section Impl_erc721_Env_t.
  Definition Self : Set := erc721.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Parameter caller : (ref Self) -> M erc721.AccountId.t.
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon Self "caller" := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Parameter emit_event : (ref Self) -> erc721.Event.t -> M unit.
  
  Global Instance AssociatedFunction_emit_event :
    Notations.DoubleColon Self "emit_event" := {
    Notations.double_colon := emit_event;
  }.
End Impl_erc721_Env_t.
End Impl_erc721_Env_t.

Module  Impl_erc721_Erc721_t.
Section Impl_erc721_Erc721_t.
  Definition Self : Set := erc721.Erc721.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : M erc721.Env.t.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon Self "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Parameter env : (ref Self) -> M erc721.Env.t.
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Parameter new : M Self.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      fn balance_of_or_zero(&self, of: &AccountId) -> u32 {
          self.owned_tokens_count.get(of).unwrap_or(0 as u32)
      }
  *)
  Parameter balance_of_or_zero :
      (ref Self) -> (ref erc721.AccountId.t) -> M u32.t.
  
  Global Instance AssociatedFunction_balance_of_or_zero :
    Notations.DoubleColon Self "balance_of_or_zero" := {
    Notations.double_colon := balance_of_or_zero;
  }.
  
  (*
      fn clear_approval(&mut self, id: TokenId) {
          self.token_approvals.remove(id);
      }
  *)
  Parameter clear_approval : (mut_ref Self) -> ltac:(erc721.TokenId) -> M unit.
  
  Global Instance AssociatedFunction_clear_approval :
    Notations.DoubleColon Self "clear_approval" := {
    Notations.double_colon := clear_approval;
  }.
  
  (*
      fn approved_for_all(&self, owner: AccountId, operator: AccountId) -> bool {
          self.operator_approvals.contains(&(owner, operator))
      }
  *)
  Parameter approved_for_all :
      (ref Self) -> erc721.AccountId.t -> erc721.AccountId.t -> M bool.t.
  
  Global Instance AssociatedFunction_approved_for_all :
    Notations.DoubleColon Self "approved_for_all" := {
    Notations.double_colon := approved_for_all;
  }.
  
  (*
      pub fn owner_of(&self, id: TokenId) -> Option<AccountId> {
          self.token_owner.get(&id)
      }
  *)
  Parameter owner_of :
      (ref Self) ->
        ltac:(erc721.TokenId) ->
        M (core.option.Option.t erc721.AccountId.t).
  
  Global Instance AssociatedFunction_owner_of :
    Notations.DoubleColon Self "owner_of" := {
    Notations.double_colon := owner_of;
  }.
  
  (*
      fn approved_or_owner(&self, from: Option<AccountId>, id: TokenId) -> bool {
          let owner = self.owner_of(id);
          from != Some(AccountId::from([0x0; 32]))
              && (from == owner
                  || from == self.token_approvals.get(&id)
                  || self.approved_for_all(
                      owner.expect("Error with AccountId"),
                      from.expect("Error with AccountId"),
                  ))
      }
  *)
  Parameter approved_or_owner :
      (ref Self) ->
        (core.option.Option.t erc721.AccountId.t) ->
        ltac:(erc721.TokenId) ->
        M bool.t.
  
  Global Instance AssociatedFunction_approved_or_owner :
    Notations.DoubleColon Self "approved_or_owner" := {
    Notations.double_colon := approved_or_owner;
  }.
  
  (*
      fn exists(&self, id: TokenId) -> bool {
          self.token_owner.contains(&id)
      }
  *)
  Parameter exists_ : (ref Self) -> ltac:(erc721.TokenId) -> M bool.t.
  
  Global Instance AssociatedFunction_exists_ :
    Notations.DoubleColon Self "exists_" := {
    Notations.double_colon := exists_;
  }.
  
  (*
      pub fn balance_of(&self, owner: AccountId) -> u32 {
          self.balance_of_or_zero(&owner)
      }
  *)
  Parameter balance_of : (ref Self) -> erc721.AccountId.t -> M u32.t.
  
  Global Instance AssociatedFunction_balance_of :
    Notations.DoubleColon Self "balance_of" := {
    Notations.double_colon := balance_of;
  }.
  
  (*
      pub fn get_approved(&self, id: TokenId) -> Option<AccountId> {
          self.token_approvals.get(&id)
      }
  *)
  Parameter get_approved :
      (ref Self) ->
        ltac:(erc721.TokenId) ->
        M (core.option.Option.t erc721.AccountId.t).
  
  Global Instance AssociatedFunction_get_approved :
    Notations.DoubleColon Self "get_approved" := {
    Notations.double_colon := get_approved;
  }.
  
  (*
      pub fn is_approved_for_all(&self, owner: AccountId, operator: AccountId) -> bool {
          self.approved_for_all(owner, operator)
      }
  *)
  Parameter is_approved_for_all :
      (ref Self) -> erc721.AccountId.t -> erc721.AccountId.t -> M bool.t.
  
  Global Instance AssociatedFunction_is_approved_for_all :
    Notations.DoubleColon Self "is_approved_for_all" := {
    Notations.double_colon := is_approved_for_all;
  }.
  
  (*
      fn approve_for_all(&mut self, to: AccountId, approved: bool) -> Result<(), Error> {
          let caller = self.env().caller();
          if to == caller {
              return Err(Error::NotAllowed);
          }
          self.env().emit_event(Event::ApprovalForAll(ApprovalForAll {
              owner: caller,
              operator: to,
              approved,
          }));
  
          if approved {
              self.operator_approvals.insert((caller, to), ());
          } else {
              self.operator_approvals.remove((caller, to));
          }
  
          Ok(())
      }
  *)
  Parameter approve_for_all :
      (mut_ref Self) ->
        erc721.AccountId.t ->
        bool.t ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_approve_for_all :
    Notations.DoubleColon Self "approve_for_all" := {
    Notations.double_colon := approve_for_all;
  }.
  
  (*
      pub fn set_approval_for_all(&mut self, to: AccountId, approved: bool) -> Result<(), Error> {
          self.approve_for_all(to, approved)?;
          Ok(())
      }
  *)
  Parameter set_approval_for_all :
      (mut_ref Self) ->
        erc721.AccountId.t ->
        bool.t ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_set_approval_for_all :
    Notations.DoubleColon Self "set_approval_for_all" := {
    Notations.double_colon := set_approval_for_all;
  }.
  
  (*
      fn approve_for(&mut self, to: &AccountId, id: TokenId) -> Result<(), Error> {
          let caller = self.env().caller();
          let owner = self.owner_of(id);
          if !(owner == Some(caller)
              || self.approved_for_all(owner.expect("Error with AccountId"), caller))
          {
              return Err(Error::NotAllowed);
          };
  
          if *to == AccountId::from([0x0; 32]) {
              return Err(Error::NotAllowed);
          };
  
          if self.token_approvals.contains(&id) {
              return Err(Error::CannotInsert);
          } else {
              self.token_approvals.insert(id, *to);
          }
  
          self.env().emit_event(Event::Approval(Approval {
              from: caller,
              to: *to,
              id,
          }));
  
          Ok(())
      }
  *)
  Parameter approve_for :
      (mut_ref Self) ->
        (ref erc721.AccountId.t) ->
        ltac:(erc721.TokenId) ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_approve_for :
    Notations.DoubleColon Self "approve_for" := {
    Notations.double_colon := approve_for;
  }.
  
  (*
      pub fn approve(&mut self, to: AccountId, id: TokenId) -> Result<(), Error> {
          self.approve_for(&to, id)?;
          Ok(())
      }
  *)
  Parameter approve :
      (mut_ref Self) ->
        erc721.AccountId.t ->
        ltac:(erc721.TokenId) ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_approve :
    Notations.DoubleColon Self "approve" := {
    Notations.double_colon := approve;
  }.
  
  (*
      fn remove_token_from(&mut self, from: &AccountId, id: TokenId) -> Result<(), Error> {
          let Self {
              token_owner,
              owned_tokens_count,
              ..
          } = self;
  
          if !token_owner.contains(&id) {
              return Err(Error::TokenNotFound);
          }
  
          let count = owned_tokens_count
              .get(from)
              .map(|c| c - (1 as u32))
              .ok_or(Error::CannotFetchValue)?;
          owned_tokens_count.insert( *from, count);
          token_owner.remove(id);
  
          Ok(())
      }
  *)
  Parameter remove_token_from :
      (mut_ref Self) ->
        (ref erc721.AccountId.t) ->
        ltac:(erc721.TokenId) ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_remove_token_from :
    Notations.DoubleColon Self "remove_token_from" := {
    Notations.double_colon := remove_token_from;
  }.
  
  (*
      fn add_token_to(&mut self, to: &AccountId, id: TokenId) -> Result<(), Error> {
          let Self {
              token_owner,
              owned_tokens_count,
              ..
          } = self;
  
          if token_owner.contains(&id) {
              return Err(Error::TokenExists);
          }
  
          if *to == AccountId::from([0x0; 32]) {
              return Err(Error::NotAllowed);
          };
  
          let count = owned_tokens_count
              .get(to)
              .map(|c| c + (1 as u32))
              .unwrap_or(1);
  
          owned_tokens_count.insert( *to, count);
          token_owner.insert(id, *to);
  
          Ok(())
      }
  *)
  Parameter add_token_to :
      (mut_ref Self) ->
        (ref erc721.AccountId.t) ->
        ltac:(erc721.TokenId) ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_add_token_to :
    Notations.DoubleColon Self "add_token_to" := {
    Notations.double_colon := add_token_to;
  }.
  
  (*
      fn transfer_token_from(
          &mut self,
          from: &AccountId,
          to: &AccountId,
          id: TokenId,
      ) -> Result<(), Error> {
          let caller = self.env().caller();
          if !self.exists(id) {
              return Err(Error::TokenNotFound);
          };
          if !self.approved_or_owner(Some(caller), id) {
              return Err(Error::NotApproved);
          };
          self.clear_approval(id);
          self.remove_token_from(from, id)?;
          self.add_token_to(to, id)?;
          self.env().emit_event(Event::Transfer(Transfer {
              from: Some( *from),
              to: Some( *to),
              id,
          }));
          Ok(())
      }
  *)
  Parameter transfer_token_from :
      (mut_ref Self) ->
        (ref erc721.AccountId.t) ->
        (ref erc721.AccountId.t) ->
        ltac:(erc721.TokenId) ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_transfer_token_from :
    Notations.DoubleColon Self "transfer_token_from" := {
    Notations.double_colon := transfer_token_from;
  }.
  
  (*
      pub fn transfer(&mut self, destination: AccountId, id: TokenId) -> Result<(), Error> {
          let caller = self.env().caller();
          self.transfer_token_from(&caller, &destination, id)?;
          Ok(())
      }
  *)
  Parameter transfer :
      (mut_ref Self) ->
        erc721.AccountId.t ->
        ltac:(erc721.TokenId) ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_transfer :
    Notations.DoubleColon Self "transfer" := {
    Notations.double_colon := transfer;
  }.
  
  (*
      pub fn transfer_from(
          &mut self,
          from: AccountId,
          to: AccountId,
          id: TokenId,
      ) -> Result<(), Error> {
          self.transfer_token_from(&from, &to, id)?;
          Ok(())
      }
  *)
  Parameter transfer_from :
      (mut_ref Self) ->
        erc721.AccountId.t ->
        erc721.AccountId.t ->
        ltac:(erc721.TokenId) ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_transfer_from :
    Notations.DoubleColon Self "transfer_from" := {
    Notations.double_colon := transfer_from;
  }.
  
  (*
      pub fn mint(&mut self, id: TokenId) -> Result<(), Error> {
          let caller = self.env().caller();
          self.add_token_to(&caller, id)?;
          self.env().emit_event(Event::Transfer(Transfer {
              from: Some(AccountId::from([0x0; 32])),
              to: Some(caller),
              id,
          }));
          Ok(())
      }
  *)
  Parameter mint :
      (mut_ref Self) ->
        ltac:(erc721.TokenId) ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_mint :
    Notations.DoubleColon Self "mint" := {
    Notations.double_colon := mint;
  }.
  
  (*
      pub fn burn(&mut self, id: TokenId) -> Result<(), Error> {
          let caller = self.env().caller();
          let Self {
              token_owner,
              owned_tokens_count,
              ..
          } = self;
  
          let owner = token_owner.get(&id).ok_or(Error::TokenNotFound)?;
          if owner != caller {
              return Err(Error::NotOwner);
          };
  
          let count = owned_tokens_count
              .get(&caller)
              .map(|c| c - 1)
              .ok_or(Error::CannotFetchValue)?;
          owned_tokens_count.insert(caller, count);
          token_owner.remove(id);
  
          self.env().emit_event(Event::Transfer(Transfer {
              from: Some(caller),
              to: Some(AccountId::from([0x0; 32])),
              id,
          }));
  
          Ok(())
      }
  *)
  Parameter burn :
      (mut_ref Self) ->
        ltac:(erc721.TokenId) ->
        M (core.result.Result.t unit erc721.Error.t).
  
  Global Instance AssociatedFunction_burn :
    Notations.DoubleColon Self "burn" := {
    Notations.double_colon := burn;
  }.
End Impl_erc721_Erc721_t.
End Impl_erc721_Erc721_t.
