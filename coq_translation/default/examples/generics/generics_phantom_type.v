(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module PhantomTuple.
  Section PhantomTuple.
    Context `{ℋ : State.Trait}.
    
    Context {A B : Set}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : A;
      x1 : core.marker.PhantomData B;
    }.
    Global Set Primitive Projections.
    
    #[refine] Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_1 : Notation.Dot "1" := {
      Notation.dot x := let* x := M.read x in Pure x.(x1) : M _;
    }.
    Admitted.
  End PhantomTuple.
End PhantomTuple.
Definition PhantomTuple `{ℋ : State.Trait} (A B : Set) : Set :=
  M.val (PhantomTuple.t (A := A) (B := B)).

Module
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Section
    Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
    Context `{ℋ : State.Trait}.
    
    Context {A B : Set}.
    
    Definition Self : Set := generics_phantom_type.PhantomTuple A B.
    
    #[refine] Global Instance ℐ :
      core.marker.StructuralPartialEq.Trait Self := {
    }.
    Admitted.
  End
    Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Global Hint Resolve ℐ : core.
End
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.

Module Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Section Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.
    Context `{ℋ : State.Trait}.
    
    Context {A B : Set}.
    
    Context
      {ℋ_0 :
        core.cmp.PartialEq.Trait A (Rhs := core.cmp.PartialEq.Default.Rhs A)}
      {ℋ_1 :
        core.cmp.PartialEq.Trait B (Rhs := core.cmp.PartialEq.Default.Rhs B)}.
    Definition Self : Set := generics_phantom_type.PhantomTuple A B.
    
    Definition eq
        (self : ref Self)
        (other : ref (generics_phantom_type.PhantomTuple A B))
        : M bool :=
      let* α0 := deref self (generics_phantom_type.PhantomTuple A B) in
      let* α1 := α0.["0"] in
      let* α2 := borrow α1 A in
      let* α3 := deref other (generics_phantom_type.PhantomTuple A B) in
      let* α4 := α3.["0"] in
      let* α5 := borrow α4 A in
      let* α6 := (core.cmp.PartialEq.eq (Self := A)) α2 α5 in
      let* α7 := deref self (generics_phantom_type.PhantomTuple A B) in
      let* α8 := α7.["1"] in
      let* α9 := borrow α8 (core.marker.PhantomData B) in
      let* α10 := deref other (generics_phantom_type.PhantomTuple A B) in
      let* α11 := α10.["1"] in
      let* α12 := borrow α11 (core.marker.PhantomData B) in
      let* α13 :=
        (core.cmp.PartialEq.eq (Self := (core.marker.PhantomData B))) α9 α12 in
      and α6 α13.
    
    Global Instance AssociatedFunction_eq : Notation.DoubleColon Self "eq" := {
      Notation.double_colon := eq;
    }.
    
    #[refine] Global Instance ℐ :
      core.cmp.PartialEq.Trait Self
        (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
      core.cmp.PartialEq.eq := eq;
    }.
    Admitted.
  End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Global Hint Resolve ℐ : core.
End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.

Module PhantomStruct.
  Section PhantomStruct.
    Context `{ℋ : State.Trait}.
    
    Context {A B : Set}.
    
    Unset Primitive Projections.
    Record t : Set := {
      first : A;
      phantom : core.marker.PhantomData B;
    }.
    Global Set Primitive Projections.
    
    #[refine] Global Instance Get_first : Notation.Dot "first" := {
      Notation.dot x := let* x := M.read x in Pure x.(first) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_first : Notation.DoubleColon t "first" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(first) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_phantom : Notation.Dot "phantom" := {
      Notation.dot x := let* x := M.read x in Pure x.(phantom) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_phantom :
      Notation.DoubleColon t "phantom" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(phantom) : M _;
    }.
    Admitted.
  End PhantomStruct.
End PhantomStruct.
Definition PhantomStruct (A B : Set) `{ℋ : State.Trait} : Set :=
  M.val (PhantomStruct.t (A := A) (B := B)).

Module
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Section
    Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
    Context `{ℋ : State.Trait}.
    
    Context {A B : Set}.
    
    Definition Self : Set := generics_phantom_type.PhantomStruct A B.
    
    #[refine] Global Instance ℐ :
      core.marker.StructuralPartialEq.Trait Self := {
    }.
    Admitted.
  End
    Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Global Hint Resolve ℐ : core.
End
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.

Module Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Section Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
    Context `{ℋ : State.Trait}.
    
    Context {A B : Set}.
    
    Context
      {ℋ_0 :
        core.cmp.PartialEq.Trait A (Rhs := core.cmp.PartialEq.Default.Rhs A)}
      {ℋ_1 :
        core.cmp.PartialEq.Trait B (Rhs := core.cmp.PartialEq.Default.Rhs B)}.
    Definition Self : Set := generics_phantom_type.PhantomStruct A B.
    
    Definition eq
        (self : ref Self)
        (other : ref (generics_phantom_type.PhantomStruct A B))
        : M bool :=
      let* α0 := deref self (generics_phantom_type.PhantomStruct A B) in
      let* α1 := α0.["first"] in
      let* α2 := borrow α1 A in
      let* α3 := deref other (generics_phantom_type.PhantomStruct A B) in
      let* α4 := α3.["first"] in
      let* α5 := borrow α4 A in
      let* α6 := (core.cmp.PartialEq.eq (Self := A)) α2 α5 in
      let* α7 := deref self (generics_phantom_type.PhantomStruct A B) in
      let* α8 := α7.["phantom"] in
      let* α9 := borrow α8 (core.marker.PhantomData B) in
      let* α10 := deref other (generics_phantom_type.PhantomStruct A B) in
      let* α11 := α10.["phantom"] in
      let* α12 := borrow α11 (core.marker.PhantomData B) in
      let* α13 :=
        (core.cmp.PartialEq.eq (Self := (core.marker.PhantomData B))) α9 α12 in
      and α6 α13.
    
    Global Instance AssociatedFunction_eq : Notation.DoubleColon Self "eq" := {
      Notation.double_colon := eq;
    }.
    
    #[refine] Global Instance ℐ :
      core.cmp.PartialEq.Trait Self
        (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
      core.cmp.PartialEq.eq := eq;
    }.
    Admitted.
  End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Global Hint Resolve ℐ : core.
End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* _tuple1 :=
    let* α0 := M.alloc "Q"%char in
    let* α1 := M.alloc (core.marker.PhantomData.Build_t tt) in
    M.alloc (generics_phantom_type.PhantomTuple.Build_t α0 α1) in
  let* _tuple2 :=
    let* α0 := M.alloc "Q"%char in
    let* α1 := M.alloc (core.marker.PhantomData.Build_t tt) in
    M.alloc (generics_phantom_type.PhantomTuple.Build_t α0 α1) in
  let* _struct1 :=
    let* α0 := M.alloc "Q"%char in
    let* α1 := M.alloc (core.marker.PhantomData.Build_t tt) in
    M.alloc
      {|
        generics_phantom_type.PhantomStruct.first := α0;
        generics_phantom_type.PhantomStruct.phantom := α1;
      |} in
  let* _struct2 :=
    let* α0 := M.alloc "Q"%char in
    let* α1 := M.alloc (core.marker.PhantomData.Build_t tt) in
    M.alloc
      {|
        generics_phantom_type.PhantomStruct.first := α0;
        generics_phantom_type.PhantomStruct.phantom := α1;
      |} in
  M.alloc tt.
