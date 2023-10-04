(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Person.
  Unset Primitive Projections.
  Record t : Set := {
    job : core.option.Option unpacking_options_via_question_mark.Job;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_job : Notation.Dot "job" := {
    Notation.dot '(Build_t x0) := x0;
  }.
  Global Instance Get_AF_job : Notation.DoubleColon t "job" := {
    Notation.double_colon '(Build_t x0) := x0;
  }.
End Person.
Definition Person : Set := Person.t.

Module Job.
  Unset Primitive Projections.
  Record t : Set := {
    phone_number
      :
      core.option.Option unpacking_options_via_question_mark.PhoneNumber;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_phone_number : Notation.Dot "phone_number" := {
    Notation.dot '(Build_t x0) := x0;
  }.
  Global Instance Get_AF_phone_number
    : Notation.DoubleColon t "phone_number" := {
    Notation.double_colon '(Build_t x0) := x0;
  }.
End Job.
Definition Job : Set := Job.t.

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.
  Definition Self := unpacking_options_via_question_mark.Job.
  
  Parameter clone :
      forall `{H' : State.Trait},
      (ref Self) -> M (H := H') unpacking_options_via_question_mark.Job.
  
  Global Instance Method_clone `{H' : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H' : State.Trait} := clone;
  }.
  Global Hint Resolve I : core.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.
  Definition Self := unpacking_options_via_question_mark.Job.
  
  Global Instance I : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.

Module PhoneNumber.
  Unset Primitive Projections.
  Record t : Set := {
    area_code : core.option.Option u8;
    number : u32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_area_code : Notation.Dot "area_code" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_AF_area_code : Notation.DoubleColon t "area_code" := {
    Notation.double_colon '(Build_t x0 _) := x0;
  }.
  Global Instance Get_number : Notation.Dot "number" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
  Global Instance Get_AF_number : Notation.DoubleColon t "number" := {
    Notation.double_colon '(Build_t _ x1) := x1;
  }.
End PhoneNumber.
Definition PhoneNumber : Set := PhoneNumber.t.

Module
  Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self := unpacking_options_via_question_mark.PhoneNumber.
  
  Parameter clone :
      forall `{H' : State.Trait},
      (ref Self) -> M (H := H') unpacking_options_via_question_mark.PhoneNumber.
  
  Global Instance Method_clone `{H' : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H' : State.Trait} := clone;
  }.
  Global Hint Resolve I : core.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.

Module
  Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self := unpacking_options_via_question_mark.PhoneNumber.
  
  Global Instance I : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.

Module Impl_unpacking_options_via_question_mark_Person.
  Definition Self := unpacking_options_via_question_mark.Person.
  
  Parameter work_phone_area_code :
      forall `{H' : State.Trait},
      (ref Self) -> M (H := H') (core.option.Option u8).
  
  Global Instance Method_work_phone_area_code `{H' : State.Trait} :
    Notation.Dot "work_phone_area_code" := {
    Notation.dot := work_phone_area_code;
  }.
End Impl_unpacking_options_via_question_mark_Person.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H' : State.Trait}, M (H := H') unit.
