(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_fmt_Display_for_converting_to_string_Circle.
Section Impl_core_fmt_Display_for_converting_to_string_Circle.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "converting_to_string::Circle") [].
  
  Parameter fmt :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "converting_to_string::Circle") []])
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
End Impl_core_fmt_Display_for_converting_to_string_Circle.
End Impl_core_fmt_Display_for_converting_to_string_Circle.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : Ty.path "unit".
