(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module bump.
  Module BumpAllocator.
    Inductive t : Set := Build.
  End BumpAllocator.
  Definition BumpAllocator := @BumpAllocator.t.
  
  Module
    Impl_core_alloc_global_GlobalAlloc_for_ink_allocator_bump_BumpAllocator.
    Definition Self := ink_allocator.bump.BumpAllocator.
    
    Parameter alloc :
        forall `{H' : State.Trait},
        (ref Self) -> core.alloc.layout.Layout -> M (H := H') (mut_ref u8).
    
    Global Instance Method_alloc `{H' : State.Trait} : Notation.Dot "alloc" := {
      Notation.dot := alloc;
    }.
    
    Parameter alloc_zeroed :
        forall `{H' : State.Trait},
        (ref Self) -> core.alloc.layout.Layout -> M (H := H') (mut_ref u8).
    
    Global Instance Method_alloc_zeroed `{H' : State.Trait} :
      Notation.Dot "alloc_zeroed" := {
      Notation.dot := alloc_zeroed;
    }.
    
    Parameter dealloc :
        forall `{H' : State.Trait},
        (ref Self) ->
          (mut_ref u8) ->
          core.alloc.layout.Layout ->
          M (H := H') unit.
    
    Global Instance Method_dealloc `{H' : State.Trait} :
      Notation.Dot "dealloc" := {
      Notation.dot := dealloc;
    }.
    
    Global Instance I : core.alloc.global.GlobalAlloc.Trait Self := {
      core.alloc.global.GlobalAlloc.alloc `{H' : State.Trait} := alloc;
      core.alloc.global.GlobalAlloc.dealloc `{H' : State.Trait} := dealloc;
    }.
    Global Hint Resolve I : core.
  End Impl_core_alloc_global_GlobalAlloc_for_ink_allocator_bump_BumpAllocator.
  
  (* Module Impl_core_fmt_Debug_for_ink_allocator_bump_InnerAlloc.
    Definition Self := ink_allocator.bump.InnerAlloc.
    
    Parameter fmt :
        forall `{H' : State.Trait},
        (ref Self) ->
          (mut_ref core.fmt.Formatter) ->
          M (H := H') core.fmt.Result.
    
    Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
    }.
    Global Hint Resolve I : core.
  End Impl_core_fmt_Debug_for_ink_allocator_bump_InnerAlloc. *)
  
  (* Module Impl_core_marker_Copy_for_ink_allocator_bump_InnerAlloc.
    Definition Self := ink_allocator.bump.InnerAlloc.
    
    Global Instance I : core.marker.Copy.Trait Self := {
    }.
    Global Hint Resolve I : core.
  End Impl_core_marker_Copy_for_ink_allocator_bump_InnerAlloc. *)
  
  (* Module Impl_core_clone_Clone_for_ink_allocator_bump_InnerAlloc.
    Definition Self := ink_allocator.bump.InnerAlloc.
    
    Parameter clone :
        forall `{H' : State.Trait},
        (ref Self) -> M (H := H') ink_allocator.bump.InnerAlloc.
    
    Global Instance Method_clone `{H' : State.Trait} : Notation.Dot "clone" := {
      Notation.dot := clone;
    }.
    
    Global Instance I : core.clone.Clone.Trait Self := {
      core.clone.Clone.clone `{H' : State.Trait} := clone;
    }.
    Global Hint Resolve I : core.
  End Impl_core_clone_Clone_for_ink_allocator_bump_InnerAlloc. *)
End bump.

Module BumpAllocator.
  Inductive t : Set := Build.
End BumpAllocator.
Definition BumpAllocator := @BumpAllocator.t.

Module Impl_core_alloc_global_GlobalAlloc_for_ink_allocator_bump_BumpAllocator.
  Definition Self := ink_allocator.bump.BumpAllocator.
  
  Parameter alloc :
      forall `{H' : State.Trait},
      (ref Self) -> core.alloc.layout.Layout -> M (H := H') (mut_ref u8).
  
  Global Instance Method_alloc `{H' : State.Trait} : Notation.Dot "alloc" := {
    Notation.dot := alloc;
  }.
  
  Parameter alloc_zeroed :
      forall `{H' : State.Trait},
      (ref Self) -> core.alloc.layout.Layout -> M (H := H') (mut_ref u8).
  
  Global Instance Method_alloc_zeroed `{H' : State.Trait} :
    Notation.Dot "alloc_zeroed" := {
    Notation.dot := alloc_zeroed;
  }.
  
  Parameter dealloc :
      forall `{H' : State.Trait},
      (ref Self) ->
        (mut_ref u8) ->
        core.alloc.layout.Layout ->
        M (H := H') unit.
  
  Global Instance Method_dealloc `{H' : State.Trait} :
    Notation.Dot "dealloc" := {
    Notation.dot := dealloc;
  }.
  
  Global Instance I : core.alloc.global.GlobalAlloc.Trait Self := {
    core.alloc.global.GlobalAlloc.alloc `{H' : State.Trait} := alloc;
    core.alloc.global.GlobalAlloc.dealloc `{H' : State.Trait} := dealloc;
  }.
  Global Hint Resolve I : core.
End Impl_core_alloc_global_GlobalAlloc_for_ink_allocator_bump_BumpAllocator.

(* Module Impl_core_fmt_Debug_for_ink_allocator_bump_InnerAlloc.
  Definition Self := ink_allocator.bump.InnerAlloc.
  
  Parameter fmt :
      forall `{H' : State.Trait},
      (ref Self) -> (mut_ref core.fmt.Formatter) -> M (H := H') core.fmt.Result.
  
  Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_ink_allocator_bump_InnerAlloc. *)

(* Module Impl_core_marker_Copy_for_ink_allocator_bump_InnerAlloc.
  Definition Self := ink_allocator.bump.InnerAlloc.
  
  Global Instance I : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End Impl_core_marker_Copy_for_ink_allocator_bump_InnerAlloc. *)

(* Module Impl_core_clone_Clone_for_ink_allocator_bump_InnerAlloc.
  Definition Self := ink_allocator.bump.InnerAlloc.
  
  Parameter clone :
      forall `{H' : State.Trait},
      (ref Self) -> M (H := H') ink_allocator.bump.InnerAlloc.
  
  Global Instance Method_clone `{H' : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H' : State.Trait} := clone;
  }.
  Global Hint Resolve I : core.
End Impl_core_clone_Clone_for_ink_allocator_bump_InnerAlloc. *)
