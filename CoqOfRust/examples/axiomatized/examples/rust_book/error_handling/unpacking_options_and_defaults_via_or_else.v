(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.
Section Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "unpacking_options_and_defaults_via_or_else::Fruit") [].
  
  Parameter fmt :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply
              (Ty.path "unpacking_options_and_defaults_via_or_else::Fruit")
              []])
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
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : Ty.path "unit".
