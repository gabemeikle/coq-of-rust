(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Fruit *)

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_with_Fruit.
  Definition Self : Ty.t :=
    Ty.path "unpacking_options_and_defaults_via_get_or_insert_with::Fruit".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_with_Fruit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
