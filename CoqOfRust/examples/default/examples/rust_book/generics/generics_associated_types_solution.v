(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Contains.
Section Contains.
  Class Trait (Self : Set) : Type := {
    A : Set;
    B : Set;
    contains :
      Ty.function
        [Ty.apply (Ty.path "ref") [Self];
          Ty.apply (Ty.path "ref") [_];
          Ty.apply (Ty.path "ref") [_]]
        (Ty.path "bool");
    first : Ty.function [Ty.apply (Ty.path "ref") [Self]] (Ty.path "i32");
    last : Ty.function [Ty.apply (Ty.path "ref") [Self]] (Ty.path "i32");
    a : Ty.function [Ty.apply (Ty.path "ref") [Self]] _;
  }.
  
  Definition Method_A `(Trait) : Instance.t := {
    Notations.double_colon_type := A;
  }.
  Definition Method_B `(Trait) : Instance.t := {
    Notations.double_colon_type := B;
  }.
End Contains.
End Contains.

Module  Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.
Section Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "generics_associated_types_solution::Container") [].
  
  (*
      type A = i32;
  *)
  Definition A : Set := Ty.path "i32".
  
  (*
      type B = i32;
  *)
  Definition B : Set := Ty.path "i32".
  
  (*
      fn contains(&self, number_1: &i32, number_2: &i32) -> bool {
          (&self.0 == number_1) && (&self.1 == number_2)
      }
  *)
  Definition contains (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; number_1; number_2] =>
      let* self := M.alloc self in
      let* number_1 := M.alloc number_1 in
      let* number_2 := M.alloc number_2 in
      let* α0 :
          Ty.function
            [Ty.apply
                (Ty.path "ref")
                [Ty.apply (Ty.path "ref") [Ty.path "i32"]];
              Ty.apply
                (Ty.path "ref")
                [Ty.apply (Ty.path "ref") [Ty.path "i32"]]]
            (Ty.path "bool") :=
        ltac:(M.get_method (fun ℐ =>
          core.cmp.PartialEq.eq
            (Self := Ty.apply (Ty.path "ref") [Ty.path "i32"])
            (Rhs := Ty.apply (Ty.path "ref") [Ty.path "i32"])
            (Trait := ℐ))) in
      let* α1 :
          Ty.apply
            (Ty.path "ref")
            [Ty.apply
                (Ty.path "generics_associated_types_solution::Container")
                []] :=
        M.read self in
      let* α2 : Ty.apply (Ty.path "ref") [Ty.path "i32"] :=
        M.alloc
          (borrow
            (generics_associated_types_solution.Container.Get_0 (deref α1))) in
      let* α3 : Ty.path "bool" := M.call (α0 (borrow α2) (borrow number_1)) in
      let* α4 :
          Ty.function
            [Ty.apply
                (Ty.path "ref")
                [Ty.apply (Ty.path "ref") [Ty.path "i32"]];
              Ty.apply
                (Ty.path "ref")
                [Ty.apply (Ty.path "ref") [Ty.path "i32"]]]
            (Ty.path "bool") :=
        ltac:(M.get_method (fun ℐ =>
          core.cmp.PartialEq.eq
            (Self := Ty.apply (Ty.path "ref") [Ty.path "i32"])
            (Rhs := Ty.apply (Ty.path "ref") [Ty.path "i32"])
            (Trait := ℐ))) in
      let* α5 :
          Ty.apply
            (Ty.path "ref")
            [Ty.apply
                (Ty.path "generics_associated_types_solution::Container")
                []] :=
        M.read self in
      let* α6 : Ty.apply (Ty.path "ref") [Ty.path "i32"] :=
        M.alloc
          (borrow
            (generics_associated_types_solution.Container.Get_1 (deref α5))) in
      let* α7 : Ty.path "bool" := M.call (α4 (borrow α6) (borrow number_2)) in
      M.pure (BinOp.Pure.and α3 α7)
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_contains : Instance.t := {
    Notations.double_colon := contains;
  }.
  
  (*
      fn first(&self) -> i32 {
          self.0
      }
  *)
  Definition first (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 :
          Ty.apply
            (Ty.path "ref")
            [Ty.apply
                (Ty.path "generics_associated_types_solution::Container")
                []] :=
        M.read self in
      M.read (generics_associated_types_solution.Container.Get_0 (deref α0))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_first : Instance.t := {
    Notations.double_colon := first;
  }.
  
  (*
      fn last(&self) -> i32 {
          self.1
      }
  *)
  Definition last (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 :
          Ty.apply
            (Ty.path "ref")
            [Ty.apply
                (Ty.path "generics_associated_types_solution::Container")
                []] :=
        M.read self in
      M.read (generics_associated_types_solution.Container.Get_1 (deref α0))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_last : Instance.t := {
    Notations.double_colon := last;
  }.
  
  (*
      fn a(&self) -> i32 {
          self.0
      }
  *)
  Definition a (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 :
          Ty.apply
            (Ty.path "ref")
            [Ty.apply
                (Ty.path "generics_associated_types_solution::Container")
                []] :=
        M.read self in
      M.read (generics_associated_types_solution.Container.Get_0 (deref α0))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_a : Instance.t := {
    Notations.double_colon := a;
  }.
  
  Definition ℐ : Instance.t := [("A", A);
    ("B", B);
    ("contains", contains);
    ("first", first);
    ("last", last);
    ("a", a)].
End Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.
End Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.

(*
fn difference<C: Contains>(container: &C) -> i32 {
    container.last() - container.first()
}
*)
Definition difference (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [C], [container] =>
    let* container := M.alloc container in
    let* α0 : Ty.function [Ty.apply (Ty.path "ref") [C]] (Ty.path "i32") :=
      ltac:(M.get_method (fun ℐ =>
        generics_associated_types_solution.Contains.last
          (Self := C)
          (Trait := ℐ))) in
    let* α1 : Ty.apply (Ty.path "ref") [C] := M.read container in
    let* α2 : Ty.path "i32" := M.call (α0 α1) in
    let* α3 : Ty.function [Ty.apply (Ty.path "ref") [C]] (Ty.path "i32") :=
      ltac:(M.get_method (fun ℐ =>
        generics_associated_types_solution.Contains.first
          (Self := C)
          (Trait := ℐ))) in
    let* α4 : Ty.apply (Ty.path "ref") [C] := M.read container in
    let* α5 : Ty.path "i32" := M.call (α3 α4) in
    BinOp.Panic.sub α2 α5
  | _, _ => M.impossible
  end.

(*
fn get_a<C: Contains>(container: &C) -> C::A {
    container.a()
}
*)
Definition get_a (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [C], [container] =>
    let* container := M.alloc container in
    let* α0 : Ty.function [Ty.apply (Ty.path "ref") [C]] _ :=
      ltac:(M.get_method (fun ℐ =>
        generics_associated_types_solution.Contains.a
          (Self := C)
          (Trait := ℐ))) in
    let* α1 : Ty.apply (Ty.path "ref") [C] := M.read container in
    M.call (α0 α1)
  | _, _ => M.impossible
  end.

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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* number_1 : Ty.path "i32" :=
      M.alloc ((Integer.of_Z 3) : Ty.path "i32") in
    let* number_2 : Ty.path "i32" :=
      M.alloc ((Integer.of_Z 10) : Ty.path "i32") in
    let* container :
        Ty.apply (Ty.path "generics_associated_types_solution::Container") [] :=
      let* α0 : Ty.path "i32" := M.read number_1 in
      let* α1 : Ty.path "i32" := M.read number_2 in
      M.alloc (generics_associated_types_solution.Container.Build_t α0 α1) in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "Does container contain ") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str " and ") in
        let* α2 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str ": ") in
        let* α3 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α4 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1; α2; α3 ] in
        let* α5 : Ty.apply (Ty.path "ref") [Ty.path "i32"] :=
          M.alloc (borrow number_1) in
        let* α6 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α5)) in
        let* α7 : Ty.apply (Ty.path "ref") [Ty.path "i32"] :=
          M.alloc (borrow number_2) in
        let* α8 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α7)) in
        let* α9 :
            Ty.function
              [Ty.apply
                  (Ty.path "ref")
                  [Ty.apply
                      (Ty.path "generics_associated_types_solution::Container")
                      []];
                Ty.apply (Ty.path "ref") [_];
                Ty.apply (Ty.path "ref") [_]]
              (Ty.path "bool") :=
          ltac:(M.get_method (fun ℐ =>
            generics_associated_types_solution.Contains.contains
              (Self :=
                Ty.apply
                  (Ty.path "generics_associated_types_solution::Container")
                  [])
              (Trait := ℐ))) in
        let* α10 : Ty.path "bool" :=
          M.call (α9 (borrow container) (borrow number_1) (borrow number_2)) in
        let* α11 : Ty.path "bool" := M.alloc α10 in
        let* α12 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α11)) in
        let* α13 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α6; α8; α12 ] in
        let* α14 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α4))
              (pointer_coercion "Unsize" (borrow α13))) in
        let* α15 : Ty.tuple := M.call (std.io.stdio._print α14) in
        M.alloc α15 in
      M.alloc tt in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "First number: ") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 :
            Ty.function
              [Ty.apply
                  (Ty.path "ref")
                  [Ty.apply
                      (Ty.path "generics_associated_types_solution::Container")
                      []]]
              (Ty.path "i32") :=
          ltac:(M.get_method (fun ℐ =>
            generics_associated_types_solution.Contains.first
              (Self :=
                Ty.apply
                  (Ty.path "generics_associated_types_solution::Container")
                  [])
              (Trait := ℐ))) in
        let* α4 : Ty.path "i32" := M.call (α3 (borrow container)) in
        let* α5 : Ty.path "i32" := M.alloc α4 in
        let* α6 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α5)) in
        let* α7 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α6 ] in
        let* α8 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α7))) in
        let* α9 : Ty.tuple := M.call (std.io.stdio._print α8) in
        M.alloc α9 in
      M.alloc tt in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "Last number: ") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 :
            Ty.function
              [Ty.apply
                  (Ty.path "ref")
                  [Ty.apply
                      (Ty.path "generics_associated_types_solution::Container")
                      []]]
              (Ty.path "i32") :=
          ltac:(M.get_method (fun ℐ =>
            generics_associated_types_solution.Contains.last
              (Self :=
                Ty.apply
                  (Ty.path "generics_associated_types_solution::Container")
                  [])
              (Trait := ℐ))) in
        let* α4 : Ty.path "i32" := M.call (α3 (borrow container)) in
        let* α5 : Ty.path "i32" := M.alloc α4 in
        let* α6 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α5)) in
        let* α7 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α6 ] in
        let* α8 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α7))) in
        let* α9 : Ty.tuple := M.call (std.io.stdio._print α8) in
        M.alloc α9 in
      M.alloc tt in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "The difference is: ") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 : Ty.path "i32" :=
          M.call
            (generics_associated_types_solution.difference
              (borrow container)) in
        let* α4 : Ty.path "i32" := M.alloc α3 in
        let* α5 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α4)) in
        let* α6 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α5 ] in
        let* α7 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α6))) in
        let* α8 : Ty.tuple := M.call (std.io.stdio._print α7) in
        M.alloc α8 in
      M.alloc tt in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
