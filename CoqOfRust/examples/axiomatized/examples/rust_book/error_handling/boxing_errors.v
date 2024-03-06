(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom Result :
    (Ty.path "boxing_errors::Result") =
      (fun T =>
        Ty.apply
          (Ty.path "core::result::Result")
          [T;
            Ty.apply
              (Ty.path "alloc::boxed::Box")
              [dyn [core.error.Error.Trait]; Ty.path "alloc::alloc::Global"]]).

(* Struct EmptyVec *)

Module Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.

Module Impl_core_clone_Clone_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_boxing_errors_EmptyVec.

Module Impl_core_fmt_Display_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Display_for_boxing_errors_EmptyVec.

Module Impl_core_error_Error_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  Definition ℐ : Instance.t := [].
End Impl_core_error_Error_for_boxing_errors_EmptyVec.

Parameter double_first : (list Ty.t) -> (list Value.t) -> M.

Parameter print : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
