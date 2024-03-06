(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Type := {
  }.
  Global Set Primitive Projections.
End Foo.

Module Bar.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Type := {
  }.
  Global Set Primitive Projections.
End Bar.

Module Tar.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Type := {
  }.
  Global Set Primitive Projections.
End Tar.

Module SomeTrait.
  Class Trait (Self : Set) : Type := {
    SomeType : Set;
    ℒ_0 :: traits_parms.Foo.Trait SomeType;
    ℒ_1 :: traits_parms.Bar.Trait SomeType;
    ℒ_2 :: traits_parms.Tar.Trait SomeType;
    some_fn : Ty.function [] (Ty.path "unit");
  }.
  
  Definition Method_SomeType `(Trait) : Instance.t := {
    Notations.double_colon_type := SomeType;
  }.
End SomeTrait.

(* Struct SomeOtherType *)

Module Impl_traits_parms_Foo_for_traits_parms_SomeOtherType.
  Definition Self : Ty.t := Ty.path "traits_parms::SomeOtherType".
  
  Definition ℐ : Instance.t := [].
End Impl_traits_parms_Foo_for_traits_parms_SomeOtherType.

Module Impl_traits_parms_Bar_for_traits_parms_SomeOtherType.
  Definition Self : Ty.t := Ty.path "traits_parms::SomeOtherType".
  
  Definition ℐ : Instance.t := [].
End Impl_traits_parms_Bar_for_traits_parms_SomeOtherType.

Module Impl_traits_parms_Tar_for_traits_parms_SomeOtherType.
  Definition Self : Ty.t := Ty.path "traits_parms::SomeOtherType".
  
  Definition ℐ : Instance.t := [].
End Impl_traits_parms_Tar_for_traits_parms_SomeOtherType.

Module Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType.
  Definition Self : Ty.t := Ty.path "traits_parms::SomeOtherType".
  
  Definition SomeType : Set := Ty.path "traits_parms::SomeOtherType".
  
  Parameter some_fn : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("SomeType", TODO);
    ("some_fn", InstanceField.Method some_fn)].
End Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType.
