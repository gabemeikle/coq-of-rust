(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum VeryVerboseEnumOfThingsToDoWithNumbers *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Add";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Subtract";
        item := Tuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_enums_type_aliases_v2_VeryVerboseEnumOfThingsToDoWithNumbers.
  Definition Self : Ty.t :=
    Ty.path "enums_type_aliases_v2::VeryVerboseEnumOfThingsToDoWithNumbers".
  
  Parameter run : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_run : M.IsAssociatedFunction Self "run" run.
End Impl_enums_type_aliases_v2_VeryVerboseEnumOfThingsToDoWithNumbers.
