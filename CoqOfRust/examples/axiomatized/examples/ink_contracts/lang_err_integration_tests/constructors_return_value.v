(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_constructors_return_value_AccountId_t.
Section Impl_core_default_Default_for_constructors_return_value_AccountId_t.
  Definition Self : Set := constructors_return_value.AccountId.t.
  
  (*
  Default
  *)
  Parameter default : M constructors_return_value.AccountId.t.
  
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
  Parameter clone : (ref Self) -> M constructors_return_value.AccountId.t.
  
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
  Parameter from : (array u8.t) -> M Self.
  
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
  
  Definition Get_value :=
    Ref.map (fun α => Some α.(value)) (fun β α => Some (α <| value := β |>)).
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
  Parameter fmt :
      (ref Self) -> (mut_ref core.fmt.Formatter.t) -> M ltac:(core.fmt.Result).
  
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
  Parameter new_with_reverted : bool.t -> M Self.
  
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
Parameter return_value :
    forall {R : Set},
    constructors_return_value.ReturnFlags.t -> (ref R) -> M never.t.

Module  Impl_constructors_return_value_ConstructorsReturnValue_t.
Section Impl_constructors_return_value_ConstructorsReturnValue_t.
  Definition Self : Set := constructors_return_value.ConstructorsReturnValue.t.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Parameter new : bool.t -> M Self.
  
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
  Parameter try_new :
      bool.t ->
        M
          (core.result.Result.t
            Self
            constructors_return_value.ConstructorError.t).
  
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
  Parameter revert_new : bool.t -> M Self.
  
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
  Parameter try_revert_new :
      bool.t ->
        M
          (core.result.Result.t
            Self
            constructors_return_value.ConstructorError.t).
  
  Global Instance AssociatedFunction_try_revert_new :
    Notations.DoubleColon Self "try_revert_new" := {
    Notations.double_colon := try_revert_new;
  }.
  
  (*
      pub fn get_value(&self) -> bool {
          self.value
      }
  *)
  Parameter get_value : (ref Self) -> M bool.t.
  
  Global Instance AssociatedFunction_get_value :
    Notations.DoubleColon Self "get_value" := {
    Notations.double_colon := get_value;
  }.
End Impl_constructors_return_value_ConstructorsReturnValue_t.
End Impl_constructors_return_value_ConstructorsReturnValue_t.
