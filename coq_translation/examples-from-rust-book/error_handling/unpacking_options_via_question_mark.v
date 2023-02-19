(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Person.
  Record t : Set := {
    job : Option;
  }.
End Person.
Definition Person : Set := Person.t.

Module Job.
  Record t : Set := {
    phone_number : Option;
  }.
End Job.
Definition Job : Set := Job.t.

Module Impl__crate_clone_Clone_for_Job.
  Definition Self := Job.
  
  #[global] Instance I : _crate.clone.Clone.Class Self := {|
    clone
      (self : static_ref Job) :=
      let _ := tt in
      deref self;
  |}.
Module ImplJob.

Module Impl__crate_marker_Copy_for_Job.
  Definition Self := Job.
  
  #[global] Instance I : _crate.marker.Copy.Class Self := {|
  |}.
Module ImplJob.

Module PhoneNumber.
  Record t : Set := {
    area_code : Option;
    number : u32;
  }.
End PhoneNumber.
Definition PhoneNumber : Set := PhoneNumber.t.

Module Impl__crate_clone_Clone_for_PhoneNumber.
  Definition Self := PhoneNumber.
  
  #[global] Instance I : _crate.clone.Clone.Class Self := {|
    clone
      (self : static_ref PhoneNumber) :=
      let _ := tt in
      let _ := tt in
      deref self;
  |}.
Module ImplPhoneNumber.

Module Impl__crate_marker_Copy_for_PhoneNumber.
  Definition Self := PhoneNumber.
  
  #[global] Instance I : _crate.marker.Copy.Class Self := {|
  |}.
Module ImplPhoneNumber.

(* Impl [Person] *)
Module ImplPerson.
  Definition work_phone_area_code (self : static_ref Person) : Option :=
    match
        branch
          match branch self.job with
            | {| Break.0 := residual; |} => Return (from_residual residual)
            | {| Continue.0 := val; |} => val
            end.phone_number
      with
      | {| Break.0 := residual; |} => Return (from_residual residual)
      | {| Continue.0 := val; |} => val
      end.area_code.
End ImplPerson.
(* End impl [Person] *)

Definition main (_ : unit) :=
  let p :=
    {|
      Person.job :=
        Some
          {|
            Job.phone_number :=
              Some
                {|
                  PhoneNumber.area_code := Some 61;
                  PhoneNumber.number := 439222222;
                |};
          |};
    |} in
  match (work_phone_area_code p, Some 61) with
  | (left_val, right_val) =>
    if not (eq (deref left_val) (deref right_val)) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  tt.
