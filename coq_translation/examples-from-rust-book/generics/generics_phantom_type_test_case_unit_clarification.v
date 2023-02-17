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

Error Enum.

(* Impl [Inch] of trait [_crate.fmt.Debug]*)
Module ImplInch.
  Definition
    fmt
    (self : static_ref Inch)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate.intrinsics.unreachable tt.
End ImplInch.
(* End impl [Inch] *)

(* Impl [Inch] of trait [_crate.clone.Clone]*)
Module ImplInch.
  Definition clone (self : static_ref Inch) : Inch :=
    deref self.
End ImplInch.
(* End impl [Inch] *)

(* Impl [Inch] of trait [_crate.marker.Copy]*)
Module ImplInch.
  
End ImplInch.
(* End impl [Inch] *)

Error Enum.

(* Impl [Mm] of trait [_crate.fmt.Debug]*)
Module ImplMm.
  Definition
    fmt
    (self : static_ref Mm)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate.intrinsics.unreachable tt.
End ImplMm.
(* End impl [Mm] *)

(* Impl [Mm] of trait [_crate.clone.Clone]*)
Module ImplMm.
  Definition clone (self : static_ref Mm) : Mm :=
    deref self.
End ImplMm.
(* End impl [Mm] *)

(* Impl [Mm] of trait [_crate.marker.Copy]*)
Module ImplMm.
  
End ImplMm.
(* End impl [Mm] *)

Definition Length : Set :=
  f64 * PhantomData.

(* Impl [Length] of trait [_crate.fmt.Debug]*)
Module ImplLength.
  Definition
    fmt
    (self : static_ref Length<Unit>)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate::fmt::ImplFormatter.debug_tuple_field2_finish
      f
      "Length"
      self.0
      self.1.
End ImplLength.
(* End impl [Length] *)

(* Impl [Length] of trait [_crate.clone.Clone]*)
Module ImplLength.
  Definition clone (self : static_ref Length<Unit>) : Length :=
    Length (_crate.clone.Clone.clone self.0) (_crate.clone.Clone.clone self.1).
End ImplLength.
(* End impl [Length] *)

(* Impl [Length] of trait [_crate.marker.Copy]*)
Module ImplLength.
  
End ImplLength.
(* End impl [Length] *)

(* Impl [Length] of trait [Add]*)
Module ImplLength.
  Definition Output : Set :=
    Length.
  
  Definition add (self : Length<Unit>) (rhs : Length) : Length :=
    Length (add self.0 rhs.0) PhantomData.
End ImplLength.
(* End impl [Length] *)

Definition main (_ : unit) :=
  let one_foot := Length 12 (* 12.0 *) PhantomData in
  let one_meter := Length 1000 (* 1000.0 *) PhantomData in
  let two_feet := add one_foot one_foot in
  let two_meters := add one_meter one_meter in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["one foot + one_foot = ";" in\n"]
      [_crate::fmt::ImplArgumentV1.new_debug two_feet.0]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["one meter + one_meter = ";" mm\n"]
      [_crate::fmt::ImplArgumentV1.new_debug two_meters.0]) ;;
  tt ;;
  tt.