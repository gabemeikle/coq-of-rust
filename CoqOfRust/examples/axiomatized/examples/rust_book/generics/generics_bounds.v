(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
Module HasArea.
  
End HasArea.

(* Struct
  {
    name := "Rectangle";
    ty_params := [];
    fields := [ ("length", Ty.path "f64"); ("height", Ty.path "f64") ];
  } *)

Module Impl_core_fmt_Debug_for_generics_bounds_Rectangle.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "generics_bounds::Rectangle")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_generics_bounds_Rectangle.

(* Struct
  {
    name := "Triangle";
    ty_params := [];
    fields := [ ("length", Ty.path "f64"); ("height", Ty.path "f64") ];
  } *)

Module Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle.
  Parameter area : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_bounds::HasArea"
      (* Self *) (Ty.path "generics_bounds::Rectangle")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("area", InstanceField.Method area) ]
      (* Instance polymorphic types *) [].
End Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle.

Parameter print_debug : (list Ty.t) -> (list Value.t) -> M.

Parameter area : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
