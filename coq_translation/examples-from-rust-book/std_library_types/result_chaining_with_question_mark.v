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

Module checked :=
  Error Enum.
  
  (* Impl [MathError] of trait [_crate.fmt.Debug]*)
  Module ImplMathError.
    Definition
      fmt
      (self : static_ref checked::MathError)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
      match self with
      | MathError.DivisionByZero =>
        _crate::fmt::ImplFormatter.write_str f "DivisionByZero"
      | MathError.NonPositiveLogarithm =>
        _crate::fmt::ImplFormatter.write_str f "NonPositiveLogarithm"
      | MathError.NegativeSquareRoot =>
        _crate::fmt::ImplFormatter.write_str f "NegativeSquareRoot"
      end.
  End ImplMathError.
  (* End impl [MathError] *)
  
  Error TyAlias.
  
  Definition div (_ : unit) :=
    if eq y 0 (* 0.0 *) then
      Err MathError.DivisionByZero
    else
      Ok (div x y).
  
  Definition sqrt (_ : unit) :=
    if lt x 0 (* 0.0 *) then
      Err MathError.NegativeSquareRoot
    else
      Ok (sqrt x).
  
  Definition ln (_ : unit) :=
    if le x 0 (* 0.0 *) then
      Err MathError.NonPositiveLogarithm
    else
      Ok (ln x).
  
  Definition op_ (_ : unit) :=
    let ratio := match branch (div x y) with
    | {| Break.0 := residual; |} => Return (from_residual residual)
    | {| Continue.0 := val; |} => val
    end in
    let ln := match branch (ln ratio) with
    | {| Break.0 := residual; |} => Return (from_residual residual)
    | {| Continue.0 := val; |} => val
    end in
    sqrt ln.
  
  Definition op (_ : unit) :=
    match op_ x y with
    | Err (why) =>
      _crate.rt.panic_display
        match why with
        | MathError.NonPositiveLogarithm => "logarithm of non-positive number"
        | MathError.DivisionByZero => "division by zero"
        | MathError.NegativeSquareRoot => "square root of negative number"
        end
    | Ok (value) =>
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["";"\n"]
          [_crate::fmt::ImplArgumentV1.new_display value]) ;;
      tt
    end..

Error Enum.

(* Impl [MathError] of trait [_crate.fmt.Debug]*)
Module ImplMathError.
  Definition
    fmt
    (self : static_ref checked::MathError)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    match self with
    | MathError.DivisionByZero =>
      _crate::fmt::ImplFormatter.write_str f "DivisionByZero"
    | MathError.NonPositiveLogarithm =>
      _crate::fmt::ImplFormatter.write_str f "NonPositiveLogarithm"
    | MathError.NegativeSquareRoot =>
      _crate::fmt::ImplFormatter.write_str f "NegativeSquareRoot"
    end.
End ImplMathError.
(* End impl [MathError] *)

Error TyAlias.

Definition div (_ : unit) :=
  if eq y 0 (* 0.0 *) then
    Err MathError.DivisionByZero
  else
    Ok (div x y).

Definition sqrt (_ : unit) :=
  if lt x 0 (* 0.0 *) then
    Err MathError.NegativeSquareRoot
  else
    Ok (sqrt x).

Definition ln (_ : unit) :=
  if le x 0 (* 0.0 *) then
    Err MathError.NonPositiveLogarithm
  else
    Ok (ln x).

Definition op_ (_ : unit) :=
  let ratio := match branch (div x y) with
  | {| Break.0 := residual; |} => Return (from_residual residual)
  | {| Continue.0 := val; |} => val
  end in
  let ln := match branch (ln ratio) with
  | {| Break.0 := residual; |} => Return (from_residual residual)
  | {| Continue.0 := val; |} => val
  end in
  sqrt ln.

Definition op (_ : unit) :=
  match op_ x y with
  | Err (why) =>
    _crate.rt.panic_display
      match why with
      | MathError.NonPositiveLogarithm => "logarithm of non-positive number"
      | MathError.DivisionByZero => "division by zero"
      | MathError.NegativeSquareRoot => "square root of negative number"
      end
  | Ok (value) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["";"\n"]
        [_crate::fmt::ImplArgumentV1.new_display value]) ;;
    tt
  end.

Definition main (_ : unit) :=
  checked.op 1 (* 1.0 *) 10 (* 10.0 *) ;;
  tt.