(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum DoubleError *)

Module Impl_core_fmt_Debug_for_wrapping_errors_DoubleError.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "wrapping_errors::DoubleError")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_wrapping_errors_DoubleError.

Axiom Result :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "wrapping_errors::Result") [ T ]) =
    (Ty.apply
      (Ty.path "core::result::Result")
      [ T; Ty.path "wrapping_errors::DoubleError" ]).

Module Impl_core_fmt_Display_for_wrapping_errors_DoubleError.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      (* Self *) (Ty.path "wrapping_errors::DoubleError")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Display_for_wrapping_errors_DoubleError.

Module Impl_core_error_Error_for_wrapping_errors_DoubleError.
  Parameter source : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::error::Error"
      (* Self *) (Ty.path "wrapping_errors::DoubleError")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("source", InstanceField.Method source) ]
      (* Instance polymorphic types *) [].
End Impl_core_error_Error_for_wrapping_errors_DoubleError.

Module Impl_core_convert_From_core_num_error_ParseIntError_for_wrapping_errors_DoubleError.
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      (* Self *) (Ty.path "wrapping_errors::DoubleError")
      (* Trait polymorphic types *)
        [ (* T *) Ty.path "core::num::error::ParseIntError" ]
      (* Instance *) [ ("from", InstanceField.Method from) ]
      (* Instance polymorphic types *) [].
End Impl_core_convert_From_core_num_error_ParseIntError_for_wrapping_errors_DoubleError.

Parameter double_first : (list Ty.t) -> (list Value.t) -> M.

Parameter print : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
