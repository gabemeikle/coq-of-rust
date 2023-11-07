(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Ref.
Section Ref.
  Context `{ℋ : State.Trait}.
  
  Context {T : Set}.
  
  Unset Primitive Projections.
  Record t : Set := {
    x0 : ref T;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.pure x.(x0) : M _;
  }.
End Ref.
End Ref.
Definition Ref `{ℋ : State.Trait} (T : Set) : Set := M.Val (Ref.t (T := T)).

Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
  Context `{ℋ : State.Trait}.
  
  Context {T : Set}.
  
  Context {ℋ_0 : core.fmt.Debug.Trait T}.
  
  Definition Self : Set := scoping_rules_lifetimes_bounds.Ref T.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M ltac:(core.fmt.Result) :=
    M.function_body
      (let* α0 : ltac:(refine core.fmt.Formatter) := deref f in
      let* α1 : ltac:(refine (mut_ref core.fmt.Formatter)) := borrow_mut α0 in
      let* α2 : ltac:(refine str) := deref (mk_str "Ref") in
      let* α3 : ltac:(refine (ref str)) := borrow α2 in
      let* α4 : ltac:(refine (scoping_rules_lifetimes_bounds.Ref T)) :=
        deref self in
      let* α5 : ltac:(refine (ref T)) := α4.["0"] in
      let* α6 : ltac:(refine (ref (ref T))) := borrow α5 in
      let* α7 : ltac:(refine (ref (ref (ref T)))) := borrow α6 in
      let* α8 : ltac:(refine (ref (ref T))) := deref α7 in
      let* α9 : ltac:(refine (ref (ref (ref T)))) := borrow α8 in
      let* α10 : ltac:(refine (ref type not implemented)) :=
        pointer_coercion "Unsize" α9 in
      core.fmt.Formatter::["debug_tuple_field1_finish"] α1 α3 α10).
  
  Global Instance AssociatedFunction_fmt : Notation.DoubleColon Self "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.

Definition print
    `{ℋ : State.Trait}
    {T : Set}
    {ℋ_0 : core.fmt.Debug.Trait T}
    (t : T)
    : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "`print`: t is "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref T)) := borrow t in
        let* α6 : ltac:(refine T) := deref α5 in
        let* α7 : ltac:(refine (ref T)) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    M.alloc tt).

Definition print_ref
    `{ℋ : State.Trait}
    {T : Set}
    {ℋ_0 : core.fmt.Debug.Trait T}
    (t : ref T)
    : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "`print_ref`: t is "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (ref T))) := borrow t in
        let* α6 : ltac:(refine (ref T)) := deref α5 in
        let* α7 : ltac:(refine (ref (ref T))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    M.alloc tt).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* x : ltac:(refine i32) := M.alloc 7 in
    let* ref_x : ltac:(refine (scoping_rules_lifetimes_bounds.Ref i32)) :=
      let* α0 : ltac:(refine (ref i32)) := borrow x in
      let* α1 : ltac:(refine i32) := deref α0 in
      let* α2 : ltac:(refine (ref i32)) := borrow α1 in
      M.alloc (scoping_rules_lifetimes_bounds.Ref.Build_t α2) in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref (scoping_rules_lifetimes_bounds.Ref i32))) :=
        borrow ref_x in
      let* α1 : ltac:(refine (scoping_rules_lifetimes_bounds.Ref i32)) :=
        deref α0 in
      let* α2 : ltac:(refine (ref (scoping_rules_lifetimes_bounds.Ref i32))) :=
        borrow α1 in
      scoping_rules_lifetimes_bounds.print_ref α2 in
    let* _ : ltac:(refine unit) := scoping_rules_lifetimes_bounds.print ref_x in
    M.alloc tt).
