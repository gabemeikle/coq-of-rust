(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.
Section Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.
  Context {K V : Set}.
  
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V].
  
  Parameter default :
      Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V].
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  Definition ℐ : Instance.t := [("default", default)].
End Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.
End Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.

Module  Impl_mapping_integration_tests_Mapping_K_V.
Section Impl_mapping_integration_tests_Mapping_K_V.
  Context {K V : Set}.
  
  Definition Self : Set :=
    Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V].
  
  Parameter contains :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V]])
        ->
        (Ty.apply (Ty.path "ref") [K]) ->
        Ty.path "bool".
  
  Definition AssociatedFunction_contains : Instance.t := {
    Notations.double_colon := contains;
  }.
  
  Parameter get :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V]])
        ->
        (Ty.apply (Ty.path "ref") [K]) ->
        Ty.apply (Ty.path "core::option::Option") [V].
  
  Definition AssociatedFunction_get : Instance.t := {
    Notations.double_colon := get;
  }.
  
  Parameter insert :
      (Ty.apply
          (Ty.path "mut_ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V]])
        ->
        K ->
        V ->
        Ty.apply (Ty.path "core::option::Option") [Ty.path "u32"].
  
  Definition AssociatedFunction_insert : Instance.t := {
    Notations.double_colon := insert;
  }.
  
  Parameter new :
      Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V].
  
  Definition AssociatedFunction_new : Instance.t := {
    Notations.double_colon := new;
  }.
  
  Parameter remove :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V]])
        ->
        K ->
        Ty.path "unit".
  
  Definition AssociatedFunction_remove : Instance.t := {
    Notations.double_colon := remove;
  }.
  
  Parameter size :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V]])
        ->
        K ->
        Ty.apply (Ty.path "core::option::Option") [Ty.path "u32"].
  
  Definition AssociatedFunction_size : Instance.t := {
    Notations.double_colon := size;
  }.
  
  Parameter take :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mapping") [K; V]])
        ->
        K ->
        Ty.apply (Ty.path "core::option::Option") [V].
  
  Definition AssociatedFunction_take : Instance.t := {
    Notations.double_colon := take;
  }.
End Impl_mapping_integration_tests_Mapping_K_V.
End Impl_mapping_integration_tests_Mapping_K_V.



Module  Impl_core_default_Default_for_mapping_integration_tests_AccountId.
Section Impl_core_default_Default_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::AccountId") [].
  
  Parameter default :
      Ty.apply (Ty.path "mapping_integration_tests::AccountId") [].
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  Definition ℐ : Instance.t := [("default", default)].
End Impl_core_default_Default_for_mapping_integration_tests_AccountId.
End Impl_core_default_Default_for_mapping_integration_tests_AccountId.

Module  Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.
Section Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::AccountId") [].
  
  Parameter clone :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "mapping_integration_tests::AccountId") []])
        ->
        Ty.apply (Ty.path "mapping_integration_tests::AccountId") [].
  
  Definition AssociatedFunction_clone : Instance.t := {
    Notations.double_colon := clone;
  }.
  
  Definition ℐ : Instance.t := [("clone", clone); ("clone_from", clone_from)].
End Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.
End Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.

Module  Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.
Section Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::AccountId") [].
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.
End Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.

Axiom Balance : Ty.path "u128".



Module  Impl_mapping_integration_tests_Env.
Section Impl_mapping_integration_tests_Env.
  Definition Self : Set :=
    Ty.apply (Ty.path "mapping_integration_tests::Env") [].
  
  Parameter caller :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Env") []])
        ->
        Ty.apply (Ty.path "mapping_integration_tests::AccountId") [].
  
  Definition AssociatedFunction_caller : Instance.t := {
    Notations.double_colon := caller;
  }.
End Impl_mapping_integration_tests_Env.
End Impl_mapping_integration_tests_Env.



Module  Impl_core_default_Default_for_mapping_integration_tests_Mappings.
Section Impl_core_default_Default_for_mapping_integration_tests_Mappings.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::Mappings") [].
  
  Parameter default :
      Ty.apply (Ty.path "mapping_integration_tests::Mappings") [].
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  Definition ℐ : Instance.t := [("default", default)].
End Impl_core_default_Default_for_mapping_integration_tests_Mappings.
End Impl_core_default_Default_for_mapping_integration_tests_Mappings.

Module  Impl_mapping_integration_tests_Mappings.
Section Impl_mapping_integration_tests_Mappings.
  Definition Self : Set :=
    Ty.apply (Ty.path "mapping_integration_tests::Mappings") [].
  
  Parameter init_env : Ty.apply (Ty.path "mapping_integration_tests::Env") [].
  
  Definition AssociatedFunction_init_env : Instance.t := {
    Notations.double_colon := init_env;
  }.
  
  Parameter env : Ty.apply (Ty.path "mapping_integration_tests::Env") [].
  
  Definition AssociatedFunction_env : Instance.t := {
    Notations.double_colon := env;
  }.
  
  Parameter new : Ty.apply (Ty.path "mapping_integration_tests::Mappings") [].
  
  Definition AssociatedFunction_new : Instance.t := {
    Notations.double_colon := new;
  }.
  
  Parameter get_balance :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mappings") []])
        ->
        Ty.apply (Ty.path "core::option::Option") [Ty.path "u128"].
  
  Definition AssociatedFunction_get_balance : Instance.t := {
    Notations.double_colon := get_balance;
  }.
  
  Parameter insert_balance :
      (Ty.apply
          (Ty.path "mut_ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mappings") []])
        ->
        (Ty.path "u128") ->
        Ty.apply (Ty.path "core::option::Option") [Ty.path "u32"].
  
  Definition AssociatedFunction_insert_balance : Instance.t := {
    Notations.double_colon := insert_balance;
  }.
  
  Parameter size_balance :
      (Ty.apply
          (Ty.path "mut_ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mappings") []])
        ->
        Ty.apply (Ty.path "core::option::Option") [Ty.path "u32"].
  
  Definition AssociatedFunction_size_balance : Instance.t := {
    Notations.double_colon := size_balance;
  }.
  
  Parameter contains_balance :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mappings") []])
        ->
        Ty.path "bool".
  
  Definition AssociatedFunction_contains_balance : Instance.t := {
    Notations.double_colon := contains_balance;
  }.
  
  Parameter remove_balance :
      (Ty.apply
          (Ty.path "mut_ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mappings") []])
        ->
        Ty.path "unit".
  
  Definition AssociatedFunction_remove_balance : Instance.t := {
    Notations.double_colon := remove_balance;
  }.
  
  Parameter take_balance :
      (Ty.apply
          (Ty.path "mut_ref")
          [Ty.apply (Ty.path "mapping_integration_tests::Mappings") []])
        ->
        Ty.apply (Ty.path "core::option::Option") [Ty.path "u128"].
  
  Definition AssociatedFunction_take_balance : Instance.t := {
    Notations.double_colon := take_balance;
  }.
End Impl_mapping_integration_tests_Mappings.
End Impl_mapping_integration_tests_Mappings.
