(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct ToDrop *)

Module Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.
  Definition Self : Ty.t := Ty.path "scoping_rules_raii_desctructor::ToDrop".
  
  Parameter drop : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("drop", InstanceField.Method drop)].
End Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
