(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  Module MathError.
    Inductive t : Set :=
    | DivisionByZero
    | NonPositiveLogarithm
    | NegativeSquareRoot.
  End MathError.
  
  Module  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  Section Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
    Ltac Self := exact result_chaining_with_question_mark.checked.MathError.t.
    
    (*
        Debug
    *)
    Definition fmt
        (self : ref ltac:(Self))
        (f : mut_ref core.fmt.Formatter.t)
        : M ltac:(core.fmt.Result) :=
      let* self : M.Val (ref ltac:(Self)) := M.alloc self in
      let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
      M.function_body
        (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
        let* α1 : M.Val core.fmt.Formatter.t := deref α0 in
        let* α2 : mut_ref core.fmt.Formatter.t := borrow_mut α1 in
        let* α3 := M.read self in
        let* α4 : M.Val (ref str.t) :=
          match α3 with
          |
              result_chaining_with_question_mark.checked.MathError.DivisionByZero
                
              =>
            let* α0 : ref str.t := M.read (mk_str "DivisionByZero") in
            let* α1 : M.Val str.t := deref α0 in
            let* α2 : ref str.t := borrow α1 in
            M.alloc α2
          |
              result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                
              =>
            let* α0 : ref str.t := M.read (mk_str "NonPositiveLogarithm") in
            let* α1 : M.Val str.t := deref α0 in
            let* α2 : ref str.t := borrow α1 in
            M.alloc α2
          |
              result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                
              =>
            let* α0 : ref str.t := M.read (mk_str "NegativeSquareRoot") in
            let* α1 : M.Val str.t := deref α0 in
            let* α2 : ref str.t := borrow α1 in
            M.alloc α2
          end in
        let* α5 : ref str.t := M.read α4 in
        core.fmt.Formatter.t::["write_str"] α2 α5).
    
    Global Instance AssociatedFunction_fmt :
      Notations.DoubleColon ltac:(Self) "fmt" := {
      Notations.double_colon := fmt;
    }.
    
    Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  
  Ltac MathResult :=
    exact
      (core.result.Result.t
        f64.t
        result_chaining_with_question_mark.checked.MathError.t).
  
  (*
      fn div(x: f64, y: f64) -> MathResult {
          if y == 0.0 {
              Err(MathError::DivisionByZero)
          } else {
              Ok(x / y)
          }
      }
  *)
  Definition div
      (x : f64.t)
      (y : f64.t)
      : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
    let* x : M.Val f64.t := M.alloc x in
    let* y : M.Val f64.t := M.alloc y in
    M.function_body
      (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
      let* α1 : M.Val bool.t := BinOp.eq y α0 in
      let* α2 : M.Val bool.t := use α1 in
      let* α3 : bool.t := M.read α2 in
      let* α4 :
          M.Val
            (core.result.Result.t
              f64.t
              result_chaining_with_question_mark.checked.MathError.t) :=
        if (α3 : bool) then
          M.alloc
            (core.result.Result.Err
              result_chaining_with_question_mark.checked.MathError.DivisionByZero)
        else
          let* α0 : M.Val f64.t := BinOp.div x y in
          let* α1 : f64.t := M.read α0 in
          M.alloc (core.result.Result.Ok α1) in
      M.read α4).
  
  (*
      fn sqrt(x: f64) -> MathResult {
          if x < 0.0 {
              Err(MathError::NegativeSquareRoot)
          } else {
              Ok(x.sqrt())
          }
      }
  *)
  Definition sqrt
      (x : f64.t)
      : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
    let* x : M.Val f64.t := M.alloc x in
    M.function_body
      (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
      let* α1 : M.Val bool.t := BinOp.lt x α0 in
      let* α2 : M.Val bool.t := use α1 in
      let* α3 : bool.t := M.read α2 in
      let* α4 :
          M.Val
            (core.result.Result.t
              f64.t
              result_chaining_with_question_mark.checked.MathError.t) :=
        if (α3 : bool) then
          M.alloc
            (core.result.Result.Err
              result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot)
        else
          let* α0 : f64.t := M.read x in
          let* α1 : f64.t := f64.t::["sqrt"] α0 in
          M.alloc (core.result.Result.Ok α1) in
      M.read α4).
  
  (*
      fn ln(x: f64) -> MathResult {
          if x <= 0.0 {
              Err(MathError::NonPositiveLogarithm)
          } else {
              Ok(x.ln())
          }
      }
  *)
  Definition ln
      (x : f64.t)
      : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
    let* x : M.Val f64.t := M.alloc x in
    M.function_body
      (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
      let* α1 : M.Val bool.t := BinOp.le x α0 in
      let* α2 : M.Val bool.t := use α1 in
      let* α3 : bool.t := M.read α2 in
      let* α4 :
          M.Val
            (core.result.Result.t
              f64.t
              result_chaining_with_question_mark.checked.MathError.t) :=
        if (α3 : bool) then
          M.alloc
            (core.result.Result.Err
              result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm)
        else
          let* α0 : f64.t := M.read x in
          let* α1 : f64.t := f64.t::["ln"] α0 in
          M.alloc (core.result.Result.Ok α1) in
      M.read α4).
  
  (*
      fn op_(x: f64, y: f64) -> MathResult {
          // if `div` "fails", then `DivisionByZero` will be `return`ed
          let ratio = div(x, y)?;
  
          // if `ln` "fails", then `NonPositiveLogarithm` will be `return`ed
          let ln = ln(ratio)?;
  
          sqrt(ln)
      }
  *)
  Definition op_
      (x : f64.t)
      (y : f64.t)
      : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
    let return_ :=
      M.return_
        (R := ltac:(result_chaining_with_question_mark.checked.MathResult)) in
    let* x : M.Val f64.t := M.alloc x in
    let* y : M.Val f64.t := M.alloc y in
    M.function_body
      (let* ratio : M.Val f64.t :=
        let* α0 : f64.t := M.read x in
        let* α1 : f64.t := M.read y in
        let* α2 :
            core.result.Result.t
              f64.t
              result_chaining_with_question_mark.checked.MathError.t :=
          result_chaining_with_question_mark.checked.div α0 α1 in
        let* α3 :
            core.ops.control_flow.ControlFlow.t
              (core.result.Result.t
                core.convert.Infallible.t
                result_chaining_with_question_mark.checked.MathError.t)
              f64.t :=
          (core.ops.try_trait.Try.branch
              (Self :=
                core.result.Result.t
                  f64.t
                  result_chaining_with_question_mark.checked.MathError.t)
              (Trait := ltac:(refine _)))
            α2 in
        let* α4 :
            M.Val
              (core.ops.control_flow.ControlFlow.t
                (core.result.Result.t
                  core.convert.Infallible.t
                  result_chaining_with_question_mark.checked.MathError.t)
                f64.t) :=
          M.alloc α3 in
        let* α5 := M.read α4 in
        let* α6 : M.Val f64.t :=
          match α5 with
          | core.ops.control_flow.ControlFlow.Break residual =>
            let* residual := M.alloc residual in
            let* α0 :
                core.result.Result.t
                  core.convert.Infallible.t
                  result_chaining_with_question_mark.checked.MathError.t :=
              M.read residual in
            let* α1 :
                core.result.Result.t
                  f64.t
                  result_chaining_with_question_mark.checked.MathError.t :=
              (core.ops.try_trait.FromResidual.from_residual
                  (Self :=
                    core.result.Result.t
                      f64.t
                      result_chaining_with_question_mark.checked.MathError.t)
                  (Trait := ltac:(refine _)))
                α0 in
            let* α2 : M.Val never.t := return_ α1 in
            never_to_any α2
          | core.ops.control_flow.ControlFlow.Continue val =>
            let* val := M.alloc val in
            M.pure val
          end in
        M.copy α6 in
      let* ln : M.Val f64.t :=
        let* α0 : f64.t := M.read ratio in
        let* α1 :
            core.result.Result.t
              f64.t
              result_chaining_with_question_mark.checked.MathError.t :=
          result_chaining_with_question_mark.checked.ln α0 in
        let* α2 :
            core.ops.control_flow.ControlFlow.t
              (core.result.Result.t
                core.convert.Infallible.t
                result_chaining_with_question_mark.checked.MathError.t)
              f64.t :=
          (core.ops.try_trait.Try.branch
              (Self :=
                core.result.Result.t
                  f64.t
                  result_chaining_with_question_mark.checked.MathError.t)
              (Trait := ltac:(refine _)))
            α1 in
        let* α3 :
            M.Val
              (core.ops.control_flow.ControlFlow.t
                (core.result.Result.t
                  core.convert.Infallible.t
                  result_chaining_with_question_mark.checked.MathError.t)
                f64.t) :=
          M.alloc α2 in
        let* α4 := M.read α3 in
        let* α5 : M.Val f64.t :=
          match α4 with
          | core.ops.control_flow.ControlFlow.Break residual =>
            let* residual := M.alloc residual in
            let* α0 :
                core.result.Result.t
                  core.convert.Infallible.t
                  result_chaining_with_question_mark.checked.MathError.t :=
              M.read residual in
            let* α1 :
                core.result.Result.t
                  f64.t
                  result_chaining_with_question_mark.checked.MathError.t :=
              (core.ops.try_trait.FromResidual.from_residual
                  (Self :=
                    core.result.Result.t
                      f64.t
                      result_chaining_with_question_mark.checked.MathError.t)
                  (Trait := ltac:(refine _)))
                α0 in
            let* α2 : M.Val never.t := return_ α1 in
            never_to_any α2
          | core.ops.control_flow.ControlFlow.Continue val =>
            let* val := M.alloc val in
            M.pure val
          end in
        M.copy α5 in
      let* α0 : f64.t := M.read ln in
      let* α1 :
          core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t :=
        result_chaining_with_question_mark.checked.sqrt α0 in
      let* α0 :
          M.Val
            (core.result.Result.t
              f64.t
              result_chaining_with_question_mark.checked.MathError.t) :=
        M.alloc α1 in
      M.read α0).
  
  (*
      pub fn op(x: f64, y: f64) {
          match op_(x, y) {
              Err(why) => panic!(
                  "{}",
                  match why {
                      MathError::NonPositiveLogarithm => "logarithm of non-positive number",
                      MathError::DivisionByZero => "division by zero",
                      MathError::NegativeSquareRoot => "square root of negative number",
                  }
              ),
              Ok(value) => println!("{}", value),
          }
      }
  *)
  Definition op (x : f64.t) (y : f64.t) : M unit :=
    let* x : M.Val f64.t := M.alloc x in
    let* y : M.Val f64.t := M.alloc y in
    M.function_body
      (let* α0 : f64.t := M.read x in
      let* α1 : f64.t := M.read y in
      let* α2 :
          core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t :=
        result_chaining_with_question_mark.checked.op_ α0 α1 in
      let* α3 :
          M.Val
            (core.result.Result.t
              f64.t
              result_chaining_with_question_mark.checked.MathError.t) :=
        M.alloc α2 in
      let* α4 := M.read α3 in
      let* α5 : M.Val unit :=
        match α4 with
        | core.result.Result.Err why =>
          let* why := M.alloc why in
          let* α0 := M.read why in
          let* α1 : M.Val (ref str.t) :=
            match α0 with
            |
                result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                  
                =>
              M.pure (mk_str "logarithm of non-positive number")
            |
                result_chaining_with_question_mark.checked.MathError.DivisionByZero
                  
                =>
              let* α0 : ref str.t := M.read (mk_str "division by zero") in
              let* α1 : M.Val str.t := deref α0 in
              let* α2 : ref str.t := borrow α1 in
              M.alloc α2
            |
                result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                  
                =>
              let* α0 : ref str.t :=
                M.read (mk_str "square root of negative number") in
              let* α1 : M.Val str.t := deref α0 in
              let* α2 : ref str.t := borrow α1 in
              M.alloc α2
            end in
          let* α2 : ref (ref str.t) := borrow α1 in
          let* α3 : never.t := core.panicking.panic_display α2 in
          let* α4 : M.Val never.t := M.alloc α3 in
          never_to_any α4
        | core.result.Result.Ok value =>
          let* value := M.alloc value in
          let* _ : M.Val unit :=
            let* α0 : M.Val (array (ref str.t)) :=
              M.alloc [ mk_str ""; mk_str "
" ] in
            let* α1 : ref (array (ref str.t)) := borrow α0 in
            let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
            let* α3 : M.Val (ref (slice (ref str.t))) :=
              pointer_coercion "Unsize" α2 in
            let* α4 : ref (slice (ref str.t)) := M.read α3 in
            let* α5 : ref f64.t := borrow value in
            let* α6 : core.fmt.rt.Argument.t :=
              core.fmt.rt.Argument.t::["new_display"] α5 in
            let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
            let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
            let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
            let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc α9 in
            let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
              pointer_coercion "Unsize" α10 in
            let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
            let* α13 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_v1"] α4 α12 in
            let* α14 : unit := std.io.stdio._print α13 in
            M.alloc α14 in
          M.alloc tt
        end in
      M.read α5).
End checked.

Module MathError.
  Inductive t : Set :=
  | DivisionByZero
  | NonPositiveLogarithm
  | NegativeSquareRoot.
End MathError.

Module  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
Section Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  Ltac Self := exact result_chaining_with_question_mark.checked.MathError.t.
  
  (*
      Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : M.Val core.fmt.Formatter.t := deref α0 in
      let* α2 : mut_ref core.fmt.Formatter.t := borrow_mut α1 in
      let* α3 := M.read self in
      let* α4 : M.Val (ref str.t) :=
        match α3 with
        |
            result_chaining_with_question_mark.checked.MathError.DivisionByZero 
            =>
          let* α0 : ref str.t := M.read (mk_str "DivisionByZero") in
          let* α1 : M.Val str.t := deref α0 in
          let* α2 : ref str.t := borrow α1 in
          M.alloc α2
        |
            result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
              
            =>
          let* α0 : ref str.t := M.read (mk_str "NonPositiveLogarithm") in
          let* α1 : M.Val str.t := deref α0 in
          let* α2 : ref str.t := borrow α1 in
          M.alloc α2
        |
            result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
              
            =>
          let* α0 : ref str.t := M.read (mk_str "NegativeSquareRoot") in
          let* α1 : M.Val str.t := deref α0 in
          let* α2 : ref str.t := borrow α1 in
          M.alloc α2
        end in
      let* α5 : ref str.t := M.read α4 in
      core.fmt.Formatter.t::["write_str"] α2 α5).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.

Ltac MathResult :=
  exact
    (core.result.Result.t
      f64.t
      result_chaining_with_question_mark.checked.MathError.t).

(*
    fn div(x: f64, y: f64) -> MathResult {
        if y == 0.0 {
            Err(MathError::DivisionByZero)
        } else {
            Ok(x / y)
        }
    }
*)
Definition div
    (x : f64.t)
    (y : f64.t)
    : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
  let* x : M.Val f64.t := M.alloc x in
  let* y : M.Val f64.t := M.alloc y in
  M.function_body
    (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
    let* α1 : M.Val bool.t := BinOp.eq y α0 in
    let* α2 : M.Val bool.t := use α1 in
    let* α3 : bool.t := M.read α2 in
    let* α4 :
        M.Val
          (core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t) :=
      if (α3 : bool) then
        M.alloc
          (core.result.Result.Err
            result_chaining_with_question_mark.checked.MathError.DivisionByZero)
      else
        let* α0 : M.Val f64.t := BinOp.div x y in
        let* α1 : f64.t := M.read α0 in
        M.alloc (core.result.Result.Ok α1) in
    M.read α4).

(*
    fn sqrt(x: f64) -> MathResult {
        if x < 0.0 {
            Err(MathError::NegativeSquareRoot)
        } else {
            Ok(x.sqrt())
        }
    }
*)
Definition sqrt
    (x : f64.t)
    : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
  let* x : M.Val f64.t := M.alloc x in
  M.function_body
    (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
    let* α1 : M.Val bool.t := BinOp.lt x α0 in
    let* α2 : M.Val bool.t := use α1 in
    let* α3 : bool.t := M.read α2 in
    let* α4 :
        M.Val
          (core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t) :=
      if (α3 : bool) then
        M.alloc
          (core.result.Result.Err
            result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot)
      else
        let* α0 : f64.t := M.read x in
        let* α1 : f64.t := f64.t::["sqrt"] α0 in
        M.alloc (core.result.Result.Ok α1) in
    M.read α4).

(*
    fn ln(x: f64) -> MathResult {
        if x <= 0.0 {
            Err(MathError::NonPositiveLogarithm)
        } else {
            Ok(x.ln())
        }
    }
*)
Definition ln
    (x : f64.t)
    : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
  let* x : M.Val f64.t := M.alloc x in
  M.function_body
    (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
    let* α1 : M.Val bool.t := BinOp.le x α0 in
    let* α2 : M.Val bool.t := use α1 in
    let* α3 : bool.t := M.read α2 in
    let* α4 :
        M.Val
          (core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t) :=
      if (α3 : bool) then
        M.alloc
          (core.result.Result.Err
            result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm)
      else
        let* α0 : f64.t := M.read x in
        let* α1 : f64.t := f64.t::["ln"] α0 in
        M.alloc (core.result.Result.Ok α1) in
    M.read α4).

(*
    fn op_(x: f64, y: f64) -> MathResult {
        // if `div` "fails", then `DivisionByZero` will be `return`ed
        let ratio = div(x, y)?;

        // if `ln` "fails", then `NonPositiveLogarithm` will be `return`ed
        let ln = ln(ratio)?;

        sqrt(ln)
    }
*)
Definition op_
    (x : f64.t)
    (y : f64.t)
    : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
  let return_ :=
    M.return_
      (R := ltac:(result_chaining_with_question_mark.checked.MathResult)) in
  let* x : M.Val f64.t := M.alloc x in
  let* y : M.Val f64.t := M.alloc y in
  M.function_body
    (let* ratio : M.Val f64.t :=
      let* α0 : f64.t := M.read x in
      let* α1 : f64.t := M.read y in
      let* α2 :
          core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t :=
        result_chaining_with_question_mark.checked.div α0 α1 in
      let* α3 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              result_chaining_with_question_mark.checked.MathError.t)
            f64.t :=
        (core.ops.try_trait.Try.branch
            (Self :=
              core.result.Result.t
                f64.t
                result_chaining_with_question_mark.checked.MathError.t)
            (Trait := ltac:(refine _)))
          α2 in
      let* α4 :
          M.Val
            (core.ops.control_flow.ControlFlow.t
              (core.result.Result.t
                core.convert.Infallible.t
                result_chaining_with_question_mark.checked.MathError.t)
              f64.t) :=
        M.alloc α3 in
      let* α5 := M.read α4 in
      let* α6 : M.Val f64.t :=
        match α5 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 :
              core.result.Result.t
                core.convert.Infallible.t
                result_chaining_with_question_mark.checked.MathError.t :=
            M.read residual in
          let* α1 :
              core.result.Result.t
                f64.t
                result_chaining_with_question_mark.checked.MathError.t :=
            (core.ops.try_trait.FromResidual.from_residual
                (Self :=
                  core.result.Result.t
                    f64.t
                    result_chaining_with_question_mark.checked.MathError.t)
                (Trait := ltac:(refine _)))
              α0 in
          let* α2 : M.Val never.t := return_ α1 in
          never_to_any α2
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      M.copy α6 in
    let* ln : M.Val f64.t :=
      let* α0 : f64.t := M.read ratio in
      let* α1 :
          core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t :=
        result_chaining_with_question_mark.checked.ln α0 in
      let* α2 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              result_chaining_with_question_mark.checked.MathError.t)
            f64.t :=
        (core.ops.try_trait.Try.branch
            (Self :=
              core.result.Result.t
                f64.t
                result_chaining_with_question_mark.checked.MathError.t)
            (Trait := ltac:(refine _)))
          α1 in
      let* α3 :
          M.Val
            (core.ops.control_flow.ControlFlow.t
              (core.result.Result.t
                core.convert.Infallible.t
                result_chaining_with_question_mark.checked.MathError.t)
              f64.t) :=
        M.alloc α2 in
      let* α4 := M.read α3 in
      let* α5 : M.Val f64.t :=
        match α4 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 :
              core.result.Result.t
                core.convert.Infallible.t
                result_chaining_with_question_mark.checked.MathError.t :=
            M.read residual in
          let* α1 :
              core.result.Result.t
                f64.t
                result_chaining_with_question_mark.checked.MathError.t :=
            (core.ops.try_trait.FromResidual.from_residual
                (Self :=
                  core.result.Result.t
                    f64.t
                    result_chaining_with_question_mark.checked.MathError.t)
                (Trait := ltac:(refine _)))
              α0 in
          let* α2 : M.Val never.t := return_ α1 in
          never_to_any α2
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      M.copy α5 in
    let* α0 : f64.t := M.read ln in
    let* α1 :
        core.result.Result.t
          f64.t
          result_chaining_with_question_mark.checked.MathError.t :=
      result_chaining_with_question_mark.checked.sqrt α0 in
    let* α0 :
        M.Val
          (core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t) :=
      M.alloc α1 in
    M.read α0).

(*
    pub fn op(x: f64, y: f64) {
        match op_(x, y) {
            Err(why) => panic!(
                "{}",
                match why {
                    MathError::NonPositiveLogarithm => "logarithm of non-positive number",
                    MathError::DivisionByZero => "division by zero",
                    MathError::NegativeSquareRoot => "square root of negative number",
                }
            ),
            Ok(value) => println!("{}", value),
        }
    }
*)
Definition op (x : f64.t) (y : f64.t) : M unit :=
  let* x : M.Val f64.t := M.alloc x in
  let* y : M.Val f64.t := M.alloc y in
  M.function_body
    (let* α0 : f64.t := M.read x in
    let* α1 : f64.t := M.read y in
    let* α2 :
        core.result.Result.t
          f64.t
          result_chaining_with_question_mark.checked.MathError.t :=
      result_chaining_with_question_mark.checked.op_ α0 α1 in
    let* α3 :
        M.Val
          (core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t) :=
      M.alloc α2 in
    let* α4 := M.read α3 in
    let* α5 : M.Val unit :=
      match α4 with
      | core.result.Result.Err why =>
        let* why := M.alloc why in
        let* α0 := M.read why in
        let* α1 : M.Val (ref str.t) :=
          match α0 with
          |
              result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                
              =>
            M.pure (mk_str "logarithm of non-positive number")
          |
              result_chaining_with_question_mark.checked.MathError.DivisionByZero
                
              =>
            let* α0 : ref str.t := M.read (mk_str "division by zero") in
            let* α1 : M.Val str.t := deref α0 in
            let* α2 : ref str.t := borrow α1 in
            M.alloc α2
          |
              result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                
              =>
            let* α0 : ref str.t :=
              M.read (mk_str "square root of negative number") in
            let* α1 : M.Val str.t := deref α0 in
            let* α2 : ref str.t := borrow α1 in
            M.alloc α2
          end in
        let* α2 : ref (ref str.t) := borrow α1 in
        let* α3 : never.t := core.panicking.panic_display α2 in
        let* α4 : M.Val never.t := M.alloc α3 in
        never_to_any α4
      | core.result.Result.Ok value =>
        let* value := M.alloc value in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str ""; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref f64.t := borrow value in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
          let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
          let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
          let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α10 in
          let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
          let* α13 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α12 in
          let* α14 : unit := std.io.stdio._print α13 in
          M.alloc α14 in
        M.alloc tt
      end in
    M.read α5).

(*
fn main() {
    checked::op(1.0, 10.0);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : M.Val f64.t := M.alloc 1 (* 1.0 *) in
      let* α1 : f64.t := M.read α0 in
      let* α2 : M.Val f64.t := M.alloc 10 (* 10.0 *) in
      let* α3 : f64.t := M.read α2 in
      let* α4 : unit := result_chaining_with_question_mark.checked.op α1 α3 in
      M.alloc α4 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
