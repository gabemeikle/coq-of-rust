(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Food *)

Module Impl_core_fmt_Debug_for_combinators_and_then_Food.
  Definition Self : Ty.t := Ty.path "combinators_and_then::Food".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_and_then_Food.

(* Enum Day *)

Module Impl_core_fmt_Debug_for_combinators_and_then_Day.
  Definition Self : Ty.t := Ty.path "combinators_and_then::Day".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_and_then_Day.

Parameter have_ingredients : (list Ty.t) -> (list Value.t) -> M.

Parameter have_recipe : (list Ty.t) -> (list Value.t) -> M.

Parameter cookable_v1 : (list Ty.t) -> (list Value.t) -> M.

Parameter cookable_v2 : (list Ty.t) -> (list Value.t) -> M.

Parameter eat : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
