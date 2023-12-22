(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Container.
Section Container.
  Record t : Set := {
    x0 : i32.t;
    x1 : i32.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot :=
      Ref.map (fun x => Some x.(x0)) (fun v x => Some (x <| x0 := v |>));
  }.
  Global Instance Get_1 : Notations.Dot "1" := {
    Notations.dot :=
      Ref.map (fun x => Some x.(x1)) (fun v x => Some (x <| x1 := v |>));
  }.
End Container.
End Container.

Module  Contains.
Section Contains.
  Class Trait (Self : Set) {A B : Set} : Type := {
    contains : (ref Self) -> (ref A) -> (ref B) -> M bool.t;
    first : (ref Self) -> M i32.t;
    last : (ref Self) -> M i32.t;
  }.
  
End Contains.
End Contains.

Module  Impl_generics_associated_types_problem_Contains_i32_t_i32_t_for_generics_associated_types_problem_Container_t.
Section Impl_generics_associated_types_problem_Contains_i32_t_i32_t_for_generics_associated_types_problem_Container_t.
  Definition Self : Set := generics_associated_types_problem.Container.t.
  
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
    let* α0 : ref generics_associated_types_problem.Container.t :=
      M.read self in
    let* α1 : M.Val (ref i32.t) := M.alloc (borrow (deref α0).["0"]) in
    let* α2 : bool.t :=
      M.call
        ((core.cmp.PartialEq.eq (Self := ref i32.t) (Trait := ltac:(refine _)))
          (borrow α1)
          (borrow number_1)) in
    let* α3 : ref generics_associated_types_problem.Container.t :=
      M.read self in
    let* α4 : M.Val (ref i32.t) := M.alloc (borrow (deref α3).["1"]) in
    let* α5 : bool.t :=
      M.call
        ((core.cmp.PartialEq.eq (Self := ref i32.t) (Trait := ltac:(refine _)))
          (borrow α4)
          (borrow number_2)) in
    M.pure (BinOp.Pure.and α2 α5).
  
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
    let* α0 : ref generics_associated_types_problem.Container.t :=
      M.read self in
    M.read (deref α0).["0"].
  
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
    let* α0 : ref generics_associated_types_problem.Container.t :=
      M.read self in
    M.read (deref α0).["1"].
  
  Global Instance AssociatedFunction_last :
    Notations.DoubleColon Self "last" := {
    Notations.double_colon := last;
  }.
  
  Global Instance ℐ :
    generics_associated_types_problem.Contains.Trait Self
      (A := i32.t)
      (B := i32.t) := {
    generics_associated_types_problem.Contains.contains := contains;
    generics_associated_types_problem.Contains.first := first;
    generics_associated_types_problem.Contains.last := last;
  }.
End Impl_generics_associated_types_problem_Contains_i32_t_i32_t_for_generics_associated_types_problem_Container_t.
End Impl_generics_associated_types_problem_Contains_i32_t_i32_t_for_generics_associated_types_problem_Container_t.

(*
fn difference<A, B, C>(container: &C) -> i32
where
    C: Contains<A, B>,
{
    container.last() - container.first()
}
*)
Definition difference
    {A B C : Set}
    {ℋ_0 : generics_associated_types_problem.Contains.Trait C (A := A) (B := B)}
    (container : ref C)
    : M i32.t :=
  let* container := M.alloc container in
  let* α0 : ref C := M.read container in
  let* α1 : i32.t :=
    M.call
      ((generics_associated_types_problem.Contains.last
          (Self := C)
          (Trait := ltac:(refine _)))
        α0) in
  let* α2 : ref C := M.read container in
  let* α3 : i32.t :=
    M.call
      ((generics_associated_types_problem.Contains.first
          (Self := C)
          (Trait := ltac:(refine _)))
        α2) in
  BinOp.Panic.sub α1 α3.

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
  let* container : M.Val generics_associated_types_problem.Container.t :=
    let* α0 : i32.t := M.read number_1 in
    let* α1 : i32.t := M.read number_2 in
    M.alloc (generics_associated_types_problem.Container.Build_t α0 α1) in
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
      let* α11 : bool.t :=
        M.call
          ((generics_associated_types_problem.Contains.contains
              (Self := generics_associated_types_problem.Container.t)
              (Trait := ltac:(refine _)))
            (borrow container)
            (borrow number_1)
            (borrow number_2)) in
      let* α12 : M.Val bool.t := M.alloc α11 in
      let* α13 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α12)) in
      let* α14 : M.Val (array core.fmt.rt.Argument.t) :=
        M.alloc [ α8; α10; α13 ] in
      let* α15 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α14) in
      let* α16 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α15) in
      let* α17 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α6 α16) in
      let* α18 : unit := M.call (std.io.stdio._print α17) in
      M.alloc α18 in
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
      let* α5 : i32.t :=
        M.call
          ((generics_associated_types_problem.Contains.first
              (Self := generics_associated_types_problem.Container.t)
              (Trait := ltac:(refine _)))
            (borrow container)) in
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
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Last number: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : i32.t :=
        M.call
          ((generics_associated_types_problem.Contains.last
              (Self := generics_associated_types_problem.Container.t)
              (Trait := ltac:(refine _)))
            (borrow container)) in
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
          (generics_associated_types_problem.difference (borrow container)) in
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
