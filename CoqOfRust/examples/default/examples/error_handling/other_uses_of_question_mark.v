(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Ltac Result T :=
  exact
    (core.result.Result.t
      T
      (alloc.boxed.Box.t _ (* dyn *) alloc.boxed.Box.Default.A)).

Module  EmptyVec.
Section EmptyVec.
  Inductive t : Set := Build.
End EmptyVec.
End EmptyVec.

Module  Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec_t.
Section Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec_t.
  Definition Self : Set := other_uses_of_question_mark.EmptyVec.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "EmptyVec") in
    M.call (core.fmt.Formatter.t::["write_str"] α0 α1).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec_t.
End Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec_t.

Module  Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec_t.
Section Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec_t.
  Definition Self : Set := other_uses_of_question_mark.EmptyVec.t.
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "invalid first item to double")
      }
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "invalid first item to double") in
    let* α2 : M.Val (array (ref str.t)) := M.alloc [ α1 ] in
    let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
    let* α4 : ref (slice (ref str.t)) :=
      M.read (pointer_coercion "Unsize" α3) in
    let* α5 : core.fmt.Arguments.t :=
      M.call (core.fmt.Arguments.t::["new_const"] α4) in
    M.call (core.fmt.Formatter.t::["write_fmt"] α0 α5).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Display.Trait Self := {
    core.fmt.Display.fmt := fmt;
  }.
End Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec_t.
End Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec_t.

Module  Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec_t.
Section Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec_t.
  Definition Self : Set := other_uses_of_question_mark.EmptyVec.t.
  
  Global Instance ℐ : core.error.Error.Required.Trait Self := {
    core.error.Error.source := Datatypes.None;
    core.error.Error.type_id := Datatypes.None;
    core.error.Error.description := Datatypes.None;
    core.error.Error.cause := Datatypes.None;
    core.error.Error.provide := Datatypes.None;
  }.
End Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec_t.
End Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec_t.

(*
fn double_first(vec: Vec<&str>) -> Result<i32> {
    let first = vec.first().ok_or(EmptyVec)?;
    let parsed = first.parse::<i32>()?;
    Ok(2 * parsed)
}
*)
Definition double_first
    (vec : alloc.vec.Vec.t (ref str.t) alloc.vec.Vec.Default.A)
    : M ltac:(other_uses_of_question_mark.Result i32.t) :=
  let* vec := M.alloc vec in
  let return_ :=
    M.return_ (R := ltac:(other_uses_of_question_mark.Result i32.t)) in
  M.catch_return
    (let* first : M.Val (ref (ref str.t)) :=
      let* α0 : _ :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.try_trait.Try.branch
            (Self :=
              core.result.Result.t
                (ref (ref str.t))
                other_uses_of_question_mark.EmptyVec.t)
            (Trait := ℐ))) in
      let* α1 : _ :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
            (Trait := ℐ))) in
      let* α2 : ref (slice (ref str.t)) := M.call (α1 (borrow vec)) in
      let* α3 : core.option.Option.t (ref (ref str.t)) :=
        M.call ((slice (ref str.t))::["first"] α2) in
      let* α4 :
          core.result.Result.t
            (ref (ref str.t))
            other_uses_of_question_mark.EmptyVec.t :=
        M.call
          ((core.option.Option.t (ref (ref str.t)))::["ok_or"]
            α3
            other_uses_of_question_mark.EmptyVec.Build) in
      let* α5 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              other_uses_of_question_mark.EmptyVec.t)
            (ref (ref str.t)) :=
        M.call (α0 α4) in
      let* α6 :
          M.Val
            (core.ops.control_flow.ControlFlow.t
              (core.result.Result.t
                core.convert.Infallible.t
                other_uses_of_question_mark.EmptyVec.t)
              (ref (ref str.t))) :=
        M.alloc α5 in
      let* α7 : M.Val (ref (ref str.t)) :=
        match_operator
          α6
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.ops.control_flow.ControlFlow.Break _ =>
                let γ0_0 := core.ops.control_flow.ControlFlow.Get_Break_0 γ in
                let* residual := M.copy γ0_0 in
                let* α0 : _ :=
                  ltac:(M.get_method (fun ℐ =>
                    core.ops.try_trait.FromResidual.from_residual
                      (Self :=
                        core.result.Result.t
                          i32.t
                          (alloc.boxed.Box.t _ (* dyn *) alloc.alloc.Global.t))
                      (R :=
                        core.result.Result.t
                          core.convert.Infallible.t
                          other_uses_of_question_mark.EmptyVec.t)
                      (Trait := ℐ))) in
                let* α1 :
                    core.result.Result.t
                      core.convert.Infallible.t
                      other_uses_of_question_mark.EmptyVec.t :=
                  M.read residual in
                let* α2 :
                    core.result.Result.t
                      i32.t
                      (alloc.boxed.Box.t _ (* dyn *) alloc.alloc.Global.t) :=
                  M.call (α0 α1) in
                let* α3 : M.Val never.t := return_ α2 in
                let* α4 := M.read α3 in
                let* α5 : ref (ref str.t) := never_to_any α4 in
                M.alloc α5
              | _ => M.break_match
              end) :
              M (M.Val (ref (ref str.t)));
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.ops.control_flow.ControlFlow.Continue _ =>
                let γ0_0 :=
                  core.ops.control_flow.ControlFlow.Get_Continue_0 γ in
                let* val := M.copy γ0_0 in
                M.pure val
              | _ => M.break_match
              end) :
              M (M.Val (ref (ref str.t)))
          ] in
      M.copy α7 in
    let* parsed : M.Val i32.t :=
      let* α0 : _ :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.try_trait.Try.branch
            (Self := core.result.Result.t i32.t core.num.error.ParseIntError.t)
            (Trait := ℐ))) in
      let* α1 : ref (ref str.t) := M.read first in
      let* α2 : ref str.t := M.read (deref α1) in
      let* α3 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
        M.call (str.t::["parse"] α2) in
      let* α4 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              core.num.error.ParseIntError.t)
            i32.t :=
        M.call (α0 α3) in
      let* α5 :
          M.Val
            (core.ops.control_flow.ControlFlow.t
              (core.result.Result.t
                core.convert.Infallible.t
                core.num.error.ParseIntError.t)
              i32.t) :=
        M.alloc α4 in
      let* α6 : M.Val i32.t :=
        match_operator
          α5
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.ops.control_flow.ControlFlow.Break _ =>
                let γ0_0 := core.ops.control_flow.ControlFlow.Get_Break_0 γ in
                let* residual := M.copy γ0_0 in
                let* α0 : _ :=
                  ltac:(M.get_method (fun ℐ =>
                    core.ops.try_trait.FromResidual.from_residual
                      (Self :=
                        core.result.Result.t
                          i32.t
                          (alloc.boxed.Box.t _ (* dyn *) alloc.alloc.Global.t))
                      (R :=
                        core.result.Result.t
                          core.convert.Infallible.t
                          core.num.error.ParseIntError.t)
                      (Trait := ℐ))) in
                let* α1 :
                    core.result.Result.t
                      core.convert.Infallible.t
                      core.num.error.ParseIntError.t :=
                  M.read residual in
                let* α2 :
                    core.result.Result.t
                      i32.t
                      (alloc.boxed.Box.t _ (* dyn *) alloc.alloc.Global.t) :=
                  M.call (α0 α1) in
                let* α3 : M.Val never.t := return_ α2 in
                let* α4 := M.read α3 in
                let* α5 : i32.t := never_to_any α4 in
                M.alloc α5
              | _ => M.break_match
              end) :
              M (M.Val i32.t);
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.ops.control_flow.ControlFlow.Continue _ =>
                let γ0_0 :=
                  core.ops.control_flow.ControlFlow.Get_Continue_0 γ in
                let* val := M.copy γ0_0 in
                M.pure val
              | _ => M.break_match
              end) :
              M (M.Val i32.t)
          ] in
      M.copy α6 in
    let* α0 : i32.t := M.read parsed in
    let* α1 : i32.t := BinOp.Panic.mul ((Integer.of_Z 2) : i32.t) α0 in
    let* α0 :
        M.Val
          (core.result.Result.t
            i32.t
            (alloc.boxed.Box.t _ (* dyn *) alloc.alloc.Global.t)) :=
      M.alloc (core.result.Result.Ok α1) in
    M.read α0).

(*
fn print(result: Result<i32>) {
    match result {
        Ok(n) => println!("The first doubled is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Definition print
    (result : ltac:(other_uses_of_question_mark.Result i32.t))
    : M unit :=
  let* result := M.alloc result in
  let* α0 : M.Val unit :=
    match_operator
      result
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.result.Result.Ok _ =>
            let γ0_0 := core.result.Result.Get_Ok_0 γ in
            let* n := M.copy γ0_0 in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "The first doubled is ") in
              let* α1 : ref str.t := M.read (mk_str "
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α2) in
              let* α4 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α3) in
              let* α5 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow n)) in
              let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α5 ] in
              let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α6) in
              let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α7) in
              let* α9 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
              let* α10 : unit := M.call (std.io.stdio._print α9) in
              M.alloc α10 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.result.Result.Err _ =>
            let γ0_0 := core.result.Result.Get_Err_0 γ in
            let* e := M.copy γ0_0 in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "Error: ") in
              let* α1 : ref str.t := M.read (mk_str "
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α2) in
              let* α4 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α3) in
              let* α5 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow e)) in
              let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α5 ] in
              let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α6) in
              let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α7) in
              let* α9 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
              let* α10 : unit := M.call (std.io.stdio._print α9) in
              M.alloc α10 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit)
      ] in
  M.read α0.

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    print(double_first(numbers));
    print(double_first(empty));
    print(double_first(strings));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* numbers : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
    let* α0 : ref str.t := M.read (mk_str "42") in
    let* α1 : ref str.t := M.read (mk_str "93") in
    let* α2 : ref str.t := M.read (mk_str "18") in
    let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
    let* α4 :
        M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3) in
    let* α5 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
      M.read (pointer_coercion "Unsize" α4) in
    let* α6 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call ((slice (ref str.t))::["into_vec"] α5) in
    M.alloc α6 in
  let* empty : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)::["new"] in
    M.alloc α0 in
  let* strings : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
    let* α0 : ref str.t := M.read (mk_str "tofu") in
    let* α1 : ref str.t := M.read (mk_str "93") in
    let* α2 : ref str.t := M.read (mk_str "18") in
    let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
    let* α4 :
        M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3) in
    let* α5 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
      M.read (pointer_coercion "Unsize" α4) in
    let* α6 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call ((slice (ref str.t))::["into_vec"] α5) in
    M.alloc α6 in
  let* _ : M.Val unit :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.read numbers in
    let* α1 :
        core.result.Result.t
          i32.t
          (alloc.boxed.Box.t _ (* dyn *) alloc.alloc.Global.t) :=
      M.call (other_uses_of_question_mark.double_first α0) in
    let* α2 : unit := M.call (other_uses_of_question_mark.print α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.read empty in
    let* α1 :
        core.result.Result.t
          i32.t
          (alloc.boxed.Box.t _ (* dyn *) alloc.alloc.Global.t) :=
      M.call (other_uses_of_question_mark.double_first α0) in
    let* α2 : unit := M.call (other_uses_of_question_mark.print α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.read strings in
    let* α1 :
        core.result.Result.t
          i32.t
          (alloc.boxed.Box.t _ (* dyn *) alloc.alloc.Global.t) :=
      M.call (other_uses_of_question_mark.double_first α0) in
    let* α2 : unit := M.call (other_uses_of_question_mark.print α1) in
    M.alloc α2 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
