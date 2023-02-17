(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

(* Approximation *)

Definition u8 : Set := Z.
Definition u16 : Set := Z.
Definition u32 : Set := Z.
Definition u64 : Set := Z.
Definition u128 : Set := Z.

Definition i8 : Set := Z.
Definition i16 : Set := Z.
Definition i32 : Set := Z.
Definition i64 : Set := Z.
Definition i128 : Set := Z.

Definition f32 : Set := Z.
Definition f64 : Set := Z.

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

(* Impl [Job] of trait [_crate.clone.Clone]*)
Module ImplJob.
  Definition clone (self : static_ref Job) : Job :=
    let _ := tt in
    deref self.
End ImplJob.
(* End impl [Job] *)

(* Impl [Job] of trait [_crate.marker.Copy]*)
Module ImplJob.
  
End ImplJob.
(* End impl [Job] *)

Module PhoneNumber.
  Record t : Set := {
    area_code : Option;
    number : u32;
  }.
End PhoneNumber.
Definition PhoneNumber : Set := PhoneNumber.t.

(* Impl [PhoneNumber] of trait [_crate.clone.Clone]*)
Module ImplPhoneNumber.
  Definition clone (self : static_ref PhoneNumber) : PhoneNumber :=
    let _ := tt in
    let _ := tt in
    deref self.
End ImplPhoneNumber.
(* End impl [PhoneNumber] *)

(* Impl [PhoneNumber] of trait [_crate.marker.Copy]*)
Module ImplPhoneNumber.
  
End ImplPhoneNumber.
(* End impl [PhoneNumber] *)

(* Impl [Person] *)
Module ImplPerson.
  Definition work_phone_area_code (self : static_ref Person) : Option :=
    match branch
      match branch self.job with
      | {| Break.0 := residual; |} => Return (from_residual residual)
      | {| Continue.0 := val; |} => val
      end.phone_number with
    | {| Break.0 := residual; |} => Return (from_residual residual)
    | {| Continue.0 := val; |} => val
    end.area_code.
End ImplPerson.
(* End impl [Person] *)

Definition main (_ : unit) :=
  let p := {|
    Person.job
      :=
      Some
        {|
          Job.phone_number
            :=
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