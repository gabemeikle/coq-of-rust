(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Flip.
Section Flip.
  Class Trait (Self : Set) : Type := {
    flip : (mut_ref Self) -> M unit;
    get : (ref Self) -> M bool.t;
  }.
  
End Flip.
End Flip.

Module  Flipper.
Section Flipper.
  Record t : Set := {
    value : bool.t;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End Flipper.
End Flipper.

Module  Impl_trait_flipper_Flipper_t.
Section Impl_trait_flipper_Flipper_t.
  Definition Self : Set := trait_flipper.Flipper.t.
  
  (*
      pub fn new() -> Self {
          Self {
              value: Default::default(),
          }
      }
  *)
  Definition new : M Self :=
    let* α0 : bool.t :=
      M.call
        (core.default.Default.default
          (Self := bool.t)
          (Trait := ltac:(refine _))) in
    M.pure {| trait_flipper.Flipper.value := α0; |}.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
End Impl_trait_flipper_Flipper_t.
End Impl_trait_flipper_Flipper_t.

Module  Impl_trait_flipper_Flip_for_trait_flipper_Flipper_t.
Section Impl_trait_flipper_Flip_for_trait_flipper_Flipper_t.
  Definition Self : Set := trait_flipper.Flipper.t.
  
  (*
      fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (self : mut_ref Self) : M unit :=
    let* self := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref trait_flipper.Flipper.t := M.read self in
      let* α1 : mut_ref trait_flipper.Flipper.t := M.read self in
      let* α2 : bool.t := M.read (deref α1).["value"] in
      assign (deref α0).["value"] (UnOp.not α2) in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon Self "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (self : ref Self) : M bool.t :=
    let* self := M.alloc self in
    let* α0 : ref trait_flipper.Flipper.t := M.read self in
    M.read (deref α0).["value"].
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
  
  Global Instance ℐ : trait_flipper.Flip.Trait Self := {
    trait_flipper.Flip.flip := flip;
    trait_flipper.Flip.get := get;
  }.
End Impl_trait_flipper_Flip_for_trait_flipper_Flipper_t.
End Impl_trait_flipper_Flip_for_trait_flipper_Flipper_t.
