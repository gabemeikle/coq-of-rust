(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Container.
Section Container.
  Record t : Set := {
    x0 : i32.t;
    x1 : i32.t;
  }.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(x0) : M _;
  }.
  Global Instance Get_1 : Notation.Dot "1" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(x1) : M _;
  }.
End Container.
End Container.

Module  Contains.
Section Contains.
  Class Trait (Self : Set) : Type := {
    A : Set;
    B : Set;
    contains : (ref ltac:(Self)) -> (ref A.t) -> (ref B.t) -> M bool.t;
    first : (ref ltac:(Self)) -> M i32.t;
    last : (ref ltac:(Self)) -> M i32.t;
    a : (ref ltac:(Self)) -> M A.t;
  }.
  
  Global Instance Method_A `(Trait) : Notation.DoubleColonType Self "A" := {
    Notation.double_colon_type := A;
  }.
  Global Instance Method_B `(Trait) : Notation.DoubleColonType Self "B" := {
    Notation.double_colon_type := B;
  }.
End Contains.
End Contains.

Module  Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container_t.
Section Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container_t.
  Ltac Self := exact generics_associated_types_solution.Container.t.
  
  (*
      type A = i32;
  *)
  Definition A : Set := i32.t.
  
  (*
      type B = i32;
  *)
  Definition B : Set := i32.t.
  
  (*
      fn contains(&self, number_1: &i32, number_2: &i32) -> bool {
          (&self.0 == number_1) && (&self.1 == number_2)
      }
  *)
  Definition contains
      (self : M.Val (ref ltac:(Self)))
      (number_1 : M.Val (ref i32.t))
      (number_2 : M.Val (ref i32.t))
      : M (M.Val bool.t) :=
    M.function_body
      (let* α0 :
          ltac:(refine
            (M.Val generics_associated_types_solution.Container.t)) :=
        deref self in
      let* α1 : ltac:(refine (M.Val i32.t)) := α0.["0"] in
      let* α2 : ltac:(refine (M.Val (ref i32.t))) := borrow α1 in
      let* α3 : ltac:(refine (M.Val (ref (ref i32.t)))) := borrow α2 in
      let* α4 : ltac:(refine (M.Val (ref (ref i32.t)))) := borrow number_1 in
      let* α5 : ltac:(refine (M.Val bool.t)) :=
        (core.cmp.PartialEq.eq (Self := ref i32.t) (Trait := ltac:(refine _)))
          α3
          α4 in
      let* α6 :
          ltac:(refine
            (M.Val generics_associated_types_solution.Container.t)) :=
        deref self in
      let* α7 : ltac:(refine (M.Val i32.t)) := α6.["1"] in
      let* α8 : ltac:(refine (M.Val (ref i32.t))) := borrow α7 in
      let* α9 : ltac:(refine (M.Val (ref (ref i32.t)))) := borrow α8 in
      let* α10 : ltac:(refine (M.Val (ref (ref i32.t)))) := borrow number_2 in
      let* α11 : ltac:(refine (M.Val bool.t)) :=
        (core.cmp.PartialEq.eq (Self := ref i32.t) (Trait := ltac:(refine _)))
          α9
          α10 in
      BinOp.and α5 α11).
  
  Global Instance AssociatedFunction_contains :
    Notation.DoubleColon ltac:(Self) "contains" := {
    Notation.double_colon := contains;
  }.
  
  (*
      fn first(&self) -> i32 {
          self.0
      }
  *)
  Definition first (self : M.Val (ref ltac:(Self))) : M (M.Val i32.t) :=
    M.function_body
      (let* α0 :
          ltac:(refine
            (M.Val generics_associated_types_solution.Container.t)) :=
        deref self in
      α0.["0"]).
  
  Global Instance AssociatedFunction_first :
    Notation.DoubleColon ltac:(Self) "first" := {
    Notation.double_colon := first;
  }.
  
  (*
      fn last(&self) -> i32 {
          self.1
      }
  *)
  Definition last (self : M.Val (ref ltac:(Self))) : M (M.Val i32.t) :=
    M.function_body
      (let* α0 :
          ltac:(refine
            (M.Val generics_associated_types_solution.Container.t)) :=
        deref self in
      α0.["1"]).
  
  Global Instance AssociatedFunction_last :
    Notation.DoubleColon ltac:(Self) "last" := {
    Notation.double_colon := last;
  }.
  
  (*
      fn a(&self) -> i32 {
          self.0
      }
  *)
  Definition a (self : M.Val (ref ltac:(Self))) : M (M.Val i32.t) :=
    M.function_body
      (let* α0 :
          ltac:(refine
            (M.Val generics_associated_types_solution.Container.t)) :=
        deref self in
      α0.["0"]).
  
  Global Instance AssociatedFunction_a :
    Notation.DoubleColon ltac:(Self) "a" := {
    Notation.double_colon := a;
  }.
  
  Global Instance ℐ :
    generics_associated_types_solution.Contains.Trait ltac:(Self) := {
    generics_associated_types_solution.Contains.A := A;
    generics_associated_types_solution.Contains.B := B;
    generics_associated_types_solution.Contains.contains := contains;
    generics_associated_types_solution.Contains.first := first;
    generics_associated_types_solution.Contains.last := last;
    generics_associated_types_solution.Contains.a := a;
  }.
End Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container_t.
End Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container_t.

(*
fn difference<C: Contains>(container: &C) -> i32 {
    container.last() - container.first()
}
*)
Definition difference
    {C : Set}
    {ℋ_0 : generics_associated_types_solution.Contains.Trait C}
    (container : M.Val (ref C))
    : M (M.Val i32.t) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val C)) := deref container in
    let* α1 : ltac:(refine (M.Val (ref C))) := borrow α0 in
    let* α2 : ltac:(refine (M.Val i32.t)) :=
      (generics_associated_types_solution.Contains.last
          (Self := C)
          (Trait := ltac:(refine _)))
        α1 in
    let* α3 : ltac:(refine (M.Val C)) := deref container in
    let* α4 : ltac:(refine (M.Val (ref C))) := borrow α3 in
    let* α5 : ltac:(refine (M.Val i32.t)) :=
      (generics_associated_types_solution.Contains.first
          (Self := C)
          (Trait := ltac:(refine _)))
        α4 in
    BinOp.sub α2 α5).

(*
fn get_a<C: Contains>(container: &C) -> C::A {
    container.a()
}
*)
Definition get_a
    {C : Set}
    {ℋ_0 : generics_associated_types_solution.Contains.Trait C}
    (container : M.Val (ref C))
    : M (M.Val C::type["A"].t) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val C)) := deref container in
    let* α1 : ltac:(refine (M.Val (ref C))) := borrow α0 in
    (generics_associated_types_solution.Contains.a
        (Self := C)
        (Trait := ltac:(refine _)))
      α1).

(*
fn main() {
    let number_1 = 3;
    let number_2 = 10;

    let container = Container(number_1, number_2);

    println!(
        "Does container contain {} and {}: {}",
        &number_1,
        &number_2,
        container.contains(&number_1, &number_2)
    );
    println!("First number: {}", container.first());
    println!("Last number: {}", container.last());

    println!("The difference is: {}", difference(&container));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* number_1 : ltac:(refine (M.Val i32.t)) := M.alloc 3 in
    let* number_2 : ltac:(refine (M.Val i32.t)) := M.alloc 10 in
    let* container :
        ltac:(refine (M.Val generics_associated_types_solution.Container.t)) :=
      let* α0 := M.read number_1 in
      let* α1 := M.read number_2 in
      M.alloc (generics_associated_types_solution.Container.Build_t α0 α1) in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc
            [
              mk_str "Does container contain ";
              mk_str " and ";
              mk_str ": ";
              mk_str "
"
            ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow number_1 in
        let* α4 : ltac:(refine (M.Val (ref (ref i32.t)))) := borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α4 in
        let* α6 : ltac:(refine (M.Val (ref i32.t))) := borrow number_2 in
        let* α7 : ltac:(refine (M.Val (ref (ref i32.t)))) := borrow α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α7 in
        let* α9 :
            ltac:(refine
              (M.Val (ref generics_associated_types_solution.Container.t))) :=
          borrow container in
        let* α10 : ltac:(refine (M.Val (ref i32.t))) := borrow number_1 in
        let* α11 : ltac:(refine (M.Val (ref i32.t))) := borrow number_2 in
        let* α12 : ltac:(refine (M.Val bool.t)) :=
          (generics_associated_types_solution.Contains.contains
              (Self := generics_associated_types_solution.Container.t)
              (Trait := ltac:(refine _)))
            α9
            α10
            α11 in
        let* α13 : ltac:(refine (M.Val (ref bool.t))) := borrow α12 in
        let* α14 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α13 in
        let* α15 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5; α8; α14 ] in
        let* α16 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α15 in
        let* α17 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α17 in
        std.io.stdio._print α18 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "First number: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val (ref generics_associated_types_solution.Container.t))) :=
          borrow container in
        let* α4 : ltac:(refine (M.Val i32.t)) :=
          (generics_associated_types_solution.Contains.first
              (Self := generics_associated_types_solution.Container.t)
              (Trait := ltac:(refine _)))
            α3 in
        let* α5 : ltac:(refine (M.Val (ref i32.t))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Last number: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val (ref generics_associated_types_solution.Container.t))) :=
          borrow container in
        let* α4 : ltac:(refine (M.Val i32.t)) :=
          (generics_associated_types_solution.Contains.last
              (Self := generics_associated_types_solution.Container.t)
              (Trait := ltac:(refine _)))
            α3 in
        let* α5 : ltac:(refine (M.Val (ref i32.t))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "The difference is: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val (ref generics_associated_types_solution.Container.t))) :=
          borrow container in
        let* α4 : ltac:(refine (M.Val i32.t)) :=
          generics_associated_types_solution.difference α3 in
        let* α5 : ltac:(refine (M.Val (ref i32.t))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    M.alloc tt).
