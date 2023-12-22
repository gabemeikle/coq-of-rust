(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Sheep.
Section Sheep.
  Record t : Set := {
    naked : bool.t;
    name : ref str.t;
  }.
  
  Global Instance Get_naked : Notations.Dot "naked" := {
    Notations.dot :=
      Ref.map (fun x => Some x.(naked)) (fun v x => Some (x <| naked := v |>));
  }.
  Global Instance Get_AF_naked : Notations.DoubleColon t "naked" := {
    Notations.double_colon (x : M.Val t) := x.["naked"];
  }.
  Global Instance Get_name : Notations.Dot "name" := {
    Notations.dot :=
      Ref.map (fun x => Some x.(name)) (fun v x => Some (x <| name := v |>));
  }.
  Global Instance Get_AF_name : Notations.DoubleColon t "name" := {
    Notations.double_colon (x : M.Val t) := x.["name"];
  }.
End Sheep.
End Sheep.

Module  Animal.
Section Animal.
  Class Trait (Self : Set) : Type := {
    new : (ref str.t) -> M Self;
    name : (ref Self) -> M (ref str.t);
    noise : (ref Self) -> M (ref str.t);
  }.
  
End Animal.
End Animal.

Module  Impl_traits_Sheep_t.
Section Impl_traits_Sheep_t.
  Definition Self : Set := traits.Sheep.t.
  
  (*
      fn is_naked(&self) -> bool {
          self.naked
      }
  *)
  Definition is_naked (self : ref Self) : M bool.t :=
    let* self := M.alloc self in
    let* α0 : ref traits.Sheep.t := M.read self in
    M.read (deref α0).["naked"].
  
  Global Instance AssociatedFunction_is_naked :
    Notations.DoubleColon Self "is_naked" := {
    Notations.double_colon := is_naked;
  }.
End Impl_traits_Sheep_t.
End Impl_traits_Sheep_t.

Module  Impl_traits_Animal_for_traits_Sheep_t.
Section Impl_traits_Animal_for_traits_Sheep_t.
  Definition Self : Set := traits.Sheep.t.
  
  (*
      fn new(name: &'static str) -> Sheep {
          Sheep {
              name: name,
              naked: false,
          }
      }
  *)
  Definition new (name : ref str.t) : M traits.Sheep.t :=
    let* name := M.alloc name in
    let* α0 : ref str.t := M.read name in
    M.pure {| traits.Sheep.name := α0; traits.Sheep.naked := false; |}.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      fn name(&self) -> &'static str {
          self.name
      }
  *)
  Definition name (self : ref Self) : M (ref str.t) :=
    let* self := M.alloc self in
    let* α0 : ref traits.Sheep.t := M.read self in
    M.read (deref α0).["name"].
  
  Global Instance AssociatedFunction_name :
    Notations.DoubleColon Self "name" := {
    Notations.double_colon := name;
  }.
  
  (*
      fn noise(&self) -> &'static str {
          if self.is_naked() {
              "baaaaah?"
          } else {
              "baaaaah!"
          }
      }
  *)
  Definition noise (self : ref Self) : M (ref str.t) :=
    let* self := M.alloc self in
    let* α0 : ref traits.Sheep.t := M.read self in
    let* α1 : bool.t := M.call (traits.Sheep.t::["is_naked"] α0) in
    let* α2 : M.Val bool.t := M.alloc α1 in
    let* α3 : bool.t := M.read (use α2) in
    let* α4 : M.Val (ref str.t) :=
      if α3 then
        M.pure (mk_str "baaaaah?")
      else
        M.pure (mk_str "baaaaah!") in
    M.read α4.
  
  Global Instance AssociatedFunction_noise :
    Notations.DoubleColon Self "noise" := {
    Notations.double_colon := noise;
  }.
  
  (*
      fn talk(&self) {
          // For example, we can add some quiet contemplation.
          println!("{} pauses briefly... {}", self.name, self.noise());
      }
  *)
  Definition talk (self : ref Self) : M unit :=
    let* self := M.alloc self in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : ref str.t := M.read (mk_str "") in
        let* α1 : ref str.t := M.read (mk_str " pauses briefly... ") in
        let* α2 : ref str.t := M.read (mk_str "
") in
        let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α3) in
        let* α5 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α4) in
        let* α6 : ref traits.Sheep.t := M.read self in
        let* α7 : core.fmt.rt.Argument.t :=
          M.call
            (core.fmt.rt.Argument.t::["new_display"]
              (borrow (deref α6).["name"])) in
        let* α8 : ref traits.Sheep.t := M.read self in
        let* α9 : ref str.t := M.call (noise α8) in
        let* α10 : M.Val (ref str.t) := M.alloc α9 in
        let* α11 : core.fmt.rt.Argument.t :=
          M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α10)) in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α7; α11 ] in
        let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
          M.alloc (borrow α12) in
        let* α14 : ref (slice core.fmt.rt.Argument.t) :=
          M.read (pointer_coercion "Unsize" α13) in
        let* α15 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_v1"] α5 α14) in
        let* α16 : unit := M.call (std.io.stdio._print α15) in
        M.alloc α16 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_talk :
    Notations.DoubleColon Self "talk" := {
    Notations.double_colon := talk;
  }.
  
  Global Instance ℐ : traits.Animal.Required.Trait Self := {
    traits.Animal.new := new;
    traits.Animal.name := name;
    traits.Animal.noise := noise;
    traits.Animal.talk := Datatypes.Some talk;
  }.
End Impl_traits_Animal_for_traits_Sheep_t.
End Impl_traits_Animal_for_traits_Sheep_t.

Module  Impl_traits_Sheep_t_2.
Section Impl_traits_Sheep_t_2.
  Definition Self : Set := traits.Sheep.t.
  
  (*
      fn shear(&mut self) {
          if self.is_naked() {
              // Implementor methods can use the implementor's trait methods.
              println!("{} is already naked...", self.name());
          } else {
              println!("{} gets a haircut!", self.name);
  
              self.naked = true;
          }
      }
  *)
  Definition shear (self : mut_ref Self) : M unit :=
    let* self := M.alloc self in
    let* α0 : mut_ref traits.Sheep.t := M.read self in
    let* α1 : bool.t :=
      M.call (traits.Sheep.t::["is_naked"] (borrow (deref α0))) in
    let* α2 : M.Val bool.t := M.alloc α1 in
    let* α3 : bool.t := M.read (use α2) in
    let* α4 : M.Val unit :=
      if α3 then
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : ref str.t := M.read (mk_str "") in
            let* α1 : ref str.t := M.read (mk_str " is already naked...
") in
            let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
            let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
            let* α4 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α3) in
            let* α5 : mut_ref traits.Sheep.t := M.read self in
            let* α6 : ref str.t :=
              M.call
                ((traits.Animal.name
                    (Self := traits.Sheep.t)
                    (Trait := ltac:(refine _)))
                  (borrow (deref α5))) in
            let* α7 : M.Val (ref str.t) := M.alloc α6 in
            let* α8 : core.fmt.rt.Argument.t :=
              M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
            let* α9 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8 ] in
            let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc (borrow α9) in
            let* α11 : ref (slice core.fmt.rt.Argument.t) :=
              M.read (pointer_coercion "Unsize" α10) in
            let* α12 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
            let* α13 : unit := M.call (std.io.stdio._print α12) in
            M.alloc α13 in
          M.alloc tt in
        M.alloc tt
      else
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : ref str.t := M.read (mk_str "") in
            let* α1 : ref str.t := M.read (mk_str " gets a haircut!
") in
            let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
            let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
            let* α4 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α3) in
            let* α5 : mut_ref traits.Sheep.t := M.read self in
            let* α6 : core.fmt.rt.Argument.t :=
              M.call
                (core.fmt.rt.Argument.t::["new_display"]
                  (borrow (deref α5).["name"])) in
            let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
            let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc (borrow α7) in
            let* α9 : ref (slice core.fmt.rt.Argument.t) :=
              M.read (pointer_coercion "Unsize" α8) in
            let* α10 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_v1"] α4 α9) in
            let* α11 : unit := M.call (std.io.stdio._print α10) in
            M.alloc α11 in
          M.alloc tt in
        let* _ : M.Val unit :=
          let* α0 : mut_ref traits.Sheep.t := M.read self in
          assign (deref α0).["naked"] true in
        M.alloc tt in
    M.read α4.
  
  Global Instance AssociatedFunction_shear :
    Notations.DoubleColon Self "shear" := {
    Notations.double_colon := shear;
  }.
End Impl_traits_Sheep_t_2.
End Impl_traits_Sheep_t_2.

(*
fn main() {
    // Type annotation is necessary in this case.
    let mut dolly: Sheep = Animal::new("Dolly");
    // TODO ^ Try removing the type annotations.

    dolly.talk();
    dolly.shear();
    dolly.talk();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* dolly : M.Val traits.Sheep.t :=
    let* α0 : ref str.t := M.read (mk_str "Dolly") in
    let* α1 : traits.Sheep.t :=
      M.call
        ((traits.Animal.new (Self := traits.Sheep.t) (Trait := ltac:(refine _)))
          α0) in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      M.call
        ((traits.Animal.talk
            (Self := traits.Sheep.t)
            (Trait := ltac:(refine _)))
          (borrow dolly)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : unit := M.call (traits.Sheep.t::["shear"] (borrow_mut dolly)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      M.call
        ((traits.Animal.talk
            (Self := traits.Sheep.t)
            (Trait := ltac:(refine _)))
          (borrow dolly)) in
    M.alloc α0 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
