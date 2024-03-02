(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  
  
  Module  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  Section Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
    Definition Self : Ty.t :=
      Ty.apply
        (Ty.path "result_chaining_with_question_mark::checked::MathError")
        [].
    
    (*
        Debug
    *)
    Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
      match 𝜏, α with
      | [], [self; f] =>
        let* self := M.alloc self in
        let* f := M.alloc f in
        let* α0 := M.read f in
        let* α1 :=
          match_operator
            self
            [
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                |
                    result_chaining_with_question_mark.checked.MathError.DivisionByZero
                    =>
                  let* α0 := M.read (mk_str "DivisionByZero") in
                  M.alloc α0
                | _ => M.break_match
                end) :
                Ty.apply (Ty.path "ref") [Ty.path "str"];
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                |
                    result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                    =>
                  let* α0 := M.read (mk_str "NonPositiveLogarithm") in
                  M.alloc α0
                | _ => M.break_match
                end) :
                Ty.apply (Ty.path "ref") [Ty.path "str"];
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                |
                    result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                    =>
                  let* α0 := M.read (mk_str "NegativeSquareRoot") in
                  M.alloc α0
                | _ => M.break_match
                end) :
                Ty.apply (Ty.path "ref") [Ty.path "str"]
            ] in
        let* α2 := M.read α1 in
        M.call
          ((Ty.apply (Ty.path "core::fmt::Formatter") [])::["write_str"] α0 α2)
      | _, _ => M.impossible
      end.
    
    Definition AssociatedFunction_fmt : Instance.t := {
      Notations.double_colon := fmt;
    }.
    
    Definition ℐ : Instance.t := [("fmt", fmt)].
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  
  Axiom MathResult :
      Ty.apply
        (Ty.path "core::result::Result")
        [Ty.path "f64";
          Ty.apply
            (Ty.path "result_chaining_with_question_mark::checked::MathError")
            []].
  
  (*
      fn div(x: f64, y: f64) -> MathResult {
          if y == 0.0 {
              Err(MathError::DivisionByZero)
          } else {
              Ok(x / y)
          }
      }
  *)
  Definition div (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [x; y] =>
      let* x := M.alloc x in
      let* y := M.alloc y in
      let* α0 := M.read y in
      let* α1 := M.read (UnsupportedLiteral : Ty.path "f64") in
      let* α2 := M.alloc ((M.var "BinOp::Pure::eq") α0 α1) in
      let* α3 := M.read (use α2) in
      let* α4 :=
        if α3 then
          M.alloc
            (core.result.Result.Err
              result_chaining_with_question_mark.checked.MathError.DivisionByZero)
        else
          let* α0 := M.read x in
          let* α1 := M.read y in
          let* α2 := (M.var "BinOp::Panic::div") α0 α1 in
          M.alloc (core.result.Result.Ok α2) in
      M.read α4
    | _, _ => M.impossible
    end.
  
  (*
      fn sqrt(x: f64) -> MathResult {
          if x < 0.0 {
              Err(MathError::NegativeSquareRoot)
          } else {
              Ok(x.sqrt())
          }
      }
  *)
  Definition sqrt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [x] =>
      let* x := M.alloc x in
      let* α0 := M.read x in
      let* α1 := M.read (UnsupportedLiteral : Ty.path "f64") in
      let* α2 := M.alloc ((M.var "BinOp::Pure::lt") α0 α1) in
      let* α3 := M.read (use α2) in
      let* α4 :=
        if α3 then
          M.alloc
            (core.result.Result.Err
              result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot)
        else
          let* α0 := M.read x in
          let* α1 := M.call ((Ty.path "f64")::["sqrt"] α0) in
          M.alloc (core.result.Result.Ok α1) in
      M.read α4
    | _, _ => M.impossible
    end.
  
  (*
      fn ln(x: f64) -> MathResult {
          if x <= 0.0 {
              Err(MathError::NonPositiveLogarithm)
          } else {
              Ok(x.ln())
          }
      }
  *)
  Definition ln (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [x] =>
      let* x := M.alloc x in
      let* α0 := M.read x in
      let* α1 := M.read (UnsupportedLiteral : Ty.path "f64") in
      let* α2 := M.alloc ((M.var "BinOp::Pure::le") α0 α1) in
      let* α3 := M.read (use α2) in
      let* α4 :=
        if α3 then
          M.alloc
            (core.result.Result.Err
              result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm)
        else
          let* α0 := M.read x in
          let* α1 := M.call ((Ty.path "f64")::["ln"] α0) in
          M.alloc (core.result.Result.Ok α1) in
      M.read α4
    | _, _ => M.impossible
    end.
  
  (*
      fn op_(x: f64, y: f64) -> MathResult {
          // if `div` "fails", then `DivisionByZero` will be `return`ed
          let ratio = div(x, y)?;
  
          // if `ln` "fails", then `NonPositiveLogarithm` will be `return`ed
          let ln = ln(ratio)?;
  
          sqrt(ln)
      }
  *)
  Definition op_ (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [x; y] =>
      let* x := M.alloc x in
      let* y := M.alloc y in
      let return_ :=
        M.return_
          (R :=
            Ty.apply
              (Ty.path "core::result::Result")
              [Ty.path "f64";
                Ty.apply
                  (Ty.path
                    "result_chaining_with_question_mark::checked::MathError")
                  []]) in
      M.catch_return
        (let* ratio :=
          let* α0 :=
            ltac:(M.get_method (fun ℐ =>
              core.ops.try_trait.Try.branch
                (Self :=
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [Ty.path "f64";
                      Ty.apply
                        (Ty.path
                          "result_chaining_with_question_mark::checked::MathError")
                        []])
                (Trait := ℐ))) in
          let* α1 := M.read x in
          let* α2 := M.read y in
          let* α3 :=
            M.call
              ((M.var "result_chaining_with_question_mark::checked::div")
                α1
                α2) in
          let* α4 := M.call (α0 α3) in
          let* α5 := M.alloc α4 in
          let* α6 :=
            match_operator
              α5
              [
                fun γ =>
                  (let* α0 := M.read γ in
                  match α0 with
                  | core.ops.control_flow.ControlFlow.Break _ =>
                    let γ0_0 :=
                      (M.var
                          "core::ops::control_flow::ControlFlow::Get_Break_0")
                        γ in
                    let* residual := M.copy γ0_0 in
                    let* α0 :=
                      ltac:(M.get_method (fun ℐ =>
                        core.ops.try_trait.FromResidual.from_residual
                          (Self :=
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [Ty.path "f64";
                                Ty.apply
                                  (Ty.path
                                    "result_chaining_with_question_mark::checked::MathError")
                                  []])
                          (R :=
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [Ty.apply
                                  (Ty.path "core::convert::Infallible")
                                  [];
                                Ty.apply
                                  (Ty.path
                                    "result_chaining_with_question_mark::checked::MathError")
                                  []])
                          (Trait := ℐ))) in
                    let* α1 := M.read residual in
                    let* α2 := M.call (α0 α1) in
                    let* α3 := return_ α2 in
                    let* α4 := M.read α3 in
                    let* α5 := never_to_any α4 in
                    M.alloc α5
                  | _ => M.break_match
                  end) :
                  Ty.path "f64";
                fun γ =>
                  (let* α0 := M.read γ in
                  match α0 with
                  | core.ops.control_flow.ControlFlow.Continue _ =>
                    let γ0_0 :=
                      (M.var
                          "core::ops::control_flow::ControlFlow::Get_Continue_0")
                        γ in
                    let* val := M.copy γ0_0 in
                    M.pure val
                  | _ => M.break_match
                  end) :
                  Ty.path "f64"
              ] in
          M.copy α6 in
        let* ln :=
          let* α0 :=
            ltac:(M.get_method (fun ℐ =>
              core.ops.try_trait.Try.branch
                (Self :=
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [Ty.path "f64";
                      Ty.apply
                        (Ty.path
                          "result_chaining_with_question_mark::checked::MathError")
                        []])
                (Trait := ℐ))) in
          let* α1 := M.read ratio in
          let* α2 :=
            M.call
              ((M.var "result_chaining_with_question_mark::checked::ln") α1) in
          let* α3 := M.call (α0 α2) in
          let* α4 := M.alloc α3 in
          let* α5 :=
            match_operator
              α4
              [
                fun γ =>
                  (let* α0 := M.read γ in
                  match α0 with
                  | core.ops.control_flow.ControlFlow.Break _ =>
                    let γ0_0 :=
                      (M.var
                          "core::ops::control_flow::ControlFlow::Get_Break_0")
                        γ in
                    let* residual := M.copy γ0_0 in
                    let* α0 :=
                      ltac:(M.get_method (fun ℐ =>
                        core.ops.try_trait.FromResidual.from_residual
                          (Self :=
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [Ty.path "f64";
                                Ty.apply
                                  (Ty.path
                                    "result_chaining_with_question_mark::checked::MathError")
                                  []])
                          (R :=
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [Ty.apply
                                  (Ty.path "core::convert::Infallible")
                                  [];
                                Ty.apply
                                  (Ty.path
                                    "result_chaining_with_question_mark::checked::MathError")
                                  []])
                          (Trait := ℐ))) in
                    let* α1 := M.read residual in
                    let* α2 := M.call (α0 α1) in
                    let* α3 := return_ α2 in
                    let* α4 := M.read α3 in
                    let* α5 := never_to_any α4 in
                    M.alloc α5
                  | _ => M.break_match
                  end) :
                  Ty.path "f64";
                fun γ =>
                  (let* α0 := M.read γ in
                  match α0 with
                  | core.ops.control_flow.ControlFlow.Continue _ =>
                    let γ0_0 :=
                      (M.var
                          "core::ops::control_flow::ControlFlow::Get_Continue_0")
                        γ in
                    let* val := M.copy γ0_0 in
                    M.pure val
                  | _ => M.break_match
                  end) :
                  Ty.path "f64"
              ] in
          M.copy α5 in
        let* α0 := M.read ln in
        let* α1 :=
          M.call
            ((M.var "result_chaining_with_question_mark::checked::sqrt") α0) in
        let* α0 := M.alloc α1 in
        M.read α0)
    | _, _ => M.impossible
    end.
  
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
  Definition op (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [x; y] =>
      let* x := M.alloc x in
      let* y := M.alloc y in
      let* α0 := M.read x in
      let* α1 := M.read y in
      let* α2 :=
        M.call
          ((M.var "result_chaining_with_question_mark::checked::op_") α0 α1) in
      let* α3 := M.alloc α2 in
      let* α4 :=
        match_operator
          α3
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.result.Result.Err _ =>
                let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
                let* why := M.copy γ0_0 in
                let* α0 :=
                  match_operator
                    why
                    [
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        |
                            result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                            =>
                          M.pure (mk_str "logarithm of non-positive number")
                        | _ => M.break_match
                        end) :
                        Ty.apply (Ty.path "ref") [Ty.path "str"];
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        |
                            result_chaining_with_question_mark.checked.MathError.DivisionByZero
                            =>
                          let* α0 := M.read (mk_str "division by zero") in
                          M.alloc α0
                        | _ => M.break_match
                        end) :
                        Ty.apply (Ty.path "ref") [Ty.path "str"];
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        |
                            result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                            =>
                          let* α0 :=
                            M.read (mk_str "square root of negative number") in
                          M.alloc α0
                        | _ => M.break_match
                        end) :
                        Ty.apply (Ty.path "ref") [Ty.path "str"]
                    ] in
                let* α1 :=
                  M.call
                    ((M.var "core::panicking::panic_display") (borrow α0)) in
                let* α2 := never_to_any α1 in
                M.alloc α2
              | _ => M.break_match
              end) :
              Ty.tuple;
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.result.Result.Ok _ =>
                let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
                let* value := M.copy γ0_0 in
                let* _ :=
                  let* α0 := M.read (mk_str "") in
                  let* α1 := M.read (mk_str "
") in
                  let* α2 := M.alloc [ α0; α1 ] in
                  let* α3 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::rt::Argument")
                            [])::["new_display"]
                        (borrow value)) in
                  let* α4 := M.alloc [ α3 ] in
                  let* α5 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::Arguments")
                            [])::["new_v1"]
                        (pointer_coercion "Unsize" (borrow α2))
                        (pointer_coercion "Unsize" (borrow α4))) in
                  let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
                  M.alloc α6 in
                M.alloc tt
              | _ => M.break_match
              end) :
              Ty.tuple
          ] in
      M.read α4
    | _, _ => M.impossible
    end.
End checked.

(*
fn main() {
    checked::op(1.0, 10.0);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.read (UnsupportedLiteral : Ty.path "f64") in
      let* α1 := M.read (UnsupportedLiteral : Ty.path "f64") in
      let* α2 :=
        M.call
          ((M.var "result_chaining_with_question_mark::checked::op") α0 α1) in
      M.alloc α2 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
