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

Module  Impl_core_default_Default_for_constructors_return_value_AccountId_t.
Section Impl_core_default_Default_for_constructors_return_value_AccountId_t.
  Definition Self : Set := constructors_return_value.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M constructors_return_value.AccountId.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    M.pure (constructors_return_value.AccountId.Build_t α0).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_constructors_return_value_AccountId_t.
End Impl_core_default_Default_for_constructors_return_value_AccountId_t.

Module  Impl_core_clone_Clone_for_constructors_return_value_AccountId_t.
Section Impl_core_clone_Clone_for_constructors_return_value_AccountId_t.
  Definition Self : Set := constructors_return_value.AccountId.t.
  
  (*
  Clone
  *)
  Definition clone
      (self : ref Self)
      : M constructors_return_value.AccountId.t :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* _ : M.Val unit := M.alloc tt in
    let* α0 : ref constructors_return_value.AccountId.t := M.read self in
    M.read (deref α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_constructors_return_value_AccountId_t.
End Impl_core_clone_Clone_for_constructors_return_value_AccountId_t.

Module  Impl_core_marker_Copy_for_constructors_return_value_AccountId_t.
Section Impl_core_marker_Copy_for_constructors_return_value_AccountId_t.
  Definition Self : Set := constructors_return_value.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_constructors_return_value_AccountId_t.
End Impl_core_marker_Copy_for_constructors_return_value_AccountId_t.

Module  Impl_core_convert_From_array_u8_t_for_constructors_return_value_AccountId_t.
Section Impl_core_convert_From_array_u8_t_for_constructors_return_value_AccountId_t.
  Definition Self : Set := constructors_return_value.AccountId.t.
  
  (*
      fn from(_value: [u8; 32]) -> Self {
          unimplemented!()
      }
  *)
  Definition from (_value : array u8.t) : M Self :=
    let* _value : M.Val (array u8.t) := M.alloc _value in
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
End Impl_core_convert_From_array_u8_t_for_constructors_return_value_AccountId_t.
End Impl_core_convert_From_array_u8_t_for_constructors_return_value_AccountId_t.

Ltac Balance := exact u128.t.

Module  ConstructorsReturnValue.
Section ConstructorsReturnValue.
  Record t : Set := {
    value : bool.t;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End ConstructorsReturnValue.
End ConstructorsReturnValue.

Module LangError.
  Inductive t : Set :=
  | CouldNotReadInput.
End LangError.

Ltac ConstructorResult T :=
  exact (core.result.Result.t T constructors_return_value.LangError.t).

Module  ConstructorError.
Section ConstructorError.
  Inductive t : Set := Build.
End ConstructorError.
End ConstructorError.

Module  Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError_t.
Section Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError_t.
  Definition Self : Set := constructors_return_value.ConstructorError.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "ConstructorError") in
    M.call (core.fmt.Formatter.t::["write_str"] α0 α1).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError_t.
End Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError_t.

Module  ReturnFlags.
Section ReturnFlags.
  Inductive t : Set := Build.
End ReturnFlags.
End ReturnFlags.

Module  Impl_constructors_return_value_ReturnFlags_t.
Section Impl_constructors_return_value_ReturnFlags_t.
  Definition Self : Set := constructors_return_value.ReturnFlags.t.
  
  (*
      fn new_with_reverted(has_reverted: bool) -> Self {
          unimplemented!()
      }
  *)
  Definition new_with_reverted (has_reverted : bool.t) : M Self :=
    let* has_reverted : M.Val bool.t := M.alloc has_reverted in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_new_with_reverted :
    Notations.DoubleColon Self "new_with_reverted" := {
    Notations.double_colon := new_with_reverted;
  }.
End Impl_constructors_return_value_ReturnFlags_t.
End Impl_constructors_return_value_ReturnFlags_t.

(*
fn return_value<R>(return_flags: ReturnFlags, return_value: &R) -> ! {
    unimplemented!()
}
*)
Definition return_value
    {R : Set}
    (return_flags : constructors_return_value.ReturnFlags.t)
    (return_value : ref R)
    : M never.t :=
  let* return_flags : M.Val constructors_return_value.ReturnFlags.t :=
    M.alloc return_flags in
  let* return_value : M.Val (ref R) := M.alloc return_value in
  let* α0 : ref str.t := M.read (mk_str "not implemented") in
  let* α1 : never.t := M.call (core.panicking.panic α0) in
  let* α2 : never.t := never_to_any α1 in
  never_to_any α2.

Module  Impl_constructors_return_value_ConstructorsReturnValue_t.
Section Impl_constructors_return_value_ConstructorsReturnValue_t.
  Definition Self : Set := constructors_return_value.ConstructorsReturnValue.t.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (init_value : bool.t) : M Self :=
    let* init_value : M.Val bool.t := M.alloc init_value in
    let* α0 : bool.t := M.read init_value in
    M.pure {| constructors_return_value.ConstructorsReturnValue.value := α0; |}.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn try_new(succeed: bool) -> Result<Self, ConstructorError> {
          if succeed {
              Ok(Self::new(true))
          } else {
              Err(ConstructorError)
          }
      }
  *)
  Definition try_new
      (succeed : bool.t)
      :
        M
          (core.result.Result.t
            Self
            constructors_return_value.ConstructorError.t) :=
    let* succeed : M.Val bool.t := M.alloc succeed in
    let* α0 : bool.t := M.read succeed in
    let* α1 :
        M.Val
          (core.result.Result.t
            constructors_return_value.ConstructorsReturnValue.t
            constructors_return_value.ConstructorError.t) :=
      if (use α0 : bool) then
        let* α0 : constructors_return_value.ConstructorsReturnValue.t :=
          M.call
            (constructors_return_value.ConstructorsReturnValue.t::["new"]
              true) in
        M.alloc (core.result.Result.Ok α0)
      else
        M.alloc
          (core.result.Result.Err
            constructors_return_value.ConstructorError.Build) in
    M.read α1.
  
  Global Instance AssociatedFunction_try_new :
    Notations.DoubleColon Self "try_new" := {
    Notations.double_colon := try_new;
  }.
  
  (*
      pub fn revert_new(_init_value: bool) -> Self {
          return_value::<ConstructorResult<AccountId>>(
              ReturnFlags::new_with_reverted(true),
              &Ok(AccountId::from([0u8; 32])),
          )
      }
  *)
  Definition revert_new (_init_value : bool.t) : M Self :=
    let* _init_value : M.Val bool.t := M.alloc _init_value in
    let* α0 : constructors_return_value.ReturnFlags.t :=
      M.call
        (constructors_return_value.ReturnFlags.t::["new_with_reverted"] true) in
    let* α1 : constructors_return_value.AccountId.t :=
      M.call
        ((core.convert.From.from
            (Self := constructors_return_value.AccountId.t)
            (Trait := ltac:(refine _)))
          (repeat (Integer.of_Z 0) 32)) in
    let* α2 :
        M.Val
          (core.result.Result.t
            constructors_return_value.AccountId.t
            constructors_return_value.LangError.t) :=
      M.alloc (core.result.Result.Ok α1) in
    let* α3 : never.t :=
      M.call (constructors_return_value.return_value α0 (borrow α2)) in
    never_to_any α3.
  
  Global Instance AssociatedFunction_revert_new :
    Notations.DoubleColon Self "revert_new" := {
    Notations.double_colon := revert_new;
  }.
  
  (*
      pub fn try_revert_new(init_value: bool) -> Result<Self, ConstructorError> {
          let value = if init_value {
              Ok(Ok(AccountId::from([0u8; 32])))
          } else {
              Err(LangError::CouldNotReadInput)
          };
  
          return_value::<ConstructorResult<Result<AccountId, ConstructorError>>>(
              ReturnFlags::new_with_reverted(true),
              &value,
          )
      }
  *)
  Definition try_revert_new
      (init_value : bool.t)
      :
        M
          (core.result.Result.t
            Self
            constructors_return_value.ConstructorError.t) :=
    let* init_value : M.Val bool.t := M.alloc init_value in
    let* value :
        M.Val
          (core.result.Result.t
            (core.result.Result.t
              constructors_return_value.AccountId.t
              constructors_return_value.ConstructorError.t)
            constructors_return_value.LangError.t) :=
      let* α0 : bool.t := M.read init_value in
      let* α1 :
          M.Val
            (core.result.Result.t
              (core.result.Result.t
                constructors_return_value.AccountId.t
                constructors_return_value.ConstructorError.t)
              constructors_return_value.LangError.t) :=
        if (use α0 : bool) then
          let* α0 : constructors_return_value.AccountId.t :=
            M.call
              ((core.convert.From.from
                  (Self := constructors_return_value.AccountId.t)
                  (Trait := ltac:(refine _)))
                (repeat (Integer.of_Z 0) 32)) in
          M.alloc (core.result.Result.Ok (core.result.Result.Ok α0))
        else
          M.alloc
            (core.result.Result.Err
              constructors_return_value.LangError.CouldNotReadInput) in
      M.copy α1 in
    let* α0 : constructors_return_value.ReturnFlags.t :=
      M.call
        (constructors_return_value.ReturnFlags.t::["new_with_reverted"] true) in
    let* α1 : never.t :=
      M.call (constructors_return_value.return_value α0 (borrow value)) in
    let* α2 :
        core.result.Result.t
          constructors_return_value.ConstructorsReturnValue.t
          constructors_return_value.ConstructorError.t :=
      never_to_any α1 in
    let* α0 :
        M.Val
          (core.result.Result.t
            constructors_return_value.ConstructorsReturnValue.t
            constructors_return_value.ConstructorError.t) :=
      M.alloc α2 in
    M.read α0.
  
  Global Instance AssociatedFunction_try_revert_new :
    Notations.DoubleColon Self "try_revert_new" := {
    Notations.double_colon := try_revert_new;
  }.
  
  (*
      pub fn get_value(&self) -> bool {
          self.value
      }
  *)
  Definition get_value (self : ref Self) : M bool.t :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* α0 : ref constructors_return_value.ConstructorsReturnValue.t :=
      M.read self in
    M.read (deref α0).["value"].
  
  Global Instance AssociatedFunction_get_value :
    Notations.DoubleColon Self "get_value" := {
    Notations.double_colon := get_value;
  }.
End Impl_constructors_return_value_ConstructorsReturnValue_t.
End Impl_constructors_return_value_ConstructorsReturnValue_t.
