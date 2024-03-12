(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_custom_environment_AccountId.
  Definition Self : Ty.t := Ty.path "custom_environment::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "custom_environment::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_custom_environment_AccountId.

Module Impl_core_clone_Clone_for_custom_environment_AccountId.
  Definition Self : Ty.t := Ty.path "custom_environment::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "custom_environment::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_custom_environment_AccountId.

Module Impl_core_marker_Copy_for_custom_environment_AccountId.
  Definition Self : Ty.t := Ty.path "custom_environment::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "custom_environment::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_custom_environment_AccountId.

Axiom Balance : (Ty.path "custom_environment::Balance") = (Ty.path "u128").

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "custom_environment::AccountId") ];
  } *)

(* StructTuple
  {
    name := "Topics";
    ty_params := [];
  } *)

Module Impl_core_default_Default_for_custom_environment_Topics.
  Definition Self : Ty.t := Ty.path "custom_environment::Topics".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "custom_environment::Topics")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_custom_environment_Topics.

(* StructRecord
  {
    name := "EventWithTopics";
    ty_params := [];
    fields :=
      [
        ("first_topic", Ty.path "u128");
        ("second_topic", Ty.path "u128");
        ("third_topic", Ty.path "u128");
        ("fourth_topic", Ty.path "u128");
        ("fifth_topic", Ty.path "u128")
      ];
  } *)

Module Impl_core_default_Default_for_custom_environment_EventWithTopics.
  Definition Self : Ty.t := Ty.path "custom_environment::EventWithTopics".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "custom_environment::EventWithTopics")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_custom_environment_EventWithTopics.

(* Enum Event *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "EventWithTopics";
        item := StructTuple [ Ty.path "custom_environment::EventWithTopics" ];
        discriminant := None;
      }
    ];
} *)

Module Impl_custom_environment_Env.
  Definition Self : Ty.t := Ty.path "custom_environment::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_caller : M.IsAssociatedFunction Self "caller" caller.
  
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_emit_event :
    M.IsAssociatedFunction Self "emit_event" emit_event.
End Impl_custom_environment_Env.

Module Impl_custom_environment_Topics.
  Definition Self : Ty.t := Ty.path "custom_environment::Topics".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter trigger : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_trigger :
    M.IsAssociatedFunction Self "trigger" trigger.
End Impl_custom_environment_Topics.
