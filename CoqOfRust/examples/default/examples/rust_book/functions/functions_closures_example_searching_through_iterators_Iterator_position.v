(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let vec = vec![1, 9, 3, 3, 13, 2];

    // `iter()` for vecs yields `&i32` and `position()` does not take a reference, so
    // we have to destructure `&i32` to `i32`
    let index_of_first_even_number = vec.iter().position(|&x| x % 2 == 0);
    assert_eq!(index_of_first_even_number, Some(5));

    // `into_iter()` for vecs yields `i32` and `position()` does not take a reference, so
    // we do not have to destructure
    let index_of_first_negative_number = vec.into_iter().position(|x| x < 0);
    assert_eq!(index_of_first_negative_number, None);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* vec :=
      let* α0 :=
        M.alloc
          [
            (Integer.of_Z 1) : Ty.path "i32";
            (Integer.of_Z 9) : Ty.path "i32";
            (Integer.of_Z 3) : Ty.path "i32";
            (Integer.of_Z 3) : Ty.path "i32";
            (Integer.of_Z 13) : Ty.path "i32";
            (Integer.of_Z 2) : Ty.path "i32"
          ] in
      let* α1 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α0 ] in
      let* α2 := M.read α1 in
      let* α3 :=
        M.call
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["into_vec"]
          [ pointer_coercion "Unsize" α2 ] in
      M.alloc α3 in
    let* index_of_first_even_number :=
      let* α0 :=
        M.get_method
          "core::iter::traits::iterator::Iterator"
          "position"
          [
            (* Self *)
              Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ];
            (* P *)
              Ty.function
                [ Ty.tuple [ Ty.apply (Ty.path "ref") [ Ty.path "i32" ] ] ]
                (Ty.path "bool")
          ] in
      let* α1 :=
        M.get_method
          "core::ops::deref::Deref"
          "deref"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α2 := M.call α1 [ vec ] in
      let* α3 :=
        M.call
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["iter"]
          [ α2 ] in
      let* α4 := M.alloc α3 in
      let* α5 :=
        M.call
          α0
          [
            α4;
            fun (α0 : Ty.apply (Ty.path "ref") [ Ty.path "i32" ]) =>
              (let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    (let* γ :=
                      let* α0 := M.read γ in
                      M.pure (deref α0) in
                    let* x := M.copy γ in
                    let* α0 := M.var "BinOp::Pure::eq" in
                    let* α1 := M.var "BinOp::Panic::rem" in
                    let* α2 := M.read x in
                    let* α3 := α1 α2 ((Integer.of_Z 2) : Ty.path "i32") in
                    M.pure (α0 α3 ((Integer.of_Z 0) : Ty.path "i32"))) :
                    _
                ]) :
              _
          ] in
      M.alloc α5 in
    let* _ :=
      let* α0 :=
        M.alloc
          (Value.StructTuple
            "core::option::Option::Some"
            [ (Integer.of_Z 5) : Ty.path "usize" ]) in
      let* α1 := M.alloc (index_of_first_even_number, α0) in
      match_operator
        α1
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 := M.var "UnOp::not" in
              let* α1 :=
                M.get_method
                  "core::cmp::PartialEq"
                  "eq"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "usize" ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "usize" ]
                  ] in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 := M.call α1 [ α2; α3 ] in
              let* α5 := M.alloc (α0 α4) in
              let* α6 := M.read (use α5) in
              if α6 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.var "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := never_to_any α1 in
                M.alloc α2
              else
                M.alloc tt
            end) :
            Ty.tuple []
        ] in
    let* index_of_first_negative_number :=
      let* α0 :=
        M.get_method
          "core::iter::traits::iterator::Iterator"
          "position"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::into_iter::IntoIter")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
            (* P *) Ty.function [ Ty.tuple [ Ty.path "i32" ] ] (Ty.path "bool")
          ] in
      let* α1 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α2 := M.read vec in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.alloc α3 in
      let* α5 :=
        M.call
          α0
          [
            α4;
            fun (α0 : Ty.path "i32") =>
              (let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    (let* x := M.copy γ in
                    let* α0 := M.var "BinOp::Pure::lt" in
                    let* α1 := M.read x in
                    M.pure (α0 α1 ((Integer.of_Z 0) : Ty.path "i32"))) :
                    _
                ]) :
              _
          ] in
      M.alloc α5 in
    let* _ :=
      let* α0 := M.alloc core.option.Option.None in
      let* α1 := M.alloc (index_of_first_negative_number, α0) in
      match_operator
        α1
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 := M.var "UnOp::not" in
              let* α1 :=
                M.get_method
                  "core::cmp::PartialEq"
                  "eq"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "usize" ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "usize" ]
                  ] in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 := M.call α1 [ α2; α3 ] in
              let* α5 := M.alloc (α0 α4) in
              let* α6 := M.read (use α5) in
              if α6 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.var "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := never_to_any α1 in
                M.alloc α2
              else
                M.alloc tt
            end) :
            Ty.tuple []
        ] in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
