(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.







Module  Impl_core_fmt_Debug_for_operator_overloading_FooBar.
Section Impl_core_fmt_Debug_for_operator_overloading_FooBar.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "operator_overloading::FooBar") [].
  
  Parameter fmt :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "operator_overloading::FooBar") []])
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
End Impl_core_fmt_Debug_for_operator_overloading_FooBar.
End Impl_core_fmt_Debug_for_operator_overloading_FooBar.



Module  Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
Section Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "operator_overloading::BarFoo") [].
  
  Parameter fmt :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "operator_overloading::BarFoo") []])
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
End Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
End Impl_core_fmt_Debug_for_operator_overloading_BarFoo.

Module  Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.
Section Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.
  Definition Self : Ty.t := Ty.apply (Ty.path "operator_overloading::Foo") [].
  
  Definition Output : Set :=
    Ty.apply (Ty.path "operator_overloading::FooBar") [].
  
  Parameter add :
      (Ty.apply (Ty.path "operator_overloading::Foo") []) ->
        (Ty.apply (Ty.path "operator_overloading::Bar") []) ->
        Ty.apply (Ty.path "operator_overloading::FooBar") [].
  
  Definition AssociatedFunction_add : Instance.t := {
    Notations.double_colon := add;
  }.
  
  Definition ℐ : Instance.t := [("Output", Output); ("add", add)].
End Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.
End Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.

Module  Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.
Section Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.
  Definition Self : Ty.t := Ty.apply (Ty.path "operator_overloading::Bar") [].
  
  Definition Output : Set :=
    Ty.apply (Ty.path "operator_overloading::BarFoo") [].
  
  Parameter add :
      (Ty.apply (Ty.path "operator_overloading::Bar") []) ->
        (Ty.apply (Ty.path "operator_overloading::Foo") []) ->
        Ty.apply (Ty.path "operator_overloading::BarFoo") [].
  
  Definition AssociatedFunction_add : Instance.t := {
    Notations.double_colon := add;
  }.
  
  Definition ℐ : Instance.t := [("Output", Output); ("add", add)].
End Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.
End Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : Ty.path "unit".
