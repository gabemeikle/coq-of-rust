(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Borrowed.
Section Borrowed.
  Context `{ℋ : State.Trait}.
  
  Record t : Set := {
    x0 : ref i32;
  }.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.pure x.(x0) : M _;
  }.
End Borrowed.
End Borrowed.
Definition Borrowed `{ℋ : State.Trait} : Set := M.Val Borrowed.t.

Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := scoping_rules_lifetimes_structs.Borrowed.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M ltac:(core.fmt.Result) :=
    M.function_body
      (let* α0 : ltac:(refine core.fmt.Formatter) := deref f in
      let* α1 : ltac:(refine (mut_ref core.fmt.Formatter)) := borrow_mut α0 in
      let* α2 : ltac:(refine str) := deref (mk_str "Borrowed") in
      let* α3 : ltac:(refine (ref str)) := borrow α2 in
      let* α4 : ltac:(refine scoping_rules_lifetimes_structs.Borrowed) :=
        deref self in
      let* α5 : ltac:(refine (ref i32)) := α4.["0"] in
      let* α6 : ltac:(refine (ref (ref i32))) := borrow α5 in
      let* α7 : ltac:(refine (ref (ref (ref i32)))) := borrow α6 in
      let* α8 : ltac:(refine (ref type not implemented)) :=
        pointer_coercion "Unsize" α7 in
      core.fmt.Formatter::["debug_tuple_field1_finish"] α1 α3 α8).
  
  Global Instance AssociatedFunction_fmt : Notation.DoubleColon Self "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.

Module  NamedBorrowed.
Section NamedBorrowed.
  Context `{ℋ : State.Trait}.
  
  Record t : Set := {
    x : ref i32;
    y : ref i32;
  }.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot x' := let* x' := M.read x' in M.pure x'.(x) : M _;
  }.
  Global Instance Get_AF_x : Notation.DoubleColon t "x" := {
    Notation.double_colon x' := let* x' := M.read x' in M.pure x'.(x) : M _;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot x := let* x := M.read x in M.pure x.(y) : M _;
  }.
  Global Instance Get_AF_y : Notation.DoubleColon t "y" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(y) : M _;
  }.
End NamedBorrowed.
End NamedBorrowed.
Definition NamedBorrowed `{ℋ : State.Trait} : Set := M.Val NamedBorrowed.t.

Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := scoping_rules_lifetimes_structs.NamedBorrowed.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M ltac:(core.fmt.Result) :=
    M.function_body
      (let* α0 : ltac:(refine core.fmt.Formatter) := deref f in
      let* α1 : ltac:(refine (mut_ref core.fmt.Formatter)) := borrow_mut α0 in
      let* α2 : ltac:(refine str) := deref (mk_str "NamedBorrowed") in
      let* α3 : ltac:(refine (ref str)) := borrow α2 in
      let* α4 : ltac:(refine str) := deref (mk_str "x") in
      let* α5 : ltac:(refine (ref str)) := borrow α4 in
      let* α6 : ltac:(refine scoping_rules_lifetimes_structs.NamedBorrowed) :=
        deref self in
      let* α7 : ltac:(refine (ref i32)) := α6.["x"] in
      let* α8 : ltac:(refine (ref (ref i32))) := borrow α7 in
      let* α9 : ltac:(refine (ref type not implemented)) :=
        pointer_coercion "Unsize" α8 in
      let* α10 : ltac:(refine str) := deref (mk_str "y") in
      let* α11 : ltac:(refine (ref str)) := borrow α10 in
      let* α12 : ltac:(refine scoping_rules_lifetimes_structs.NamedBorrowed) :=
        deref self in
      let* α13 : ltac:(refine (ref i32)) := α12.["y"] in
      let* α14 : ltac:(refine (ref (ref i32))) := borrow α13 in
      let* α15 : ltac:(refine (ref (ref (ref i32)))) := borrow α14 in
      let* α16 : ltac:(refine (ref type not implemented)) :=
        pointer_coercion "Unsize" α15 in
      core.fmt.Formatter::["debug_struct_field2_finish"] α1 α3 α5 α9 α11 α16).
  
  Global Instance AssociatedFunction_fmt : Notation.DoubleColon Self "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.

Module Either.
  Inductive t `{ℋ : State.Trait} : Set :=
  | Num (_ : i32)
  | Ref (_ : ref i32).
End Either.
Definition Either `{ℋ : State.Trait} : Set := M.Val Either.t.

Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := scoping_rules_lifetimes_structs.Either.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M ltac:(core.fmt.Result) :=
    M.function_body
      (let* α0 := M.read self in
      match α0 with
      | scoping_rules_lifetimes_structs.Either.Num __self_0 =>
        let* α0 : ltac:(refine core.fmt.Formatter) := deref f in
        let* α1 : ltac:(refine (mut_ref core.fmt.Formatter)) := borrow_mut α0 in
        let* α2 : ltac:(refine str) := deref (mk_str "Num") in
        let* α3 : ltac:(refine (ref str)) := borrow α2 in
        let* α4 : ltac:(refine (ref (ref i32))) := borrow __self_0 in
        let* α5 : ltac:(refine (ref type not implemented)) :=
          pointer_coercion "Unsize" α4 in
        core.fmt.Formatter::["debug_tuple_field1_finish"] α1 α3 α5
      | scoping_rules_lifetimes_structs.Either.Ref __self_0 =>
        let* α0 : ltac:(refine core.fmt.Formatter) := deref f in
        let* α1 : ltac:(refine (mut_ref core.fmt.Formatter)) := borrow_mut α0 in
        let* α2 : ltac:(refine str) := deref (mk_str "Ref") in
        let* α3 : ltac:(refine (ref str)) := borrow α2 in
        let* α4 : ltac:(refine (ref (ref (ref i32)))) := borrow __self_0 in
        let* α5 : ltac:(refine (ref type not implemented)) :=
          pointer_coercion "Unsize" α4 in
        core.fmt.Formatter::["debug_tuple_field1_finish"] α1 α3 α5
      end).
  
  Global Instance AssociatedFunction_fmt : Notation.DoubleColon Self "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* x : ltac:(refine i32) := M.alloc 18 in
    let* y : ltac:(refine i32) := M.alloc 15 in
    let* single : ltac:(refine scoping_rules_lifetimes_structs.Borrowed) :=
      let* α0 : ltac:(refine (ref i32)) := borrow x in
      M.alloc (scoping_rules_lifetimes_structs.Borrowed.Build_t α0) in
    let* double : ltac:(refine scoping_rules_lifetimes_structs.NamedBorrowed) :=
      let* α0 : ltac:(refine (ref i32)) := borrow x in
      let* α1 : ltac:(refine (ref i32)) := borrow y in
      M.alloc
        {|
          scoping_rules_lifetimes_structs.NamedBorrowed.x := α0;
          scoping_rules_lifetimes_structs.NamedBorrowed.y := α1;
        |} in
    let* reference : ltac:(refine scoping_rules_lifetimes_structs.Either) :=
      let* α0 : ltac:(refine (ref i32)) := borrow x in
      M.alloc (scoping_rules_lifetimes_structs.Either.Ref α0) in
    let* number : ltac:(refine scoping_rules_lifetimes_structs.Either) :=
      M.alloc (scoping_rules_lifetimes_structs.Either.Num y) in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "x is borrowed in "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (ref scoping_rules_lifetimes_structs.Borrowed)) :=
          borrow single in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α3 in
        let* α5 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α5 in
        let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "x and y are borrowed in "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (ref scoping_rules_lifetimes_structs.NamedBorrowed)) :=
          borrow double in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α3 in
        let* α5 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α5 in
        let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "x is borrowed in "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref scoping_rules_lifetimes_structs.Either)) :=
          borrow reference in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α3 in
        let* α5 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α5 in
        let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "y is *not* borrowed in "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref scoping_rules_lifetimes_structs.Either)) :=
          borrow number in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α3 in
        let* α5 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α5 in
        let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    M.alloc tt).
