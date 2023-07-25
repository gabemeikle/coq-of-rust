(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition Result : Set := core.result.Result T wrapping_errors.DoubleError.

Module DoubleError.
  Inductive t : Set :=
  | EmptyVec
  | Parse (_ : core.num.error.ParseIntError).
End DoubleError.
Definition DoubleError := DoubleError.t.

Module Impl_core_fmt_Debug_for_wrapping_errors_DoubleError.
  Definition Self := wrapping_errors.DoubleError.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    match self with
    | wrapping_errors.DoubleError.EmptyVec =>
      core.fmt.Formatter::["write_str"] f "EmptyVec"
    | wrapping_errors.DoubleError.Parse __self_0 =>
      core.fmt.Formatter::["debug_tuple_field1_finish"]
        f
        "Parse"
        (addr_of __self_0)
    end.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_wrapping_errors_DoubleError.

Module Impl_core_fmt_Display_for_wrapping_errors_DoubleError.
  Definition Self := wrapping_errors.DoubleError.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    let* α0 := self.["deref"] in
    match α0 with
    | wrapping_errors.DoubleError.EmptyVec =>
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "please use a vector with at least one element" ]) in
      f.["write_fmt"] α0
    | wrapping_errors.DoubleError.Parse  =>
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "the provided string could not be parsed as int" ]) in
      f.["write_fmt"] α0
    end.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Display.Trait Self := {
    core.fmt.Display.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Display_for_wrapping_errors_DoubleError.

Module Impl_core_error_Error_for_wrapping_errors_DoubleError.
  Definition Self := wrapping_errors.DoubleError.
  
  Definition source
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) (core.option.Option (ref TraitObject)) :=
    let* α0 := self.["deref"] in
    match α0 with
    | wrapping_errors.DoubleError.EmptyVec => Pure core.option.Option.None
    | wrapping_errors.DoubleError.Parse e => Pure (core.option.Option.Some e)
    end.
  
  Global Instance Method_source `{H : State.Trait} : Notation.Dot "source" := {
    Notation.dot := source;
  }.
  
  Global Instance I : core.error.Error.Trait Self := {
  }.
End Impl_core_error_Error_for_wrapping_errors_DoubleError.

Module Impl_core_convert_From_for_wrapping_errors_DoubleError.
  Definition Self := wrapping_errors.DoubleError.
  
  Definition from
      `{H : State.Trait}
      (err : core.num.error.ParseIntError)
      : M (H := H) wrapping_errors.DoubleError :=
    Pure (wrapping_errors.DoubleError.Parse err).
  
  Global Instance AssociatedFunction_from `{H : State.Trait} :
    Notation.DoubleColon Self "from" := {
    Notation.double_colon := from;
  }.
  
  Global Instance I :
      core.convert.From.Trait Self (T := core.num.error.ParseIntError) := {
    core.convert.From.from `{H : State.Trait} := from;
  }.
End Impl_core_convert_From_for_wrapping_errors_DoubleError.

Definition double_first
    `{H : State.Trait}
    (vec : alloc.vec.Vec (ref str))
    : M (H := H) (wrapping_errors.Result i32) :=
  let* first :=
    let* α0 := vec.["first"] in
    let* α1 := α0.["ok_or"] wrapping_errors.DoubleError.EmptyVec in
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
    (result : wrapping_errors.Result i32)
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
      let* _ :=
        let* α0 := format_argument::["new_display"] (addr_of e) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "Error: "; "
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt in
    let* α0 := e.["source"] in
    match α0 with
    | core.option.Option.Some source =>
      let* _ :=
        let* _ :=
          let* α0 := format_argument::["new_display"] (addr_of source) in
          let* α1 :=
            format_arguments::["new_v1"]
              (addr_of [ "  Caused by: "; "
" ])
              (addr_of [ α0 ]) in
          std.io.stdio._print α1 in
        Pure tt in
      Pure tt
    end
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* numbers :=
    let* α0 := alloc.boxed.Box::["new"] [ "42"; "93"; "18" ] in
    Slice::["into_vec"] α0 in
  let* empty := alloc.vec.Vec::["new"] in
  let* strings :=
    let* α0 := alloc.boxed.Box::["new"] [ "tofu"; "93"; "18" ] in
    Slice::["into_vec"] α0 in
  let* _ :=
    let* α0 := wrapping_errors.double_first numbers in
    wrapping_errors.print α0 in
  let* _ :=
    let* α0 := wrapping_errors.double_first empty in
    wrapping_errors.print α0 in
  let* _ :=
    let* α0 := wrapping_errors.double_first strings in
    wrapping_errors.print α0 in
  Pure tt.
