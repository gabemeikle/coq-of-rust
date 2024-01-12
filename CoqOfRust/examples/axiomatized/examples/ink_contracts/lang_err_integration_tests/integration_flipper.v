(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Flipper.
Section Flipper.
  Record t : Set := {
    value : bool.t;
  }.
  
  Definition Get_value :=
    Ref.map (fun α => Some α.(value)) (fun β α => Some (α <| value := β |>)).
End Flipper.
End Flipper.

Module  FlipperError.
Section FlipperError.
  Inductive t : Set := Build.
End FlipperError.
End FlipperError.

Module  Impl_core_fmt_Debug_for_integration_flipper_FlipperError_t.
Section Impl_core_fmt_Debug_for_integration_flipper_FlipperError_t.
  Definition Self : Set := integration_flipper.FlipperError.t.
  
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
End Impl_core_fmt_Debug_for_integration_flipper_FlipperError_t.
End Impl_core_fmt_Debug_for_integration_flipper_FlipperError_t.

Module  Impl_integration_flipper_Flipper_t.
Section Impl_integration_flipper_Flipper_t.
  Definition Self : Set := integration_flipper.Flipper.t.
  
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
      pub fn new_default() -> Self {
          Self::new(Default::default())
      }
  *)
  Parameter new_default : M Self.
  
  Global Instance AssociatedFunction_new_default :
    Notations.DoubleColon Self "new_default" := {
    Notations.double_colon := new_default;
  }.
  
  (*
      pub fn try_new(succeed: bool) -> Result<Self, FlipperError> {
          if succeed {
              Ok(Self::new(true))
          } else {
              Err(FlipperError)
          }
      }
  *)
  Parameter try_new :
      bool.t ->
        M (core.result.Result.t Self integration_flipper.FlipperError.t).
  
  Global Instance AssociatedFunction_try_new :
    Notations.DoubleColon Self "try_new" := {
    Notations.double_colon := try_new;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Parameter flip : (mut_ref Self) -> M unit.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon Self "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Parameter get : (ref Self) -> M bool.t.
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
  
  (*
      pub fn err_flip(&mut self) -> Result<(), ()> {
          self.flip();
          Err(())
      }
  *)
  Parameter err_flip : (mut_ref Self) -> M (core.result.Result.t unit unit).
  
  Global Instance AssociatedFunction_err_flip :
    Notations.DoubleColon Self "err_flip" := {
    Notations.double_colon := err_flip;
  }.
End Impl_integration_flipper_Flipper_t.
End Impl_integration_flipper_Flipper_t.
