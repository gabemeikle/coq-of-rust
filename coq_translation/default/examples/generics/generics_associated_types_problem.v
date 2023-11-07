(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Container.
Section Container.
  Context `{ℋ : State.Trait}.
  
  Record t : Set := {
    x0 : i32;
    x1 : i32;
  }.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.pure x.(x0) : M _;
  }.
  Global Instance Get_1 : Notation.Dot "1" := {
    Notation.dot x := let* x := M.read x in M.pure x.(x1) : M _;
  }.
End Container.
End Container.
Definition Container `{ℋ : State.Trait} : Set := M.Val Container.t.

Module  Contains.
Section Contains.
  Context `{ℋ : State.Trait}.
  
  Class Trait (Self : Set) {A B : Set} : Type := {
    contains : (ref Self) -> (ref A) -> (ref B) -> M bool;
    first : (ref Self) -> M i32;
    last : (ref Self) -> M i32;
  }.
  
End Contains.
End Contains.

Module  Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.
Section Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := generics_associated_types_problem.Container.
  
  Definition contains
      (self : ref Self)
      (number_1 : ref i32)
      (number_2 : ref i32)
      : M bool :=
    M.function_body
      (let* α0 : ltac:(refine generics_associated_types_problem.Container) :=
        deref self in
      let* α1 : ltac:(refine i32) := α0.["0"] in
      let* α2 : ltac:(refine (ref i32)) := borrow α1 in
      let* α3 : ltac:(refine (ref (ref i32))) := borrow α2 in
      let* α4 : ltac:(refine (ref (ref i32))) := borrow number_1 in
      let* α5 : ltac:(refine bool) :=
        (core.cmp.PartialEq.eq (Self := ref i32) (Trait := ltac:(refine _)))
          α3
          α4 in
      let* α6 : ltac:(refine generics_associated_types_problem.Container) :=
        deref self in
      let* α7 : ltac:(refine i32) := α6.["1"] in
      let* α8 : ltac:(refine (ref i32)) := borrow α7 in
      let* α9 : ltac:(refine (ref (ref i32))) := borrow α8 in
      let* α10 : ltac:(refine (ref (ref i32))) := borrow number_2 in
      let* α11 : ltac:(refine bool) :=
        (core.cmp.PartialEq.eq (Self := ref i32) (Trait := ltac:(refine _)))
          α9
          α10 in
      BinOp.and α5 α11).
  
  Global Instance AssociatedFunction_contains :
    Notation.DoubleColon Self "contains" := {
    Notation.double_colon := contains;
  }.
  
  Definition first (self : ref Self) : M i32 :=
    M.function_body
      (let* α0 : ltac:(refine generics_associated_types_problem.Container) :=
        deref self in
      α0.["0"]).
  
  Global Instance AssociatedFunction_first :
    Notation.DoubleColon Self "first" := {
    Notation.double_colon := first;
  }.
  
  Definition last (self : ref Self) : M i32 :=
    M.function_body
      (let* α0 : ltac:(refine generics_associated_types_problem.Container) :=
        deref self in
      α0.["1"]).
  
  Global Instance AssociatedFunction_last :
    Notation.DoubleColon Self "last" := {
    Notation.double_colon := last;
  }.
  
  Global Instance ℐ :
    generics_associated_types_problem.Contains.Trait Self
      (A := i32)
      (B := i32) := {
    generics_associated_types_problem.Contains.contains := contains;
    generics_associated_types_problem.Contains.first := first;
    generics_associated_types_problem.Contains.last := last;
  }.
End Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.
End Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.

Definition difference
    `{ℋ : State.Trait}
    {A B C : Set}
    {ℋ_0 : generics_associated_types_problem.Contains.Trait C (A := A) (B := B)}
    (container : ref C)
    : M i32 :=
  M.function_body
    (let* α0 : ltac:(refine C) := deref container in
    let* α1 : ltac:(refine (ref C)) := borrow α0 in
    let* α2 : ltac:(refine i32) :=
      (generics_associated_types_problem.Contains.last
          (Self := C)
          (Trait := ltac:(refine _)))
        α1 in
    let* α3 : ltac:(refine C) := deref container in
    let* α4 : ltac:(refine (ref C)) := borrow α3 in
    let* α5 : ltac:(refine i32) :=
      (generics_associated_types_problem.Contains.first
          (Self := C)
          (Trait := ltac:(refine _)))
        α4 in
    BinOp.sub α2 α5).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* number_1 : ltac:(refine i32) := M.alloc 3 in
    let* number_2 : ltac:(refine i32) := M.alloc 10 in
    let* container :
        ltac:(refine generics_associated_types_problem.Container) :=
      M.alloc
        (generics_associated_types_problem.Container.Build_t
          number_1
          number_2) in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc
            [
              mk_str "Does container contain ";
              mk_str " and ";
              mk_str ": ";
              mk_str "
"
            ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref i32)) := borrow number_1 in
        let* α4 : ltac:(refine (ref (ref i32))) := borrow α3 in
        let* α5 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α4 in
        let* α6 : ltac:(refine (ref i32)) := borrow number_2 in
        let* α7 : ltac:(refine (ref (ref i32))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 :
            ltac:(refine (ref generics_associated_types_problem.Container)) :=
          borrow container in
        let* α10 : ltac:(refine (ref i32)) := borrow number_1 in
        let* α11 : ltac:(refine (ref i32)) := borrow number_2 in
        let* α12 : ltac:(refine bool) :=
          (generics_associated_types_problem.Contains.contains
              (Self := generics_associated_types_problem.Container)
              (Trait := ltac:(refine _)))
            α9
            α10
            α11 in
        let* α13 : ltac:(refine (ref bool)) := borrow α12 in
        let* α14 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α13 in
        let* α15 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α5; α8; α14 ] in
        let* α16 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α15 in
        let* α17 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α17 in
        std.io.stdio._print α18 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "First number: "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (ref generics_associated_types_problem.Container)) :=
          borrow container in
        let* α4 : ltac:(refine i32) :=
          (generics_associated_types_problem.Contains.first
              (Self := generics_associated_types_problem.Container)
              (Trait := ltac:(refine _)))
            α3 in
        let* α5 : ltac:(refine (ref i32)) := borrow α4 in
        let* α6 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α5 in
        let* α7 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α7 in
        let* α9 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "Last number: "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (ref generics_associated_types_problem.Container)) :=
          borrow container in
        let* α4 : ltac:(refine i32) :=
          (generics_associated_types_problem.Contains.last
              (Self := generics_associated_types_problem.Container)
              (Trait := ltac:(refine _)))
            α3 in
        let* α5 : ltac:(refine (ref i32)) := borrow α4 in
        let* α6 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α5 in
        let* α7 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α7 in
        let* α9 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "The difference is: "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (ref generics_associated_types_problem.Container)) :=
          borrow container in
        let* α4 : ltac:(refine i32) :=
          generics_associated_types_problem.difference α3 in
        let* α5 : ltac:(refine (ref i32)) := borrow α4 in
        let* α6 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α5 in
        let* α7 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α7 in
        let* α9 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    M.alloc tt).
