(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter reverse : (list Ty.t) -> (list Value.t) -> M.

(* Struct Matrix *)

Module Impl_core_fmt_Debug_for_tuples_Matrix.
  Definition Self : Ty.t := Ty.path "tuples::Matrix".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_tuples_Matrix.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
