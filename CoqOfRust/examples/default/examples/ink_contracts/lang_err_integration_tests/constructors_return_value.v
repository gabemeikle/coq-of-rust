(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_default_Default_for_constructors_return_value_AccountId.
Section Impl_core_default_Default_for_constructors_return_value_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "constructors_return_value::AccountId") [].
  
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
      M.pure (constructors_return_value.AccountId.Build_t α1)
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  Definition ℐ : Instance.t := [("default", default)].
End Impl_core_default_Default_for_constructors_return_value_AccountId.
End Impl_core_default_Default_for_constructors_return_value_AccountId.

Module  Impl_core_clone_Clone_for_constructors_return_value_AccountId.
Section Impl_core_clone_Clone_for_constructors_return_value_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "constructors_return_value::AccountId") [].
  
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
              Ty.apply (Ty.path "constructors_return_value::AccountId") []
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_clone : Instance.t := {
    Notations.double_colon := clone;
  }.
  
  Definition ℐ : Instance.t := [("clone", clone); ("clone_from", clone_from)].
End Impl_core_clone_Clone_for_constructors_return_value_AccountId.
End Impl_core_clone_Clone_for_constructors_return_value_AccountId.

Module  Impl_core_marker_Copy_for_constructors_return_value_AccountId.
Section Impl_core_marker_Copy_for_constructors_return_value_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "constructors_return_value::AccountId") [].
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_constructors_return_value_AccountId.
End Impl_core_marker_Copy_for_constructors_return_value_AccountId.

Module  Impl_core_convert_From_array_u8_for_constructors_return_value_AccountId.
Section Impl_core_convert_From_array_u8_for_constructors_return_value_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "constructors_return_value::AccountId") [].
  
  (*
      fn from(_value: [u8; 32]) -> Self {
          unimplemented!()
      }
  *)
  Definition from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [_value] =>
      let* _value := M.alloc _value in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_from : Instance.t := {
    Notations.double_colon := from;
  }.
  
  Definition ℐ : Instance.t := [("from", from)].
End Impl_core_convert_From_array_u8_for_constructors_return_value_AccountId.
End Impl_core_convert_From_array_u8_for_constructors_return_value_AccountId.

Axiom Balance : Ty.path "u128".





Axiom ConstructorResult :
    fun T =>
      Ty.apply
        (Ty.path "core::result::Result")
        [T; Ty.apply (Ty.path "constructors_return_value::LangError") []].



Module  Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError.
Section Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "constructors_return_value::ConstructorError") [].
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "ConstructorError") in
      M.call
        ((Ty.apply (Ty.path "core::fmt::Formatter") [])::["write_str"] α0 α1)
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_fmt : Instance.t := {
    Notations.double_colon := fmt;
  }.
  
  Definition ℐ : Instance.t := [("fmt", fmt)].
End Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError.
End Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError.



Module  Impl_constructors_return_value_ReturnFlags.
Section Impl_constructors_return_value_ReturnFlags.
  Definition Self : Set :=
    Ty.apply (Ty.path "constructors_return_value::ReturnFlags") [].
  
  (*
      fn new_with_reverted(has_reverted: bool) -> Self {
          unimplemented!()
      }
  *)
  Definition new_with_reverted (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [has_reverted] =>
      let* has_reverted := M.alloc has_reverted in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_new_with_reverted : Instance.t := {
    Notations.double_colon := new_with_reverted;
  }.
End Impl_constructors_return_value_ReturnFlags.
End Impl_constructors_return_value_ReturnFlags.

(*
fn return_value<R>(return_flags: ReturnFlags, return_value: &R) -> ! {
    unimplemented!()
}
*)
Definition return_value (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [R], [return_flags; return_value] =>
    let* return_flags := M.alloc return_flags in
    let* return_value := M.alloc return_value in
    let* α0 := M.read (mk_str "not implemented") in
    M.call ((M.var "core::panicking::panic") α0)
  | _, _ => M.impossible
  end.

Module  Impl_constructors_return_value_ConstructorsReturnValue.
Section Impl_constructors_return_value_ConstructorsReturnValue.
  Definition Self : Set :=
    Ty.apply (Ty.path "constructors_return_value::ConstructorsReturnValue") [].
  
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
      M.pure
        {| constructors_return_value.ConstructorsReturnValue.value := α0; |}
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_new : Instance.t := {
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
  Definition try_new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [succeed] =>
      let* succeed := M.alloc succeed in
      let* α0 := M.read (use succeed) in
      let* α1 :=
        if α0 then
          let* α0 :=
            M.call
              ((Ty.apply
                    (Ty.path
                      "constructors_return_value::ConstructorsReturnValue")
                    [])::["new"]
                true) in
          M.alloc (core.result.Result.Ok α0)
        else
          M.alloc
            (core.result.Result.Err
              constructors_return_value.ConstructorError.Build) in
      M.read α1
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_try_new : Instance.t := {
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
  Definition revert_new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [_init_value] =>
      let* _init_value := M.alloc _init_value in
      let* α0 :=
        M.call
          ((Ty.apply
                (Ty.path "constructors_return_value::ReturnFlags")
                [])::["new_with_reverted"]
            true) in
      let* α1 :=
        ltac:(M.get_method (fun ℐ =>
          core.convert.From.from
            (Self :=
              Ty.apply (Ty.path "constructors_return_value::AccountId") [])
            (T := Ty.apply (Ty.path "array") [Ty.path "u8"])
            (Trait := ℐ))) in
      let* α2 := M.call (α1 (repeat ((Integer.of_Z 0) : Ty.path "u8") 32)) in
      let* α3 := M.alloc (core.result.Result.Ok α2) in
      let* α4 :=
        M.call
          ((M.var "constructors_return_value::return_value") α0 (borrow α3)) in
      never_to_any α4
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_revert_new : Instance.t := {
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
  Definition try_revert_new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [init_value] =>
      let* init_value := M.alloc init_value in
      let* value :=
        let* α0 := M.read (use init_value) in
        let* α1 :=
          if α0 then
            let* α0 :=
              ltac:(M.get_method (fun ℐ =>
                core.convert.From.from
                  (Self :=
                    Ty.apply
                      (Ty.path "constructors_return_value::AccountId")
                      [])
                  (T := Ty.apply (Ty.path "array") [Ty.path "u8"])
                  (Trait := ℐ))) in
            let* α1 :=
              M.call (α0 (repeat ((Integer.of_Z 0) : Ty.path "u8") 32)) in
            M.alloc (core.result.Result.Ok (core.result.Result.Ok α1))
          else
            M.alloc
              (core.result.Result.Err
                constructors_return_value.LangError.CouldNotReadInput) in
        M.copy α1 in
      let* α0 :=
        M.call
          ((Ty.apply
                (Ty.path "constructors_return_value::ReturnFlags")
                [])::["new_with_reverted"]
            true) in
      let* α1 :=
        M.call
          ((M.var "constructors_return_value::return_value")
            α0
            (borrow value)) in
      let* α2 := never_to_any α1 in
      let* α0 := M.alloc α2 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_try_revert_new : Instance.t := {
    Notations.double_colon := try_revert_new;
  }.
  
  (*
      pub fn get_value(&self) -> bool {
          self.value
      }
  *)
  Definition get_value (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read
        ((M.var "constructors_return_value::ConstructorsReturnValue::Get_value")
          (deref α0))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_get_value : Instance.t := {
    Notations.double_colon := get_value;
  }.
End Impl_constructors_return_value_ConstructorsReturnValue.
End Impl_constructors_return_value_ConstructorsReturnValue.
