(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition EvenNumber : Set :=
  i32.

(* Impl [EvenNumber] of trait [_crate.fmt.Debug]*)
Module ImplEvenNumber.
  Definition
    fmt
    (self : ref Self)
    (f : ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate::fmt::ImplFormatter.debug_tuple_field1_finish f "EvenNumber" self.0.
End ImplEvenNumber.
(* End impl [EvenNumber] *)

(* Impl [EvenNumber] of trait [_crate.marker.StructuralPartialEq]*)
Module ImplEvenNumber.
  
End ImplEvenNumber.
(* End impl [EvenNumber] *)

(* Impl [EvenNumber] of trait [_crate.cmp.PartialEq]*)
Module ImplEvenNumber.
  Definition eq (self : ref Self) (other : ref EvenNumber) : bool :=
    eq self.0 other.0.
End ImplEvenNumber.
(* End impl [EvenNumber] *)

(* Impl [EvenNumber] of trait [TryFrom]*)
Module ImplEvenNumber.
  Definition Error : Set :=
    .
  
  Definition try_from (value : i32) : Result :=
    if eq (rem value 2) 0 then
      Ok (EvenNumber value)
    else
      Err ().
End ImplEvenNumber.
(* End impl [EvenNumber] *)

Definition main (_ : unit) :=
  match (ImplEvenNumber.try_from 8, Ok (EvenNumber 8)) with
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
  match (ImplEvenNumber.try_from 5, Err ()) with
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
  let result := try_into 8 in
  match (result, Ok (EvenNumber 8)) with
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
  let result := try_into 5 in
  match (result, Err ()) with
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