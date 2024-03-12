(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Container";
    ty_params := [];
    fields := [ Ty.path "i32"; Ty.path "i32" ];
  } *)

(* Trait *)
Module Contains.
  
End Contains.

Module Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.
  Definition Self : Ty.t :=
    Ty.path "generics_associated_types_problem::Container".
  
  (*
      fn contains(&self, number_1: &i32, number_2: &i32) -> bool {
          (&self.0 == number_1) && (&self.1 == number_2)
      }
  *)
  Definition contains (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; number_1; number_2 ] =>
      let* self := M.alloc self in
      let* number_1 := M.alloc number_1 in
      let* number_2 := M.alloc number_2 in
      let* α0 :=
        M.get_trait_method
          "core::cmp::PartialEq"
          "eq"
          [
            (* Self *) Ty.apply (Ty.path "&") [ Ty.path "i32" ];
            (* Rhs *) Ty.apply (Ty.path "&") [ Ty.path "i32" ]
          ] in
      let* α1 := M.read self in
      let* α2 := M.alloc (M.get_struct_tuple α1 0) in
      let* α3 := M.call α0 [ α2; number_1 ] in
      LogicalOp.and
        α3
        (let* α0 :=
          M.get_trait_method
            "core::cmp::PartialEq"
            "eq"
            [
              (* Self *) Ty.apply (Ty.path "&") [ Ty.path "i32" ];
              (* Rhs *) Ty.apply (Ty.path "&") [ Ty.path "i32" ]
            ] in
        let* α1 := M.read self in
        let* α2 := M.alloc (M.get_struct_tuple α1 1) in
        M.call α0 [ α2; number_2 ])
    | _, _ => M.impossible
    end.
  
  (*
      fn first(&self) -> i32 {
          self.0
      }
  *)
  Definition first (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_tuple α0 0)
    | _, _ => M.impossible
    end.
  
  (*
      fn last(&self) -> i32 {
          self.1
      }
  *)
  Definition last (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_tuple α0 1)
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_associated_types_problem::Contains"
      (* Self *) (Ty.path "generics_associated_types_problem::Container")
      (* Trait polymorphic types *)
        [ (* A *) Ty.path "i32"; (* B *) Ty.path "i32" ]
      (* Instance *)
        [
          ("contains", InstanceField.Method contains);
          ("first", InstanceField.Method first);
          ("last", InstanceField.Method last)
        ].
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
    let* α0 :=
      M.get_trait_method
        "generics_associated_types_problem::Contains"
        "last"
        [ (* Self *) C; (* A *) A; (* B *) B ] in
    let* α1 := M.read container in
    let* α2 := M.call α0 [ α1 ] in
    let* α3 :=
      M.get_trait_method
        "generics_associated_types_problem::Contains"
        "first"
        [ (* Self *) C; (* A *) A; (* B *) B ] in
    let* α4 := M.read container in
    let* α5 := M.call α3 [ α4 ] in
    BinOp.Panic.sub α2 α5
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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* number_1 := M.alloc (Value.Integer Integer.I32 3) in
    let* number_2 := M.alloc (Value.Integer Integer.I32 10) in
    let* container :=
      let* α0 := M.read number_1 in
      let* α1 := M.read number_2 in
      M.alloc
        (Value.StructTuple
          "generics_associated_types_problem::Container"
          [ α0; α1 ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Does container contain ") in
        let* α3 := M.read (mk_str " and ") in
        let* α4 := M.read (mk_str ": ") in
        let* α5 := M.read (mk_str "
") in
        let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
        let* α7 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α8 := M.alloc number_1 in
        let* α9 := M.call α7 [ α8 ] in
        let* α10 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α11 := M.alloc number_2 in
        let* α12 := M.call α10 [ α11 ] in
        let* α13 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α14 :=
          M.get_trait_method
            "generics_associated_types_problem::Contains"
            "contains"
            [
              (* Self *) Ty.path "generics_associated_types_problem::Container";
              (* A *) Ty.path "i32";
              (* B *) Ty.path "i32"
            ] in
        let* α15 := M.call α14 [ container; number_1; number_2 ] in
        let* α16 := M.alloc α15 in
        let* α17 := M.call α13 [ α16 ] in
        let* α18 := M.alloc (Value.Array [ α9; α12; α17 ]) in
        let* α19 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α6;
              M.pointer_coercion (* Unsize *) α18
            ] in
        let* α20 := M.call α0 [ α19 ] in
        M.alloc α20 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "First number: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_trait_method
            "generics_associated_types_problem::Contains"
            "first"
            [
              (* Self *) Ty.path "generics_associated_types_problem::Container";
              (* A *) Ty.path "i32";
              (* B *) Ty.path "i32"
            ] in
        let* α7 := M.call α6 [ container ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Last number: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_trait_method
            "generics_associated_types_problem::Contains"
            "last"
            [
              (* Self *) Ty.path "generics_associated_types_problem::Container";
              (* A *) Ty.path "i32";
              (* B *) Ty.path "i32"
            ] in
        let* α7 := M.call α6 [ container ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "The difference is: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_function
            "generics_associated_types_problem::difference"
            [
              Ty.path "i32";
              Ty.path "i32";
              Ty.path "generics_associated_types_problem::Container"
            ] in
        let* α7 := M.call α6 [ container ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
