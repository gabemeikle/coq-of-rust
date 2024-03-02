(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_default_Default_for_custom_environment_AccountId.
Section Impl_core_default_Default_for_custom_environment_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "custom_environment::AccountId") [].
  
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
      M.pure (custom_environment.AccountId.Build_t α1)
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  Definition ℐ : Instance.t := [("default", default)].
End Impl_core_default_Default_for_custom_environment_AccountId.
End Impl_core_default_Default_for_custom_environment_AccountId.

Module  Impl_core_clone_Clone_for_custom_environment_AccountId.
Section Impl_core_clone_Clone_for_custom_environment_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "custom_environment::AccountId") [].
  
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
              Ty.apply (Ty.path "custom_environment::AccountId") []
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_clone : Instance.t := {
    Notations.double_colon := clone;
  }.
  
  Definition ℐ : Instance.t := [("clone", clone); ("clone_from", clone_from)].
End Impl_core_clone_Clone_for_custom_environment_AccountId.
End Impl_core_clone_Clone_for_custom_environment_AccountId.

Module  Impl_core_marker_Copy_for_custom_environment_AccountId.
Section Impl_core_marker_Copy_for_custom_environment_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "custom_environment::AccountId") [].
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_custom_environment_AccountId.
End Impl_core_marker_Copy_for_custom_environment_AccountId.

Axiom Balance : Ty.path "u128".





Module  Impl_core_default_Default_for_custom_environment_Topics.
Section Impl_core_default_Default_for_custom_environment_Topics.
  Definition Self : Ty.t := Ty.apply (Ty.path "custom_environment::Topics") [].
  
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] => M.pure custom_environment.Topics.Build
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  Definition ℐ : Instance.t := [("default", default)].
End Impl_core_default_Default_for_custom_environment_Topics.
End Impl_core_default_Default_for_custom_environment_Topics.



Module  Impl_core_default_Default_for_custom_environment_EventWithTopics.
Section Impl_core_default_Default_for_custom_environment_EventWithTopics.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "custom_environment::EventWithTopics") [].
  
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
      let* α2 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.path "u128")
            (Trait := ℐ))) in
      let* α3 := M.call α2 in
      let* α4 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.path "u128")
            (Trait := ℐ))) in
      let* α5 := M.call α4 in
      let* α6 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.path "u128")
            (Trait := ℐ))) in
      let* α7 := M.call α6 in
      let* α8 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.path "u128")
            (Trait := ℐ))) in
      let* α9 := M.call α8 in
      M.pure
        {|
          custom_environment.EventWithTopics.first_topic := α1;
          custom_environment.EventWithTopics.second_topic := α3;
          custom_environment.EventWithTopics.third_topic := α5;
          custom_environment.EventWithTopics.fourth_topic := α7;
          custom_environment.EventWithTopics.fifth_topic := α9;
        |}
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  Definition ℐ : Instance.t := [("default", default)].
End Impl_core_default_Default_for_custom_environment_EventWithTopics.
End Impl_core_default_Default_for_custom_environment_EventWithTopics.



Module  Impl_custom_environment_Env.
Section Impl_custom_environment_Env.
  Definition Self : Set := Ty.apply (Ty.path "custom_environment::Env") [].
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read ((M.var "custom_environment::Env::Get_caller") (deref α0))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_caller : Instance.t := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Definition emit_event (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _event] =>
      let* self := M.alloc self in
      let* _event := M.alloc _event in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_emit_event : Instance.t := {
    Notations.double_colon := emit_event;
  }.
End Impl_custom_environment_Env.
End Impl_custom_environment_Env.

Module  Impl_custom_environment_Topics.
Section Impl_custom_environment_Topics.
  Definition Self : Set := Ty.apply (Ty.path "custom_environment::Topics") [].
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_init_env : Instance.t := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      M.call (Ty.apply (Ty.path "custom_environment::Topics") [])::["init_env"]
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_env : Instance.t := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.apply (Ty.path "custom_environment::Topics") [])
            (Trait := ℐ))) in
      M.call α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_new : Instance.t := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn trigger(&mut self) {
          self.env()
              .emit_event(Event::EventWithTopics(EventWithTopics::default()));
      }
  *)
  Definition trigger (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 :=
          M.call
            ((Ty.apply (Ty.path "custom_environment::Topics") [])::["env"]
              (borrow (deref α0))) in
        let* α2 := M.alloc α1 in
        let* α3 :=
          ltac:(M.get_method (fun ℐ =>
            core.default.Default.default
              (Self :=
                Ty.apply (Ty.path "custom_environment::EventWithTopics") [])
              (Trait := ℐ))) in
        let* α4 := M.call α3 in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "custom_environment::Env") [])::["emit_event"]
              (borrow α2)
              (custom_environment.Event.EventWithTopics α4)) in
        M.alloc α5 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_trigger : Instance.t := {
    Notations.double_colon := trigger;
  }.
End Impl_custom_environment_Topics.
End Impl_custom_environment_Topics.
