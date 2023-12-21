(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Mapping.
Section Mapping.
  Context (K V : Set).
  
  Record t : Set := {
    _key : core.marker.PhantomData.t K;
    _value : core.marker.PhantomData.t V;
  }.
  
  Global Instance Get__key : Notations.Dot "_key" := {
    Notations.dot := Ref.map (fun x => x.(_key)) (fun v x => x <| _key := v |>);
  }.
  Global Instance Get_AF__key : Notations.DoubleColon t "_key" := {
    Notations.double_colon (x : M.Val t) := x.["_key"];
  }.
  Global Instance Get__value : Notations.Dot "_value" := {
    Notations.dot :=
      Ref.map (fun x => x.(_value)) (fun v x => x <| _value := v |>);
  }.
  Global Instance Get_AF__value : Notations.DoubleColon t "_value" := {
    Notations.double_colon (x : M.Val t) := x.["_value"];
  }.
End Mapping.
End Mapping.

Module  Impl_core_default_Default_for_erc1155_Mapping_t_K_V.
Section Impl_core_default_Default_for_erc1155_Mapping_t_K_V.
  Context {K V : Set}.
  
  Context
    {ℋ_0 : core.default.Default.Trait K}
    {ℋ_1 : core.default.Default.Trait V}.
  
  Definition Self : Set := erc1155.Mapping.t K V.
  
  (*
  Default
  *)
  Parameter default : M (erc1155.Mapping.t K V).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_erc1155_Mapping_t_K_V.
End Impl_core_default_Default_for_erc1155_Mapping_t_K_V.

Module  Impl_erc1155_Mapping_t_K_V.
Section Impl_erc1155_Mapping_t_K_V.
  Context {K V : Set}.
  
  Definition Self : Set := erc1155.Mapping.t K V.
  
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
End Impl_erc1155_Mapping_t_K_V.
End Impl_erc1155_Mapping_t_K_V.

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

Module  Impl_core_default_Default_for_erc1155_AccountId_t.
Section Impl_core_default_Default_for_erc1155_AccountId_t.
  Definition Self : Set := erc1155.AccountId.t.
  
  (*
  Default
  *)
  Parameter default : M erc1155.AccountId.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_erc1155_AccountId_t.
End Impl_core_default_Default_for_erc1155_AccountId_t.

Module  Impl_core_clone_Clone_for_erc1155_AccountId_t.
Section Impl_core_clone_Clone_for_erc1155_AccountId_t.
  Definition Self : Set := erc1155.AccountId.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M erc1155.AccountId.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_erc1155_AccountId_t.
End Impl_core_clone_Clone_for_erc1155_AccountId_t.

Module  Impl_core_marker_Copy_for_erc1155_AccountId_t.
Section Impl_core_marker_Copy_for_erc1155_AccountId_t.
  Definition Self : Set := erc1155.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_erc1155_AccountId_t.
End Impl_core_marker_Copy_for_erc1155_AccountId_t.

Module  Impl_core_marker_StructuralPartialEq_for_erc1155_AccountId_t.
Section Impl_core_marker_StructuralPartialEq_for_erc1155_AccountId_t.
  Definition Self : Set := erc1155.AccountId.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_erc1155_AccountId_t.
End Impl_core_marker_StructuralPartialEq_for_erc1155_AccountId_t.

Module  Impl_core_cmp_PartialEq_for_erc1155_AccountId_t.
Section Impl_core_cmp_PartialEq_for_erc1155_AccountId_t.
  Definition Self : Set := erc1155.AccountId.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref Self) -> (ref erc1155.AccountId.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_erc1155_AccountId_t.
End Impl_core_cmp_PartialEq_for_erc1155_AccountId_t.

Module  Impl_core_convert_From_array_u8_t_for_erc1155_AccountId_t.
Section Impl_core_convert_From_array_u8_t_for_erc1155_AccountId_t.
  Definition Self : Set := erc1155.AccountId.t.
  
  (*
      fn from(_v: [u8; 32]) -> Self {
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
End Impl_core_convert_From_array_u8_t_for_erc1155_AccountId_t.
End Impl_core_convert_From_array_u8_t_for_erc1155_AccountId_t.

Ltac Balance := exact u128.t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : erc1155.AccountId.t;
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

Parameter ON_ERC_1155_RECEIVED_SELECTOR : array u8.t.

Parameter _ON_ERC_1155_BATCH_RECEIVED_SELECTOR : array u8.t.

Ltac TokenId := exact u128.t.

Module Error.
  Inductive t : Set :=
  | UnexistentToken
  | ZeroAddressTransfer
  | NotApproved
  | InsufficientBalance
  | SelfApproval
  | BatchTransferMismatch.
End Error.

Module  Impl_core_marker_StructuralPartialEq_for_erc1155_Error_t.
Section Impl_core_marker_StructuralPartialEq_for_erc1155_Error_t.
  Definition Self : Set := erc1155.Error.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_erc1155_Error_t.
End Impl_core_marker_StructuralPartialEq_for_erc1155_Error_t.

Module  Impl_core_cmp_PartialEq_for_erc1155_Error_t.
Section Impl_core_cmp_PartialEq_for_erc1155_Error_t.
  Definition Self : Set := erc1155.Error.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref Self) -> (ref erc1155.Error.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_erc1155_Error_t.
End Impl_core_cmp_PartialEq_for_erc1155_Error_t.

Module  Impl_core_marker_StructuralEq_for_erc1155_Error_t.
Section Impl_core_marker_StructuralEq_for_erc1155_Error_t.
  Definition Self : Set := erc1155.Error.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_erc1155_Error_t.
End Impl_core_marker_StructuralEq_for_erc1155_Error_t.

Module  Impl_core_cmp_Eq_for_erc1155_Error_t.
Section Impl_core_cmp_Eq_for_erc1155_Error_t.
  Definition Self : Set := erc1155.Error.t.
  
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
End Impl_core_cmp_Eq_for_erc1155_Error_t.
End Impl_core_cmp_Eq_for_erc1155_Error_t.

Ltac Result T := exact (core.result.Result.t T erc1155.Error.t).

Module  Erc1155.
Section Erc1155.
  Class Trait (Self : Set) : Type := {
    safe_transfer_from :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        ltac:(erc1155.TokenId) ->
        ltac:(erc1155.Balance) ->
        (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A) ->
        M ltac:(erc1155.Result unit);
    safe_batch_transfer_from :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        (alloc.vec.Vec.t ltac:(erc1155.TokenId) alloc.vec.Vec.Default.A) ->
        (alloc.vec.Vec.t ltac:(erc1155.Balance) alloc.vec.Vec.Default.A) ->
        (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A) ->
        M ltac:(erc1155.Result unit);
    balance_of :
      (ref Self) ->
        erc1155.AccountId.t ->
        ltac:(erc1155.TokenId) ->
        M ltac:(erc1155.Balance);
    balance_of_batch :
      (ref Self) ->
        (alloc.vec.Vec.t erc1155.AccountId.t alloc.vec.Vec.Default.A) ->
        (alloc.vec.Vec.t ltac:(erc1155.TokenId) alloc.vec.Vec.Default.A) ->
        M (alloc.vec.Vec.t ltac:(erc1155.Balance) alloc.vec.Vec.Default.A);
    set_approval_for_all :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        bool.t ->
        M ltac:(erc1155.Result unit);
    is_approved_for_all :
      (ref Self) -> erc1155.AccountId.t -> erc1155.AccountId.t -> M bool.t;
  }.
  
End Erc1155.
End Erc1155.

Module  Erc1155TokenReceiver.
Section Erc1155TokenReceiver.
  Class Trait (Self : Set) : Type := {
    on_received :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        ltac:(erc1155.TokenId) ->
        ltac:(erc1155.Balance) ->
        (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A) ->
        M (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A);
    on_batch_received :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        (alloc.vec.Vec.t ltac:(erc1155.TokenId) alloc.vec.Vec.Default.A) ->
        (alloc.vec.Vec.t ltac:(erc1155.Balance) alloc.vec.Vec.Default.A) ->
        (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A) ->
        M (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A);
  }.
  
End Erc1155TokenReceiver.
End Erc1155TokenReceiver.

Ltac Owner := exact erc1155.AccountId.t.

Ltac Operator := exact erc1155.AccountId.t.

Module  TransferSingle.
Section TransferSingle.
  Record t : Set := {
    operator : core.option.Option.t erc1155.AccountId.t;
    from : core.option.Option.t erc1155.AccountId.t;
    to : core.option.Option.t erc1155.AccountId.t;
    token_id : ltac:(erc1155.TokenId);
    value : ltac:(erc1155.Balance);
  }.
  
  Global Instance Get_operator : Notations.Dot "operator" := {
    Notations.dot :=
      Ref.map (fun x => x.(operator)) (fun v x => x <| operator := v |>);
  }.
  Global Instance Get_AF_operator : Notations.DoubleColon t "operator" := {
    Notations.double_colon (x : M.Val t) := x.["operator"];
  }.
  Global Instance Get_from : Notations.Dot "from" := {
    Notations.dot := Ref.map (fun x => x.(from)) (fun v x => x <| from := v |>);
  }.
  Global Instance Get_AF_from : Notations.DoubleColon t "from" := {
    Notations.double_colon (x : M.Val t) := x.["from"];
  }.
  Global Instance Get_to : Notations.Dot "to" := {
    Notations.dot := Ref.map (fun x => x.(to)) (fun v x => x <| to := v |>);
  }.
  Global Instance Get_AF_to : Notations.DoubleColon t "to" := {
    Notations.double_colon (x : M.Val t) := x.["to"];
  }.
  Global Instance Get_token_id : Notations.Dot "token_id" := {
    Notations.dot :=
      Ref.map (fun x => x.(token_id)) (fun v x => x <| token_id := v |>);
  }.
  Global Instance Get_AF_token_id : Notations.DoubleColon t "token_id" := {
    Notations.double_colon (x : M.Val t) := x.["token_id"];
  }.
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End TransferSingle.
End TransferSingle.

Module  ApprovalForAll.
Section ApprovalForAll.
  Record t : Set := {
    owner : erc1155.AccountId.t;
    operator : erc1155.AccountId.t;
    approved : bool.t;
  }.
  
  Global Instance Get_owner : Notations.Dot "owner" := {
    Notations.dot :=
      Ref.map (fun x => x.(owner)) (fun v x => x <| owner := v |>);
  }.
  Global Instance Get_AF_owner : Notations.DoubleColon t "owner" := {
    Notations.double_colon (x : M.Val t) := x.["owner"];
  }.
  Global Instance Get_operator : Notations.Dot "operator" := {
    Notations.dot :=
      Ref.map (fun x => x.(operator)) (fun v x => x <| operator := v |>);
  }.
  Global Instance Get_AF_operator : Notations.DoubleColon t "operator" := {
    Notations.double_colon (x : M.Val t) := x.["operator"];
  }.
  Global Instance Get_approved : Notations.Dot "approved" := {
    Notations.dot :=
      Ref.map (fun x => x.(approved)) (fun v x => x <| approved := v |>);
  }.
  Global Instance Get_AF_approved : Notations.DoubleColon t "approved" := {
    Notations.double_colon (x : M.Val t) := x.["approved"];
  }.
End ApprovalForAll.
End ApprovalForAll.

Module  Uri.
Section Uri.
  Record t : Set := {
    value : alloc.string.String.t;
    token_id : ltac:(erc1155.TokenId);
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
  Global Instance Get_token_id : Notations.Dot "token_id" := {
    Notations.dot :=
      Ref.map (fun x => x.(token_id)) (fun v x => x <| token_id := v |>);
  }.
  Global Instance Get_AF_token_id : Notations.DoubleColon t "token_id" := {
    Notations.double_colon (x : M.Val t) := x.["token_id"];
  }.
End Uri.
End Uri.

Module Event.
  Inductive t : Set :=
  | TransferSingle (_ : erc1155.TransferSingle.t)
  | ApprovalForAll (_ : erc1155.ApprovalForAll.t)
  | Uri (_ : erc1155.Uri.t).
End Event.

Module  Impl_erc1155_Env_t.
Section Impl_erc1155_Env_t.
  Definition Self : Set := erc1155.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Parameter caller : (ref Self) -> M erc1155.AccountId.t.
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon Self "caller" := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Parameter emit_event : (ref Self) -> erc1155.Event.t -> M unit.
  
  Global Instance AssociatedFunction_emit_event :
    Notations.DoubleColon Self "emit_event" := {
    Notations.double_colon := emit_event;
  }.
End Impl_erc1155_Env_t.
End Impl_erc1155_Env_t.

Module  Contract.
Section Contract.
  Record t : Set := {
    balances :
      erc1155.Mapping.t
        (erc1155.AccountId.t * ltac:(erc1155.TokenId))
        ltac:(erc1155.Balance);
    approvals :
      erc1155.Mapping.t (ltac:(erc1155.Owner) * ltac:(erc1155.Operator)) unit;
    token_id_nonce : ltac:(erc1155.TokenId);
  }.
  
  Global Instance Get_balances : Notations.Dot "balances" := {
    Notations.dot :=
      Ref.map (fun x => x.(balances)) (fun v x => x <| balances := v |>);
  }.
  Global Instance Get_AF_balances : Notations.DoubleColon t "balances" := {
    Notations.double_colon (x : M.Val t) := x.["balances"];
  }.
  Global Instance Get_approvals : Notations.Dot "approvals" := {
    Notations.dot :=
      Ref.map (fun x => x.(approvals)) (fun v x => x <| approvals := v |>);
  }.
  Global Instance Get_AF_approvals : Notations.DoubleColon t "approvals" := {
    Notations.double_colon (x : M.Val t) := x.["approvals"];
  }.
  Global Instance Get_token_id_nonce : Notations.Dot "token_id_nonce" := {
    Notations.dot :=
      Ref.map
        (fun x => x.(token_id_nonce))
        (fun v x => x <| token_id_nonce := v |>);
  }.
  Global Instance Get_AF_token_id_nonce :
    Notations.DoubleColon t "token_id_nonce" := {
    Notations.double_colon (x : M.Val t) := x.["token_id_nonce"];
  }.
End Contract.
End Contract.

Module  Impl_core_default_Default_for_erc1155_Contract_t.
Section Impl_core_default_Default_for_erc1155_Contract_t.
  Definition Self : Set := erc1155.Contract.t.
  
  (*
  Default
  *)
  Parameter default : M erc1155.Contract.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_erc1155_Contract_t.
End Impl_core_default_Default_for_erc1155_Contract_t.

Module  Impl_erc1155_Contract_t.
Section Impl_erc1155_Contract_t.
  Definition Self : Set := erc1155.Contract.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : M erc1155.Env.t.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon Self "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Parameter env : (ref Self) -> M erc1155.Env.t.
  
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
      pub fn create(&mut self, value: Balance) -> TokenId {
          let caller = self.env().caller();
  
          // Given that TokenId is a `u128` the likelihood of this overflowing is pretty
          // slim.
          self.token_id_nonce += 1;
          self.balances.insert((caller, self.token_id_nonce), value);
  
          // Emit transfer event but with mint semantics
          self.env().emit_event(Event::TransferSingle(TransferSingle {
              operator: Some(caller),
              from: None,
              to: if value == 0 { None } else { Some(caller) },
              token_id: self.token_id_nonce,
              value,
          }));
  
          self.token_id_nonce
      }
  *)
  Parameter create :
      (mut_ref Self) -> ltac:(erc1155.Balance) -> M ltac:(erc1155.TokenId).
  
  Global Instance AssociatedFunction_create :
    Notations.DoubleColon Self "create" := {
    Notations.double_colon := create;
  }.
  
  (*
      pub fn mint(&mut self, token_id: TokenId, value: Balance) -> Result<()> {
          ensure!(token_id <= self.token_id_nonce, Error::UnexistentToken);
  
          let caller = self.env().caller();
          self.balances.insert((caller, token_id), value);
  
          // Emit transfer event but with mint semantics
          self.env().emit_event(Event::TransferSingle(TransferSingle {
              operator: Some(caller),
              from: None,
              to: Some(caller),
              token_id,
              value,
          }));
  
          Ok(())
      }
  *)
  Parameter mint :
      (mut_ref Self) ->
        ltac:(erc1155.TokenId) ->
        ltac:(erc1155.Balance) ->
        M ltac:(erc1155.Result unit).
  
  Global Instance AssociatedFunction_mint :
    Notations.DoubleColon Self "mint" := {
    Notations.double_colon := mint;
  }.
  
  (*
      fn perform_transfer(
          &mut self,
          from: AccountId,
          to: AccountId,
          token_id: TokenId,
          value: Balance,
      ) {
          let mut sender_balance = self
              .balances
              .get(&(from, token_id))
              .expect("Caller should have ensured that `from` holds `token_id`.");
          sender_balance -= value;
          self.balances.insert((from, token_id), sender_balance);
  
          let mut recipient_balance = self.balances.get(&(to, token_id)).unwrap_or(0);
          recipient_balance += value;
          self.balances.insert((to, token_id), recipient_balance);
  
          let caller = self.env().caller();
          self.env().emit_event(Event::TransferSingle(TransferSingle {
              operator: Some(caller),
              from: Some(from),
              to: Some(to),
              token_id,
              value,
          }));
      }
  *)
  Parameter perform_transfer :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        ltac:(erc1155.TokenId) ->
        ltac:(erc1155.Balance) ->
        M unit.
  
  Global Instance AssociatedFunction_perform_transfer :
    Notations.DoubleColon Self "perform_transfer" := {
    Notations.double_colon := perform_transfer;
  }.
  
  (*
      fn transfer_acceptance_check(
          &mut self,
          caller: AccountId,
          from: AccountId,
          to: AccountId,
          token_id: TokenId,
          value: Balance,
          data: Vec<u8>,
      ) {
          // This is disabled during tests due to the use of `invoke_contract()` not
          // being supported (tests end up panicking).
          #[cfg(not(test))]
          {
              use ink::env::call::{build_call, ExecutionInput, Selector};
  
              // If our recipient is a smart contract we need to see if they accept or
              // reject this transfer. If they reject it we need to revert the call.
              let result = build_call::<Environment>()
                  .call(to)
                  .gas_limit(5000)
                  .exec_input(
                      ExecutionInput::new(Selector::new(ON_ERC_1155_RECEIVED_SELECTOR))
                          .push_arg(caller)
                          .push_arg(from)
                          .push_arg(token_id)
                          .push_arg(value)
                          .push_arg(data),
                  )
                  .returns::<Vec<u8>>()
                  .params()
                  .try_invoke();
  
              match result {
                  Ok(v) => {
                      ink::env::debug_println!(
                          "Received return value \"{:?}\" from contract {:?}",
                          v.clone()
                              .expect("Call should be valid, don't expect a `LangError`."),
                          from
                      );
                      assert_eq!(
                          v.clone()
                              .expect("Call should be valid, don't expect a `LangError`."),
                          &ON_ERC_1155_RECEIVED_SELECTOR[..],
                          "The recipient contract at {to:?} does not accept token transfers.\n
                              Expected: {ON_ERC_1155_RECEIVED_SELECTOR:?}, Got {v:?}"
                      )
                  }
                  Err(e) => {
                      match e {
                          ink::env::Error::CodeNotFound | ink::env::Error::NotCallable => {
                              // Our recipient wasn't a smart contract, so there's
                              // nothing more for
                              // us to do
                              ink::env::debug_println!(
                                  "Recipient at {:?} from is not a smart contract ({:?})",
                                  from,
                                  e
                              );
                          }
                          _ => {
                              // We got some sort of error from the call to our
                              // recipient smart
                              // contract, and as such we must revert this call
                              panic!("Got error \"{e:?}\" while trying to call {from:?}")
                          }
                      }
                  }
              }
          }
      }
  *)
  Parameter transfer_acceptance_check :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        ltac:(erc1155.TokenId) ->
        ltac:(erc1155.Balance) ->
        (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A) ->
        M unit.
  
  Global Instance AssociatedFunction_transfer_acceptance_check :
    Notations.DoubleColon Self "transfer_acceptance_check" := {
    Notations.double_colon := transfer_acceptance_check;
  }.
End Impl_erc1155_Contract_t.
End Impl_erc1155_Contract_t.

Module  Impl_erc1155_Erc1155_for_erc1155_Contract_t.
Section Impl_erc1155_Erc1155_for_erc1155_Contract_t.
  Definition Self : Set := erc1155.Contract.t.
  
  (*
      fn safe_transfer_from(
          &mut self,
          from: AccountId,
          to: AccountId,
          token_id: TokenId,
          value: Balance,
          data: Vec<u8>,
      ) -> Result<()> {
          let caller = self.env().caller();
          if caller != from {
              ensure!(self.is_approved_for_all(from, caller), Error::NotApproved);
          }
  
          ensure!(to != zero_address(), Error::ZeroAddressTransfer);
  
          let balance = self.balance_of(from, token_id);
          ensure!(balance >= value, Error::InsufficientBalance);
  
          self.perform_transfer(from, to, token_id, value);
          self.transfer_acceptance_check(caller, from, to, token_id, value, data);
  
          Ok(())
      }
  *)
  Parameter safe_transfer_from :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        ltac:(erc1155.TokenId) ->
        ltac:(erc1155.Balance) ->
        (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A) ->
        M ltac:(erc1155.Result unit).
  
  Global Instance AssociatedFunction_safe_transfer_from :
    Notations.DoubleColon Self "safe_transfer_from" := {
    Notations.double_colon := safe_transfer_from;
  }.
  
  (*
      fn safe_batch_transfer_from(
          &mut self,
          from: AccountId,
          to: AccountId,
          token_ids: Vec<TokenId>,
          values: Vec<Balance>,
          data: Vec<u8>,
      ) -> Result<()> {
          let caller = self.env().caller();
          if caller != from {
              ensure!(self.is_approved_for_all(from, caller), Error::NotApproved);
          }
  
          ensure!(to != zero_address(), Error::ZeroAddressTransfer);
          ensure!(!token_ids.is_empty(), Error::BatchTransferMismatch);
          ensure!(
              token_ids.len() == values.len(),
              Error::BatchTransferMismatch,
          );
  
          let transfers = token_ids.iter().zip(values.iter());
          for (&id, &v) in transfers.clone() {
              let balance = self.balance_of(from, id);
              ensure!(balance >= v, Error::InsufficientBalance);
          }
  
          for (&id, &v) in transfers {
              self.perform_transfer(from, to, id, v);
          }
  
          // Can use the any token ID/value here, we really just care about knowing if
          // `to` is a smart contract which accepts transfers
          self.transfer_acceptance_check(caller, from, to, token_ids[0], values[0], data);
  
          Ok(())
      }
  *)
  Parameter safe_batch_transfer_from :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        (alloc.vec.Vec.t ltac:(erc1155.TokenId) alloc.vec.Vec.Default.A) ->
        (alloc.vec.Vec.t ltac:(erc1155.Balance) alloc.vec.Vec.Default.A) ->
        (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A) ->
        M ltac:(erc1155.Result unit).
  
  Global Instance AssociatedFunction_safe_batch_transfer_from :
    Notations.DoubleColon Self "safe_batch_transfer_from" := {
    Notations.double_colon := safe_batch_transfer_from;
  }.
  
  (*
      fn balance_of(&self, owner: AccountId, token_id: TokenId) -> Balance {
          self.balances.get(&(owner, token_id)).unwrap_or(0)
      }
  *)
  Parameter balance_of :
      (ref Self) ->
        erc1155.AccountId.t ->
        ltac:(erc1155.TokenId) ->
        M ltac:(erc1155.Balance).
  
  Global Instance AssociatedFunction_balance_of :
    Notations.DoubleColon Self "balance_of" := {
    Notations.double_colon := balance_of;
  }.
  
  (*
      fn balance_of_batch(&self, owners: Vec<AccountId>, token_ids: Vec<TokenId>) -> Vec<Balance> {
          let mut output = Vec::new();
          for o in &owners {
              for t in &token_ids {
                  let amount = self.balance_of( *o, *t);
                  output.push(amount);
              }
          }
          output
      }
  *)
  Parameter balance_of_batch :
      (ref Self) ->
        (alloc.vec.Vec.t erc1155.AccountId.t alloc.vec.Vec.Default.A) ->
        (alloc.vec.Vec.t ltac:(erc1155.TokenId) alloc.vec.Vec.Default.A) ->
        M (alloc.vec.Vec.t ltac:(erc1155.Balance) alloc.vec.Vec.Default.A).
  
  Global Instance AssociatedFunction_balance_of_batch :
    Notations.DoubleColon Self "balance_of_batch" := {
    Notations.double_colon := balance_of_batch;
  }.
  
  (*
      fn set_approval_for_all(&mut self, operator: AccountId, approved: bool) -> Result<()> {
          let caller = self.env().caller();
          ensure!(operator != caller, Error::SelfApproval);
  
          if approved {
              self.approvals.insert((caller, operator), ());
          } else {
              self.approvals.remove((caller, operator));
          }
  
          self.env().emit_event(Event::ApprovalForAll(ApprovalForAll {
              owner: caller,
              operator,
              approved,
          }));
  
          Ok(())
      }
  *)
  Parameter set_approval_for_all :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        bool.t ->
        M ltac:(erc1155.Result unit).
  
  Global Instance AssociatedFunction_set_approval_for_all :
    Notations.DoubleColon Self "set_approval_for_all" := {
    Notations.double_colon := set_approval_for_all;
  }.
  
  (*
      fn is_approved_for_all(&self, owner: AccountId, operator: AccountId) -> bool {
          self.approvals.contains(&(owner, operator))
      }
  *)
  Parameter is_approved_for_all :
      (ref Self) -> erc1155.AccountId.t -> erc1155.AccountId.t -> M bool.t.
  
  Global Instance AssociatedFunction_is_approved_for_all :
    Notations.DoubleColon Self "is_approved_for_all" := {
    Notations.double_colon := is_approved_for_all;
  }.
  
  Global Instance ℐ : erc1155.Erc1155.Trait Self := {
    erc1155.Erc1155.safe_transfer_from := safe_transfer_from;
    erc1155.Erc1155.safe_batch_transfer_from := safe_batch_transfer_from;
    erc1155.Erc1155.balance_of := balance_of;
    erc1155.Erc1155.balance_of_batch := balance_of_batch;
    erc1155.Erc1155.set_approval_for_all := set_approval_for_all;
    erc1155.Erc1155.is_approved_for_all := is_approved_for_all;
  }.
End Impl_erc1155_Erc1155_for_erc1155_Contract_t.
End Impl_erc1155_Erc1155_for_erc1155_Contract_t.

Module  Impl_erc1155_Erc1155TokenReceiver_for_erc1155_Contract_t.
Section Impl_erc1155_Erc1155TokenReceiver_for_erc1155_Contract_t.
  Definition Self : Set := erc1155.Contract.t.
  
  (*
      fn on_received(
          &mut self,
          _operator: AccountId,
          _from: AccountId,
          _token_id: TokenId,
          _value: Balance,
          _data: Vec<u8>,
      ) -> Vec<u8> {
          // The ERC-1155 standard dictates that if a contract does not accept token
          // transfers directly to the contract, then the contract must
          // revert.
          //
          // This prevents a user from unintentionally transferring tokens to a smart
          // contract and getting their funds stuck without any sort of
          // recovery mechanism.
          //
          // Note that the choice of whether or not to accept tokens is implementation
          // specific, and we've decided to not accept them in this
          // implementation.
          unimplemented!("This smart contract does not accept token transfer.")
      }
  *)
  Parameter on_received :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        ltac:(erc1155.TokenId) ->
        ltac:(erc1155.Balance) ->
        (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A) ->
        M (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A).
  
  Global Instance AssociatedFunction_on_received :
    Notations.DoubleColon Self "on_received" := {
    Notations.double_colon := on_received;
  }.
  
  (*
      fn on_batch_received(
          &mut self,
          _operator: AccountId,
          _from: AccountId,
          _token_ids: Vec<TokenId>,
          _values: Vec<Balance>,
          _data: Vec<u8>,
      ) -> Vec<u8> {
          // The ERC-1155 standard dictates that if a contract does not accept token
          // transfers directly to the contract, then the contract must
          // revert.
          //
          // This prevents a user from unintentionally transferring tokens to a smart
          // contract and getting their funds stuck without any sort of
          // recovery mechanism.
          //
          // Note that the choice of whether or not to accept tokens is implementation
          // specific, and we've decided to not accept them in this
          // implementation.
          unimplemented!("This smart contract does not accept batch token transfers.")
      }
  *)
  Parameter on_batch_received :
      (mut_ref Self) ->
        erc1155.AccountId.t ->
        erc1155.AccountId.t ->
        (alloc.vec.Vec.t ltac:(erc1155.TokenId) alloc.vec.Vec.Default.A) ->
        (alloc.vec.Vec.t ltac:(erc1155.Balance) alloc.vec.Vec.Default.A) ->
        (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A) ->
        M (alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A).
  
  Global Instance AssociatedFunction_on_batch_received :
    Notations.DoubleColon Self "on_batch_received" := {
    Notations.double_colon := on_batch_received;
  }.
  
  Global Instance ℐ : erc1155.Erc1155TokenReceiver.Trait Self := {
    erc1155.Erc1155TokenReceiver.on_received := on_received;
    erc1155.Erc1155TokenReceiver.on_batch_received := on_batch_received;
  }.
End Impl_erc1155_Erc1155TokenReceiver_for_erc1155_Contract_t.
End Impl_erc1155_Erc1155TokenReceiver_for_erc1155_Contract_t.

(*
fn zero_address() -> AccountId {
    [0u8; 32].into()
}
*)
Parameter zero_address : M erc1155.AccountId.t.
