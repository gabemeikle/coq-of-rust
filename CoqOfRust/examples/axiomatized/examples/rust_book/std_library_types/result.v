(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  
  
  Module  Impl_core_fmt_Debug_for_result_checked_MathError.
  Section Impl_core_fmt_Debug_for_result_checked_MathError.
    Definition Self : Ty.t :=
      Ty.apply (Ty.path "result::checked::MathError") [].
    
    Parameter fmt :
        (Ty.apply
            (Ty.path "ref")
            [Ty.apply (Ty.path "result::checked::MathError") []])
          ->
          (Ty.apply
            (Ty.path "mut_ref")
            [Ty.apply (Ty.path "core::fmt::Formatter") []])
          ->
          Ty.apply
            (Ty.path "core::result::Result")
            [Ty.tuple; Ty.apply (Ty.path "core::fmt::Error") []].
    
    Definition AssociatedFunction_fmt : Instance.t := {
      Notations.double_colon := fmt;
    }.
    
    Definition ℐ : Instance.t := [("fmt", fmt)].
  End Impl_core_fmt_Debug_for_result_checked_MathError.
  End Impl_core_fmt_Debug_for_result_checked_MathError.
  
  Axiom MathResult :
      Ty.apply
        (Ty.path "core::result::Result")
        [Ty.path "f64"; Ty.apply (Ty.path "result::checked::MathError") []].
  
  Parameter div :
      (Ty.path "f64") ->
        (Ty.path "f64") ->
        Ty.apply
          (Ty.path "core::result::Result")
          [Ty.path "f64"; Ty.apply (Ty.path "result::checked::MathError") []].
  
  Parameter sqrt :
      (Ty.path "f64") ->
        Ty.apply
          (Ty.path "core::result::Result")
          [Ty.path "f64"; Ty.apply (Ty.path "result::checked::MathError") []].
  
  Parameter ln :
      (Ty.path "f64") ->
        Ty.apply
          (Ty.path "core::result::Result")
          [Ty.path "f64"; Ty.apply (Ty.path "result::checked::MathError") []].
End checked.

Parameter op : (Ty.path "f64") -> (Ty.path "f64") -> Ty.path "f64".

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : Ty.path "unit".
