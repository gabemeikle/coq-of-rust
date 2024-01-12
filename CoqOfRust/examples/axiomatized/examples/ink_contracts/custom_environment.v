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

Module  Impl_core_default_Default_for_custom_environment_AccountId_t.
Section Impl_core_default_Default_for_custom_environment_AccountId_t.
  Definition Self : Set := custom_environment.AccountId.t.
  
  (*
  Default
  *)
  Parameter default : M custom_environment.AccountId.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_custom_environment_AccountId_t.
End Impl_core_default_Default_for_custom_environment_AccountId_t.

Module  Impl_core_clone_Clone_for_custom_environment_AccountId_t.
Section Impl_core_clone_Clone_for_custom_environment_AccountId_t.
  Definition Self : Set := custom_environment.AccountId.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M custom_environment.AccountId.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_custom_environment_AccountId_t.
End Impl_core_clone_Clone_for_custom_environment_AccountId_t.

Module  Impl_core_marker_Copy_for_custom_environment_AccountId_t.
Section Impl_core_marker_Copy_for_custom_environment_AccountId_t.
  Definition Self : Set := custom_environment.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_custom_environment_AccountId_t.
End Impl_core_marker_Copy_for_custom_environment_AccountId_t.

Ltac Balance := exact u128.t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : custom_environment.AccountId.t;
  }.
  
  Definition Get_caller :=
    Ref.map (fun α => Some α.(caller)) (fun β α => Some (α <| caller := β |>)).
End Env.
End Env.

Module  Topics.
Section Topics.
  Inductive t : Set := Build.
End Topics.
End Topics.

Module  Impl_core_default_Default_for_custom_environment_Topics_t.
Section Impl_core_default_Default_for_custom_environment_Topics_t.
  Definition Self : Set := custom_environment.Topics.t.
  
  (*
  Default
  *)
  Parameter default : M custom_environment.Topics.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_custom_environment_Topics_t.
End Impl_core_default_Default_for_custom_environment_Topics_t.

Module  EventWithTopics.
Section EventWithTopics.
  Record t : Set := {
    first_topic : ltac:(custom_environment.Balance);
    second_topic : ltac:(custom_environment.Balance);
    third_topic : ltac:(custom_environment.Balance);
    fourth_topic : ltac:(custom_environment.Balance);
    fifth_topic : ltac:(custom_environment.Balance);
  }.
  
  Definition Get_first_topic :=
    Ref.map
      (fun α => Some α.(first_topic))
      (fun β α => Some (α <| first_topic := β |>)).
  Definition Get_second_topic :=
    Ref.map
      (fun α => Some α.(second_topic))
      (fun β α => Some (α <| second_topic := β |>)).
  Definition Get_third_topic :=
    Ref.map
      (fun α => Some α.(third_topic))
      (fun β α => Some (α <| third_topic := β |>)).
  Definition Get_fourth_topic :=
    Ref.map
      (fun α => Some α.(fourth_topic))
      (fun β α => Some (α <| fourth_topic := β |>)).
  Definition Get_fifth_topic :=
    Ref.map
      (fun α => Some α.(fifth_topic))
      (fun β α => Some (α <| fifth_topic := β |>)).
End EventWithTopics.
End EventWithTopics.

Module  Impl_core_default_Default_for_custom_environment_EventWithTopics_t.
Section Impl_core_default_Default_for_custom_environment_EventWithTopics_t.
  Definition Self : Set := custom_environment.EventWithTopics.t.
  
  (*
  Default
  *)
  Parameter default : M custom_environment.EventWithTopics.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_custom_environment_EventWithTopics_t.
End Impl_core_default_Default_for_custom_environment_EventWithTopics_t.

Module Event.
  Inductive t : Set :=
  | EventWithTopics (_ : custom_environment.EventWithTopics.t).
  
  Definition Get_EventWithTopics_0 :=
    Ref.map
      (fun α => match α with | EventWithTopics α0 => Some α0 end)
      (fun β α =>
        match α with | EventWithTopics _ => Some (EventWithTopics β) end).
End Event.

Module  Impl_custom_environment_Env_t.
Section Impl_custom_environment_Env_t.
  Definition Self : Set := custom_environment.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Parameter caller : (ref Self) -> M custom_environment.AccountId.t.
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon Self "caller" := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Parameter emit_event : (ref Self) -> custom_environment.Event.t -> M unit.
  
  Global Instance AssociatedFunction_emit_event :
    Notations.DoubleColon Self "emit_event" := {
    Notations.double_colon := emit_event;
  }.
End Impl_custom_environment_Env_t.
End Impl_custom_environment_Env_t.

Module  Impl_custom_environment_Topics_t.
Section Impl_custom_environment_Topics_t.
  Definition Self : Set := custom_environment.Topics.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : M custom_environment.Env.t.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon Self "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Parameter env : (ref Self) -> M custom_environment.Env.t.
  
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
      pub fn trigger(&mut self) {
          self.env()
              .emit_event(Event::EventWithTopics(EventWithTopics::default()));
      }
  *)
  Parameter trigger : (mut_ref Self) -> M unit.
  
  Global Instance AssociatedFunction_trigger :
    Notations.DoubleColon Self "trigger" := {
    Notations.double_colon := trigger;
  }.
End Impl_custom_environment_Topics_t.
End Impl_custom_environment_Topics_t.
