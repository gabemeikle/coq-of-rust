(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Section
    Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
    Context {A B : Set}.
    Definition Self := generics_phantom_type.PhantomTuple A B.
    
    Global Instance I : core.marker.StructuralPartialEq.Trait Self := {
    }.
  End
    Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Global Hint Resolve I : core.
End
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.

Module Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Section Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.
    Context {A B : Set}.
    Definition Self := generics_phantom_type.PhantomTuple A B.
    
    Parameter eq :
        forall `{H' : State.Trait},
        (ref Self) ->
          (ref (generics_phantom_type.PhantomTuple A B)) ->
          M (H := H') bool.
    
    Global Instance Method_eq `{H' : State.Trait} : Notation.Dot "eq" := {
      Notation.dot := eq;
    }.
    
    Global Instance I
      : core.cmp.PartialEq.Trait Self
          (Rhs := core.cmp.PartialEq.Default.Rhs Self)
        := {
      core.cmp.PartialEq.eq `{H' : State.Trait} := eq;
    }.
  End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Global Hint Resolve I : core.
End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.

Module
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Section
    Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
    Context {A B : Set}.
    Definition Self := generics_phantom_type.PhantomStruct A B.
    
    Global Instance I : core.marker.StructuralPartialEq.Trait Self := {
    }.
  End
    Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Global Hint Resolve I : core.
End
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.

Module Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Section Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
    Context {A B : Set}.
    Definition Self := generics_phantom_type.PhantomStruct A B.
    
    Parameter eq :
        forall `{H' : State.Trait},
        (ref Self) ->
          (ref (generics_phantom_type.PhantomStruct A B)) ->
          M (H := H') bool.
    
    Global Instance Method_eq `{H' : State.Trait} : Notation.Dot "eq" := {
      Notation.dot := eq;
    }.
    
    Global Instance I
      : core.cmp.PartialEq.Trait Self
          (Rhs := core.cmp.PartialEq.Default.Rhs Self)
        := {
      core.cmp.PartialEq.eq `{H' : State.Trait} := eq;
    }.
  End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Global Hint Resolve I : core.
End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
