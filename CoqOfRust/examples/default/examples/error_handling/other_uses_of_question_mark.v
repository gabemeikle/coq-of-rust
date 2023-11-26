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
  Ltac Self := exact other_uses_of_question_mark.EmptyVec.t.
  
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
      let* α1 : ref str.t := M.read (mk_str "EmptyVec") in
      core.fmt.Formatter.t::["write_str"] α0 α1).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec_t.
End Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec_t.

Module  Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec_t.
Section Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec_t.
  Ltac Self := exact other_uses_of_question_mark.EmptyVec.t.
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "invalid first item to double")
      }
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "invalid first item to double" ] in
      let* α2 : ref (array (ref str.t)) := borrow α1 in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc α2 in
      let* α4 : M.Val (ref (slice (ref str.t))) :=
        pointer_coercion "Unsize" α3 in
      let* α5 : ref (slice (ref str.t)) := M.read α4 in
      let* α6 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_const"] α5 in
      core.fmt.Formatter.t::["write_fmt"] α0 α6).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Display.Trait ltac:(Self) := {
    core.fmt.Display.fmt := fmt;
  }.
End Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec_t.
End Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec_t.

Module  Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec_t.
Section Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec_t.
  Ltac Self := exact other_uses_of_question_mark.EmptyVec.t.
  
  Global Instance ℐ : core.error.Error.Required.Trait ltac:(Self) := {
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
  let return_ :=
    M.return_ (R := ltac:(other_uses_of_question_mark.Result i32.t)) in
  let* vec : M.Val (alloc.vec.Vec.t (ref str.t) alloc.vec.Vec.Default.A) :=
    M.alloc vec in
  M.function_body
    (let* first : M.Val (ref (ref str.t)) :=
      let* α0 : ref (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
        borrow vec in
      let* α1 : ref (slice (ref str.t)) :=
        (core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : core.option.Option.t (ref (ref str.t)) :=
        (slice (ref str.t))::["first"] α1 in
      let* α3 :
          core.result.Result.t
            (ref (ref str.t))
            other_uses_of_question_mark.EmptyVec.t :=
        (core.option.Option.t (ref (ref str.t)))::["ok_or"]
          α2
          other_uses_of_question_mark.EmptyVec.Build_t in
      let* α4 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              other_uses_of_question_mark.EmptyVec.t)
            (ref (ref str.t)) :=
        (core.ops.try_trait.Try.branch
            (Self :=
              core.result.Result.t
                (ref (ref str.t))
                other_uses_of_question_mark.EmptyVec.t)
            (Trait := ltac:(refine _)))
          α3 in
      let* α5 : M.Val (ref (ref str.t)) :=
        match α4 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 :
              core.result.Result.t
                core.convert.Infallible.t
                other_uses_of_question_mark.EmptyVec.t :=
            M.read residual in
          let* α1 :
              core.result.Result.t
                i32.t
                (alloc.boxed.Box.t type not implemented alloc.alloc.Global.t) :=
            (core.ops.try_trait.FromResidual.from_residual
                (Self :=
                  core.result.Result.t
                    i32.t
                    (alloc.boxed.Box.t
                      type not implemented
                      alloc.alloc.Global.t))
                (Trait := ltac:(refine _)))
              α0 in
          let* α2 : M.Val never.t := return_ α1 in
          never_to_any α2
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      M.copy α5 in
    let* parsed : M.Val i32.t :=
      let* α0 : ref (ref str.t) := M.read first in
      let* α1 : M.Val (ref str.t) := deref α0 in
      let* α2 : ref str.t := M.read α1 in
      let* α3 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
        str.t::["parse"] α2 in
      let* α4 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              core.num.error.ParseIntError.t)
            i32.t :=
        (core.ops.try_trait.Try.branch
            (Self := core.result.Result.t i32.t core.num.error.ParseIntError.t)
            (Trait := ltac:(refine _)))
          α3 in
      let* α5 : M.Val i32.t :=
        match α4 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 :
              core.result.Result.t
                core.convert.Infallible.t
                core.num.error.ParseIntError.t :=
            M.read residual in
          let* α1 :
              core.result.Result.t
                i32.t
                (alloc.boxed.Box.t type not implemented alloc.alloc.Global.t) :=
            (core.ops.try_trait.FromResidual.from_residual
                (Self :=
                  core.result.Result.t
                    i32.t
                    (alloc.boxed.Box.t
                      type not implemented
                      alloc.alloc.Global.t))
                (Trait := ltac:(refine _)))
              α0 in
          let* α2 : M.Val never.t := return_ α1 in
          never_to_any α2
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      M.copy α5 in
    let* α0 : M.Val i32.t := M.alloc 2 in
    let* α1 : M.Val i32.t := BinOp.mul α0 parsed in
    let* α2 : i32.t := M.read α1 in
    let* α0 :
        M.Val
          (core.result.Result.t
            i32.t
            (alloc.boxed.Box.t type not implemented alloc.alloc.Global.t)) :=
      M.alloc (core.result.Result.Ok α2) in
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
  let* result : M.Val ltac:(other_uses_of_question_mark.Result i32.t) :=
    M.alloc result in
  M.function_body
    (let* α0 :
        core.result.Result.t
          i32.t
          (alloc.boxed.Box.t type not implemented alloc.alloc.Global.t) :=
      M.read result in
    let* α1 : M.Val unit :=
      match α0 with
      | core.result.Result.Ok n =>
        let* n := M.alloc n in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "The first doubled is "; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref i32.t := borrow n in
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
      | core.result.Result.Err e =>
        let* e := M.alloc e in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "Error: "; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 :
              ref
                (alloc.boxed.Box.t type not implemented alloc.alloc.Global.t) :=
            borrow e in
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
    M.read α1).

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
  M.function_body
    (let* numbers : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
      let* α0 : ref str.t := M.read (mk_str "93") in
      let* α1 : M.Val (ref str.t) := M.alloc α0 in
      let* α2 : ref str.t := M.read (mk_str "18") in
      let* α3 : M.Val (ref str.t) := M.alloc α2 in
      let* α4 : M.Val (array (ref str.t)) := M.alloc [ mk_str "42"; α1; α3 ] in
      let* α5 :
          M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α4 in
      let* α6 :
          M.Val (alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t) :=
        pointer_coercion "Unsize" α5 in
      let* α7 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
        M.read α6 in
      let* α8 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        (slice (ref str.t))::["into_vec"] α7 in
      M.alloc α8 in
    let* empty : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
      let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)::["new"] in
      M.alloc α0 in
    let* strings : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
      let* α0 : ref str.t := M.read (mk_str "93") in
      let* α1 : M.Val (ref str.t) := M.alloc α0 in
      let* α2 : ref str.t := M.read (mk_str "18") in
      let* α3 : M.Val (ref str.t) := M.alloc α2 in
      let* α4 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "tofu"; α1; α3 ] in
      let* α5 :
          M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α4 in
      let* α6 :
          M.Val (alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t) :=
        pointer_coercion "Unsize" α5 in
      let* α7 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
        M.read α6 in
      let* α8 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        (slice (ref str.t))::["into_vec"] α7 in
      M.alloc α8 in
    let* _ : M.Val unit :=
      let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        M.read numbers in
      let* α1 :
          core.result.Result.t
            i32.t
            (alloc.boxed.Box.t type not implemented alloc.alloc.Global.t) :=
        other_uses_of_question_mark.double_first α0 in
      let* α2 : unit := other_uses_of_question_mark.print α1 in
      M.alloc α2 in
    let* _ : M.Val unit :=
      let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        M.read empty in
      let* α1 :
          core.result.Result.t
            i32.t
            (alloc.boxed.Box.t type not implemented alloc.alloc.Global.t) :=
        other_uses_of_question_mark.double_first α0 in
      let* α2 : unit := other_uses_of_question_mark.print α1 in
      M.alloc α2 in
    let* _ : M.Val unit :=
      let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        M.read strings in
      let* α1 :
          core.result.Result.t
            i32.t
            (alloc.boxed.Box.t type not implemented alloc.alloc.Global.t) :=
        other_uses_of_question_mark.double_first α0 in
      let* α2 : unit := other_uses_of_question_mark.print α1 in
      M.alloc α2 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
