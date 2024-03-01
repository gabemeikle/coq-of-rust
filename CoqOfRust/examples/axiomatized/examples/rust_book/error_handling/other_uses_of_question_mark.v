(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom Result :
    fun T =>
      Ty.apply
        (Ty.path "core::result::Result")
        [T;
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [dyn [core.error.Error.Trait];
              Ty.apply (Ty.path "alloc::alloc::Global") []]].



Module  Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.
Section Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "other_uses_of_question_mark::EmptyVec") [].
  
  Parameter fmt :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "other_uses_of_question_mark::EmptyVec") []])
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
End Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.
End Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.

Module  Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.
Section Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "other_uses_of_question_mark::EmptyVec") [].
  
  Parameter fmt :
      (Ty.apply
          (Ty.path "ref")
          [Ty.apply (Ty.path "other_uses_of_question_mark::EmptyVec") []])
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
End Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.
End Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.

Module  Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.
Section Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "other_uses_of_question_mark::EmptyVec") [].
  
  Definition ℐ : Instance.t := [("source", source);
    ("type_id", type_id);
    ("description", description);
    ("cause", cause);
    ("provide", provide)].
End Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.
End Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.

Parameter double_first :
    (Ty.apply
        (Ty.path "alloc::vec::Vec")
        [Ty.apply (Ty.path "ref") [Ty.path "str"];
          Ty.apply (Ty.path "alloc::alloc::Global") []])
      ->
      Ty.apply
        (Ty.path "core::result::Result")
        [Ty.path "i32";
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [dyn [core.error.Error.Trait];
              Ty.apply (Ty.path "alloc::alloc::Global") []]].

Parameter print :
    (Ty.apply
        (Ty.path "core::result::Result")
        [Ty.path "i32";
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [dyn [core.error.Error.Trait];
              Ty.apply (Ty.path "alloc::alloc::Global") []]])
      ->
      Ty.path "unit".

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : Ty.path "unit".
