(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition Result : Set := core.result.Result T (alloc.boxed.Box TraitObject).

Module EmptyVec.
  Inductive t : Set := Build.
End EmptyVec.
Definition EmptyVec := @EmptyVec.t.

Module Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.
  Definition Self := boxing_errors.EmptyVec.
  
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
End Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.

Module Impl_core_clone_Clone_for_boxing_errors_EmptyVec.
  Definition Self := boxing_errors.EmptyVec.
  
  Definition clone
      `{H : State.Trait}
      (self : ref It_is_here!)
      : M (H := H) boxing_errors.EmptyVec :=
    Pure boxing_errors.EmptyVec.Build.
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_boxing_errors_EmptyVec.

Module Impl_core_fmt_Display_for_boxing_errors_EmptyVec.
  Definition Self := boxing_errors.EmptyVec.
  
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
End Impl_core_fmt_Display_for_boxing_errors_EmptyVec.

Module Impl_core_error_Error_for_boxing_errors_EmptyVec.
  Definition Self := boxing_errors.EmptyVec.
  
  Global Instance I : core.error.Error.Trait Self :=
    core.error.Error.Build_Trait _.
End Impl_core_error_Error_for_boxing_errors_EmptyVec.

Definition double_first
    `{H : State.Trait}
    (vec : alloc.vec.Vec (ref str))
    : M (H := H) (boxing_errors.Result i32) :=
  let* α0 := vec.["first"] in
  let* α1 :=
    α0.["ok_or_else"] (fun  => boxing_errors.EmptyVec.Build.["into"]) in
  α1.["and_then"]
    (fun s =>
      let* α0 := s.["parse"] in
      let* α1 := α0.["map_err"] (fun e => e.["into"]) in
      α1.["map"] (fun i => 2.["mul"] i)).

Definition print
    `{H : State.Trait}
    (result : boxing_errors.Result i32)
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
    let* α0 := boxing_errors.double_first numbers in
    boxing_errors.print α0 in
  let* _ :=
    let* α0 := boxing_errors.double_first empty in
    boxing_errors.print α0 in
  let* _ :=
    let* α0 := boxing_errors.double_first strings in
    boxing_errors.print α0 in
  Pure tt.
