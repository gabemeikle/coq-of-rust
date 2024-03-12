(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Food *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "CordonBleu";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Steak";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Sushi";
        item := Tuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_combinators_and_then_Food.
  Definition Self : Ty.t := Ty.path "combinators_and_then::Food".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_and_then::Food")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_and_then_Food.

(* Enum Day *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Monday";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Tuesday";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Wednesday";
        item := Tuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_combinators_and_then_Day.
  Definition Self : Ty.t := Ty.path "combinators_and_then::Day".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_and_then::Day")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_and_then_Day.

Parameter have_ingredients : (list Ty.t) -> (list Value.t) -> M.

Parameter have_recipe : (list Ty.t) -> (list Value.t) -> M.

Parameter cookable_v1 : (list Ty.t) -> (list Value.t) -> M.

Parameter cookable_v2 : (list Ty.t) -> (list Value.t) -> M.

Parameter eat : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
