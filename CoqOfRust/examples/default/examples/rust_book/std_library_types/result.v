(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  
  
  Module  Impl_core_fmt_Debug_for_result_checked_MathError.
  Section Impl_core_fmt_Debug_for_result_checked_MathError.
    Definition Self : Ty.t :=
      Ty.apply (Ty.path "result::checked::MathError") [].
    
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
                | result.checked.MathError.DivisionByZero =>
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
                | result.checked.MathError.NonPositiveLogarithm =>
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
                | result.checked.MathError.NegativeSquareRoot =>
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
  End Impl_core_fmt_Debug_for_result_checked_MathError.
  End Impl_core_fmt_Debug_for_result_checked_MathError.
  
  Axiom MathResult :
      Ty.apply
        (Ty.path "core::result::Result")
        [Ty.path "f64"; Ty.apply (Ty.path "result::checked::MathError") []].
  
  (*
      pub fn div(x: f64, y: f64) -> MathResult {
          if y == 0.0 {
              // This operation would `fail`, instead let's return the reason of
              // the failure wrapped in `Err`
              Err(MathError::DivisionByZero)
          } else {
              // This operation is valid, return the result wrapped in `Ok`
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
            (core.result.Result.Err result.checked.MathError.DivisionByZero)
        else
          let* α0 := M.read x in
          let* α1 := M.read y in
          let* α2 := (M.var "BinOp::Panic::div") α0 α1 in
          M.alloc (core.result.Result.Ok α2) in
      M.read α4
    | _, _ => M.impossible
    end.
  
  (*
      pub fn sqrt(x: f64) -> MathResult {
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
            (core.result.Result.Err result.checked.MathError.NegativeSquareRoot)
        else
          let* α0 := M.read x in
          let* α1 := M.call ((Ty.path "f64")::["sqrt"] α0) in
          M.alloc (core.result.Result.Ok α1) in
      M.read α4
    | _, _ => M.impossible
    end.
  
  (*
      pub fn ln(x: f64) -> MathResult {
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
              result.checked.MathError.NonPositiveLogarithm)
        else
          let* α0 := M.read x in
          let* α1 := M.call ((Ty.path "f64")::["ln"] α0) in
          M.alloc (core.result.Result.Ok α1) in
      M.read α4
    | _, _ => M.impossible
    end.
End checked.

(*
fn op(x: f64, y: f64) -> f64 {
    // This is a three level match pyramid!
    match checked::div(x, y) {
        Err(why) => panic!("{:?}", why),
        Ok(ratio) => match checked::ln(ratio) {
            Err(why) => panic!("{:?}", why),
            Ok(ln) => match checked::sqrt(ln) {
                Err(why) => panic!("{:?}", why),
                Ok(sqrt) => sqrt,
            },
        },
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
    let* α2 := M.call ((M.var "result::checked::div") α0 α1) in
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
              let* α0 := M.read (mk_str "") in
              let* α1 := M.alloc [ α0 ] in
              let* α2 :=
                M.call
                  ((Ty.apply
                        (Ty.path "core::fmt::rt::Argument")
                        [])::["new_debug"]
                    (borrow why)) in
              let* α3 := M.alloc [ α2 ] in
              let* α4 :=
                M.call
                  ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
                    (pointer_coercion "Unsize" (borrow α1))
                    (pointer_coercion "Unsize" (borrow α3))) in
              let* α5 := M.call ((M.var "core::panicking::panic_fmt") α4) in
              let* α6 := never_to_any α5 in
              M.alloc α6
            | _ => M.break_match
            end) :
            Ty.path "f64";
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
              let* ratio := M.copy γ0_0 in
              let* α0 := M.read ratio in
              let* α1 := M.call ((M.var "result::checked::ln") α0) in
              let* α2 := M.alloc α1 in
              match_operator
                α2
                [
                  fun γ =>
                    (let* α0 := M.read γ in
                    match α0 with
                    | core.result.Result.Err _ =>
                      let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
                      let* why := M.copy γ0_0 in
                      let* α0 := M.read (mk_str "") in
                      let* α1 := M.alloc [ α0 ] in
                      let* α2 :=
                        M.call
                          ((Ty.apply
                                (Ty.path "core::fmt::rt::Argument")
                                [])::["new_debug"]
                            (borrow why)) in
                      let* α3 := M.alloc [ α2 ] in
                      let* α4 :=
                        M.call
                          ((Ty.apply
                                (Ty.path "core::fmt::Arguments")
                                [])::["new_v1"]
                            (pointer_coercion "Unsize" (borrow α1))
                            (pointer_coercion "Unsize" (borrow α3))) in
                      let* α5 :=
                        M.call ((M.var "core::panicking::panic_fmt") α4) in
                      let* α6 := never_to_any α5 in
                      M.alloc α6
                    | _ => M.break_match
                    end) :
                    Ty.path "f64";
                  fun γ =>
                    (let* α0 := M.read γ in
                    match α0 with
                    | core.result.Result.Ok _ =>
                      let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
                      let* ln := M.copy γ0_0 in
                      let* α0 := M.read ln in
                      let* α1 := M.call ((M.var "result::checked::sqrt") α0) in
                      let* α2 := M.alloc α1 in
                      match_operator
                        α2
                        [
                          fun γ =>
                            (let* α0 := M.read γ in
                            match α0 with
                            | core.result.Result.Err _ =>
                              let γ0_0 :=
                                (M.var "core::result::Result::Get_Err_0") γ in
                              let* why := M.copy γ0_0 in
                              let* α0 := M.read (mk_str "") in
                              let* α1 := M.alloc [ α0 ] in
                              let* α2 :=
                                M.call
                                  ((Ty.apply
                                        (Ty.path "core::fmt::rt::Argument")
                                        [])::["new_debug"]
                                    (borrow why)) in
                              let* α3 := M.alloc [ α2 ] in
                              let* α4 :=
                                M.call
                                  ((Ty.apply
                                        (Ty.path "core::fmt::Arguments")
                                        [])::["new_v1"]
                                    (pointer_coercion "Unsize" (borrow α1))
                                    (pointer_coercion "Unsize" (borrow α3))) in
                              let* α5 :=
                                M.call
                                  ((M.var "core::panicking::panic_fmt") α4) in
                              let* α6 := never_to_any α5 in
                              M.alloc α6
                            | _ => M.break_match
                            end) :
                            Ty.path "f64";
                          fun γ =>
                            (let* α0 := M.read γ in
                            match α0 with
                            | core.result.Result.Ok _ =>
                              let γ0_0 :=
                                (M.var "core::result::Result::Get_Ok_0") γ in
                              let* sqrt := M.copy γ0_0 in
                              M.pure sqrt
                            | _ => M.break_match
                            end) :
                            Ty.path "f64"
                        ]
                    | _ => M.break_match
                    end) :
                    Ty.path "f64"
                ]
            | _ => M.break_match
            end) :
            Ty.path "f64"
        ] in
    M.read α4
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Will this fail?
    println!("{}", op(1.0, 10.0));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 := M.read (UnsupportedLiteral : Ty.path "f64") in
        let* α4 := M.read (UnsupportedLiteral : Ty.path "f64") in
        let* α5 := M.call ((M.var "result::op") α3 α4) in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α6)) in
        let* α8 := M.alloc [ α7 ] in
        let* α9 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α8))) in
        let* α10 := M.call ((M.var "std::io::stdio::_print") α9) in
        M.alloc α10 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
