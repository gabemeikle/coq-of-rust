(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Container.
Section Container.
  Record t : Set := {
    x0 : i32.t;
    x1 : i32.t;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
  Definition Get_1 :=
    Ref.map (fun α => Some α.(x1)) (fun β α => Some (α <| x1 := β |>)).
End Container.
End Container.

Module  Contains.
Section Contains.
  Class Trait (Self : Set) : Type := {
    A : Set;
    B : Set;
    contains : (ref Self) -> (ref A.t) -> (ref B.t) -> M bool.t;
    first : (ref Self) -> M i32.t;
    last : (ref Self) -> M i32.t;
    a : (ref Self) -> M A.t;
  }.
  
  Global Instance Method_A `(Trait) : Notations.DoubleColonType Self "A" := {
    Notations.double_colon_type := A;
  }.
  Global Instance Method_B `(Trait) : Notations.DoubleColonType Self "B" := {
    Notations.double_colon_type := B;
  }.
End Contains.
End Contains.

Module  Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container_t.
Section Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container_t.
  Definition Self : Set := generics_associated_types_solution.Container.t.
  
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
      (self : ref Self)
      (number_1 : ref i32.t)
      (number_2 : ref i32.t)
      : M bool.t :=
    let* self := M.alloc self in
    let* number_1 := M.alloc number_1 in
    let* number_2 := M.alloc number_2 in
    let* α0 : _ :=
      ltac:(M.get_method (fun ℐ =>
        core.cmp.PartialEq.eq
          (Self := ref i32.t)
          (Rhs := ref i32.t)
          (Trait := ℐ))) in
    let* α1 : ref generics_associated_types_solution.Container.t :=
      M.read self in
    let* α2 : M.Val (ref i32.t) :=
      M.alloc
        (borrow
          (generics_associated_types_solution.Container.Get_0 (deref α1))) in
    let* α3 : bool.t := M.call (α0 (borrow α2) (borrow number_1)) in
    let* α4 : _ :=
      ltac:(M.get_method (fun ℐ =>
        core.cmp.PartialEq.eq
          (Self := ref i32.t)
          (Rhs := ref i32.t)
          (Trait := ℐ))) in
    let* α5 : ref generics_associated_types_solution.Container.t :=
      M.read self in
    let* α6 : M.Val (ref i32.t) :=
      M.alloc
        (borrow
          (generics_associated_types_solution.Container.Get_1 (deref α5))) in
    let* α7 : bool.t := M.call (α4 (borrow α6) (borrow number_2)) in
    M.pure (BinOp.Pure.and α3 α7).
  
  Global Instance AssociatedFunction_contains :
    Notations.DoubleColon Self "contains" := {
    Notations.double_colon := contains;
  }.
  
  (*
      fn first(&self) -> i32 {
          self.0
      }
  *)
  Definition first (self : ref Self) : M i32.t :=
    let* self := M.alloc self in
    let* α0 : ref generics_associated_types_solution.Container.t :=
      M.read self in
    M.read (generics_associated_types_solution.Container.Get_0 (deref α0)).
  
  Global Instance AssociatedFunction_first :
    Notations.DoubleColon Self "first" := {
    Notations.double_colon := first;
  }.
  
  (*
      fn last(&self) -> i32 {
          self.1
      }
  *)
  Definition last (self : ref Self) : M i32.t :=
    let* self := M.alloc self in
    let* α0 : ref generics_associated_types_solution.Container.t :=
      M.read self in
    M.read (generics_associated_types_solution.Container.Get_1 (deref α0)).
  
  Global Instance AssociatedFunction_last :
    Notations.DoubleColon Self "last" := {
    Notations.double_colon := last;
  }.
  
  (*
      fn a(&self) -> i32 {
          self.0
      }
  *)
  Definition a (self : ref Self) : M i32.t :=
    let* self := M.alloc self in
    let* α0 : ref generics_associated_types_solution.Container.t :=
      M.read self in
    M.read (generics_associated_types_solution.Container.Get_0 (deref α0)).
  
  Global Instance AssociatedFunction_a : Notations.DoubleColon Self "a" := {
    Notations.double_colon := a;
  }.
  
  Global Instance ℐ :
    generics_associated_types_solution.Contains.Trait Self := {
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
    (container : ref C)
    : M i32.t :=
  let* container := M.alloc container in
  let* α0 : _ :=
    ltac:(M.get_method (fun ℐ =>
      generics_associated_types_solution.Contains.last
        (Self := C)
        (Trait := ℐ))) in
  let* α1 : ref C := M.read container in
  let* α2 : i32.t := M.call (α0 α1) in
  let* α3 : _ :=
    ltac:(M.get_method (fun ℐ =>
      generics_associated_types_solution.Contains.first
        (Self := C)
        (Trait := ℐ))) in
  let* α4 : ref C := M.read container in
  let* α5 : i32.t := M.call (α3 α4) in
  BinOp.Panic.sub α2 α5.

(*
fn get_a<C: Contains>(container: &C) -> C::A {
    container.a()
}
*)
Definition get_a
    {C : Set}
    {ℋ_0 : generics_associated_types_solution.Contains.Trait C}
    (container : ref C)
    : M C::type["A"].t :=
  let* container := M.alloc container in
  let* α0 : _ :=
    ltac:(M.get_method (fun ℐ =>
      generics_associated_types_solution.Contains.a
        (Self := C)
        (Trait := ℐ))) in
  let* α1 : ref C := M.read container in
  M.call (α0 α1).

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
Definition main : M unit :=
  let* number_1 : M.Val i32.t := M.alloc (Integer.of_Z 3) in
  let* number_2 : M.Val i32.t := M.alloc (Integer.of_Z 10) in
  let* container : M.Val generics_associated_types_solution.Container.t :=
    let* α0 : i32.t := M.read number_1 in
    let* α1 : i32.t := M.read number_2 in
    M.alloc (generics_associated_types_solution.Container.Build_t α0 α1) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Does container contain ") in
      let* α1 : ref str.t := M.read (mk_str " and ") in
      let* α2 : ref str.t := M.read (mk_str ": ") in
      let* α3 : ref str.t := M.read (mk_str "
") in
      let* α4 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2; α3 ] in
      let* α5 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α4) in
      let* α6 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α5) in
      let* α7 : M.Val (ref i32.t) := M.alloc (borrow number_1) in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
      let* α9 : M.Val (ref i32.t) := M.alloc (borrow number_2) in
      let* α10 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α9)) in
      let* α11 : _ :=
        ltac:(M.get_method (fun ℐ =>
          generics_associated_types_solution.Contains.contains
            (Self := generics_associated_types_solution.Container.t)
            (Trait := ℐ))) in
      let* α12 : bool.t :=
        M.call (α11 (borrow container) (borrow number_1) (borrow number_2)) in
      let* α13 : M.Val bool.t := M.alloc α12 in
      let* α14 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α13)) in
      let* α15 : M.Val (array core.fmt.rt.Argument.t) :=
        M.alloc [ α8; α10; α14 ] in
      let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α15) in
      let* α17 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α16) in
      let* α18 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α6 α17) in
      let* α19 : unit := M.call (std.io.stdio._print α18) in
      M.alloc α19 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "First number: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : _ :=
        ltac:(M.get_method (fun ℐ =>
          generics_associated_types_solution.Contains.first
            (Self := generics_associated_types_solution.Container.t)
            (Trait := ℐ))) in
      let* α6 : i32.t := M.call (α5 (borrow container)) in
      let* α7 : M.Val i32.t := M.alloc α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
      let* α9 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8 ] in
      let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α9) in
      let* α11 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α10) in
      let* α12 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
      let* α13 : unit := M.call (std.io.stdio._print α12) in
      M.alloc α13 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Last number: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : _ :=
        ltac:(M.get_method (fun ℐ =>
          generics_associated_types_solution.Contains.last
            (Self := generics_associated_types_solution.Container.t)
            (Trait := ℐ))) in
      let* α6 : i32.t := M.call (α5 (borrow container)) in
      let* α7 : M.Val i32.t := M.alloc α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
      let* α9 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8 ] in
      let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α9) in
      let* α11 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α10) in
      let* α12 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
      let* α13 : unit := M.call (std.io.stdio._print α12) in
      M.alloc α13 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "The difference is: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : i32.t :=
        M.call
          (generics_associated_types_solution.difference (borrow container)) in
      let* α6 : M.Val i32.t := M.alloc α5 in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α6)) in
      let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
      let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α8) in
      let* α10 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α9) in
      let* α11 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α10) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
