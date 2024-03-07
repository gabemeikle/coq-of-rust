(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum PhoneNumber *)

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self : Ty.t :=
    Ty.path "unpacking_options_via_question_mark::PhoneNumber".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self : Ty.t :=
    Ty.path "unpacking_options_via_question_mark::PhoneNumber".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.

(* Enum Job *)

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.
  Definition Self : Ty.t := Ty.path "unpacking_options_via_question_mark::Job".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Definition ℐ : Instance.t := [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.
  Definition Self : Ty.t := Ty.path "unpacking_options_via_question_mark::Job".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.

(* Enum Person *)

Module Impl_unpacking_options_via_question_mark_Person.
  Definition Self : Ty.t :=
    Ty.path "unpacking_options_via_question_mark::Person".
  
  Parameter work_phone_area_code : (list Ty.t) -> (list Value.t) -> M.
End Impl_unpacking_options_via_question_mark_Person.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
