(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

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

Module  Impl_flipper_Flipper_t.
Section Impl_flipper_Flipper_t.
  Ltac Self := exact flipper.Flipper.t.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (init_value : bool.t) : M ltac:(Self) :=
    let* init_value : M.Val bool.t := M.alloc init_value in
    let* α0 : bool.t := M.read init_value in
    M.pure {| flipper.Flipper.value := α0; |}.
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn new_default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition new_default : M ltac:(Self) :=
    let* α0 : bool.t :=
      M.call
        (core.default.Default.default
          (Self := bool.t)
          (Trait := ltac:(refine _))) in
    M.call (flipper.Flipper.t::["new"] α0).
  
  Global Instance AssociatedFunction_new_default :
    Notations.DoubleColon ltac:(Self) "new_default" := {
    Notations.double_colon := new_default;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (self : mut_ref ltac:(Self)) : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref flipper.Flipper.t := M.read self in
      let* α1 : mut_ref flipper.Flipper.t := M.read self in
      let* α2 : bool.t := M.read (deref α1).["value"] in
      assign (deref α0).["value"] (UnOp.not α2) in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon ltac:(Self) "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (self : ref ltac:(Self)) : M bool.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref flipper.Flipper.t := M.read self in
    M.read (deref α0).["value"].
  
  Global Instance AssociatedFunction_get :
    Notations.DoubleColon ltac:(Self) "get" := {
    Notations.double_colon := get;
  }.
End Impl_flipper_Flipper_t.
End Impl_flipper_Flipper_t.
