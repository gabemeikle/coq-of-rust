(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "Circle";
    ty_params := [];
    fields := [ ("radius", Ty.path "i32") ];
  } *)

Module Impl_core_fmt_Display_for_converting_to_string_Circle.
  Definition Self : Ty.t := Ty.path "converting_to_string::Circle".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      (* Self *) (Ty.path "converting_to_string::Circle")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Display_for_converting_to_string_Circle.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
