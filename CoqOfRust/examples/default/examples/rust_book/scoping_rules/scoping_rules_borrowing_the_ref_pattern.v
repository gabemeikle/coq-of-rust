(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Point";
    ty_params := [];
    fields := [ ("x", Ty.path "i32"); ("y", Ty.path "i32") ];
  } *)

Module Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point.
  Definition Self : Ty.t :=
    Ty.path "scoping_rules_borrowing_the_ref_pattern::Point".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator Value.DeclaredButUndefined [ fun γ => M.read self ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "scoping_rules_borrowing_the_ref_pattern::Point")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point.

Module Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point.
  Definition Self : Ty.t :=
    Ty.path "scoping_rules_borrowing_the_ref_pattern::Point".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "scoping_rules_borrowing_the_ref_pattern::Point")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point.

(*
fn main() {
    let c = 'Q';

    // A `ref` borrow on the left side of an assignment is equivalent to
    // an `&` borrow on the right side.
    let ref ref_c1 = c;
    let ref_c2 = &c;

    println!("ref_c1 equals ref_c2: {}", *ref_c1 == *ref_c2);

    let point = Point { x: 0, y: 0 };

    // `ref` is also valid when destructuring a struct.
    let _copy_of_x = {
        // `ref_to_x` is a reference to the `x` field of `point`.
        let Point {
            x: ref ref_to_x,
            y: _,
        } = point;

        // Return a copy of the `x` field of `point`.
        *ref_to_x
    };

    // A mutable copy of `point`
    let mut mutable_point = point;

    {
        // `ref` can be paired with `mut` to take mutable references.
        let Point {
            x: _,
            y: ref mut mut_ref_to_y,
        } = mutable_point;

        // Mutate the `y` field of `mutable_point` via a mutable reference.
        *mut_ref_to_y = 1;
    }

    println!("point is ({}, {})", point.x, point.y);
    println!(
        "mutable_point is ({}, {})",
        mutable_point.x, mutable_point.y
    );

    // A mutable tuple that includes a pointer
    let mut mutable_tuple = (Box::new(5u32), 3u32);

    {
        // Destructure `mutable_tuple` to change the value of `last`.
        let (_, ref mut last) = mutable_tuple;
        *last = 2u32;
    }

    println!("tuple is {:?}", mutable_tuple);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* c := M.alloc (Value.UnicodeChar 81) in
    let* α0 :=
      match_operator
        c
        [
          fun γ =>
            let* ref_c1 := M.alloc γ in
            let* ref_c2 := M.alloc c in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1"
                    [] in
                let* α2 := M.read (mk_str "ref_c1 equals ref_c2: ") in
                let* α3 := M.read (mk_str "
") in
                let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                let* α5 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display"
                    [ Ty.path "bool" ] in
                let* α6 := M.read ref_c1 in
                let* α7 := M.read α6 in
                let* α8 := M.read ref_c2 in
                let* α9 := M.read α8 in
                let* α10 := M.alloc (BinOp.Pure.eq α7 α9) in
                let* α11 := M.call_closure α5 [ α10 ] in
                let* α12 := M.alloc (Value.Array [ α11 ]) in
                let* α13 :=
                  M.call_closure
                    α1
                    [
                      M.pointer_coercion (* Unsize *) α4;
                      M.pointer_coercion (* Unsize *) α12
                    ] in
                let* α14 := M.call_closure α0 [ α13 ] in
                M.alloc α14 in
              M.alloc (Value.Tuple []) in
            let* point :=
              M.alloc
                (Value.StructRecord
                  "scoping_rules_borrowing_the_ref_pattern::Point"
                  [
                    ("x", Value.Integer Integer.I32 0);
                    ("y", Value.Integer Integer.I32 0)
                  ]) in
            let* _copy_of_x :=
              let* α0 :=
                match_operator
                  point
                  [
                    fun γ =>
                      let* γ0_0 :=
                        M.get_struct_record_field_or_break_match
                          γ
                          "scoping_rules_borrowing_the_ref_pattern::Point"
                          "x" in
                      let* γ0_1 :=
                        M.get_struct_record_field_or_break_match
                          γ
                          "scoping_rules_borrowing_the_ref_pattern::Point"
                          "y" in
                      let* ref_to_x := M.alloc γ0_0 in
                      M.read ref_to_x
                  ] in
              M.copy α0 in
            let* mutable_point := M.copy point in
            let* _ :=
              match_operator
                mutable_point
                [
                  fun γ =>
                    let* γ0_0 :=
                      M.get_struct_record_field_or_break_match
                        γ
                        "scoping_rules_borrowing_the_ref_pattern::Point"
                        "x" in
                    let* γ0_1 :=
                      M.get_struct_record_field_or_break_match
                        γ
                        "scoping_rules_borrowing_the_ref_pattern::Point"
                        "y" in
                    let* mut_ref_to_y := M.alloc γ0_1 in
                    let* _ :=
                      let* α0 := M.read mut_ref_to_y in
                      M.assign α0 (Value.Integer Integer.I32 1) in
                    M.alloc (Value.Tuple [])
                ] in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1"
                    [] in
                let* α2 := M.read (mk_str "point is (") in
                let* α3 := M.read (mk_str ", ") in
                let* α4 := M.read (mk_str ")
") in
                let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                let* α6 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display"
                    [ Ty.path "i32" ] in
                let* α7 :=
                  M.call_closure
                    α6
                    [
                      M.get_struct_record_field
                        point
                        "scoping_rules_borrowing_the_ref_pattern::Point"
                        "x"
                    ] in
                let* α8 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display"
                    [ Ty.path "i32" ] in
                let* α9 :=
                  M.call_closure
                    α8
                    [
                      M.get_struct_record_field
                        point
                        "scoping_rules_borrowing_the_ref_pattern::Point"
                        "y"
                    ] in
                let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
                let* α11 :=
                  M.call_closure
                    α1
                    [
                      M.pointer_coercion (* Unsize *) α5;
                      M.pointer_coercion (* Unsize *) α10
                    ] in
                let* α12 := M.call_closure α0 [ α11 ] in
                M.alloc α12 in
              M.alloc (Value.Tuple []) in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1"
                    [] in
                let* α2 := M.read (mk_str "mutable_point is (") in
                let* α3 := M.read (mk_str ", ") in
                let* α4 := M.read (mk_str ")
") in
                let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                let* α6 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display"
                    [ Ty.path "i32" ] in
                let* α7 :=
                  M.call_closure
                    α6
                    [
                      M.get_struct_record_field
                        mutable_point
                        "scoping_rules_borrowing_the_ref_pattern::Point"
                        "x"
                    ] in
                let* α8 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display"
                    [ Ty.path "i32" ] in
                let* α9 :=
                  M.call_closure
                    α8
                    [
                      M.get_struct_record_field
                        mutable_point
                        "scoping_rules_borrowing_the_ref_pattern::Point"
                        "y"
                    ] in
                let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
                let* α11 :=
                  M.call_closure
                    α1
                    [
                      M.pointer_coercion (* Unsize *) α5;
                      M.pointer_coercion (* Unsize *) α10
                    ] in
                let* α12 := M.call_closure α0 [ α11 ] in
                M.alloc α12 in
              M.alloc (Value.Tuple []) in
            let* mutable_tuple :=
              let* α0 :=
                M.get_associated_function
                  (Ty.apply
                    (Ty.path "alloc::boxed::Box")
                    [ Ty.path "u32"; Ty.path "alloc::alloc::Global" ])
                  "new"
                  [] in
              let* α1 := M.call_closure α0 [ Value.Integer Integer.U32 5 ] in
              M.alloc (Value.Tuple [ α1; Value.Integer Integer.U32 3 ]) in
            let* _ :=
              match_operator
                mutable_tuple
                [
                  fun γ =>
                    let γ0_0 := M.get_tuple_field γ 0 in
                    let γ0_1 := M.get_tuple_field γ 1 in
                    let* last := M.alloc γ0_1 in
                    let* _ :=
                      let* α0 := M.read last in
                      M.assign α0 (Value.Integer Integer.U32 2) in
                    M.alloc (Value.Tuple [])
                ] in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1"
                    [] in
                let* α2 := M.read (mk_str "tuple is ") in
                let* α3 := M.read (mk_str "
") in
                let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                let* α5 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_debug"
                    [
                      Ty.tuple
                        [
                          Ty.apply
                            (Ty.path "alloc::boxed::Box")
                            [ Ty.path "u32"; Ty.path "alloc::alloc::Global" ];
                          Ty.path "u32"
                        ]
                    ] in
                let* α6 := M.call_closure α5 [ mutable_tuple ] in
                let* α7 := M.alloc (Value.Array [ α6 ]) in
                let* α8 :=
                  M.call_closure
                    α1
                    [
                      M.pointer_coercion (* Unsize *) α4;
                      M.pointer_coercion (* Unsize *) α7
                    ] in
                let* α9 := M.call_closure α0 [ α8 ] in
                M.alloc α9 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
