(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "PhantomTuple";
    ty_params := [ ("A", None); ("B", None) ];
    fields := [ A; Ty.apply (Ty.path "core::marker::PhantomData") [ B ] ];
  } *)

Module Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Definition Self (A B : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type::PhantomTuple") [ A; B ].
  
  Axiom Implements :
    forall (A B : Ty.t),
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *)
        (Ty.apply (Ty.path "generics_phantom_type::PhantomTuple") [ A; B ])
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.

Module Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Definition Self (A B : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type::PhantomTuple") [ A; B ].
  
  (*
  PartialEq
  *)
  Definition eq (A B : Ty.t) (𝜏 : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self A B in
    match 𝜏, α with
    | [], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      let* α0 :=
        M.get_trait_method
          "core::cmp::PartialEq"
          "eq"
          [ (* Self *) A; (* Rhs *) A ] in
      let* α1 := M.read self in
      let* α2 := M.read other in
      let* α3 :=
        M.call_closure
          α0
          [ M.get_struct_tuple α1 0; M.get_struct_tuple α2 0 ] in
      LogicalOp.and
        α3
        (let* α0 :=
          M.get_trait_method
            "core::cmp::PartialEq"
            "eq"
            [
              (* Self *) Ty.apply (Ty.path "core::marker::PhantomData") [ B ];
              (* Rhs *) Ty.apply (Ty.path "core::marker::PhantomData") [ B ]
            ] in
        let* α1 := M.read self in
        let* α2 := M.read other in
        M.call_closure α0 [ M.get_struct_tuple α1 1; M.get_struct_tuple α2 1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (A B : Ty.t),
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *)
        (Ty.apply (Ty.path "generics_phantom_type::PhantomTuple") [ A; B ])
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method (eq A B)) ].
End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.

(* StructRecord
  {
    name := "PhantomStruct";
    ty_params := [ ("A", None); ("B", None) ];
    fields :=
      [
        ("first", A);
        ("phantom", Ty.apply (Ty.path "core::marker::PhantomData") [ B ])
      ];
  } *)

Module Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Definition Self (A B : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type::PhantomStruct") [ A; B ].
  
  Axiom Implements :
    forall (A B : Ty.t),
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *)
        (Ty.apply (Ty.path "generics_phantom_type::PhantomStruct") [ A; B ])
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.

Module Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Definition Self (A B : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type::PhantomStruct") [ A; B ].
  
  (*
  PartialEq
  *)
  Definition eq (A B : Ty.t) (𝜏 : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self A B in
    match 𝜏, α with
    | [], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      let* α0 :=
        M.get_trait_method
          "core::cmp::PartialEq"
          "eq"
          [ (* Self *) A; (* Rhs *) A ] in
      let* α1 := M.read self in
      let* α2 := M.read other in
      let* α3 :=
        M.call_closure
          α0
          [ M.get_struct_record α1 "first"; M.get_struct_record α2 "first" ] in
      LogicalOp.and
        α3
        (let* α0 :=
          M.get_trait_method
            "core::cmp::PartialEq"
            "eq"
            [
              (* Self *) Ty.apply (Ty.path "core::marker::PhantomData") [ B ];
              (* Rhs *) Ty.apply (Ty.path "core::marker::PhantomData") [ B ]
            ] in
        let* α1 := M.read self in
        let* α2 := M.read other in
        M.call_closure
          α0
          [ M.get_struct_record α1 "phantom"; M.get_struct_record α2 "phantom"
          ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (A B : Ty.t),
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *)
        (Ty.apply (Ty.path "generics_phantom_type::PhantomStruct") [ A; B ])
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method (eq A B)) ].
End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.

(*
fn main() {
    // Here, `f32` and `f64` are the hidden parameters.
    // PhantomTuple type specified as `<char, f32>`.
    let _tuple1: PhantomTuple<char, f32> = PhantomTuple('Q', PhantomData);
    // PhantomTuple type specified as `<char, f64>`.
    let _tuple2: PhantomTuple<char, f64> = PhantomTuple('Q', PhantomData);

    // Type specified as `<char, f32>`.
    let _struct1: PhantomStruct<char, f32> = PhantomStruct {
        first: 'Q',
        phantom: PhantomData,
    };
    // Type specified as `<char, f64>`.
    let _struct2: PhantomStruct<char, f64> = PhantomStruct {
        first: 'Q',
        phantom: PhantomData,
    };

    // Compile-time Error! Type mismatch so these cannot be compared:
    // println!("_tuple1 == _tuple2 yields: {}",
    //           _tuple1 == _tuple2);

    // Compile-time Error! Type mismatch so these cannot be compared:
    // println!("_struct1 == _struct2 yields: {}",
    //           _struct1 == _struct2);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _tuple1 :=
      M.alloc
        (Value.StructTuple
          "generics_phantom_type::PhantomTuple"
          [
            Value.UnicodeChar 81;
            Value.StructTuple "core::marker::PhantomData" []
          ]) in
    let* _tuple2 :=
      M.alloc
        (Value.StructTuple
          "generics_phantom_type::PhantomTuple"
          [
            Value.UnicodeChar 81;
            Value.StructTuple "core::marker::PhantomData" []
          ]) in
    let* _struct1 :=
      M.alloc
        (Value.StructRecord
          "generics_phantom_type::PhantomStruct"
          [
            ("first", Value.UnicodeChar 81);
            ("phantom", Value.StructTuple "core::marker::PhantomData" [])
          ]) in
    let* _struct2 :=
      M.alloc
        (Value.StructRecord
          "generics_phantom_type::PhantomStruct"
          [
            ("first", Value.UnicodeChar 81);
            ("phantom", Value.StructTuple "core::marker::PhantomData" [])
          ]) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
