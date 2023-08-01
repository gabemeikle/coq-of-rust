(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition Result : Set := core.result.Result T (alloc.boxed.Box TraitObject).

Module EmptyVec.
  Inductive t : Set := Build.
End EmptyVec.
Definition EmptyVec := @EmptyVec.t.

Module Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.
  Definition Self := other_uses_of_question_mark.EmptyVec.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref It_is_here!)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.fmt.Formatter::["write_str"] f "EmptyVec".
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.

Module Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.
  Definition Self := other_uses_of_question_mark.EmptyVec.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref It_is_here!)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    let* α0 :=
      format_arguments::["new_const"]
        (addr_of [ "invalid first item to double" ]) in
    f.["write_fmt"] α0.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Display.Trait Self := {
    core.fmt.Display.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.

Module Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.
  Definition Self := other_uses_of_question_mark.EmptyVec.
  
  Global Instance I : core.error.Error.Trait Self :=
    core.error.Error.Build_Trait _.
End Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.

Definition double_first
    `{H : State.Trait}
    (vec : alloc.vec.Vec (ref str))
    : M (H := H) (other_uses_of_question_mark.Result i32) :=
  let* first :=
    let* α0 := vec.["first"] in
    let* α1 := α0.["ok_or"] other_uses_of_question_mark.EmptyVec.Build in
    let* α2 := α1.["branch"] in
    match α2 with
    | LanguageItem.Break residual =>
      let* α0 := residual.["from_residual"] in
      Return α0
    | LanguageItem.Continue val => Pure val
    end in
  let* parsed :=
    let* α0 := first.["parse"] in
    let* α1 := α0.["branch"] in
    match α1 with
    | LanguageItem.Break residual =>
      let* α0 := residual.["from_residual"] in
      Return α0
    | LanguageItem.Continue val => Pure val
    end in
  let* α0 := 2.["mul"] parsed in
  Pure (core.result.Result.Ok α0).

Definition print
    `{H : State.Trait}
    (result : other_uses_of_question_mark.Result i32)
    : M (H := H) unit :=
  match result with
  | core.result.Result.Ok n =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of n) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "The first doubled is "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt
  | core.result.Result.Err e =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of e) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Error: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* numbers :=
    let* α0 := alloc.boxed.Box::["new"] [ "42"; "93"; "18" ] in
    (Slice _)::["into_vec"] α0 in
  let* empty := alloc.vec.Vec::["new"] in
  let* strings :=
    let* α0 := alloc.boxed.Box::["new"] [ "tofu"; "93"; "18" ] in
    (Slice _)::["into_vec"] α0 in
  let* _ :=
    let* α0 := other_uses_of_question_mark.double_first numbers in
    other_uses_of_question_mark.print α0 in
  let* _ :=
    let* α0 := other_uses_of_question_mark.double_first empty in
    other_uses_of_question_mark.print α0 in
  let* _ :=
    let* α0 := other_uses_of_question_mark.double_first strings in
    other_uses_of_question_mark.print α0 in
  Pure tt.
