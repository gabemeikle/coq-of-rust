(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Sheep.
  Unset Primitive Projections.
  Record t : Set := {
    naked : bool;
    name : ref str;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_naked : Notation.Dot "naked" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Sheep.
Definition Sheep : Set := @Sheep.t.

Module Animal.
  Class Trait (Self : Set) : Set := {
    new `{H : State.Trait} : (ref str) -> (M (H := H) Self);
    name `{H : State.Trait} : (ref Self) -> (M (H := H) (ref str));
    noise `{H : State.Trait} : (ref Self) -> (M (H := H) (ref str));
  }.
  
  Global Instance Method_new `{H : State.Trait} `(Trait)
    : Notation.Dot "new" := {
    Notation.dot := new;
  }.
  Global Instance Method_name `{H : State.Trait} `(Trait)
    : Notation.Dot "name" := {
    Notation.dot := name;
  }.
  Global Instance Method_noise `{H : State.Trait} `(Trait)
    : Notation.Dot "noise" := {
    Notation.dot := noise;
  }.
  Global Instance Method_talk `{H : State.Trait} `(Trait)
    : Notation.Dot "talk" := {
    Notation.dot (self : ref Self) :=
      (let* _ :=
        let* _ :=
          let* α0 := self.["name"] in
          let* α1 := format_argument::["new_display"] (addr_of α0) in
          let* α2 := self.["noise"] in
          let* α3 := format_argument::["new_display"] (addr_of α2) in
          let* α4 :=
            format_arguments::["new_v1"]
              (addr_of [ ""; " says "; "
" ])
              (addr_of [ α1; α3 ]) in
          std.io.stdio._print α4 in
        Pure tt in
      Pure tt
      : M (H := H) unit);
  }.
End Animal.

Module Impl_traits_Sheep.
  Definition Self := traits.Sheep.
  
  Definition is_naked
      `{H : State.Trait}
      (self : ref It_is_here!)
      : M (H := H) bool :=
    Pure self.["naked"].
  
  Global Instance Method_is_naked `{H : State.Trait} :
    Notation.Dot "is_naked" := {
    Notation.dot := is_naked;
  }.
End Impl_traits_Sheep.

Module Impl_traits_Animal_for_traits_Sheep.
  Definition Self := traits.Sheep.
  
  Definition new
      `{H : State.Trait}
      (name : ref str)
      : M (H := H) traits.Sheep :=
    Pure {| traits.Sheep.name := name; traits.Sheep.naked := false; |}.
  
  Global Instance AssociatedFunction_new `{H : State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
  
  Definition name
      `{H : State.Trait}
      (self : ref It_is_here!)
      : M (H := H) (ref str) :=
    Pure self.["name"].
  
  Global Instance Method_name `{H : State.Trait} : Notation.Dot "name" := {
    Notation.dot := name;
  }.
  
  Definition noise
      `{H : State.Trait}
      (self : ref It_is_here!)
      : M (H := H) (ref str) :=
    let* α0 := self.["is_naked"] in
    if (α0 : bool) then
      Pure "baaaaah?"
    else
      Pure "baaaaah!".
  
  Global Instance Method_noise `{H : State.Trait} : Notation.Dot "noise" := {
    Notation.dot := noise;
  }.
  
  Definition talk
      `{H : State.Trait}
      (self : ref It_is_here!)
      : M (H := H) unit :=
    let* _ :=
      let* _ :=
        let* α0 := format_argument::["new_display"] (addr_of self.["name"]) in
        let* α1 := self.["noise"] in
        let* α2 := format_argument::["new_display"] (addr_of α1) in
        let* α3 :=
          format_arguments::["new_v1"]
            (addr_of [ ""; " pauses briefly... "; "
" ])
            (addr_of [ α0; α2 ]) in
        std.io.stdio._print α3 in
      Pure tt in
    Pure tt.
  
  Global Instance Method_talk `{H : State.Trait} : Notation.Dot "talk" := {
    Notation.dot := talk;
  }.
  
  Global Instance I : traits.Animal.Trait Self := {
    traits.Animal.new `{H : State.Trait} := new;
    traits.Animal.name `{H : State.Trait} := name;
    traits.Animal.noise `{H : State.Trait} := noise;
  }.
End Impl_traits_Animal_for_traits_Sheep.

Module Impl_traits_Sheep_2.
  Definition Self := traits.Sheep.
  
  Definition shear
      `{H : State.Trait}
      (self : mut_ref It_is_here!)
      : M (H := H) unit :=
    let* α0 := self.["is_naked"] in
    if (α0 : bool) then
      let* _ :=
        let* _ :=
          let* α0 := self.["name"] in
          let* α1 := format_argument::["new_display"] (addr_of α0) in
          let* α2 :=
            format_arguments::["new_v1"]
              (addr_of [ ""; " is already naked...
" ])
              (addr_of [ α1 ]) in
          std.io.stdio._print α2 in
        Pure tt in
      Pure tt
    else
      let* _ :=
        let* _ :=
          let* α0 := format_argument::["new_display"] (addr_of self.["name"]) in
          let* α1 :=
            format_arguments::["new_v1"]
              (addr_of [ ""; " gets a haircut!
" ])
              (addr_of [ α0 ]) in
          std.io.stdio._print α1 in
        Pure tt in
      let* _ := assign self.["naked"] true in
      Pure tt.
  
  Global Instance Method_shear `{H : State.Trait} : Notation.Dot "shear" := {
    Notation.dot := shear;
  }.
End Impl_traits_Sheep_2.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* dolly :=
    let* α0 := traits.Animal.new "Dolly" in
    Pure (α0 : traits.Sheep) in
  let* _ := dolly.["talk"] in
  let* _ := dolly.["shear"] in
  let* _ := dolly.["talk"] in
  Pure tt.
