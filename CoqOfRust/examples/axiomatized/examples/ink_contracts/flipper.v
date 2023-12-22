(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Flipper.
Section Flipper.
  Record t : Set := {
    value : bool.t;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => Some x.(value)) (fun v x => Some (x <| value := v |>));
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End Flipper.
End Flipper.

Module  Impl_flipper_Flipper_t.
Section Impl_flipper_Flipper_t.
  Definition Self : Set := flipper.Flipper.t.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Parameter new : bool.t -> M Self.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn new_default() -> Self {
          Self::new(Default::default())
      }
  *)
  Parameter new_default : M Self.
  
  Global Instance AssociatedFunction_new_default :
    Notations.DoubleColon Self "new_default" := {
    Notations.double_colon := new_default;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Parameter flip : (mut_ref Self) -> M unit.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon Self "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Parameter get : (ref Self) -> M bool.t.
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
End Impl_flipper_Flipper_t.
End Impl_flipper_Flipper_t.
