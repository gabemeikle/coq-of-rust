(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Increment.
Section Increment.
  Class Trait (Self : Set) : Type := {
    inc : (mut_ref ltac:(Self)) -> M unit;
    get : (ref ltac:(Self)) -> M u64.t;
  }.
  
End Increment.
End Increment.

Module  Reset.
Section Reset.
  Class Trait (Self : Set) : Type := {
    reset : (mut_ref ltac:(Self)) -> M unit;
  }.
  
End Reset.
End Reset.

Module  Incrementer.
Section Incrementer.
  Record t : Set := {
    value : u64.t;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End Incrementer.
End Incrementer.

Module  Impl_trait_incrementer_Incrementer_t.
Section Impl_trait_incrementer_Incrementer_t.
  Ltac Self := exact trait_incrementer.Incrementer.t.
  
  (*
      pub fn new(init_value: u64) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (init_value : u64.t) : M ltac:(Self) :=
    let* init_value : M.Val u64.t := M.alloc init_value in
    let* α0 : u64.t := M.read init_value in
    M.pure {| trait_incrementer.Incrementer.value := α0; |}.
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn inc_by(&mut self, delta: u64) {
          self.value += delta;
      }
  *)
  Definition inc_by (self : mut_ref ltac:(Self)) (delta : u64.t) : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* delta : M.Val u64.t := M.alloc delta in
    let* _ : M.Val unit :=
      let* α0 : mut_ref trait_incrementer.Incrementer.t := M.read self in
      assign_op BinOp.Panic.add (deref α0).["value"] delta in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_inc_by :
    Notations.DoubleColon ltac:(Self) "inc_by" := {
    Notations.double_colon := inc_by;
  }.
End Impl_trait_incrementer_Incrementer_t.
End Impl_trait_incrementer_Incrementer_t.

Module  Impl_trait_incrementer_Increment_for_trait_incrementer_Incrementer_t.
Section Impl_trait_incrementer_Increment_for_trait_incrementer_Incrementer_t.
  Ltac Self := exact trait_incrementer.Incrementer.t.
  
  (*
      fn inc(&mut self) {
          self.inc_by(1)
      }
  *)
  Definition inc (self : mut_ref ltac:(Self)) : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* α0 : mut_ref trait_incrementer.Incrementer.t := M.read self in
    M.call (trait_incrementer.Incrementer.t::["inc_by"] α0 (Integer.of_Z 1)).
  
  Global Instance AssociatedFunction_inc :
    Notations.DoubleColon ltac:(Self) "inc" := {
    Notations.double_colon := inc;
  }.
  
  (*
      fn get(&self) -> u64 {
          self.value
      }
  *)
  Definition get (self : ref ltac:(Self)) : M u64.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref trait_incrementer.Incrementer.t := M.read self in
    M.read (deref α0).["value"].
  
  Global Instance AssociatedFunction_get :
    Notations.DoubleColon ltac:(Self) "get" := {
    Notations.double_colon := get;
  }.
  
  Global Instance ℐ : trait_incrementer.Increment.Trait ltac:(Self) := {
    trait_incrementer.Increment.inc := inc;
    trait_incrementer.Increment.get := get;
  }.
End Impl_trait_incrementer_Increment_for_trait_incrementer_Incrementer_t.
End Impl_trait_incrementer_Increment_for_trait_incrementer_Incrementer_t.

Module  Impl_trait_incrementer_Reset_for_trait_incrementer_Incrementer_t.
Section Impl_trait_incrementer_Reset_for_trait_incrementer_Incrementer_t.
  Ltac Self := exact trait_incrementer.Incrementer.t.
  
  (*
      fn reset(&mut self) {
          self.value = 0;
      }
  *)
  Definition reset (self : mut_ref ltac:(Self)) : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref trait_incrementer.Incrementer.t := M.read self in
      assign (deref α0).["value"] (Integer.of_Z 0) in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_reset :
    Notations.DoubleColon ltac:(Self) "reset" := {
    Notations.double_colon := reset;
  }.
  
  Global Instance ℐ : trait_incrementer.Reset.Trait ltac:(Self) := {
    trait_incrementer.Reset.reset := reset;
  }.
End Impl_trait_incrementer_Reset_for_trait_incrementer_Incrementer_t.
End Impl_trait_incrementer_Reset_for_trait_incrementer_Incrementer_t.
