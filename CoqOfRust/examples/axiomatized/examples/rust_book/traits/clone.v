(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Unit *)

Module Impl_core_fmt_Debug_for_clone_Unit.
  Definition Self : Ty.t := Ty.path "clone::Unit".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_clone_Unit.

Module Impl_core_clone_Clone_for_clone_Unit.
  Definition Self : Ty.t := Ty.path "clone::Unit".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_clone_Unit.

Module Impl_core_marker_Copy_for_clone_Unit.
  Definition Self : Ty.t := Ty.path "clone::Unit".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_clone_Unit.

(* Struct Pair *)

Module Impl_core_clone_Clone_for_clone_Pair.
  Definition Self : Ty.t := Ty.path "clone::Pair".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_clone_Pair.

Module Impl_core_fmt_Debug_for_clone_Pair.
  Definition Self : Ty.t := Ty.path "clone::Pair".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_clone_Pair.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
