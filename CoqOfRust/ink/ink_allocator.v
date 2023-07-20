(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module bump.
  Definition PAGE_SIZE `{H : State.Trait} : usize := run (64.["mul"] 1024).
  
  Definition INNER `{H : State.Trait} : ink_allocator.bump.InnerAlloc :=
    run (ink_allocator.bump.InnerAlloc::["new"]).
  
  Module BumpAllocator.
    Inductive t : Set := Build.
  End BumpAllocator.
  Definition BumpAllocator := BumpAllocator.t.
  
  Module
    Impl_core_alloc_global_GlobalAlloc_for_ink_allocator_bump_BumpAllocator.
    Definition Self := ink_allocator.bump.BumpAllocator.
    
    Parameter alloc : forall `{H : State.Trait},
        ref Self ->
        core.alloc.layout.Layout ->
        M (H := H) (mut_ref u8).
    
    Global Instance Method_alloc `{H : State.Trait} : Notation.Dot "alloc" := {
      Notation.dot := alloc;
    }.
    
    Parameter alloc_zeroed : forall `{H : State.Trait},
        ref Self ->
        core.alloc.layout.Layout ->
        M (H := H) (mut_ref u8).
    
    Global Instance Method_alloc_zeroed `{H : State.Trait} :
      Notation.Dot "alloc_zeroed" := {
      Notation.dot := alloc_zeroed;
    }.
    
    Parameter dealloc : forall `{H : State.Trait},
        ref Self ->
        mut_ref u8 ->
        core.alloc.layout.Layout ->
        M (H := H) unit.
    
    Global Instance Method_dealloc `{H : State.Trait} :
      Notation.Dot "dealloc" := {
      Notation.dot := dealloc;
    }.
    
    Global Instance I : core.alloc.global.GlobalAlloc.Trait Self := {
      core.alloc.global.GlobalAlloc.alloc `{H : State.Trait} := alloc;
      core.alloc.global.GlobalAlloc.dealloc `{H : State.Trait} := dealloc;
    }.
  End Impl_core_alloc_global_GlobalAlloc_for_ink_allocator_bump_BumpAllocator.
  
  Module InnerAlloc.
    Record t : Set := {
      next : usize;
      upper_limit : usize;
    }.
    
    Global Instance Get_next : Notation.Dot "next" := {
      Notation.dot '(Build_t x0 _) := x0;
    }.
    Global Instance Get_upper_limit : Notation.Dot "upper_limit" := {
      Notation.dot '(Build_t _ x1) := x1;
    }.
  End InnerAlloc.
  Definition InnerAlloc : Set := InnerAlloc.t.
  
  Module Impl_core_fmt_Debug_for_ink_allocator_bump_InnerAlloc.
    Definition Self := ink_allocator.bump.InnerAlloc.
    
    Parameter debug_struct_field2_finish : core.fmt.Formatter -> string -> 
      string -> usize -> 
      string -> usize -> 
      M (H := H) core.fmt.Result.
    
    Global Instance Deb_debug_struct_field2_finish : Notation.DoubleColon
      core.fmt.Formatter "debug_struct_field2_finish" := {
      Notation.double_colon := debug_struct_field2_finish; }.
    
    Parameter fmt : forall `{H : State.Trait},
        ref Self ->
        mut_ref core.fmt.Formatter ->
        M (H := H) core.fmt.Result.
    
    Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H : State.Trait} := fmt;
    }.
  End Impl_core_fmt_Debug_for_ink_allocator_bump_InnerAlloc.
  
  Module Impl_core_marker_Copy_for_ink_allocator_bump_InnerAlloc.
    Definition Self := ink_allocator.bump.InnerAlloc.
    
    Global Instance I : core.marker.Copy.Trait Self :=
      core.marker.Copy.Build_Trait _.
  End Impl_core_marker_Copy_for_ink_allocator_bump_InnerAlloc.
  
  Module Impl_core_clone_Clone_for_ink_allocator_bump_InnerAlloc.
    Definition Self := ink_allocator.bump.InnerAlloc.
    
    Parameter clone : forall `{H : State.Trait},
        ref Self ->
        M (H := H) ink_allocator.bump.InnerAlloc.
    
    Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
      Notation.dot := clone;
    }.
    
    Global Instance I : core.clone.Clone.Trait Self := {
      core.clone.Clone.clone `{H : State.Trait} := clone;
    }.
  End Impl_core_clone_Clone_for_ink_allocator_bump_InnerAlloc.
  
  Module Impl_ink_allocator_bump_InnerAlloc.
    Definition Self := ink_allocator.bump.InnerAlloc.
    
    Parameter new : forall `{H : State.Trait}, M (H := H) Self.
    
    Global Instance AssociatedFunction_new `{H : State.Trait} :
      Notation.DoubleColon Self "new" := {
      Notation.double_colon := new;
    }.
    
    Parameter heap_start : forall `{H : State.Trait}, M (H := H) usize.
    
    Global Instance AssociatedFunction_heap_start `{H : State.Trait} :
      Notation.DoubleColon Self "heap_start" := {
      Notation.double_colon := heap_start;
    }.
    
    Parameter heap_end : forall `{H : State.Trait}, M (H := H) usize.
    
    Global Instance AssociatedFunction_heap_end `{H : State.Trait} :
      Notation.DoubleColon Self "heap_end" := {
      Notation.double_colon := heap_end;
    }.
    
    Parameter request_pages : forall `{H : State.Trait},
        mut_ref Self ->
        usize ->
        M (H := H) (core.option.Option usize).
    
    Global Instance Method_request_pages `{H : State.Trait} :
      Notation.Dot "request_pages" := {
      Notation.dot := request_pages;
    }.
    
    Parameter alloc : forall `{H : State.Trait},
        mut_ref Self ->
        core.alloc.layout.Layout ->
        M (H := H) (core.option.Option usize).
    
    Global Instance Method_alloc `{H : State.Trait} : Notation.Dot "alloc" := {
      Notation.dot := alloc;
    }.
  End Impl_ink_allocator_bump_InnerAlloc.
  
  Parameter required_pages : forall `{H : State.Trait},
      usize ->
      M (H := H) (core.option.Option usize).
End bump.

Definition PAGE_SIZE `{H : State.Trait} : usize := run (64.["mul"] 1024).

Definition INNER `{H : State.Trait} : ink_allocator.bump.InnerAlloc :=
  run (ink_allocator.bump.InnerAlloc::["new"]).

Module BumpAllocator.
  Inductive t : Set := Build.
End BumpAllocator.
Definition BumpAllocator := BumpAllocator.t.

Module Impl_core_alloc_global_GlobalAlloc_for_ink_allocator_bump_BumpAllocator.
  Definition Self := ink_allocator.bump.BumpAllocator.
  
  Parameter alloc : forall `{H : State.Trait},
      ref Self ->
      core.alloc.layout.Layout ->
      M (H := H) (mut_ref u8).
  
  Global Instance Method_alloc `{H : State.Trait} : Notation.Dot "alloc" := {
    Notation.dot := alloc;
  }.
  
  Parameter alloc_zeroed : forall `{H : State.Trait},
      ref Self ->
      core.alloc.layout.Layout ->
      M (H := H) (mut_ref u8).
  
  Global Instance Method_alloc_zeroed `{H : State.Trait} :
    Notation.Dot "alloc_zeroed" := {
    Notation.dot := alloc_zeroed;
  }.
  
  Parameter dealloc : forall `{H : State.Trait},
      ref Self ->
      mut_ref u8 ->
      core.alloc.layout.Layout ->
      M (H := H) unit.
  
  Global Instance Method_dealloc `{H : State.Trait} :
    Notation.Dot "dealloc" := {
    Notation.dot := dealloc;
  }.
  
  Global Instance I : core.alloc.global.GlobalAlloc.Trait Self := {
    core.alloc.global.GlobalAlloc.alloc `{H : State.Trait} := alloc;
    core.alloc.global.GlobalAlloc.dealloc `{H : State.Trait} := dealloc;
  }.
End Impl_core_alloc_global_GlobalAlloc_for_ink_allocator_bump_BumpAllocator.

Module InnerAlloc.
  Record t : Set := {
    next : usize;
    upper_limit : usize;
  }.
  
  Global Instance Get_next : Notation.Dot "next" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_upper_limit : Notation.Dot "upper_limit" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End InnerAlloc.
Definition InnerAlloc : Set := InnerAlloc.t.

Module Impl_core_fmt_Debug_for_ink_allocator_bump_InnerAlloc.
  Definition Self := ink_allocator.bump.InnerAlloc.
  
  Parameter debug_struct_field2_finish : core.fmt.Formatter -> string -> 
    string -> usize -> 
    string -> usize -> 
    M (H := H) core.fmt.Result.
  
  Global Instance Deb_debug_struct_field2_finish : Notation.DoubleColon
    core.fmt.Formatter "debug_struct_field2_finish" := {
    Notation.double_colon := debug_struct_field2_finish; }.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_ink_allocator_bump_InnerAlloc.

Module Impl_core_marker_Copy_for_ink_allocator_bump_InnerAlloc.
  Definition Self := ink_allocator.bump.InnerAlloc.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End Impl_core_marker_Copy_for_ink_allocator_bump_InnerAlloc.

Module Impl_core_clone_Clone_for_ink_allocator_bump_InnerAlloc.
  Definition Self := ink_allocator.bump.InnerAlloc.
  
  Parameter clone : forall `{H : State.Trait},
      ref Self ->
      M (H := H) ink_allocator.bump.InnerAlloc.
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_ink_allocator_bump_InnerAlloc.

Module Impl_ink_allocator_bump_InnerAlloc_2.
  Definition Self := ink_allocator.bump.InnerAlloc.
  
  Parameter new : forall `{H : State.Trait}, M (H := H) Self.
  
  Global Instance AssociatedFunction_new `{H : State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
  
  Parameter heap_start : forall `{H : State.Trait}, M (H := H) usize.
  
  Global Instance AssociatedFunction_heap_start `{H : State.Trait} :
    Notation.DoubleColon Self "heap_start" := {
    Notation.double_colon := heap_start;
  }.
  
  Parameter heap_end : forall `{H : State.Trait}, M (H := H) usize.
  
  Global Instance AssociatedFunction_heap_end `{H : State.Trait} :
    Notation.DoubleColon Self "heap_end" := {
    Notation.double_colon := heap_end;
  }.
  
  Parameter request_pages : forall `{H : State.Trait},
      mut_ref Self ->
      usize ->
      M (H := H) (core.option.Option usize).
  
  Global Instance Method_request_pages `{H : State.Trait} :
    Notation.Dot "request_pages" := {
    Notation.dot := request_pages;
  }.
  
  Parameter alloc : forall `{H : State.Trait},
      mut_ref Self ->
      core.alloc.layout.Layout ->
      M (H := H) (core.option.Option usize).
  
  Global Instance Method_alloc `{H : State.Trait} : Notation.Dot "alloc" := {
    Notation.dot := alloc;
  }.
End Impl_ink_allocator_bump_InnerAlloc_2.

Parameter required_pages : forall `{H : State.Trait},
    usize ->
    M (H := H) (core.option.Option usize).
