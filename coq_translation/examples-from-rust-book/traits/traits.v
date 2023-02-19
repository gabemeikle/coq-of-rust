(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Sheep.
  Record t : Set := {
    naked : bool;
    name : static_ref str;
  }.
End Sheep.
Definition Sheep : Set := Sheep.t.

Class Animal : Set := {
  new : static_ref str -> Self;
  name : static_ref Self -> static_ref str;
  noise : static_ref Self -> static_ref str;
  talk : static_ref Self -> _;
}.

(* Impl [Sheep] *)
Module ImplSheep.
  Definition is_naked (self : static_ref Sheep) : bool := self.naked.
  
  Definition shear (self : mut_ref Sheep) :=
    if is_naked self then
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["";" is already naked...\n"]
          [_crate::fmt::ImplArgumentV1.new_display (name self)]) ;;
      tt ;;
      tt
    else
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["";" gets a haircut!\n"]
          [_crate::fmt::ImplArgumentV1.new_display self.name]) ;;
      tt ;;
      assign self.naked := true ;;
      tt.
End ImplSheep.
(* End impl [Sheep] *)

Module Impl_Animal_for_Sheep.
  Definition Self := Sheep.
  
  #[global] Instance I : Animal.Class Self := {|
    new
      (name : static_ref str) :=
      {| Sheep.name := name; Sheep.naked := false; |};
    name (self : static_ref Sheep) := self.name;
    noise
      (self : static_ref Sheep) :=
      if is_naked self then
        "baaaaah?"
      else
        "baaaaah!";
    talk
      (self : static_ref Sheep) :=
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["";" pauses briefly... ";"\n"]
          [_crate::fmt::ImplArgumentV1.new_display
            self.name;_crate::fmt::ImplArgumentV1.new_display (noise self)]) ;;
      tt ;;
      tt;
  |}.
Module ImplSheep.

Definition main (_ : unit) :=
  let dolly := Animal.new "Dolly" in
  talk dolly ;;
  shear dolly ;;
  talk dolly ;;
  tt.
