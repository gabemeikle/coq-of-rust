(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition Result (T : Set) : Set :=
  core.result.Result T wrapping_errors.DoubleError.

Module DoubleError.
  Inductive t : Set :=
  | EmptyVec
  | Parse (_ : core.num.error.ParseIntError).
End DoubleError.
Definition DoubleError : Set := DoubleError.t.

Module Impl_core_fmt_Debug_for_wrapping_errors_DoubleError.
  Definition Self `{State.Trait} := wrapping_errors.DoubleError.
  
  Definition fmt
      `{State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M core.fmt.Result :=
    match self with
    | wrapping_errors.DoubleError  =>
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 := deref (mk_str "EmptyVec") str in
      let* α3 := borrow α2 str in
      core.fmt.Formatter::["write_str"] α1 α3
    | wrapping_errors.DoubleError __self_0 =>
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 := deref (mk_str "Parse") str in
      let* α3 := borrow α2 str in
      let* α4 := borrow __self_0 (ref core.num.error.ParseIntError) in
      let* α5 := deref α4 (ref core.num.error.ParseIntError) in
      let* α6 := borrow α5 (ref core.num.error.ParseIntError) in
      let* α7 := pointer_coercion "Unsize" α6 in
      core.fmt.Formatter::["debug_tuple_field1_finish"] α1 α3 α7
    end.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_wrapping_errors_DoubleError.

Module Impl_core_fmt_Display_for_wrapping_errors_DoubleError.
  Definition Self `{State.Trait} := wrapping_errors.DoubleError.
  
  Definition fmt
      `{State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M core.fmt.Result :=
    let* α0 := deref self wrapping_errors.DoubleError in
    match α0 with
    | wrapping_errors.DoubleError  =>
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 :=
        borrow
          [ mk_str "please use a vector with at least one element" ]
          (list (ref str)) in
      let* α3 := deref α2 (list (ref str)) in
      let* α4 := borrow α3 (list (ref str)) in
      let* α5 := pointer_coercion "Unsize" α4 in
      let* α6 := core.fmt.Arguments::["new_const"] α5 in
      core.fmt.Formatter::["write_fmt"] α1 α6
    | wrapping_errors.DoubleError  =>
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 :=
        borrow
          [ mk_str "the provided string could not be parsed as int" ]
          (list (ref str)) in
      let* α3 := deref α2 (list (ref str)) in
      let* α4 := borrow α3 (list (ref str)) in
      let* α5 := pointer_coercion "Unsize" α4 in
      let* α6 := core.fmt.Arguments::["new_const"] α5 in
      core.fmt.Formatter::["write_fmt"] α1 α6
    end.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Display.Trait Self := {
    core.fmt.Display.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Display_for_wrapping_errors_DoubleError.

Module Impl_core_error_Error_for_wrapping_errors_DoubleError.
  Definition Self `{State.Trait} := wrapping_errors.DoubleError.
  
  Definition source
      `{State.Trait}
      (self : ref Self)
      : M (core.option.Option (ref _ (* dyn *))) :=
    let* α0 := deref self wrapping_errors.DoubleError in
    match α0 with
    | wrapping_errors.DoubleError  => Pure (core.option.Option.None tt)
    | wrapping_errors.DoubleError e =>
      let* α0 := deref e core.num.error.ParseIntError in
      let* α1 := borrow α0 core.num.error.ParseIntError in
      let* α2 := pointer_coercion "Unsize" α1 in
      Pure (core.option.Option.Some α2)
    end.
  
  Global Instance Method_source `{State.Trait} : Notation.Dot "source" := {
    Notation.dot := source;
  }.
  
  Global Instance I `{State.Trait} : core.error.Error.Trait Self := {
  }.
  Global Hint Resolve I : core.
End Impl_core_error_Error_for_wrapping_errors_DoubleError.

Module Impl_core_convert_From_for_wrapping_errors_DoubleError.
  Definition Self `{State.Trait} := wrapping_errors.DoubleError.
  
  Definition from
      `{State.Trait}
      (err : core.num.error.ParseIntError)
      : M wrapping_errors.DoubleError :=
    Pure (wrapping_errors.DoubleError.Parse err).
  
  Global Instance AssociatedFunction_from `{State.Trait} :
    Notation.DoubleColon Self "from" := {
    Notation.double_colon := from;
  }.
  
  Global Instance I `{State.Trait}
    : core.convert.From.Trait Self (T := core.num.error.ParseIntError) := {
    core.convert.From.from := from;
  }.
  Global Hint Resolve I : core.
End Impl_core_convert_From_for_wrapping_errors_DoubleError.

Definition double_first
    `{State.Trait}
    (vec : alloc.vec.Vec (ref str) alloc.vec.Vec.Default.A)
    : M (wrapping_errors.Result i32) :=
  let* first :=
    let* α0 := borrow vec (alloc.vec.Vec (ref str) alloc.alloc.Global) in
    let* α1 := core.ops.deref.Deref.deref α0 in
    let* α2 := deref α1 (Slice (ref str)) in
    let* α3 := borrow α2 (Slice (ref str)) in
    let* α4 := (Slice _)::["first"] α3 in
    let* α5 :=
      (core.option.Option _)::["ok_or"]
        α4
        (wrapping_errors.DoubleError.EmptyVec tt) in
    let* α6 := core.ops.try_trait.Try.branch α5 in
    match α6 with
    | core.ops.control_flow.ControlFlow residual =>
      let* α0 := core.ops.try_trait.FromResidual.from_residual residual in
      let* α1 := Return α0 in
      never_to_any α1
    | core.ops.control_flow.ControlFlow val => Pure val
    end in
  let* parsed :=
    let* α0 := deref first (ref str) in
    let* α1 := deref α0 str in
    let* α2 := borrow α1 str in
    let* α3 := str::["parse"] α2 in
    let* α4 := core.ops.try_trait.Try.branch α3 in
    match α4 with
    | core.ops.control_flow.ControlFlow residual =>
      let* α0 := core.ops.try_trait.FromResidual.from_residual residual in
      let* α1 := Return α0 in
      never_to_any α1
    | core.ops.control_flow.ControlFlow val => Pure val
    end in
  let* α0 := M.alloc 2 in
  let* α1 := mul α0 parsed in
  Pure (core.result.Result.Ok α1).

Definition print
    `{State.Trait}
    (result : wrapping_errors.Result i32)
    : M unit :=
  match result with
  | core.result.Result n =>
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "The first doubled is "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow n i32 in
      let* α5 := deref α4 i32 in
      let* α6 := borrow α5 i32 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt
  | core.result.Result e =>
    let* _ :=
      let* _ :=
        let* α0 := borrow [ mk_str "Error: "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow e wrapping_errors.DoubleError in
        let* α5 := deref α4 wrapping_errors.DoubleError in
        let* α6 := borrow α5 wrapping_errors.DoubleError in
        let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
        let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
        let* α9 := deref α8 (list core.fmt.rt.Argument) in
        let* α10 := borrow α9 (list core.fmt.rt.Argument) in
        let* α11 := pointer_coercion "Unsize" α10 in
        let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
        std.io.stdio._print α12 in
      Pure tt in
    let* α0 := borrow e wrapping_errors.DoubleError in
    let* α1 := core.error.Error.source α0 in
    let* α2 := let_if core.option.Option source := α1 in
    if (α2 : bool) then
      let* _ :=
        let* _ :=
          let* α0 :=
            borrow [ mk_str "  Caused by: "; mk_str "
" ] (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := borrow source (ref type not implemented) in
          let* α5 := deref α4 (ref type not implemented) in
          let* α6 := borrow α5 (ref type not implemented) in
          let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
          let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
          let* α9 := deref α8 (list core.fmt.rt.Argument) in
          let* α10 := borrow α9 (list core.fmt.rt.Argument) in
          let* α11 := pointer_coercion "Unsize" α10 in
          let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
          std.io.stdio._print α12 in
        Pure tt in
      Pure tt
    else
      Pure tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* numbers :=
    let* α0 := deref (mk_str "93") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "18") str in
    let* α3 := borrow α2 str in
    let* α4 :=
      (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"]
        [ mk_str "42"; α1; α3 ] in
    let* α5 := pointer_coercion "Unsize" α4 in
    (Slice _)::["into_vec"] α5 in
  let* empty := (alloc.vec.Vec _ alloc.alloc.Global)::["new"] in
  let* strings :=
    let* α0 := deref (mk_str "93") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "18") str in
    let* α3 := borrow α2 str in
    let* α4 :=
      (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"]
        [ mk_str "tofu"; α1; α3 ] in
    let* α5 := pointer_coercion "Unsize" α4 in
    (Slice _)::["into_vec"] α5 in
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
