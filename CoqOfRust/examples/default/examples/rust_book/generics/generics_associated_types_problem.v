(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Container *)

(* Trait *)
Module Contains.
  
End Contains.

Module Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.
  (*
      fn contains(&self, number_1: &i32, number_2: &i32) -> bool {
          (&self.0 == number_1) && (&self.1 == number_2)
      }
  *)
  Definition contains (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; number_1; number_2 ] =>
      let* self := M.alloc self in
      let* number_1 := M.alloc number_1 in
      let* number_2 := M.alloc number_2 in
      let* α0 := M.var "BinOp::Pure::and" in
      let* α1 :=
        M.get_method
          "core::cmp::PartialEq"
          "eq"
          [
            (* Self *) Ty.apply (Ty.path "ref") [ Ty.path "i32" ];
            (* Rhs *) Ty.apply (Ty.path "ref") [ Ty.path "i32" ]
          ] in
      let* α2 := M.var "generics_associated_types_problem::Container::Get_0" in
      let* α3 := M.read self in
      let* α4 := M.alloc (α2 α3) in
      let* α5 := M.call α1 [ α4; number_1 ] in
      let* α6 :=
        M.get_method
          "core::cmp::PartialEq"
          "eq"
          [
            (* Self *) Ty.apply (Ty.path "ref") [ Ty.path "i32" ];
            (* Rhs *) Ty.apply (Ty.path "ref") [ Ty.path "i32" ]
          ] in
      let* α7 := M.var "generics_associated_types_problem::Container::Get_1" in
      let* α8 := M.read self in
      let* α9 := M.alloc (α7 α8) in
      let* α10 := M.call α6 [ α9; number_2 ] in
      M.pure (α0 α5 α10)
    | _, _ => M.impossible
    end.
  
  (*
      fn first(&self) -> i32 {
          self.0
      }
  *)
  Definition first (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.var "generics_associated_types_problem::Container::Get_0" in
      let* α1 := M.read self in
      M.read (α0 α1)
    | _, _ => M.impossible
    end.
  
  (*
      fn last(&self) -> i32 {
          self.1
      }
  *)
  Definition last (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.var "generics_associated_types_problem::Container::Get_1" in
      let* α1 := M.read self in
      M.read (α0 α1)
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_associated_types_problem::Contains"
      (* Self *) (Ty.path "generics_associated_types_problem::Container")
      [ (* A *) Ty.path "i32"; (* B *) Ty.path "i32" ]
      [
        ("contains", InstanceField.Method contains);
        ("first", InstanceField.Method first);
        ("last", InstanceField.Method last)
      ]
      [].
End Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.

(*
fn difference<A, B, C>(container: &C) -> i32
where
    C: Contains<A, B>,
{
    container.last() - container.first()
}
*)
Definition difference (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ A; B; C ], [ container ] =>
    let* container := M.alloc container in
    let* α0 := M.var "BinOp::Panic::sub" in
    let* α1 :=
      M.get_method
        "generics_associated_types_problem::Contains"
        "last"
        [ (* Self *) C; (* A *) A; (* B *) B ] in
    let* α2 := M.read container in
    let* α3 := M.call α1 [ α2 ] in
    let* α4 :=
      M.get_method
        "generics_associated_types_problem::Contains"
        "first"
        [ (* Self *) C; (* A *) A; (* B *) B ] in
    let* α5 := M.read container in
    let* α6 := M.call α4 [ α5 ] in
    α0 α3 α6
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
    let* number_1 := M.alloc ((Integer.of_Z 3) : Ty.path "i32") in
    let* number_2 := M.alloc ((Integer.of_Z 10) : Ty.path "i32") in
    let* container :=
      let* α0 := M.read number_1 in
      let* α1 := M.read number_2 in
      M.alloc
        (Value.StructTuple
          "generics_associated_types_problem::Container"
          [ α0; α1 ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Does container contain ") in
        let* α2 := M.read (mk_str " and ") in
        let* α3 := M.read (mk_str ": ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc [ α1; α2; α3; α4 ] in
        let* α6 := M.alloc number_1 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α6 ] in
        let* α8 := M.alloc number_2 in
        let* α9 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α8 ] in
        let* α10 :=
          M.get_method
            "generics_associated_types_problem::Contains"
            "contains"
            [
              (* Self *) Ty.path "generics_associated_types_problem::Container";
              (* A *) Ty.path "i32";
              (* B *) Ty.path "i32"
            ] in
        let* α11 := M.call α10 [ container; number_1; number_2 ] in
        let* α12 := M.alloc α11 in
        let* α13 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α12 ] in
        let* α14 := M.alloc [ α7; α9; α13 ] in
        let* α15 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α5; pointer_coercion "Unsize" α14 ] in
        let* α16 := M.call α0 [ α15 ] in
        M.alloc α16 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "First number: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_method
            "generics_associated_types_problem::Contains"
            "first"
            [
              (* Self *) Ty.path "generics_associated_types_problem::Container";
              (* A *) Ty.path "i32";
              (* B *) Ty.path "i32"
            ] in
        let* α5 := M.call α4 [ container ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α6 ] in
        let* α8 := M.alloc [ α7 ] in
        let* α9 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α8 ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Last number: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_method
            "generics_associated_types_problem::Contains"
            "last"
            [
              (* Self *) Ty.path "generics_associated_types_problem::Container";
              (* A *) Ty.path "i32";
              (* B *) Ty.path "i32"
            ] in
        let* α5 := M.call α4 [ container ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α6 ] in
        let* α8 := M.alloc [ α7 ] in
        let* α9 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α8 ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "The difference is: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 := M.var "generics_associated_types_problem::difference" in
        let* α5 := M.call α4 [ container ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α6 ] in
        let* α8 := M.alloc [ α7 ] in
        let* α9 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α8 ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
