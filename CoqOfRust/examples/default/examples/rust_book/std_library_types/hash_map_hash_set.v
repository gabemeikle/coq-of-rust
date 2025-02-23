(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut a: HashSet<i32> = vec![1i32, 2, 3].into_iter().collect();
    let mut b: HashSet<i32> = vec![2i32, 3, 4].into_iter().collect();

    assert!(a.insert(4));
    assert!(a.contains(&4));

    // `HashSet::insert()` returns false if
    // there was a value already present.
    // assert!(b.insert(4), "Value 4 is already in set B!");
    // FIXME ^ Comment out this line

    b.insert(5);

    // If a collection's element type implements `Debug`,
    // then the collection implements `Debug`.
    // It usually prints its elements in the format `[elem1, elem2, ...]`
    println!("A: {:?}", a);
    println!("B: {:?}", b);

    // Print [1, 2, 3, 4, 5] in arbitrary order
    println!("Union: {:?}", a.union(&b).collect::<Vec<&i32>>());

    // This should print [1]
    println!("Difference: {:?}", a.difference(&b).collect::<Vec<&i32>>());

    // Print [2, 3, 4] in arbitrary order.
    println!(
        "Intersection: {:?}",
        a.intersection(&b).collect::<Vec<&i32>>()
    );

    // Print [1, 5]
    println!(
        "Symmetric Difference: {:?}",
        a.symmetric_difference(&b).collect::<Vec<&i32>>()
    );
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* a :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "alloc::vec::into_iter::IntoIter")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "collect"
          [
            Ty.apply
              (Ty.path "std::collections::hash::set::HashSet")
              [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ]
          ] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "into_iter"
          [] in
      let* α2 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α3 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply (Ty.path "array") [ Ty.path "i32" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α4 :=
        M.alloc
          (Value.Array
            [
              Value.Integer Integer.I32 1;
              Value.Integer Integer.I32 2;
              Value.Integer Integer.I32 3
            ]) in
      let* α5 := M.call_closure α3 [ α4 ] in
      let* α6 := M.read α5 in
      let* α7 := M.call_closure α2 [ M.pointer_coercion (* Unsize *) α6 ] in
      let* α8 := M.call_closure α1 [ α7 ] in
      let* α9 := M.call_closure α0 [ α8 ] in
      M.alloc α9 in
    let* b :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "alloc::vec::into_iter::IntoIter")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "collect"
          [
            Ty.apply
              (Ty.path "std::collections::hash::set::HashSet")
              [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ]
          ] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "into_iter"
          [] in
      let* α2 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α3 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply (Ty.path "array") [ Ty.path "i32" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α4 :=
        M.alloc
          (Value.Array
            [
              Value.Integer Integer.I32 2;
              Value.Integer Integer.I32 3;
              Value.Integer Integer.I32 4
            ]) in
      let* α5 := M.call_closure α3 [ α4 ] in
      let* α6 := M.read α5 in
      let* α7 := M.call_closure α2 [ M.pointer_coercion (* Unsize *) α6 ] in
      let* α8 := M.call_closure α1 [ α7 ] in
      let* α9 := M.call_closure α0 [ α8 ] in
      M.alloc α9 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::set::HashSet")
            [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
          "insert"
          [] in
      let* α1 := M.call_closure α0 [ a; Value.Integer Integer.I32 4 ] in
      let* α2 := M.alloc (UnOp.Pure.not α1) in
      let* α3 := M.read (M.use α2) in
      if Value.is_true α3 then
        let* α0 := M.get_function "core::panicking::panic" [] in
        let* α1 := M.read (mk_str "assertion failed: a.insert(4)") in
        let* α2 := M.call_closure α0 [ α1 ] in
        let* α3 := M.never_to_any α2 in
        M.alloc α3
      else
        M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::set::HashSet")
            [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
          "contains"
          [ Ty.path "i32" ] in
      let* α1 := M.alloc (Value.Integer Integer.I32 4) in
      let* α2 := M.call_closure α0 [ a; α1 ] in
      let* α3 := M.alloc (UnOp.Pure.not α2) in
      let* α4 := M.read (M.use α3) in
      if Value.is_true α4 then
        let* α0 := M.get_function "core::panicking::panic" [] in
        let* α1 := M.read (mk_str "assertion failed: a.contains(&4)") in
        let* α2 := M.call_closure α0 [ α1 ] in
        let* α3 := M.never_to_any α2 in
        M.alloc α3
      else
        M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::set::HashSet")
            [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
          "insert"
          [] in
      let* α1 := M.call_closure α0 [ b; Value.Integer Integer.I32 5 ] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "A: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [
              Ty.apply
                (Ty.path "std::collections::hash::set::HashSet")
                [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ]
            ] in
        let* α6 := M.call_closure α5 [ a ] in
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
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "B: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [
              Ty.apply
                (Ty.path "std::collections::hash::set::HashSet")
                [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ]
            ] in
        let* α6 := M.call_closure α5 [ b ] in
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
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Union: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α6 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            (Ty.apply
              (Ty.path "std::collections::hash::set::Union")
              [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
            []
            "collect"
            [
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α7 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "std::collections::hash::set::HashSet")
              [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
            "union"
            [] in
        let* α8 := M.call_closure α7 [ a; b ] in
        let* α9 := M.call_closure α6 [ α8 ] in
        let* α10 := M.alloc α9 in
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
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Difference: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α6 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            (Ty.apply
              (Ty.path "std::collections::hash::set::Difference")
              [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
            []
            "collect"
            [
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α7 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "std::collections::hash::set::HashSet")
              [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
            "difference"
            [] in
        let* α8 := M.call_closure α7 [ a; b ] in
        let* α9 := M.call_closure α6 [ α8 ] in
        let* α10 := M.alloc α9 in
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
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Intersection: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α6 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            (Ty.apply
              (Ty.path "std::collections::hash::set::Intersection")
              [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
            []
            "collect"
            [
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α7 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "std::collections::hash::set::HashSet")
              [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
            "intersection"
            [] in
        let* α8 := M.call_closure α7 [ a; b ] in
        let* α9 := M.call_closure α6 [ α8 ] in
        let* α10 := M.alloc α9 in
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
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Symmetric Difference: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α6 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            (Ty.apply
              (Ty.path "std::collections::hash::set::SymmetricDifference")
              [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
            []
            "collect"
            [
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α7 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "std::collections::hash::set::HashSet")
              [ Ty.path "i32"; Ty.path "std::hash::random::RandomState" ])
            "symmetric_difference"
            [] in
        let* α8 := M.call_closure α7 [ a; b ] in
        let* α9 := M.call_closure α6 [ α8 ] in
        let* α10 := M.alloc α9 in
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
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
