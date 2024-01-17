(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  CustomAllocator.
Section CustomAllocator.
  Record t : Set := {
    value : alloc.vec.Vec.t bool.t alloc.vec.Vec.Default.A;
  }.
  
  Definition Get_value :=
    Ref.map (fun α => Some α.(value)) (fun β α => Some (α <| value := β |>)).
End CustomAllocator.
End CustomAllocator.

Module  Impl_custom_allocator_CustomAllocator_t.
Section Impl_custom_allocator_CustomAllocator_t.
  Definition Self : Set := custom_allocator.CustomAllocator.t.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self {
              value: vec![init_value],
          }
      }
  *)
  Definition new (init_value : bool.t) : M Self :=
    let* init_value := M.alloc init_value in
    let* α0 : bool.t := M.read init_value in
    let* α1 : M.Val (array bool.t) := M.alloc [ α0 ] in
    let* α2 : M.Val (alloc.boxed.Box.t (array bool.t) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"] α1) in
    let* α3 : alloc.boxed.Box.t (array bool.t) alloc.alloc.Global.t :=
      M.read α2 in
    let* α4 : alloc.vec.Vec.t bool.t alloc.alloc.Global.t :=
      M.call ((slice bool.t)::["into_vec"] (pointer_coercion "Unsize" α3)) in
    M.pure {| custom_allocator.CustomAllocator.value := α4; |}.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition default : M Self :=
    let* α0 : M bool.t :=
      ltac:(M.get_method (fun ℐ =>
        core.default.Default.default (Self := bool.t) (Trait := ℐ))) in
    let* α1 : bool.t := M.call α0 in
    M.call (custom_allocator.CustomAllocator.t::["new"] α1).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value[0] = !self.value[0];
      }
  *)
  Definition flip (self : mut_ref Self) : M unit :=
    let* self := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 :
          (mut_ref (alloc.vec.Vec.t bool.t alloc.alloc.Global.t)) ->
            usize.t ->
            M (mut_ref _) :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.index.IndexMut.index_mut
            (Self := alloc.vec.Vec.t bool.t alloc.alloc.Global.t)
            (Idx := usize.t)
            (Trait := ℐ))) in
      let* α1 : mut_ref custom_allocator.CustomAllocator.t := M.read self in
      let* α2 : mut_ref bool.t :=
        M.call
          (α0
            (borrow_mut (custom_allocator.CustomAllocator.Get_value (deref α1)))
            ((Integer.of_Z 0) : usize.t)) in
      let* α3 :
          (ref (alloc.vec.Vec.t bool.t alloc.alloc.Global.t)) ->
            usize.t ->
            M (ref _) :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.index.Index.index
            (Self := alloc.vec.Vec.t bool.t alloc.alloc.Global.t)
            (Idx := usize.t)
            (Trait := ℐ))) in
      let* α4 : mut_ref custom_allocator.CustomAllocator.t := M.read self in
      let* α5 : ref bool.t :=
        M.call
          (α3
            (borrow (custom_allocator.CustomAllocator.Get_value (deref α4)))
            ((Integer.of_Z 0) : usize.t)) in
      let* α6 : bool.t := M.read (deref α5) in
      assign (deref α2) (UnOp.not α6) in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon Self "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value[0]
      }
  *)
  Definition get (self : ref Self) : M bool.t :=
    let* self := M.alloc self in
    let* α0 :
        (ref (alloc.vec.Vec.t bool.t alloc.alloc.Global.t)) ->
          usize.t ->
          M (ref _) :=
      ltac:(M.get_method (fun ℐ =>
        core.ops.index.Index.index
          (Self := alloc.vec.Vec.t bool.t alloc.alloc.Global.t)
          (Idx := usize.t)
          (Trait := ℐ))) in
    let* α1 : ref custom_allocator.CustomAllocator.t := M.read self in
    let* α2 : ref bool.t :=
      M.call
        (α0
          (borrow (custom_allocator.CustomAllocator.Get_value (deref α1)))
          ((Integer.of_Z 0) : usize.t)) in
    M.read (deref α2).
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
End Impl_custom_allocator_CustomAllocator_t.
End Impl_custom_allocator_CustomAllocator_t.
