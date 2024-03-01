(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_default_Default_for_conditional_compilation_AccountId.
Section Impl_core_default_Default_for_conditional_compilation_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "conditional_compilation::AccountId") [].
  
  Parameter default :
      Ty.apply (Ty.path "conditional_compilation::AccountId") [].
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  Definition ℐ : Instance.t := [("default", default)].
End Impl_core_default_Default_for_conditional_compilation_AccountId.
End Impl_core_default_Default_for_conditional_compilation_AccountId.

Module  Impl_core_clone_Clone_for_conditional_compilation_AccountId.
Section Impl_core_clone_Clone_for_conditional_compilation_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "conditional_compilation::AccountId") [].
  
  Parameter clone :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "conditional_compilation::AccountId") []])
        ->
        Ty.apply (Ty.path "conditional_compilation::AccountId") [].
  
  Definition AssociatedFunction_clone : Instance.t := {
    Notations.double_colon := clone;
  }.
  
  Definition ℐ : Instance.t := [("clone", clone); ("clone_from", clone_from)].
End Impl_core_clone_Clone_for_conditional_compilation_AccountId.
End Impl_core_clone_Clone_for_conditional_compilation_AccountId.

Module  Impl_core_marker_Copy_for_conditional_compilation_AccountId.
Section Impl_core_marker_Copy_for_conditional_compilation_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "conditional_compilation::AccountId") [].
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_conditional_compilation_AccountId.
End Impl_core_marker_Copy_for_conditional_compilation_AccountId.

Axiom Balance : Ty.path "u128".

Axiom BlockNumber : Ty.path "u32".



Module  Flip.
Section Flip.
  Class Trait (Self : Set) : Type := {
    flip : Ty.function [Ty.apply (Ty.path "mut_ref") [Self]] (Ty.path "unit");
    get : Ty.function [Ty.apply (Ty.path "ref") [Self]] (Ty.path "bool");
    push_foo :
      Ty.function
        [Ty.apply (Ty.path "mut_ref") [Self]; Ty.path "bool"]
        (Ty.path "unit");
  }.
  
End Flip.
End Flip.







Module  Impl_conditional_compilation_Env.
Section Impl_conditional_compilation_Env.
  Definition Self : Set := Ty.apply (Ty.path "conditional_compilation::Env") [].
  
  Parameter caller :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "conditional_compilation::Env") []])
        ->
        Ty.apply (Ty.path "conditional_compilation::AccountId") [].
  
  Definition AssociatedFunction_caller : Instance.t := {
    Notations.double_colon := caller;
  }.
  
  Parameter emit_event :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "conditional_compilation::Env") []])
        ->
        (Ty.apply (Ty.path "conditional_compilation::Event") []) ->
        Ty.path "unit".
  
  Definition AssociatedFunction_emit_event : Instance.t := {
    Notations.double_colon := emit_event;
  }.
  
  Parameter block_number :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "conditional_compilation::Env") []])
        ->
        Ty.path "u32".
  
  Definition AssociatedFunction_block_number : Instance.t := {
    Notations.double_colon := block_number;
  }.
End Impl_conditional_compilation_Env.
End Impl_conditional_compilation_Env.



Module  Impl_conditional_compilation_ConditionalCompilation.
Section Impl_conditional_compilation_ConditionalCompilation.
  Definition Self : Set :=
    Ty.apply (Ty.path "conditional_compilation::ConditionalCompilation") [].
  
  Parameter init_env : Ty.apply (Ty.path "conditional_compilation::Env") [].
  
  Definition AssociatedFunction_init_env : Instance.t := {
    Notations.double_colon := init_env;
  }.
  
  Parameter env :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply
              (Ty.path "conditional_compilation::ConditionalCompilation")
              []])
        ->
        Ty.apply (Ty.path "conditional_compilation::Env") [].
  
  Definition AssociatedFunction_env : Instance.t := {
    Notations.double_colon := env;
  }.
  
  Parameter new :
      Ty.apply (Ty.path "conditional_compilation::ConditionalCompilation") [].
  
  Definition AssociatedFunction_new : Instance.t := {
    Notations.double_colon := new;
  }.
  
  Parameter new_foo :
      (Ty.path "bool") ->
        Ty.apply (Ty.path "conditional_compilation::ConditionalCompilation") [].
  
  Definition AssociatedFunction_new_foo : Instance.t := {
    Notations.double_colon := new_foo;
  }.
  
  Parameter new_bar :
      (Ty.path "bool") ->
        Ty.apply (Ty.path "conditional_compilation::ConditionalCompilation") [].
  
  Definition AssociatedFunction_new_bar : Instance.t := {
    Notations.double_colon := new_bar;
  }.
  
  Parameter new_foo_bar :
      (Ty.path "bool") ->
        Ty.apply (Ty.path "conditional_compilation::ConditionalCompilation") [].
  
  Definition AssociatedFunction_new_foo_bar : Instance.t := {
    Notations.double_colon := new_foo_bar;
  }.
  
  Parameter inherent_flip_foo :
      (Ty.apply
          (Ty.path "mut_ref")
          [Ty.apply
              (Ty.path "conditional_compilation::ConditionalCompilation")
              []])
        ->
        Ty.path "unit".
  
  Definition AssociatedFunction_inherent_flip_foo : Instance.t := {
    Notations.double_colon := inherent_flip_foo;
  }.
  
  Parameter inherent_flip_bar :
      (Ty.apply
          (Ty.path "mut_ref")
          [Ty.apply
              (Ty.path "conditional_compilation::ConditionalCompilation")
              []])
        ->
        Ty.path "unit".
  
  Definition AssociatedFunction_inherent_flip_bar : Instance.t := {
    Notations.double_colon := inherent_flip_bar;
  }.
End Impl_conditional_compilation_ConditionalCompilation.
End Impl_conditional_compilation_ConditionalCompilation.

Module  Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
Section Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "conditional_compilation::ConditionalCompilation") [].
  
  Parameter flip :
      (Ty.apply
          (Ty.path "mut_ref")
          [Ty.apply
              (Ty.path "conditional_compilation::ConditionalCompilation")
              []])
        ->
        Ty.path "unit".
  
  Definition AssociatedFunction_flip : Instance.t := {
    Notations.double_colon := flip;
  }.
  
  Parameter get :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply
              (Ty.path "conditional_compilation::ConditionalCompilation")
              []])
        ->
        Ty.path "bool".
  
  Definition AssociatedFunction_get : Instance.t := {
    Notations.double_colon := get;
  }.
  
  Parameter push_foo :
      (Ty.apply
          (Ty.path "mut_ref")
          [Ty.apply
              (Ty.path "conditional_compilation::ConditionalCompilation")
              []])
        ->
        (Ty.path "bool") ->
        Ty.path "unit".
  
  Definition AssociatedFunction_push_foo : Instance.t := {
    Notations.double_colon := push_foo;
  }.
  
  Definition ℐ : Instance.t := [("flip", flip);
    ("get", get);
    ("push_foo", push_foo)].
End Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
End Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
