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

Module  Impl_core_default_Default_for_custom_environment_AccountId_t.
Section Impl_core_default_Default_for_custom_environment_AccountId_t.
  Definition Self : Set := custom_environment.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M custom_environment.AccountId.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    M.pure (custom_environment.AccountId.Build_t α0).
  
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
  Definition clone (self : ref Self) : M custom_environment.AccountId.t :=
    let* self := M.alloc self in
    let _ : unit := tt in
    let* α0 : ref custom_environment.AccountId.t := M.read self in
    M.read (deref α0).
  
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
  
  Global Instance Get_caller : Notations.Dot "caller" := {
    Notations.dot :=
      Ref.map (fun x => x.(caller)) (fun v x => x <| caller := v |>);
  }.
  Global Instance Get_AF_caller : Notations.DoubleColon t "caller" := {
    Notations.double_colon (x : M.Val t) := x.["caller"];
  }.
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
  Definition default : M custom_environment.Topics.t :=
    M.pure custom_environment.Topics.Build.
  
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
  
  Global Instance Get_first_topic : Notations.Dot "first_topic" := {
    Notations.dot :=
      Ref.map (fun x => x.(first_topic)) (fun v x => x <| first_topic := v |>);
  }.
  Global Instance Get_AF_first_topic :
    Notations.DoubleColon t "first_topic" := {
    Notations.double_colon (x : M.Val t) := x.["first_topic"];
  }.
  Global Instance Get_second_topic : Notations.Dot "second_topic" := {
    Notations.dot :=
      Ref.map
        (fun x => x.(second_topic))
        (fun v x => x <| second_topic := v |>);
  }.
  Global Instance Get_AF_second_topic :
    Notations.DoubleColon t "second_topic" := {
    Notations.double_colon (x : M.Val t) := x.["second_topic"];
  }.
  Global Instance Get_third_topic : Notations.Dot "third_topic" := {
    Notations.dot :=
      Ref.map (fun x => x.(third_topic)) (fun v x => x <| third_topic := v |>);
  }.
  Global Instance Get_AF_third_topic :
    Notations.DoubleColon t "third_topic" := {
    Notations.double_colon (x : M.Val t) := x.["third_topic"];
  }.
  Global Instance Get_fourth_topic : Notations.Dot "fourth_topic" := {
    Notations.dot :=
      Ref.map
        (fun x => x.(fourth_topic))
        (fun v x => x <| fourth_topic := v |>);
  }.
  Global Instance Get_AF_fourth_topic :
    Notations.DoubleColon t "fourth_topic" := {
    Notations.double_colon (x : M.Val t) := x.["fourth_topic"];
  }.
  Global Instance Get_fifth_topic : Notations.Dot "fifth_topic" := {
    Notations.dot :=
      Ref.map (fun x => x.(fifth_topic)) (fun v x => x <| fifth_topic := v |>);
  }.
  Global Instance Get_AF_fifth_topic :
    Notations.DoubleColon t "fifth_topic" := {
    Notations.double_colon (x : M.Val t) := x.["fifth_topic"];
  }.
End EventWithTopics.
End EventWithTopics.

Module  Impl_core_default_Default_for_custom_environment_EventWithTopics_t.
Section Impl_core_default_Default_for_custom_environment_EventWithTopics_t.
  Definition Self : Set := custom_environment.EventWithTopics.t.
  
  (*
  Default
  *)
  Definition default : M custom_environment.EventWithTopics.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    let* α1 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    let* α2 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    let* α3 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    let* α4 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    M.pure
      {|
        custom_environment.EventWithTopics.first_topic := α0;
        custom_environment.EventWithTopics.second_topic := α1;
        custom_environment.EventWithTopics.third_topic := α2;
        custom_environment.EventWithTopics.fourth_topic := α3;
        custom_environment.EventWithTopics.fifth_topic := α4;
      |}.
  
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
End Event.

Module  Impl_custom_environment_Env_t.
Section Impl_custom_environment_Env_t.
  Definition Self : Set := custom_environment.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (self : ref Self) : M custom_environment.AccountId.t :=
    let* self := M.alloc self in
    let* α0 : ref custom_environment.Env.t := M.read self in
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
      (_event : custom_environment.Event.t)
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
  Definition init_env : M custom_environment.Env.t :=
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
  Definition env (self : ref Self) : M custom_environment.Env.t :=
    let* self := M.alloc self in
    M.call custom_environment.Topics.t::["init_env"].
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new : M Self :=
    M.call
      (core.default.Default.default
        (Self := custom_environment.Topics.t)
        (Trait := ltac:(refine _))).
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn trigger(&mut self) {
          self.env()
              .emit_event(Event::EventWithTopics(EventWithTopics::default()));
      }
  *)
  Definition trigger (self : mut_ref Self) : M unit :=
    let* self := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref custom_environment.Topics.t := M.read self in
      let* α1 : custom_environment.Env.t :=
        M.call (custom_environment.Topics.t::["env"] (borrow (deref α0))) in
      let* α2 : M.Val custom_environment.Env.t := M.alloc α1 in
      let* α3 : custom_environment.EventWithTopics.t :=
        M.call
          (core.default.Default.default
            (Self := custom_environment.EventWithTopics.t)
            (Trait := ltac:(refine _))) in
      let* α4 : unit :=
        M.call
          (custom_environment.Env.t::["emit_event"]
            (borrow α2)
            (custom_environment.Event.EventWithTopics α3)) in
      M.alloc α4 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_trigger :
    Notations.DoubleColon Self "trigger" := {
    Notations.double_colon := trigger;
  }.
End Impl_custom_environment_Topics_t.
End Impl_custom_environment_Topics_t.
