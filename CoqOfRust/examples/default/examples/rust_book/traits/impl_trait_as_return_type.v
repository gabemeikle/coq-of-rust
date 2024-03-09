(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn combine_vecs_explicit_return_type(
    v: Vec<i32>,
    u: Vec<i32>,
) -> iter::Cycle<iter::Chain<IntoIter<i32>, IntoIter<i32>>> {
    v.into_iter().chain(u.into_iter()).cycle()
}
*)
Definition combine_vecs_explicit_return_type
    (𝜏 : list Ty.t)
    (α : list Value.t)
    : M :=
  match 𝜏, α with
  | [], [ v; u ] =>
    let* v := M.alloc v in
    let* u := M.alloc u in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::iterator::Iterator"
        "cycle"
        [
          (* Self *)
            Ty.apply
              (Ty.path "core::iter::adapters::chain::Chain")
              [
                Ty.apply
                  (Ty.path "alloc::vec::into_iter::IntoIter")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
                Ty.apply
                  (Ty.path "alloc::vec::into_iter::IntoIter")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
              ]
        ] in
    let* α1 :=
      M.get_trait_method
        "core::iter::traits::iterator::Iterator"
        "chain"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::into_iter::IntoIter")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
          (* U *)
            Ty.apply
              (Ty.path "alloc::vec::into_iter::IntoIter")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
        ] in
    let* α2 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
        ] in
    let* α3 := M.read v in
    let* α4 := M.call α2 [ α3 ] in
    let* α5 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
        ] in
    let* α6 := M.read u in
    let* α7 := M.call α5 [ α6 ] in
    let* α8 := M.call α1 [ α4; α7 ] in
    M.call α0 [ α8 ]
  | _, _ => M.impossible
  end.

(*
fn combine_vecs(v: Vec<i32>, u: Vec<i32>) -> impl Iterator<Item = i32> {
    v.into_iter().chain(u.into_iter()).cycle()
}
*)
Definition combine_vecs (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ v; u ] =>
    let* v := M.alloc v in
    let* u := M.alloc u in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::iterator::Iterator"
        "cycle"
        [
          (* Self *)
            Ty.apply
              (Ty.path "core::iter::adapters::chain::Chain")
              [
                Ty.apply
                  (Ty.path "alloc::vec::into_iter::IntoIter")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
                Ty.apply
                  (Ty.path "alloc::vec::into_iter::IntoIter")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
              ]
        ] in
    let* α1 :=
      M.get_trait_method
        "core::iter::traits::iterator::Iterator"
        "chain"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::into_iter::IntoIter")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
          (* U *)
            Ty.apply
              (Ty.path "alloc::vec::into_iter::IntoIter")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
        ] in
    let* α2 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
        ] in
    let* α3 := M.read v in
    let* α4 := M.call α2 [ α3 ] in
    let* α5 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
        ] in
    let* α6 := M.read u in
    let* α7 := M.call α5 [ α6 ] in
    let* α8 := M.call α1 [ α4; α7 ] in
    M.call α0 [ α8 ]
  | _, _ => M.impossible
  end.

Error OpaqueTy.

(*
fn main() {
    let v1 = vec![1, 2, 3];
    let v2 = vec![4, 5];
    let mut v3 = combine_vecs(v1, v2);
    assert_eq!(Some(1), v3.next());
    assert_eq!(Some(2), v3.next());
    assert_eq!(Some(3), v3.next());
    assert_eq!(Some(4), v3.next());
    assert_eq!(Some(5), v3.next());
    println!("all done");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* v1 :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec" in
      let* α1 :=
        M.alloc
          [
            Value.Integer Integer.I32 1;
            Value.Integer Integer.I32 2;
            Value.Integer Integer.I32 3
          ] in
      let* α2 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α1 ] in
      let* α3 := M.read α2 in
      let* α4 := M.call α0 [ M.pointer_coercion "Unsize" α3 ] in
      M.alloc α4 in
    let* v2 :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec" in
      let* α1 :=
        M.alloc [ Value.Integer Integer.I32 4; Value.Integer Integer.I32 5 ] in
      let* α2 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α1 ] in
      let* α3 := M.read α2 in
      let* α4 := M.call α0 [ M.pointer_coercion "Unsize" α3 ] in
      M.alloc α4 in
    let* v3 :=
      let* α0 := M.get_function "impl_trait_as_return_type::combine_vecs" in
      let* α1 := M.read v1 in
      let* α2 := M.read v2 in
      let* α3 := M.call α0 [ α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.alloc
          (Value.StructTuple
            "core::option::Option::Some"
            [ Value.Integer Integer.I32 1 ]) in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          "next"
          [ (* Self *) _ ] in
      let* α2 := M.call α1 [ v3 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α0; α3 ]) in
      match_operator
        α4
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 :=
                M.get_trait_method
                  "core::cmp::PartialEq"
                  "eq"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ]
                  ] in
              let* α1 := M.read left_val in
              let* α2 := M.read right_val in
              let* α3 := M.call α0 [ α1; α2 ] in
              let* α4 := M.alloc (UnOp.not α3) in
              let* α5 := M.read (M.use α4) in
              if α5 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.get_function "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := M.never_to_any α1 in
                M.alloc α2
              else
                M.alloc (Value.Tuple [])
            end)
        ] in
    let* _ :=
      let* α0 :=
        M.alloc
          (Value.StructTuple
            "core::option::Option::Some"
            [ Value.Integer Integer.I32 2 ]) in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          "next"
          [ (* Self *) _ ] in
      let* α2 := M.call α1 [ v3 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α0; α3 ]) in
      match_operator
        α4
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 :=
                M.get_trait_method
                  "core::cmp::PartialEq"
                  "eq"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ]
                  ] in
              let* α1 := M.read left_val in
              let* α2 := M.read right_val in
              let* α3 := M.call α0 [ α1; α2 ] in
              let* α4 := M.alloc (UnOp.not α3) in
              let* α5 := M.read (M.use α4) in
              if α5 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.get_function "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := M.never_to_any α1 in
                M.alloc α2
              else
                M.alloc (Value.Tuple [])
            end)
        ] in
    let* _ :=
      let* α0 :=
        M.alloc
          (Value.StructTuple
            "core::option::Option::Some"
            [ Value.Integer Integer.I32 3 ]) in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          "next"
          [ (* Self *) _ ] in
      let* α2 := M.call α1 [ v3 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α0; α3 ]) in
      match_operator
        α4
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 :=
                M.get_trait_method
                  "core::cmp::PartialEq"
                  "eq"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ]
                  ] in
              let* α1 := M.read left_val in
              let* α2 := M.read right_val in
              let* α3 := M.call α0 [ α1; α2 ] in
              let* α4 := M.alloc (UnOp.not α3) in
              let* α5 := M.read (M.use α4) in
              if α5 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.get_function "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := M.never_to_any α1 in
                M.alloc α2
              else
                M.alloc (Value.Tuple [])
            end)
        ] in
    let* _ :=
      let* α0 :=
        M.alloc
          (Value.StructTuple
            "core::option::Option::Some"
            [ Value.Integer Integer.I32 4 ]) in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          "next"
          [ (* Self *) _ ] in
      let* α2 := M.call α1 [ v3 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α0; α3 ]) in
      match_operator
        α4
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 :=
                M.get_trait_method
                  "core::cmp::PartialEq"
                  "eq"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ]
                  ] in
              let* α1 := M.read left_val in
              let* α2 := M.read right_val in
              let* α3 := M.call α0 [ α1; α2 ] in
              let* α4 := M.alloc (UnOp.not α3) in
              let* α5 := M.read (M.use α4) in
              if α5 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.get_function "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := M.never_to_any α1 in
                M.alloc α2
              else
                M.alloc (Value.Tuple [])
            end)
        ] in
    let* _ :=
      let* α0 :=
        M.alloc
          (Value.StructTuple
            "core::option::Option::Some"
            [ Value.Integer Integer.I32 5 ]) in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          "next"
          [ (* Self *) _ ] in
      let* α2 := M.call α1 [ v3 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α0; α3 ]) in
      match_operator
        α4
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 :=
                M.get_trait_method
                  "core::cmp::PartialEq"
                  "eq"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ]
                  ] in
              let* α1 := M.read left_val in
              let* α2 := M.read right_val in
              let* α3 := M.call α0 [ α1; α2 ] in
              let* α4 := M.alloc (UnOp.not α3) in
              let* α5 := M.read (M.use α4) in
              if α5 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.get_function "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := M.never_to_any α1 in
                M.alloc α2
              else
                M.alloc (Value.Tuple [])
            end)
        ] in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const" in
        let* α2 := M.read (mk_str "all done
") in
        let* α3 := M.alloc [ α2 ] in
        let* α4 := M.call α1 [ M.pointer_coercion "Unsize" α3 ] in
        let* α5 := M.call α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
