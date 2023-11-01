(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module DoubleError.
  Section DoubleError.
    Context `{ℋ : State.Trait}.
    
    Inductive t : Set := Build.
  End DoubleError.
End DoubleError.
Definition DoubleError := @DoubleError.t.

Module Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError.
  Section Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := defining_an_error_type.DoubleError.
    
    Definition fmt
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M ltac:(core.fmt.Result) :=
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 := deref (mk_str "DoubleError") str in
      let* α3 := borrow α2 str in
      core.fmt.Formatter::["write_str"] α1 α3.
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    #[refine] Global Instance ℐ : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
    Admitted.
  End Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError.
  Global Hint Resolve ℐ : core.
End Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError.

Module Impl_core_clone_Clone_for_defining_an_error_type_DoubleError.
  Section Impl_core_clone_Clone_for_defining_an_error_type_DoubleError.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := defining_an_error_type.DoubleError.
    
    Definition clone (self : ref Self) : M defining_an_error_type.DoubleError :=
      M.alloc (defining_an_error_type.DoubleError.Build_t tt).
    
    Global Instance AssociatedFunction_clone :
      Notation.DoubleColon Self "clone" := {
      Notation.double_colon := clone;
    }.
    
    #[refine] Global Instance ℐ : core.clone.Clone.Trait Self := {
      core.clone.Clone.clone := clone;
    }.
    Admitted.
  End Impl_core_clone_Clone_for_defining_an_error_type_DoubleError.
  Global Hint Resolve ℐ : core.
End Impl_core_clone_Clone_for_defining_an_error_type_DoubleError.

Ltac Result T :=
  refine (core.result.Result T defining_an_error_type.DoubleError).

Module Impl_core_fmt_Display_for_defining_an_error_type_DoubleError.
  Section Impl_core_fmt_Display_for_defining_an_error_type_DoubleError.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := defining_an_error_type.DoubleError.
    
    Definition fmt
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M ltac:(core.fmt.Result) :=
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 :=
        borrow [ mk_str "invalid first item to double" ] (list (ref str)) in
      let* α3 := deref α2 (list (ref str)) in
      let* α4 := borrow α3 (list (ref str)) in
      let* α5 := pointer_coercion "Unsize" α4 in
      let* α6 := core.fmt.Arguments::["new_const"] α5 in
      core.fmt.Formatter::["write_fmt"] α1 α6.
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    #[refine] Global Instance ℐ : core.fmt.Display.Trait Self := {
      core.fmt.Display.fmt := fmt;
    }.
    Admitted.
  End Impl_core_fmt_Display_for_defining_an_error_type_DoubleError.
  Global Hint Resolve ℐ : core.
End Impl_core_fmt_Display_for_defining_an_error_type_DoubleError.

Definition double_first
    `{ℋ : State.Trait}
    (vec : alloc.vec.Vec (ref str) alloc.vec.Vec.Default.A)
    : M ltac:(defining_an_error_type.Result constr:(i32)) :=
  let* α0 := borrow vec (alloc.vec.Vec (ref str) alloc.alloc.Global) in
  let* α1 :=
    (core.ops.deref.Deref.deref
        (Self := (alloc.vec.Vec (ref str) alloc.alloc.Global)))
      α0 in
  let* α2 := deref α1 (Slice (ref str)) in
  let* α3 := borrow α2 (Slice (ref str)) in
  let* α4 := (Slice T)::["first"] α3 in
  let* α5 := M.alloc (defining_an_error_type.DoubleError.Build_t tt) in
  let* α6 := (core.option.Option T)::["ok_or"] α4 α5 in
  (core.result.Result T E)::["and_then"]
    α6
    (let* α0 := deref s (ref str) in
    let* α1 := deref α0 str in
    let* α2 := borrow α1 str in
    let* α3 := str::["parse"] α2 in
    let* α4 :=
      (core.result.Result T E)::["map_err"]
        α3
        (M.alloc (defining_an_error_type.DoubleError.Build_t tt)) in
    (core.result.Result T E)::["map"]
      α4
      (let* α0 := M.alloc 2 in
      BinOp.mul α0 i)).

Definition print
    `{ℋ : State.Trait}
    (result : ltac:(defining_an_error_type.Result constr:(i32)))
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
    M.alloc tt
  | core.result.Result e =>
    let* _ :=
      let* α0 := borrow [ mk_str "Error: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow e defining_an_error_type.DoubleError in
      let* α5 := deref α4 defining_an_error_type.DoubleError in
      let* α6 := borrow α5 defining_an_error_type.DoubleError in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    M.alloc tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* numbers :=
    let* α0 := deref (mk_str "93") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "18") str in
    let* α3 := borrow α2 str in
    let* α4 :=
      (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"]
        [ mk_str "42"; α1; α3 ] in
    let* α5 := pointer_coercion "Unsize" α4 in
    (Slice T)::["into_vec"] α5 in
  let* empty := (alloc.vec.Vec T alloc.alloc.Global)::["new"] in
  let* strings :=
    let* α0 := deref (mk_str "93") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "18") str in
    let* α3 := borrow α2 str in
    let* α4 :=
      (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"]
        [ mk_str "tofu"; α1; α3 ] in
    let* α5 := pointer_coercion "Unsize" α4 in
    (Slice T)::["into_vec"] α5 in
  let* _ :=
    let* α0 := defining_an_error_type.double_first numbers in
    defining_an_error_type.print α0 in
  let* _ :=
    let* α0 := defining_an_error_type.double_first empty in
    defining_an_error_type.print α0 in
  let* _ :=
    let* α0 := defining_an_error_type.double_first strings in
    defining_an_error_type.print α0 in
  M.alloc tt.
