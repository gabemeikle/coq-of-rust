(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* person :=
    let* α0 :=
      (core.convert.From.from
          (Self := alloc.string.String)
          (Trait := ltac:(refine _)))
        (mk_str "Alice") in
    let* α1 := M.alloc 20 in
    let* α2 := (alloc.boxed.Box u8 alloc.alloc.Global)::["new"] α1 in
    M.alloc
      {|
        scoping_rules_ownership_and_rules_partial_moves.main.Person.name := α0;
        scoping_rules_ownership_and_rules_partial_moves.main.Person.age := α2;
      |} in
  let
      '{|
        scoping_rules_ownership_and_rules_partial_moves.main.Person.name
          :=
          name;
        scoping_rules_ownership_and_rules_partial_moves.main.Person.age := age;
      |} :=
    person in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "The person's age is "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow age (ref (alloc.boxed.Box u8 alloc.alloc.Global)) in
      let* α5 := deref α4 (ref (alloc.boxed.Box u8 alloc.alloc.Global)) in
      let* α6 := borrow α5 (ref (alloc.boxed.Box u8 alloc.alloc.Global)) in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    M.alloc tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "The person's name is "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow name alloc.string.String in
      let* α5 := deref α4 alloc.string.String in
      let* α6 := borrow α5 alloc.string.String in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    M.alloc tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "The person's age from person struct is "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := person.["age"] in
      let* α5 := borrow α4 (alloc.boxed.Box u8 alloc.alloc.Global) in
      let* α6 := deref α5 (alloc.boxed.Box u8 alloc.alloc.Global) in
      let* α7 := borrow α6 (alloc.boxed.Box u8 alloc.alloc.Global) in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 := borrow [ α8 ] (list core.fmt.rt.Argument) in
      let* α10 := deref α9 (list core.fmt.rt.Argument) in
      let* α11 := borrow α10 (list core.fmt.rt.Argument) in
      let* α12 := pointer_coercion "Unsize" α11 in
      let* α13 := core.fmt.Arguments::["new_v1"] α3 α12 in
      std.io.stdio._print α13 in
    M.alloc tt in
  M.alloc tt.

Module  Person.
Section Person.
  Context `{ℋ : State.Trait}.
  
  Unset Primitive Projections.
  Record t : Set := {
    name : alloc.string.String;
    age : alloc.boxed.Box u8 alloc.boxed.Box.Default.A;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot x := let* x := M.read x in M.pure x.(name) : M _;
  }.
  Global Instance Get_AF_name : Notation.DoubleColon t "name" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(name) : M _;
  }.
  Global Instance Get_age : Notation.Dot "age" := {
    Notation.dot x := let* x := M.read x in M.pure x.(age) : M _;
  }.
  Global Instance Get_AF_age : Notation.DoubleColon t "age" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(age) : M _;
  }.
End Person.
End Person.
Definition Person `{ℋ : State.Trait} : Set := M.Val Person.t.

Module  Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
Section Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set :=
    scoping_rules_ownership_and_rules_partial_moves.main.Person.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M ltac:(core.fmt.Result) :=
    let* α0 := deref f core.fmt.Formatter in
    let* α1 := borrow_mut α0 core.fmt.Formatter in
    let* α2 := deref (mk_str "Person") str in
    let* α3 := borrow α2 str in
    let* α4 := deref (mk_str "name") str in
    let* α5 := borrow α4 str in
    let* α6 :=
      deref self scoping_rules_ownership_and_rules_partial_moves.main.Person in
    let* α7 := α6.["name"] in
    let* α8 := borrow α7 alloc.string.String in
    let* α9 := deref α8 alloc.string.String in
    let* α10 := borrow α9 alloc.string.String in
    let* α11 := pointer_coercion "Unsize" α10 in
    let* α12 := deref (mk_str "age") str in
    let* α13 := borrow α12 str in
    let* α14 :=
      deref self scoping_rules_ownership_and_rules_partial_moves.main.Person in
    let* α15 := α14.["age"] in
    let* α16 := borrow α15 (alloc.boxed.Box u8 alloc.alloc.Global) in
    let* α17 := borrow α16 (ref (alloc.boxed.Box u8 alloc.alloc.Global)) in
    let* α18 := deref α17 (ref (alloc.boxed.Box u8 alloc.alloc.Global)) in
    let* α19 := borrow α18 (ref (alloc.boxed.Box u8 alloc.alloc.Global)) in
    let* α20 := pointer_coercion "Unsize" α19 in
    core.fmt.Formatter::["debug_struct_field2_finish"] α1 α3 α5 α11 α13 α20.
  
  Global Instance AssociatedFunction_fmt : Notation.DoubleColon Self "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
End Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
