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

Module  Impl_core_default_Default_for_dns_Mapping_t_K_V.
Section Impl_core_default_Default_for_dns_Mapping_t_K_V.
  Context {K V : Set}.
  
  Context
    {ℋ_0 : core.default.Default.Trait K}
    {ℋ_1 : core.default.Default.Trait V}.
  
  Definition Self : Set := dns.Mapping.t K V.
  
  (*
  Default
  *)
  Definition default : M (dns.Mapping.t K V) :=
    let* α0 : _ :=
      ltac:(M.get_method (fun ℐ =>
        core.default.Default.default
          (Self := core.marker.PhantomData.t K)
          (Trait := ℐ))) in
    let* α1 : core.marker.PhantomData.t K := M.call α0 in
    let* α2 : _ :=
      ltac:(M.get_method (fun ℐ =>
        core.default.Default.default
          (Self := core.marker.PhantomData.t V)
          (Trait := ℐ))) in
    let* α3 : core.marker.PhantomData.t V := M.call α2 in
    M.pure {| dns.Mapping._key := α1; dns.Mapping._value := α3; |}.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_dns_Mapping_t_K_V.
End Impl_core_default_Default_for_dns_Mapping_t_K_V.

Module  Impl_dns_Mapping_t_K_V.
Section Impl_dns_Mapping_t_K_V.
  Context {K V : Set}.
  
  Definition Self : Set := dns.Mapping.t K V.
  
  (*
      fn contains(&self, _key: &K) -> bool {
          unimplemented!()
      }
  *)
  Definition contains (self : ref Self) (_key : ref K) : M bool.t :=
    let* self := M.alloc self in
    let* _key := M.alloc _key in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_contains :
    Notations.DoubleColon Self "contains" := {
    Notations.double_colon := contains;
  }.
  
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
      fn insert(&mut self, _key: K, _value: V) -> Option<u32> {
          unimplemented!()
      }
  *)
  Definition insert
      (self : mut_ref Self)
      (_key : K)
      (_value : V)
      : M (core.option.Option.t u32.t) :=
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
  
  (*
      fn new() -> Mapping<K, V> {
          unimplemented!()
      }
  *)
  Definition new : M (dns.Mapping.t K V) :=
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      fn remove(&self, _key: K) {
          unimplemented!()
      }
  *)
  Definition remove (self : ref Self) (_key : K) : M unit :=
    let* self := M.alloc self in
    let* _key := M.alloc _key in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_remove :
    Notations.DoubleColon Self "remove" := {
    Notations.double_colon := remove;
  }.
  
  (*
      fn size(&self, _key: K) -> Option<u32> {
          unimplemented!()
      }
  *)
  Definition size
      (self : ref Self)
      (_key : K)
      : M (core.option.Option.t u32.t) :=
    let* self := M.alloc self in
    let* _key := M.alloc _key in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_size :
    Notations.DoubleColon Self "size" := {
    Notations.double_colon := size;
  }.
  
  (*
      fn take(&self, _key: K) -> Option<V> {
          unimplemented!()
      }
  *)
  Definition take (self : ref Self) (_key : K) : M (core.option.Option.t V) :=
    let* self := M.alloc self in
    let* _key := M.alloc _key in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_take :
    Notations.DoubleColon Self "take" := {
    Notations.double_colon := take;
  }.
End Impl_dns_Mapping_t_K_V.
End Impl_dns_Mapping_t_K_V.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_dns_AccountId_t.
Section Impl_core_default_Default_for_dns_AccountId_t.
  Definition Self : Set := dns.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M dns.AccountId.t :=
    let* α0 : _ :=
      ltac:(M.get_method (fun ℐ =>
        core.default.Default.default (Self := u128.t) (Trait := ℐ))) in
    let* α1 : u128.t := M.call α0 in
    M.pure (dns.AccountId.Build_t α1).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_dns_AccountId_t.
End Impl_core_default_Default_for_dns_AccountId_t.

Module  Impl_core_clone_Clone_for_dns_AccountId_t.
Section Impl_core_clone_Clone_for_dns_AccountId_t.
  Definition Self : Set := dns.AccountId.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref Self) : M dns.AccountId.t :=
    let* self := M.alloc self in
    let* α0 : M.Val dns.AccountId.t :=
      match_operator
        (DeclaredButUndefinedVariable
          (A := core.clone.AssertParamIsClone.t u128.t))
        [
          fun γ =>
            (let* α0 : ref dns.AccountId.t := M.read self in
            M.pure (deref α0)) :
            M (M.Val dns.AccountId.t)
        ] in
    M.read α0.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_dns_AccountId_t.
End Impl_core_clone_Clone_for_dns_AccountId_t.

Module  Impl_core_marker_Copy_for_dns_AccountId_t.
Section Impl_core_marker_Copy_for_dns_AccountId_t.
  Definition Self : Set := dns.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_dns_AccountId_t.
End Impl_core_marker_Copy_for_dns_AccountId_t.

Module  Impl_core_marker_StructuralPartialEq_for_dns_AccountId_t.
Section Impl_core_marker_StructuralPartialEq_for_dns_AccountId_t.
  Definition Self : Set := dns.AccountId.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_dns_AccountId_t.
End Impl_core_marker_StructuralPartialEq_for_dns_AccountId_t.

Module  Impl_core_cmp_PartialEq_for_dns_AccountId_t.
Section Impl_core_cmp_PartialEq_for_dns_AccountId_t.
  Definition Self : Set := dns.AccountId.t.
  
  (*
  PartialEq
  *)
  Definition eq (self : ref Self) (other : ref dns.AccountId.t) : M bool.t :=
    let* self := M.alloc self in
    let* other := M.alloc other in
    let* α0 : ref dns.AccountId.t := M.read self in
    let* α1 : u128.t := M.read (dns.AccountId.Get_0 (deref α0)) in
    let* α2 : ref dns.AccountId.t := M.read other in
    let* α3 : u128.t := M.read (dns.AccountId.Get_0 (deref α2)) in
    M.pure (BinOp.Pure.eq α1 α3).
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_dns_AccountId_t.
End Impl_core_cmp_PartialEq_for_dns_AccountId_t.

Module  Impl_core_convert_From_array_u8_t_for_dns_AccountId_t.
Section Impl_core_convert_From_array_u8_t_for_dns_AccountId_t.
  Definition Self : Set := dns.AccountId.t.
  
  (*
      fn from(_value: [u8; 32]) -> Self {
          unimplemented!()
      }
  *)
  Definition from (_value : array u8.t) : M Self :=
    let* _value := M.alloc _value in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_from :
    Notations.DoubleColon Self "from" := {
    Notations.double_colon := from;
  }.
  
  Global Instance ℐ : core.convert.From.Trait Self (T := array u8.t) := {
    core.convert.From.from := from;
  }.
End Impl_core_convert_From_array_u8_t_for_dns_AccountId_t.
End Impl_core_convert_From_array_u8_t_for_dns_AccountId_t.

Ltac Balance := exact u128.t.

Ltac Hash := exact (array u8.t).

Module  Env.
Section Env.
  Record t : Set := {
    caller : dns.AccountId.t;
  }.
  
  Definition Get_caller :=
    Ref.map (fun α => Some α.(caller)) (fun β α => Some (α <| caller := β |>)).
End Env.
End Env.

Module  Register.
Section Register.
  Record t : Set := {
    name : ltac:(dns.Hash);
    from : dns.AccountId.t;
  }.
  
  Definition Get_name :=
    Ref.map (fun α => Some α.(name)) (fun β α => Some (α <| name := β |>)).
  Definition Get_from :=
    Ref.map (fun α => Some α.(from)) (fun β α => Some (α <| from := β |>)).
End Register.
End Register.

Module  SetAddress.
Section SetAddress.
  Record t : Set := {
    name : ltac:(dns.Hash);
    from : dns.AccountId.t;
    old_address : core.option.Option.t dns.AccountId.t;
    new_address : dns.AccountId.t;
  }.
  
  Definition Get_name :=
    Ref.map (fun α => Some α.(name)) (fun β α => Some (α <| name := β |>)).
  Definition Get_from :=
    Ref.map (fun α => Some α.(from)) (fun β α => Some (α <| from := β |>)).
  Definition Get_old_address :=
    Ref.map
      (fun α => Some α.(old_address))
      (fun β α => Some (α <| old_address := β |>)).
  Definition Get_new_address :=
    Ref.map
      (fun α => Some α.(new_address))
      (fun β α => Some (α <| new_address := β |>)).
End SetAddress.
End SetAddress.

Module  Transfer.
Section Transfer.
  Record t : Set := {
    name : ltac:(dns.Hash);
    from : dns.AccountId.t;
    old_owner : core.option.Option.t dns.AccountId.t;
    new_owner : dns.AccountId.t;
  }.
  
  Definition Get_name :=
    Ref.map (fun α => Some α.(name)) (fun β α => Some (α <| name := β |>)).
  Definition Get_from :=
    Ref.map (fun α => Some α.(from)) (fun β α => Some (α <| from := β |>)).
  Definition Get_old_owner :=
    Ref.map
      (fun α => Some α.(old_owner))
      (fun β α => Some (α <| old_owner := β |>)).
  Definition Get_new_owner :=
    Ref.map
      (fun α => Some α.(new_owner))
      (fun β α => Some (α <| new_owner := β |>)).
End Transfer.
End Transfer.

Module Event.
  Inductive t : Set :=
  | Register (_ : dns.Register.t)
  | SetAddress (_ : dns.SetAddress.t)
  | Transfer (_ : dns.Transfer.t).
  
  Definition Get_Register_0 :=
    Ref.map
      (fun α => match α with | Register α0 => Some α0 | _ => None end)
      (fun β α =>
        match α with | Register _ => Some (Register β) | _ => None end).
  
  Definition Get_SetAddress_0 :=
    Ref.map
      (fun α => match α with | SetAddress α0 => Some α0 | _ => None end)
      (fun β α =>
        match α with | SetAddress _ => Some (SetAddress β) | _ => None end).
  
  Definition Get_Transfer_0 :=
    Ref.map
      (fun α => match α with | Transfer α0 => Some α0 | _ => None end)
      (fun β α =>
        match α with | Transfer _ => Some (Transfer β) | _ => None end).
End Event.

Module  Impl_dns_Env_t.
Section Impl_dns_Env_t.
  Definition Self : Set := dns.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (self : ref Self) : M dns.AccountId.t :=
    let* self := M.alloc self in
    let* α0 : ref dns.Env.t := M.read self in
    M.read (dns.Env.Get_caller (deref α0)).
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon Self "caller" := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Definition emit_event (self : ref Self) (_event : dns.Event.t) : M unit :=
    let* self := M.alloc self in
    let* _event := M.alloc _event in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_emit_event :
    Notations.DoubleColon Self "emit_event" := {
    Notations.double_colon := emit_event;
  }.
End Impl_dns_Env_t.
End Impl_dns_Env_t.

Module  DomainNameService.
Section DomainNameService.
  Record t : Set := {
    name_to_address : dns.Mapping.t ltac:(dns.Hash) dns.AccountId.t;
    name_to_owner : dns.Mapping.t ltac:(dns.Hash) dns.AccountId.t;
    default_address : dns.AccountId.t;
  }.
  
  Definition Get_name_to_address :=
    Ref.map
      (fun α => Some α.(name_to_address))
      (fun β α => Some (α <| name_to_address := β |>)).
  Definition Get_name_to_owner :=
    Ref.map
      (fun α => Some α.(name_to_owner))
      (fun β α => Some (α <| name_to_owner := β |>)).
  Definition Get_default_address :=
    Ref.map
      (fun α => Some α.(default_address))
      (fun β α => Some (α <| default_address := β |>)).
End DomainNameService.
End DomainNameService.

(*
fn zero_address() -> AccountId {
    [0u8; 32].into()
}
*)
Definition zero_address : M dns.AccountId.t :=
  let* α0 : _ :=
    ltac:(M.get_method (fun ℐ =>
      core.convert.Into.into
        (Self := array u8.t)
        (T := dns.AccountId.t)
        (Trait := ℐ))) in
  M.call (α0 (repeat ((Integer.of_Z 0) : u8.t) 32)).

Module  Impl_core_default_Default_for_dns_DomainNameService_t.
Section Impl_core_default_Default_for_dns_DomainNameService_t.
  Definition Self : Set := dns.DomainNameService.t.
  
  (*
      fn default() -> Self {
          let mut name_to_address = Mapping::new();
          name_to_address.insert(Hash::default(), zero_address());
          let mut name_to_owner = Mapping::new();
          name_to_owner.insert(Hash::default(), zero_address());
  
          Self {
              name_to_address,
              name_to_owner,
              default_address: zero_address(),
          }
      }
  *)
  Definition default : M Self :=
    let* name_to_address : M.Val (dns.Mapping.t (array u8.t) dns.AccountId.t) :=
      let* α0 : dns.Mapping.t (array u8.t) dns.AccountId.t :=
        M.call (dns.Mapping.t (array u8.t) dns.AccountId.t)::["new"] in
      M.alloc α0 in
    let* _ : M.Val (core.option.Option.t u32.t) :=
      let* α0 : _ :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default (Self := array u8.t) (Trait := ℐ))) in
      let* α1 : array u8.t := M.call α0 in
      let* α2 : dns.AccountId.t := M.call dns.zero_address in
      let* α3 : core.option.Option.t u32.t :=
        M.call
          ((dns.Mapping.t (array u8.t) dns.AccountId.t)::["insert"]
            (borrow_mut name_to_address)
            α1
            α2) in
      M.alloc α3 in
    let* name_to_owner : M.Val (dns.Mapping.t (array u8.t) dns.AccountId.t) :=
      let* α0 : dns.Mapping.t (array u8.t) dns.AccountId.t :=
        M.call (dns.Mapping.t (array u8.t) dns.AccountId.t)::["new"] in
      M.alloc α0 in
    let* _ : M.Val (core.option.Option.t u32.t) :=
      let* α0 : _ :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default (Self := array u8.t) (Trait := ℐ))) in
      let* α1 : array u8.t := M.call α0 in
      let* α2 : dns.AccountId.t := M.call dns.zero_address in
      let* α3 : core.option.Option.t u32.t :=
        M.call
          ((dns.Mapping.t (array u8.t) dns.AccountId.t)::["insert"]
            (borrow_mut name_to_owner)
            α1
            α2) in
      M.alloc α3 in
    let* α0 : dns.Mapping.t (array u8.t) dns.AccountId.t :=
      M.read name_to_address in
    let* α1 : dns.Mapping.t (array u8.t) dns.AccountId.t :=
      M.read name_to_owner in
    let* α2 : dns.AccountId.t := M.call dns.zero_address in
    let* α0 : M.Val dns.DomainNameService.t :=
      M.alloc
        {|
          dns.DomainNameService.name_to_address := α0;
          dns.DomainNameService.name_to_owner := α1;
          dns.DomainNameService.default_address := α2;
        |} in
    M.read α0.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_dns_DomainNameService_t.
End Impl_core_default_Default_for_dns_DomainNameService_t.

Module Error.
  Inductive t : Set :=
  | NameAlreadyExists
  | CallerIsNotOwner.
End Error.

Module  Impl_core_marker_StructuralPartialEq_for_dns_Error_t.
Section Impl_core_marker_StructuralPartialEq_for_dns_Error_t.
  Definition Self : Set := dns.Error.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_dns_Error_t.
End Impl_core_marker_StructuralPartialEq_for_dns_Error_t.

Module  Impl_core_cmp_PartialEq_for_dns_Error_t.
Section Impl_core_cmp_PartialEq_for_dns_Error_t.
  Definition Self : Set := dns.Error.t.
  
  (*
  PartialEq
  *)
  Definition eq (self : ref Self) (other : ref dns.Error.t) : M bool.t :=
    let* self := M.alloc self in
    let* other := M.alloc other in
    let* __self_tag : M.Val isize.t :=
      let* α0 : ref dns.Error.t := M.read self in
      let* α1 : isize.t := M.call (core.intrinsics.discriminant_value α0) in
      M.alloc α1 in
    let* __arg1_tag : M.Val isize.t :=
      let* α0 : ref dns.Error.t := M.read other in
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
End Impl_core_cmp_PartialEq_for_dns_Error_t.
End Impl_core_cmp_PartialEq_for_dns_Error_t.

Module  Impl_core_marker_StructuralEq_for_dns_Error_t.
Section Impl_core_marker_StructuralEq_for_dns_Error_t.
  Definition Self : Set := dns.Error.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_dns_Error_t.
End Impl_core_marker_StructuralEq_for_dns_Error_t.

Module  Impl_core_cmp_Eq_for_dns_Error_t.
Section Impl_core_cmp_Eq_for_dns_Error_t.
  Definition Self : Set := dns.Error.t.
  
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
End Impl_core_cmp_Eq_for_dns_Error_t.
End Impl_core_cmp_Eq_for_dns_Error_t.

Ltac Result T := exact (core.result.Result.t T dns.Error.t).

Module  Impl_dns_DomainNameService_t.
Section Impl_dns_DomainNameService_t.
  Definition Self : Set := dns.DomainNameService.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env : M dns.Env.t :=
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
  Definition env (self : ref Self) : M dns.Env.t :=
    let* self := M.alloc self in
    M.call dns.DomainNameService.t::["init_env"].
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new : M Self :=
    let* α0 : _ :=
      ltac:(M.get_method (fun ℐ =>
        core.default.Default.default
          (Self := dns.DomainNameService.t)
          (Trait := ℐ))) in
    M.call α0.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn register(&mut self, name: Hash) -> Result<()> {
          let caller = self.env().caller();
          if self.name_to_owner.contains(&name) {
              return Err(Error::NameAlreadyExists);
          }
  
          self.name_to_owner.insert(name, caller);
          self.env()
              .emit_event(Event::Register(Register { name, from: caller }));
  
          Ok(())
      }
  *)
  Definition register
      (self : mut_ref Self)
      (name : ltac:(dns.Hash))
      : M ltac:(dns.Result unit) :=
    let* self := M.alloc self in
    let* name := M.alloc name in
    let return_ := M.return_ (R := ltac:(dns.Result unit)) in
    M.catch_return
      (let* caller : M.Val dns.AccountId.t :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : dns.Env.t :=
          M.call (dns.DomainNameService.t::["env"] (borrow (deref α0))) in
        let* α2 : M.Val dns.Env.t := M.alloc α1 in
        let* α3 : dns.AccountId.t :=
          M.call (dns.Env.t::["caller"] (borrow α2)) in
        M.alloc α3 in
      let* _ : M.Val unit :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : bool.t :=
          M.call
            ((dns.Mapping.t (array u8.t) dns.AccountId.t)::["contains"]
              (borrow (dns.DomainNameService.Get_name_to_owner (deref α0)))
              (borrow name)) in
        let* α2 : M.Val bool.t := M.alloc α1 in
        let* α3 : bool.t := M.read (use α2) in
        if α3 then
          let* α0 : M.Val never.t :=
            return_ (core.result.Result.Err dns.Error.NameAlreadyExists) in
          let* α1 := M.read α0 in
          let* α2 : unit := never_to_any α1 in
          M.alloc α2
        else
          M.alloc tt in
      let* _ : M.Val (core.option.Option.t u32.t) :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : array u8.t := M.read name in
        let* α2 : dns.AccountId.t := M.read caller in
        let* α3 : core.option.Option.t u32.t :=
          M.call
            ((dns.Mapping.t (array u8.t) dns.AccountId.t)::["insert"]
              (borrow_mut (dns.DomainNameService.Get_name_to_owner (deref α0)))
              α1
              α2) in
        M.alloc α3 in
      let* _ : M.Val unit :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : dns.Env.t :=
          M.call (dns.DomainNameService.t::["env"] (borrow (deref α0))) in
        let* α2 : M.Val dns.Env.t := M.alloc α1 in
        let* α3 : array u8.t := M.read name in
        let* α4 : dns.AccountId.t := M.read caller in
        let* α5 : unit :=
          M.call
            (dns.Env.t::["emit_event"]
              (borrow α2)
              (dns.Event.Register
                {| dns.Register.name := α3; dns.Register.from := α4; |})) in
        M.alloc α5 in
      let* α0 : M.Val (core.result.Result.t unit dns.Error.t) :=
        M.alloc (core.result.Result.Ok tt) in
      M.read α0).
  
  Global Instance AssociatedFunction_register :
    Notations.DoubleColon Self "register" := {
    Notations.double_colon := register;
  }.
  
  (*
      fn get_owner_or_default(&self, name: Hash) -> AccountId {
          self.name_to_owner
              .get(&name)
              .unwrap_or(self.default_address)
      }
  *)
  Definition get_owner_or_default
      (self : ref Self)
      (name : ltac:(dns.Hash))
      : M dns.AccountId.t :=
    let* self := M.alloc self in
    let* name := M.alloc name in
    let* α0 : ref dns.DomainNameService.t := M.read self in
    let* α1 : core.option.Option.t dns.AccountId.t :=
      M.call
        ((dns.Mapping.t (array u8.t) dns.AccountId.t)::["get"]
          (borrow (dns.DomainNameService.Get_name_to_owner (deref α0)))
          (borrow name)) in
    let* α2 : ref dns.DomainNameService.t := M.read self in
    let* α3 : dns.AccountId.t :=
      M.read (dns.DomainNameService.Get_default_address (deref α2)) in
    M.call ((core.option.Option.t dns.AccountId.t)::["unwrap_or"] α1 α3).
  
  Global Instance AssociatedFunction_get_owner_or_default :
    Notations.DoubleColon Self "get_owner_or_default" := {
    Notations.double_colon := get_owner_or_default;
  }.
  
  (*
      pub fn set_address(&mut self, name: Hash, new_address: AccountId) -> Result<()> {
          let caller = self.env().caller();
          let owner = self.get_owner_or_default(name);
          if caller != owner {
              return Err(Error::CallerIsNotOwner);
          }
  
          let old_address = self.name_to_address.get(&name);
          self.name_to_address.insert(name, new_address);
  
          self.env().emit_event(Event::SetAddress(SetAddress {
              name,
              from: caller,
              old_address,
              new_address,
          }));
          Ok(())
      }
  *)
  Definition set_address
      (self : mut_ref Self)
      (name : ltac:(dns.Hash))
      (new_address : dns.AccountId.t)
      : M ltac:(dns.Result unit) :=
    let* self := M.alloc self in
    let* name := M.alloc name in
    let* new_address := M.alloc new_address in
    let return_ := M.return_ (R := ltac:(dns.Result unit)) in
    M.catch_return
      (let* caller : M.Val dns.AccountId.t :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : dns.Env.t :=
          M.call (dns.DomainNameService.t::["env"] (borrow (deref α0))) in
        let* α2 : M.Val dns.Env.t := M.alloc α1 in
        let* α3 : dns.AccountId.t :=
          M.call (dns.Env.t::["caller"] (borrow α2)) in
        M.alloc α3 in
      let* owner : M.Val dns.AccountId.t :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : array u8.t := M.read name in
        let* α2 : dns.AccountId.t :=
          M.call
            (dns.DomainNameService.t::["get_owner_or_default"]
              (borrow (deref α0))
              α1) in
        M.alloc α2 in
      let* _ : M.Val unit :=
        let* α0 : _ :=
          ltac:(M.get_method (fun ℐ =>
            core.cmp.PartialEq.ne
              (Self := dns.AccountId.t)
              (Rhs := dns.AccountId.t)
              (Trait := ℐ))) in
        let* α1 : bool.t := M.call (α0 (borrow caller) (borrow owner)) in
        let* α2 : M.Val bool.t := M.alloc α1 in
        let* α3 : bool.t := M.read (use α2) in
        if α3 then
          let* α0 : M.Val never.t :=
            return_ (core.result.Result.Err dns.Error.CallerIsNotOwner) in
          let* α1 := M.read α0 in
          let* α2 : unit := never_to_any α1 in
          M.alloc α2
        else
          M.alloc tt in
      let* old_address : M.Val (core.option.Option.t dns.AccountId.t) :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : core.option.Option.t dns.AccountId.t :=
          M.call
            ((dns.Mapping.t (array u8.t) dns.AccountId.t)::["get"]
              (borrow (dns.DomainNameService.Get_name_to_address (deref α0)))
              (borrow name)) in
        M.alloc α1 in
      let* _ : M.Val (core.option.Option.t u32.t) :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : array u8.t := M.read name in
        let* α2 : dns.AccountId.t := M.read new_address in
        let* α3 : core.option.Option.t u32.t :=
          M.call
            ((dns.Mapping.t (array u8.t) dns.AccountId.t)::["insert"]
              (borrow_mut
                (dns.DomainNameService.Get_name_to_address (deref α0)))
              α1
              α2) in
        M.alloc α3 in
      let* _ : M.Val unit :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : dns.Env.t :=
          M.call (dns.DomainNameService.t::["env"] (borrow (deref α0))) in
        let* α2 : M.Val dns.Env.t := M.alloc α1 in
        let* α3 : array u8.t := M.read name in
        let* α4 : dns.AccountId.t := M.read caller in
        let* α5 : core.option.Option.t dns.AccountId.t := M.read old_address in
        let* α6 : dns.AccountId.t := M.read new_address in
        let* α7 : unit :=
          M.call
            (dns.Env.t::["emit_event"]
              (borrow α2)
              (dns.Event.SetAddress
                {|
                  dns.SetAddress.name := α3;
                  dns.SetAddress.from := α4;
                  dns.SetAddress.old_address := α5;
                  dns.SetAddress.new_address := α6;
                |})) in
        M.alloc α7 in
      let* α0 : M.Val (core.result.Result.t unit dns.Error.t) :=
        M.alloc (core.result.Result.Ok tt) in
      M.read α0).
  
  Global Instance AssociatedFunction_set_address :
    Notations.DoubleColon Self "set_address" := {
    Notations.double_colon := set_address;
  }.
  
  (*
      pub fn transfer(&mut self, name: Hash, to: AccountId) -> Result<()> {
          let caller = self.env().caller();
          let owner = self.get_owner_or_default(name);
          if caller != owner {
              return Err(Error::CallerIsNotOwner);
          }
  
          let old_owner = self.name_to_owner.get(&name);
          self.name_to_owner.insert(name, to);
  
          self.env().emit_event(Event::Transfer(Transfer {
              name,
              from: caller,
              old_owner,
              new_owner: to,
          }));
  
          Ok(())
      }
  *)
  Definition transfer
      (self : mut_ref Self)
      (name : ltac:(dns.Hash))
      (to : dns.AccountId.t)
      : M ltac:(dns.Result unit) :=
    let* self := M.alloc self in
    let* name := M.alloc name in
    let* to := M.alloc to in
    let return_ := M.return_ (R := ltac:(dns.Result unit)) in
    M.catch_return
      (let* caller : M.Val dns.AccountId.t :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : dns.Env.t :=
          M.call (dns.DomainNameService.t::["env"] (borrow (deref α0))) in
        let* α2 : M.Val dns.Env.t := M.alloc α1 in
        let* α3 : dns.AccountId.t :=
          M.call (dns.Env.t::["caller"] (borrow α2)) in
        M.alloc α3 in
      let* owner : M.Val dns.AccountId.t :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : array u8.t := M.read name in
        let* α2 : dns.AccountId.t :=
          M.call
            (dns.DomainNameService.t::["get_owner_or_default"]
              (borrow (deref α0))
              α1) in
        M.alloc α2 in
      let* _ : M.Val unit :=
        let* α0 : _ :=
          ltac:(M.get_method (fun ℐ =>
            core.cmp.PartialEq.ne
              (Self := dns.AccountId.t)
              (Rhs := dns.AccountId.t)
              (Trait := ℐ))) in
        let* α1 : bool.t := M.call (α0 (borrow caller) (borrow owner)) in
        let* α2 : M.Val bool.t := M.alloc α1 in
        let* α3 : bool.t := M.read (use α2) in
        if α3 then
          let* α0 : M.Val never.t :=
            return_ (core.result.Result.Err dns.Error.CallerIsNotOwner) in
          let* α1 := M.read α0 in
          let* α2 : unit := never_to_any α1 in
          M.alloc α2
        else
          M.alloc tt in
      let* old_owner : M.Val (core.option.Option.t dns.AccountId.t) :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : core.option.Option.t dns.AccountId.t :=
          M.call
            ((dns.Mapping.t (array u8.t) dns.AccountId.t)::["get"]
              (borrow (dns.DomainNameService.Get_name_to_owner (deref α0)))
              (borrow name)) in
        M.alloc α1 in
      let* _ : M.Val (core.option.Option.t u32.t) :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : array u8.t := M.read name in
        let* α2 : dns.AccountId.t := M.read to in
        let* α3 : core.option.Option.t u32.t :=
          M.call
            ((dns.Mapping.t (array u8.t) dns.AccountId.t)::["insert"]
              (borrow_mut (dns.DomainNameService.Get_name_to_owner (deref α0)))
              α1
              α2) in
        M.alloc α3 in
      let* _ : M.Val unit :=
        let* α0 : mut_ref dns.DomainNameService.t := M.read self in
        let* α1 : dns.Env.t :=
          M.call (dns.DomainNameService.t::["env"] (borrow (deref α0))) in
        let* α2 : M.Val dns.Env.t := M.alloc α1 in
        let* α3 : array u8.t := M.read name in
        let* α4 : dns.AccountId.t := M.read caller in
        let* α5 : core.option.Option.t dns.AccountId.t := M.read old_owner in
        let* α6 : dns.AccountId.t := M.read to in
        let* α7 : unit :=
          M.call
            (dns.Env.t::["emit_event"]
              (borrow α2)
              (dns.Event.Transfer
                {|
                  dns.Transfer.name := α3;
                  dns.Transfer.from := α4;
                  dns.Transfer.old_owner := α5;
                  dns.Transfer.new_owner := α6;
                |})) in
        M.alloc α7 in
      let* α0 : M.Val (core.result.Result.t unit dns.Error.t) :=
        M.alloc (core.result.Result.Ok tt) in
      M.read α0).
  
  Global Instance AssociatedFunction_transfer :
    Notations.DoubleColon Self "transfer" := {
    Notations.double_colon := transfer;
  }.
  
  (*
      fn get_address_or_default(&self, name: Hash) -> AccountId {
          self.name_to_address
              .get(&name)
              .unwrap_or(self.default_address)
      }
  *)
  Definition get_address_or_default
      (self : ref Self)
      (name : ltac:(dns.Hash))
      : M dns.AccountId.t :=
    let* self := M.alloc self in
    let* name := M.alloc name in
    let* α0 : ref dns.DomainNameService.t := M.read self in
    let* α1 : core.option.Option.t dns.AccountId.t :=
      M.call
        ((dns.Mapping.t (array u8.t) dns.AccountId.t)::["get"]
          (borrow (dns.DomainNameService.Get_name_to_address (deref α0)))
          (borrow name)) in
    let* α2 : ref dns.DomainNameService.t := M.read self in
    let* α3 : dns.AccountId.t :=
      M.read (dns.DomainNameService.Get_default_address (deref α2)) in
    M.call ((core.option.Option.t dns.AccountId.t)::["unwrap_or"] α1 α3).
  
  Global Instance AssociatedFunction_get_address_or_default :
    Notations.DoubleColon Self "get_address_or_default" := {
    Notations.double_colon := get_address_or_default;
  }.
  
  (*
      pub fn get_address(&self, name: Hash) -> AccountId {
          self.get_address_or_default(name)
      }
  *)
  Definition get_address
      (self : ref Self)
      (name : ltac:(dns.Hash))
      : M dns.AccountId.t :=
    let* self := M.alloc self in
    let* name := M.alloc name in
    let* α0 : ref dns.DomainNameService.t := M.read self in
    let* α1 : array u8.t := M.read name in
    M.call (dns.DomainNameService.t::["get_address_or_default"] α0 α1).
  
  Global Instance AssociatedFunction_get_address :
    Notations.DoubleColon Self "get_address" := {
    Notations.double_colon := get_address;
  }.
  
  (*
      pub fn get_owner(&self, name: Hash) -> AccountId {
          self.get_owner_or_default(name)
      }
  *)
  Definition get_owner
      (self : ref Self)
      (name : ltac:(dns.Hash))
      : M dns.AccountId.t :=
    let* self := M.alloc self in
    let* name := M.alloc name in
    let* α0 : ref dns.DomainNameService.t := M.read self in
    let* α1 : array u8.t := M.read name in
    M.call (dns.DomainNameService.t::["get_owner_or_default"] α0 α1).
  
  Global Instance AssociatedFunction_get_owner :
    Notations.DoubleColon Self "get_owner" := {
    Notations.double_colon := get_owner;
  }.
End Impl_dns_DomainNameService_t.
End Impl_dns_DomainNameService_t.
