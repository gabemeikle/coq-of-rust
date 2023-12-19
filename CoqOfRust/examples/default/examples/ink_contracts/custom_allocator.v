(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  CustomAllocator.
Section CustomAllocator.
  Record t : Set := {
    value : alloc.vec.Vec.t bool.t alloc.vec.Vec.Default.A;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End CustomAllocator.
End CustomAllocator.

Module  Impl_custom_allocator_CustomAllocator_t.
Section Impl_custom_allocator_CustomAllocator_t.
  Ltac Self := exact custom_allocator.CustomAllocator.t.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self {
              value: vec![init_value],
          }
      }
  *)
  Definition new (init_value : bool.t) : M ltac:(Self) :=
    let* init_value : M.Val bool.t := M.alloc init_value in
    let* α0 : bool.t := M.read init_value in
    let* α1 : M.Val (array bool.t) := M.alloc [ α0 ] in
    let* α2 : M.Val (alloc.boxed.Box.t (array bool.t) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α1) in
    let* α3 : alloc.boxed.Box.t (slice bool.t) alloc.alloc.Global.t :=
      M.read (pointer_coercion "Unsize" α2) in
    let* α4 : alloc.vec.Vec.t bool.t alloc.alloc.Global.t :=
      M.call ((slice bool.t)::["into_vec"] α3) in
    M.pure {| custom_allocator.CustomAllocator.value := α4; |}.
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition default : M ltac:(Self) :=
    let* α0 : bool.t :=
      M.call
        (core.default.Default.default
          (Self := bool.t)
          (Trait := ltac:(refine _))) in
    M.call (custom_allocator.CustomAllocator.t::["new"] α0).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon ltac:(Self) "default" := {
    Notations.double_colon := default;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value[0] = !self.value[0];
      }
  *)
  Definition flip (self : mut_ref ltac:(Self)) : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref custom_allocator.CustomAllocator.t := M.read self in
      let* α1 : mut_ref bool.t :=
        M.call
          ((core.ops.index.IndexMut.index_mut
              (Self := alloc.vec.Vec.t bool.t alloc.alloc.Global.t)
              (Trait := ltac:(refine _)))
            (borrow_mut (deref α0).["value"])
            (Integer.of_Z 0)) in
      let* α2 : mut_ref custom_allocator.CustomAllocator.t := M.read self in
      let* α3 : ref bool.t :=
        M.call
          ((core.ops.index.Index.index
              (Self := alloc.vec.Vec.t bool.t alloc.alloc.Global.t)
              (Trait := ltac:(refine _)))
            (borrow (deref α2).["value"])
            (Integer.of_Z 0)) in
      let* α4 : bool.t := M.read (deref α3) in
      assign (deref α1) (UnOp.not α4) in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon ltac:(Self) "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value[0]
      }
  *)
  Definition get (self : ref ltac:(Self)) : M bool.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref custom_allocator.CustomAllocator.t := M.read self in
    let* α1 : ref bool.t :=
      M.call
        ((core.ops.index.Index.index
            (Self := alloc.vec.Vec.t bool.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          (borrow (deref α0).["value"])
          (Integer.of_Z 0)) in
    M.read (deref α1).
  
  Global Instance AssociatedFunction_get :
    Notations.DoubleColon ltac:(Self) "get" := {
    Notations.double_colon := get;
  }.
End Impl_custom_allocator_CustomAllocator_t.
End Impl_custom_allocator_CustomAllocator_t.
