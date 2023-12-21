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

Module  Impl_core_default_Default_for_trait_erc20_Mapping_t_K_V.
Section Impl_core_default_Default_for_trait_erc20_Mapping_t_K_V.
  Context {K V : Set}.
  
  Context
    {ℋ_0 : core.default.Default.Trait K}
    {ℋ_1 : core.default.Default.Trait V}.
  
  Definition Self : Set := trait_erc20.Mapping.t K V.
  
  (*
  Default
  *)
  Definition default : M (trait_erc20.Mapping.t K V) :=
    let* α0 : core.marker.PhantomData.t K :=
      M.call
        (core.default.Default.default
          (Self := core.marker.PhantomData.t K)
          (Trait := ltac:(refine _))) in
    let* α1 : core.marker.PhantomData.t V :=
      M.call
        (core.default.Default.default
          (Self := core.marker.PhantomData.t V)
          (Trait := ltac:(refine _))) in
    M.pure
      {| trait_erc20.Mapping._key := α0; trait_erc20.Mapping._value := α1; |}.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_trait_erc20_Mapping_t_K_V.
End Impl_core_default_Default_for_trait_erc20_Mapping_t_K_V.

Module  Impl_trait_erc20_Mapping_t_K_V.
Section Impl_trait_erc20_Mapping_t_K_V.
  Context {K V : Set}.
  
  Definition Self : Set := trait_erc20.Mapping.t K V.
  
  (*
      fn get(&self, _key: &K) -> Option<V> {
          unimplemented!()
      }
  *)
  Definition get
      (self : ref Self)
      (_key : ref K)
      : M (core.option.Option.t V) :=
    let* self := M.alloc self in
    let* _key := M.alloc _key in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
  
  (*
      fn insert(&mut self, _key: K, _value: V) {
          unimplemented!()
      }
  *)
  Definition insert (self : mut_ref Self) (_key : K) (_value : V) : M unit :=
    let* self := M.alloc self in
    let* _key := M.alloc _key in
    let* _value := M.alloc _value in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_insert :
    Notations.DoubleColon Self "insert" := {
    Notations.double_colon := insert;
  }.
End Impl_trait_erc20_Mapping_t_K_V.
End Impl_trait_erc20_Mapping_t_K_V.

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

Module  Impl_core_default_Default_for_trait_erc20_AccountId_t.
Section Impl_core_default_Default_for_trait_erc20_AccountId_t.
  Definition Self : Set := trait_erc20.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M trait_erc20.AccountId.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    M.pure (trait_erc20.AccountId.Build_t α0).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_trait_erc20_AccountId_t.
End Impl_core_default_Default_for_trait_erc20_AccountId_t.

Module  Impl_core_clone_Clone_for_trait_erc20_AccountId_t.
Section Impl_core_clone_Clone_for_trait_erc20_AccountId_t.
  Definition Self : Set := trait_erc20.AccountId.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref Self) : M trait_erc20.AccountId.t :=
    let* self := M.alloc self in
    let _ : unit := tt in
    let* α0 : ref trait_erc20.AccountId.t := M.read self in
    M.read (deref α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_trait_erc20_AccountId_t.
End Impl_core_clone_Clone_for_trait_erc20_AccountId_t.

Module  Impl_core_marker_Copy_for_trait_erc20_AccountId_t.
Section Impl_core_marker_Copy_for_trait_erc20_AccountId_t.
  Definition Self : Set := trait_erc20.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_trait_erc20_AccountId_t.
End Impl_core_marker_Copy_for_trait_erc20_AccountId_t.

Ltac Balance := exact u128.t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : trait_erc20.AccountId.t;
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

Module Error.
  Inductive t : Set :=
  | InsufficientBalance
  | InsufficientAllowance.
End Error.

Module  Impl_core_fmt_Debug_for_trait_erc20_Error_t.
Section Impl_core_fmt_Debug_for_trait_erc20_Error_t.
  Definition Self : Set := trait_erc20.Error.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref trait_erc20.Error.t := M.read self in
    let* α2 : M.Val (ref str.t) :=
      match α1 with
      | trait_erc20.Error.InsufficientBalance  =>
        let* α0 : ref str.t := M.read (mk_str "InsufficientBalance") in
        M.alloc α0
      | trait_erc20.Error.InsufficientAllowance  =>
        let* α0 : ref str.t := M.read (mk_str "InsufficientAllowance") in
        M.alloc α0
      end in
    let* α3 : ref str.t := M.read α2 in
    M.call (core.fmt.Formatter.t::["write_str"] α0 α3).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_trait_erc20_Error_t.
End Impl_core_fmt_Debug_for_trait_erc20_Error_t.

Module  Impl_core_marker_StructuralPartialEq_for_trait_erc20_Error_t.
Section Impl_core_marker_StructuralPartialEq_for_trait_erc20_Error_t.
  Definition Self : Set := trait_erc20.Error.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_trait_erc20_Error_t.
End Impl_core_marker_StructuralPartialEq_for_trait_erc20_Error_t.

Module  Impl_core_cmp_PartialEq_for_trait_erc20_Error_t.
Section Impl_core_cmp_PartialEq_for_trait_erc20_Error_t.
  Definition Self : Set := trait_erc20.Error.t.
  
  (*
  PartialEq
  *)
  Definition eq
      (self : ref Self)
      (other : ref trait_erc20.Error.t)
      : M bool.t :=
    let* self := M.alloc self in
    let* other := M.alloc other in
    let* __self_tag : M.Val isize.t :=
      let* α0 : ref trait_erc20.Error.t := M.read self in
      let* α1 : isize.t := M.call (core.intrinsics.discriminant_value α0) in
      M.alloc α1 in
    let* __arg1_tag : M.Val isize.t :=
      let* α0 : ref trait_erc20.Error.t := M.read other in
      let* α1 : isize.t := M.call (core.intrinsics.discriminant_value α0) in
      M.alloc α1 in
    let* α0 : isize.t := M.read __self_tag in
    let* α1 : isize.t := M.read __arg1_tag in
    let* α0 : M.Val bool.t := M.alloc (BinOp.Pure.eq α0 α1) in
    M.read α0.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_trait_erc20_Error_t.
End Impl_core_cmp_PartialEq_for_trait_erc20_Error_t.

Module  Impl_core_marker_StructuralEq_for_trait_erc20_Error_t.
Section Impl_core_marker_StructuralEq_for_trait_erc20_Error_t.
  Definition Self : Set := trait_erc20.Error.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_trait_erc20_Error_t.
End Impl_core_marker_StructuralEq_for_trait_erc20_Error_t.

Module  Impl_core_cmp_Eq_for_trait_erc20_Error_t.
Section Impl_core_cmp_Eq_for_trait_erc20_Error_t.
  Definition Self : Set := trait_erc20.Error.t.
  
  (*
  Eq
  *)
  Definition assert_receiver_is_total_eq (self : ref Self) : M unit :=
    let* self := M.alloc self in
    M.pure tt.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_trait_erc20_Error_t.
End Impl_core_cmp_Eq_for_trait_erc20_Error_t.

Ltac Result T := exact (core.result.Result.t T trait_erc20.Error.t).

Module  BaseErc20.
Section BaseErc20.
  Class Trait (Self : Set) : Type := {
    total_supply : (ref Self) -> M ltac:(trait_erc20.Balance);
    balance_of :
      (ref Self) -> trait_erc20.AccountId.t -> M ltac:(trait_erc20.Balance);
    allowance :
      (ref Self) ->
        trait_erc20.AccountId.t ->
        trait_erc20.AccountId.t ->
        M ltac:(trait_erc20.Balance);
    transfer :
      (mut_ref Self) ->
        trait_erc20.AccountId.t ->
        ltac:(trait_erc20.Balance) ->
        M ltac:(trait_erc20.Result unit);
    approve :
      (mut_ref Self) ->
        trait_erc20.AccountId.t ->
        ltac:(trait_erc20.Balance) ->
        M ltac:(trait_erc20.Result unit);
    transfer_from :
      (mut_ref Self) ->
        trait_erc20.AccountId.t ->
        trait_erc20.AccountId.t ->
        ltac:(trait_erc20.Balance) ->
        M ltac:(trait_erc20.Result unit);
  }.
  
End BaseErc20.
End BaseErc20.

Module  Erc20.
Section Erc20.
  Record t : Set := {
    total_supply : ltac:(trait_erc20.Balance);
    balances :
      trait_erc20.Mapping.t trait_erc20.AccountId.t ltac:(trait_erc20.Balance);
    allowances :
      trait_erc20.Mapping.t
        (trait_erc20.AccountId.t * trait_erc20.AccountId.t)
        ltac:(trait_erc20.Balance);
  }.
  
  Global Instance Get_total_supply : Notations.Dot "total_supply" := {
    Notations.dot :=
      Ref.map
        (fun x => x.(total_supply))
        (fun v x => x <| total_supply := v |>);
  }.
  Global Instance Get_AF_total_supply :
    Notations.DoubleColon t "total_supply" := {
    Notations.double_colon (x : M.Val t) := x.["total_supply"];
  }.
  Global Instance Get_balances : Notations.Dot "balances" := {
    Notations.dot :=
      Ref.map (fun x => x.(balances)) (fun v x => x <| balances := v |>);
  }.
  Global Instance Get_AF_balances : Notations.DoubleColon t "balances" := {
    Notations.double_colon (x : M.Val t) := x.["balances"];
  }.
  Global Instance Get_allowances : Notations.Dot "allowances" := {
    Notations.dot :=
      Ref.map (fun x => x.(allowances)) (fun v x => x <| allowances := v |>);
  }.
  Global Instance Get_AF_allowances : Notations.DoubleColon t "allowances" := {
    Notations.double_colon (x : M.Val t) := x.["allowances"];
  }.
End Erc20.
End Erc20.

Module  Impl_core_default_Default_for_trait_erc20_Erc20_t.
Section Impl_core_default_Default_for_trait_erc20_Erc20_t.
  Definition Self : Set := trait_erc20.Erc20.t.
  
  (*
  Default
  *)
  Definition default : M trait_erc20.Erc20.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    let* α1 : trait_erc20.Mapping.t trait_erc20.AccountId.t u128.t :=
      M.call
        (core.default.Default.default
          (Self := trait_erc20.Mapping.t trait_erc20.AccountId.t u128.t)
          (Trait := ltac:(refine _))) in
    let* α2 :
        trait_erc20.Mapping.t
          (trait_erc20.AccountId.t * trait_erc20.AccountId.t)
          u128.t :=
      M.call
        (core.default.Default.default
          (Self :=
            trait_erc20.Mapping.t
              (trait_erc20.AccountId.t * trait_erc20.AccountId.t)
              u128.t)
          (Trait := ltac:(refine _))) in
    M.pure
      {|
        trait_erc20.Erc20.total_supply := α0;
        trait_erc20.Erc20.balances := α1;
        trait_erc20.Erc20.allowances := α2;
      |}.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_trait_erc20_Erc20_t.
End Impl_core_default_Default_for_trait_erc20_Erc20_t.

Module  Transfer.
Section Transfer.
  Record t : Set := {
    from : core.option.Option.t trait_erc20.AccountId.t;
    to : core.option.Option.t trait_erc20.AccountId.t;
    value : ltac:(trait_erc20.Balance);
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
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End Transfer.
End Transfer.

Module  Approval.
Section Approval.
  Record t : Set := {
    owner : trait_erc20.AccountId.t;
    spender : trait_erc20.AccountId.t;
    value : ltac:(trait_erc20.Balance);
  }.
  
  Global Instance Get_owner : Notations.Dot "owner" := {
    Notations.dot :=
      Ref.map (fun x => x.(owner)) (fun v x => x <| owner := v |>);
  }.
  Global Instance Get_AF_owner : Notations.DoubleColon t "owner" := {
    Notations.double_colon (x : M.Val t) := x.["owner"];
  }.
  Global Instance Get_spender : Notations.Dot "spender" := {
    Notations.dot :=
      Ref.map (fun x => x.(spender)) (fun v x => x <| spender := v |>);
  }.
  Global Instance Get_AF_spender : Notations.DoubleColon t "spender" := {
    Notations.double_colon (x : M.Val t) := x.["spender"];
  }.
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End Approval.
End Approval.

Module Event.
  Inductive t : Set :=
  | Transfer (_ : trait_erc20.Transfer.t)
  | Approval (_ : trait_erc20.Approval.t).
End Event.

Module  Impl_trait_erc20_Env_t.
Section Impl_trait_erc20_Env_t.
  Definition Self : Set := trait_erc20.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (self : ref Self) : M trait_erc20.AccountId.t :=
    let* self := M.alloc self in
    let* α0 : ref trait_erc20.Env.t := M.read self in
    M.read (deref α0).["caller"].
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon Self "caller" := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Definition emit_event
      (self : ref Self)
      (_event : trait_erc20.Event.t)
      : M unit :=
    let* self := M.alloc self in
    let* _event := M.alloc _event in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_emit_event :
    Notations.DoubleColon Self "emit_event" := {
    Notations.double_colon := emit_event;
  }.
End Impl_trait_erc20_Env_t.
End Impl_trait_erc20_Env_t.

Module  Impl_trait_erc20_Erc20_t.
Section Impl_trait_erc20_Erc20_t.
  Definition Self : Set := trait_erc20.Erc20.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env : M trait_erc20.Env.t :=
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon Self "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (self : ref Self) : M trait_erc20.Env.t :=
    let* self := M.alloc self in
    M.call trait_erc20.Erc20.t::["init_env"].
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new(total_supply: Balance) -> Self {
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
  Definition new (total_supply : ltac:(trait_erc20.Balance)) : M Self :=
    let* total_supply := M.alloc total_supply in
    let* balances :
        M.Val (trait_erc20.Mapping.t trait_erc20.AccountId.t u128.t) :=
      let* α0 : trait_erc20.Mapping.t trait_erc20.AccountId.t u128.t :=
        M.call
          (core.default.Default.default
            (Self := trait_erc20.Mapping.t trait_erc20.AccountId.t u128.t)
            (Trait := ltac:(refine _))) in
      M.alloc α0 in
    let* caller : M.Val trait_erc20.AccountId.t :=
      let* α0 : trait_erc20.Env.t := M.call trait_erc20.Erc20.t::["init_env"] in
      let* α1 : M.Val trait_erc20.Env.t := M.alloc α0 in
      let* α2 : trait_erc20.AccountId.t :=
        M.call (trait_erc20.Env.t::["caller"] (borrow α1)) in
      M.alloc α2 in
    let* _ : M.Val unit :=
      let* α0 : trait_erc20.AccountId.t := M.read caller in
      let* α1 : u128.t := M.read total_supply in
      let* α2 : unit :=
        M.call
          ((trait_erc20.Mapping.t trait_erc20.AccountId.t u128.t)::["insert"]
            (borrow_mut balances)
            α0
            α1) in
      M.alloc α2 in
    let* _ : M.Val unit :=
      let* α0 : trait_erc20.Env.t := M.call trait_erc20.Erc20.t::["init_env"] in
      let* α1 : M.Val trait_erc20.Env.t := M.alloc α0 in
      let* α2 : trait_erc20.AccountId.t := M.read caller in
      let* α3 : u128.t := M.read total_supply in
      let* α4 : unit :=
        M.call
          (trait_erc20.Env.t::["emit_event"]
            (borrow α1)
            (trait_erc20.Event.Transfer
              {|
                trait_erc20.Transfer.from := core.option.Option.None;
                trait_erc20.Transfer.to := core.option.Option.Some α2;
                trait_erc20.Transfer.value := α3;
              |})) in
      M.alloc α4 in
    let* α0 : u128.t := M.read total_supply in
    let* α1 : trait_erc20.Mapping.t trait_erc20.AccountId.t u128.t :=
      M.read balances in
    let* α2 :
        trait_erc20.Mapping.t
          (trait_erc20.AccountId.t * trait_erc20.AccountId.t)
          u128.t :=
      M.call
        (core.default.Default.default
          (Self :=
            trait_erc20.Mapping.t
              (trait_erc20.AccountId.t * trait_erc20.AccountId.t)
              u128.t)
          (Trait := ltac:(refine _))) in
    let* α0 : M.Val trait_erc20.Erc20.t :=
      M.alloc
        {|
          trait_erc20.Erc20.total_supply := α0;
          trait_erc20.Erc20.balances := α1;
          trait_erc20.Erc20.allowances := α2;
        |} in
    M.read α0.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      fn balance_of_impl(&self, owner: &AccountId) -> Balance {
          self.balances.get(owner).unwrap_or_default()
      }
  *)
  Definition balance_of_impl
      (self : ref Self)
      (owner : ref trait_erc20.AccountId.t)
      : M ltac:(trait_erc20.Balance) :=
    let* self := M.alloc self in
    let* owner := M.alloc owner in
    let* α0 : ref trait_erc20.Erc20.t := M.read self in
    let* α1 : ref trait_erc20.AccountId.t := M.read owner in
    let* α2 : core.option.Option.t u128.t :=
      M.call
        ((trait_erc20.Mapping.t trait_erc20.AccountId.t u128.t)::["get"]
          (borrow (deref α0).["balances"])
          α1) in
    M.call ((core.option.Option.t u128.t)::["unwrap_or_default"] α2).
  
  Global Instance AssociatedFunction_balance_of_impl :
    Notations.DoubleColon Self "balance_of_impl" := {
    Notations.double_colon := balance_of_impl;
  }.
  
  (*
      fn allowance_impl(&self, owner: &AccountId, spender: &AccountId) -> Balance {
          self.allowances.get(&( *owner, *spender)).unwrap_or_default()
      }
  *)
  Definition allowance_impl
      (self : ref Self)
      (owner : ref trait_erc20.AccountId.t)
      (spender : ref trait_erc20.AccountId.t)
      : M ltac:(trait_erc20.Balance) :=
    let* self := M.alloc self in
    let* owner := M.alloc owner in
    let* spender := M.alloc spender in
    let* α0 : ref trait_erc20.Erc20.t := M.read self in
    let* α1 : ref trait_erc20.AccountId.t := M.read owner in
    let* α2 : trait_erc20.AccountId.t := M.read (deref α1) in
    let* α3 : ref trait_erc20.AccountId.t := M.read spender in
    let* α4 : trait_erc20.AccountId.t := M.read (deref α3) in
    let* α5 : M.Val (trait_erc20.AccountId.t * trait_erc20.AccountId.t) :=
      M.alloc (α2, α4) in
    let* α6 : core.option.Option.t u128.t :=
      M.call
        ((trait_erc20.Mapping.t
              (trait_erc20.AccountId.t * trait_erc20.AccountId.t)
              u128.t)::["get"]
          (borrow (deref α0).["allowances"])
          (borrow α5)) in
    M.call ((core.option.Option.t u128.t)::["unwrap_or_default"] α6).
  
  Global Instance AssociatedFunction_allowance_impl :
    Notations.DoubleColon Self "allowance_impl" := {
    Notations.double_colon := allowance_impl;
  }.
  
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
  Definition transfer_from_to
      (self : mut_ref Self)
      (from : ref trait_erc20.AccountId.t)
      (to : ref trait_erc20.AccountId.t)
      (value : ltac:(trait_erc20.Balance))
      : M ltac:(trait_erc20.Result unit) :=
    let* self := M.alloc self in
    let* from := M.alloc from in
    let* to := M.alloc to in
    let* value := M.alloc value in
    let return_ := M.return_ (R := ltac:(trait_erc20.Result unit)) in
    M.catch_return
      (let* from_balance : M.Val u128.t :=
        let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
        let* α1 : ref trait_erc20.AccountId.t := M.read from in
        let* α2 : u128.t :=
          M.call
            (trait_erc20.Erc20.t::["balance_of_impl"] (borrow (deref α0)) α1) in
        M.alloc α2 in
      let* _ : M.Val unit :=
        let* α0 : u128.t := M.read from_balance in
        let* α1 : u128.t := M.read value in
        let* α2 : M.Val bool.t := M.alloc (BinOp.Pure.lt α0 α1) in
        let* α3 : bool.t := M.read (use α2) in
        if α3 then
          let* _ : M.Val never.t :=
            return_
              (core.result.Result.Err trait_erc20.Error.InsufficientBalance) in
          let* α0 : M.Val unit := M.alloc tt in
          let* α1 := M.read α0 in
          let* α2 : unit := never_to_any α1 in
          M.alloc α2
        else
          M.alloc tt in
      let* _ : M.Val unit :=
        let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
        let* α1 : ref trait_erc20.AccountId.t := M.read from in
        let* α2 : trait_erc20.AccountId.t := M.read (deref α1) in
        let* α3 : u128.t := M.read from_balance in
        let* α4 : u128.t := M.read value in
        let* α5 : u128.t := BinOp.Panic.sub α3 α4 in
        let* α6 : unit :=
          M.call
            ((trait_erc20.Mapping.t trait_erc20.AccountId.t u128.t)::["insert"]
              (borrow_mut (deref α0).["balances"])
              α2
              α5) in
        M.alloc α6 in
      let* to_balance : M.Val u128.t :=
        let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
        let* α1 : ref trait_erc20.AccountId.t := M.read to in
        let* α2 : u128.t :=
          M.call
            (trait_erc20.Erc20.t::["balance_of_impl"] (borrow (deref α0)) α1) in
        M.alloc α2 in
      let* _ : M.Val unit :=
        let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
        let* α1 : ref trait_erc20.AccountId.t := M.read to in
        let* α2 : trait_erc20.AccountId.t := M.read (deref α1) in
        let* α3 : u128.t := M.read to_balance in
        let* α4 : u128.t := M.read value in
        let* α5 : u128.t := BinOp.Panic.add α3 α4 in
        let* α6 : unit :=
          M.call
            ((trait_erc20.Mapping.t trait_erc20.AccountId.t u128.t)::["insert"]
              (borrow_mut (deref α0).["balances"])
              α2
              α5) in
        M.alloc α6 in
      let* _ : M.Val unit :=
        let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
        let* α1 : trait_erc20.Env.t :=
          M.call (trait_erc20.Erc20.t::["env"] (borrow (deref α0))) in
        let* α2 : M.Val trait_erc20.Env.t := M.alloc α1 in
        let* α3 : ref trait_erc20.AccountId.t := M.read from in
        let* α4 : trait_erc20.AccountId.t := M.read (deref α3) in
        let* α5 : ref trait_erc20.AccountId.t := M.read to in
        let* α6 : trait_erc20.AccountId.t := M.read (deref α5) in
        let* α7 : u128.t := M.read value in
        let* α8 : unit :=
          M.call
            (trait_erc20.Env.t::["emit_event"]
              (borrow α2)
              (trait_erc20.Event.Transfer
                {|
                  trait_erc20.Transfer.from := core.option.Option.Some α4;
                  trait_erc20.Transfer.to := core.option.Option.Some α6;
                  trait_erc20.Transfer.value := α7;
                |})) in
        M.alloc α8 in
      let* α0 : M.Val (core.result.Result.t unit trait_erc20.Error.t) :=
        M.alloc (core.result.Result.Ok tt) in
      M.read α0).
  
  Global Instance AssociatedFunction_transfer_from_to :
    Notations.DoubleColon Self "transfer_from_to" := {
    Notations.double_colon := transfer_from_to;
  }.
End Impl_trait_erc20_Erc20_t.
End Impl_trait_erc20_Erc20_t.

Module  Impl_trait_erc20_BaseErc20_for_trait_erc20_Erc20_t.
Section Impl_trait_erc20_BaseErc20_for_trait_erc20_Erc20_t.
  Definition Self : Set := trait_erc20.Erc20.t.
  
  (*
      fn total_supply(&self) -> Balance {
          self.total_supply
      }
  *)
  Definition total_supply (self : ref Self) : M ltac:(trait_erc20.Balance) :=
    let* self := M.alloc self in
    let* α0 : ref trait_erc20.Erc20.t := M.read self in
    M.read (deref α0).["total_supply"].
  
  Global Instance AssociatedFunction_total_supply :
    Notations.DoubleColon Self "total_supply" := {
    Notations.double_colon := total_supply;
  }.
  
  (*
      fn balance_of(&self, owner: AccountId) -> Balance {
          self.balance_of_impl(&owner)
      }
  *)
  Definition balance_of
      (self : ref Self)
      (owner : trait_erc20.AccountId.t)
      : M ltac:(trait_erc20.Balance) :=
    let* self := M.alloc self in
    let* owner := M.alloc owner in
    let* α0 : ref trait_erc20.Erc20.t := M.read self in
    M.call (trait_erc20.Erc20.t::["balance_of_impl"] α0 (borrow owner)).
  
  Global Instance AssociatedFunction_balance_of :
    Notations.DoubleColon Self "balance_of" := {
    Notations.double_colon := balance_of;
  }.
  
  (*
      fn allowance(&self, owner: AccountId, spender: AccountId) -> Balance {
          self.allowance_impl(&owner, &spender)
      }
  *)
  Definition allowance
      (self : ref Self)
      (owner : trait_erc20.AccountId.t)
      (spender : trait_erc20.AccountId.t)
      : M ltac:(trait_erc20.Balance) :=
    let* self := M.alloc self in
    let* owner := M.alloc owner in
    let* spender := M.alloc spender in
    let* α0 : ref trait_erc20.Erc20.t := M.read self in
    M.call
      (trait_erc20.Erc20.t::["allowance_impl"]
        α0
        (borrow owner)
        (borrow spender)).
  
  Global Instance AssociatedFunction_allowance :
    Notations.DoubleColon Self "allowance" := {
    Notations.double_colon := allowance;
  }.
  
  (*
      fn transfer(&mut self, to: AccountId, value: Balance) -> Result<()> {
          let from = self.env().caller();
          self.transfer_from_to(&from, &to, value)
      }
  *)
  Definition transfer
      (self : mut_ref Self)
      (to : trait_erc20.AccountId.t)
      (value : ltac:(trait_erc20.Balance))
      : M ltac:(trait_erc20.Result unit) :=
    let* self := M.alloc self in
    let* to := M.alloc to in
    let* value := M.alloc value in
    let* from : M.Val trait_erc20.AccountId.t :=
      let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
      let* α1 : trait_erc20.Env.t :=
        M.call (trait_erc20.Erc20.t::["env"] (borrow (deref α0))) in
      let* α2 : M.Val trait_erc20.Env.t := M.alloc α1 in
      let* α3 : trait_erc20.AccountId.t :=
        M.call (trait_erc20.Env.t::["caller"] (borrow α2)) in
      M.alloc α3 in
    let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
    let* α1 : u128.t := M.read value in
    let* α2 : core.result.Result.t unit trait_erc20.Error.t :=
      M.call
        (trait_erc20.Erc20.t::["transfer_from_to"]
          α0
          (borrow from)
          (borrow to)
          α1) in
    let* α0 : M.Val (core.result.Result.t unit trait_erc20.Error.t) :=
      M.alloc α2 in
    M.read α0.
  
  Global Instance AssociatedFunction_transfer :
    Notations.DoubleColon Self "transfer" := {
    Notations.double_colon := transfer;
  }.
  
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
  Definition approve
      (self : mut_ref Self)
      (spender : trait_erc20.AccountId.t)
      (value : ltac:(trait_erc20.Balance))
      : M ltac:(trait_erc20.Result unit) :=
    let* self := M.alloc self in
    let* spender := M.alloc spender in
    let* value := M.alloc value in
    let* owner : M.Val trait_erc20.AccountId.t :=
      let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
      let* α1 : trait_erc20.Env.t :=
        M.call (trait_erc20.Erc20.t::["env"] (borrow (deref α0))) in
      let* α2 : M.Val trait_erc20.Env.t := M.alloc α1 in
      let* α3 : trait_erc20.AccountId.t :=
        M.call (trait_erc20.Env.t::["caller"] (borrow α2)) in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
      let* α1 : trait_erc20.AccountId.t := M.read owner in
      let* α2 : trait_erc20.AccountId.t := M.read spender in
      let* α3 : u128.t := M.read value in
      let* α4 : unit :=
        M.call
          ((trait_erc20.Mapping.t
                (trait_erc20.AccountId.t * trait_erc20.AccountId.t)
                u128.t)::["insert"]
            (borrow_mut (deref α0).["allowances"])
            (α1, α2)
            α3) in
      M.alloc α4 in
    let* _ : M.Val unit :=
      let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
      let* α1 : trait_erc20.Env.t :=
        M.call (trait_erc20.Erc20.t::["env"] (borrow (deref α0))) in
      let* α2 : M.Val trait_erc20.Env.t := M.alloc α1 in
      let* α3 : trait_erc20.AccountId.t := M.read owner in
      let* α4 : trait_erc20.AccountId.t := M.read spender in
      let* α5 : u128.t := M.read value in
      let* α6 : unit :=
        M.call
          (trait_erc20.Env.t::["emit_event"]
            (borrow α2)
            (trait_erc20.Event.Approval
              {|
                trait_erc20.Approval.owner := α3;
                trait_erc20.Approval.spender := α4;
                trait_erc20.Approval.value := α5;
              |})) in
      M.alloc α6 in
    let* α0 : M.Val (core.result.Result.t unit trait_erc20.Error.t) :=
      M.alloc (core.result.Result.Ok tt) in
    M.read α0.
  
  Global Instance AssociatedFunction_approve :
    Notations.DoubleColon Self "approve" := {
    Notations.double_colon := approve;
  }.
  
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
  Definition transfer_from
      (self : mut_ref Self)
      (from : trait_erc20.AccountId.t)
      (to : trait_erc20.AccountId.t)
      (value : ltac:(trait_erc20.Balance))
      : M ltac:(trait_erc20.Result unit) :=
    let* self := M.alloc self in
    let* from := M.alloc from in
    let* to := M.alloc to in
    let* value := M.alloc value in
    let return_ := M.return_ (R := ltac:(trait_erc20.Result unit)) in
    M.catch_return
      (let* caller : M.Val trait_erc20.AccountId.t :=
        let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
        let* α1 : trait_erc20.Env.t :=
          M.call (trait_erc20.Erc20.t::["env"] (borrow (deref α0))) in
        let* α2 : M.Val trait_erc20.Env.t := M.alloc α1 in
        let* α3 : trait_erc20.AccountId.t :=
          M.call (trait_erc20.Env.t::["caller"] (borrow α2)) in
        M.alloc α3 in
      let* allowance : M.Val u128.t :=
        let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
        let* α1 : u128.t :=
          M.call
            (trait_erc20.Erc20.t::["allowance_impl"]
              (borrow (deref α0))
              (borrow from)
              (borrow caller)) in
        M.alloc α1 in
      let* _ : M.Val unit :=
        let* α0 : u128.t := M.read allowance in
        let* α1 : u128.t := M.read value in
        let* α2 : M.Val bool.t := M.alloc (BinOp.Pure.lt α0 α1) in
        let* α3 : bool.t := M.read (use α2) in
        if α3 then
          let* _ : M.Val never.t :=
            return_
              (core.result.Result.Err
                trait_erc20.Error.InsufficientAllowance) in
          let* α0 : M.Val unit := M.alloc tt in
          let* α1 := M.read α0 in
          let* α2 : unit := never_to_any α1 in
          M.alloc α2
        else
          M.alloc tt in
      let* _ : M.Val unit :=
        let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
        let* α1 : u128.t := M.read value in
        let* α2 : core.result.Result.t unit trait_erc20.Error.t :=
          M.call
            (trait_erc20.Erc20.t::["transfer_from_to"]
              α0
              (borrow from)
              (borrow to)
              α1) in
        let* α3 :
            core.ops.control_flow.ControlFlow.t
              (core.result.Result.t
                core.convert.Infallible.t
                trait_erc20.Error.t)
              unit :=
          M.call
            ((core.ops.try_trait.Try.branch
                (Self := core.result.Result.t unit trait_erc20.Error.t)
                (Trait := ltac:(refine _)))
              α2) in
        match α3 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 :
              core.result.Result.t
                core.convert.Infallible.t
                trait_erc20.Error.t :=
            M.read residual in
          let* α1 : core.result.Result.t unit trait_erc20.Error.t :=
            M.call
              ((core.ops.try_trait.FromResidual.from_residual
                  (Self := core.result.Result.t unit trait_erc20.Error.t)
                  (Trait := ltac:(refine _)))
                α0) in
          let* α2 : M.Val never.t := return_ α1 in
          let* α3 := M.read α2 in
          let* α4 : unit := never_to_any α3 in
          M.alloc α4
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      let* _ : M.Val unit :=
        let* α0 : mut_ref trait_erc20.Erc20.t := M.read self in
        let* α1 : trait_erc20.AccountId.t := M.read from in
        let* α2 : trait_erc20.AccountId.t := M.read caller in
        let* α3 : u128.t := M.read allowance in
        let* α4 : u128.t := M.read value in
        let* α5 : u128.t := BinOp.Panic.sub α3 α4 in
        let* α6 : unit :=
          M.call
            ((trait_erc20.Mapping.t
                  (trait_erc20.AccountId.t * trait_erc20.AccountId.t)
                  u128.t)::["insert"]
              (borrow_mut (deref α0).["allowances"])
              (α1, α2)
              α5) in
        M.alloc α6 in
      let* α0 : M.Val (core.result.Result.t unit trait_erc20.Error.t) :=
        M.alloc (core.result.Result.Ok tt) in
      M.read α0).
  
  Global Instance AssociatedFunction_transfer_from :
    Notations.DoubleColon Self "transfer_from" := {
    Notations.double_colon := transfer_from;
  }.
  
  Global Instance ℐ : trait_erc20.BaseErc20.Trait Self := {
    trait_erc20.BaseErc20.total_supply := total_supply;
    trait_erc20.BaseErc20.balance_of := balance_of;
    trait_erc20.BaseErc20.allowance := allowance;
    trait_erc20.BaseErc20.transfer := transfer;
    trait_erc20.BaseErc20.approve := approve;
    trait_erc20.BaseErc20.transfer_from := transfer_from;
  }.
End Impl_trait_erc20_BaseErc20_for_trait_erc20_Erc20_t.
End Impl_trait_erc20_BaseErc20_for_trait_erc20_Erc20_t.
