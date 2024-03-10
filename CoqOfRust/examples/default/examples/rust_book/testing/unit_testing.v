(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
*)
Definition add (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ a; b ] =>
    let* a := M.alloc a in
    let* b := M.alloc b in
    let* α0 := M.read a in
    let* α1 := M.read b in
    BinOp.Panic.add α0 α1
  | _, _ => M.impossible
  end.

(*
fn bad_add(a: i32, b: i32) -> i32 {
    a - b
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition bad_add (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ a; b ] =>
    let* a := M.alloc a in
    let* b := M.alloc b in
    let* α0 := M.read a in
    let* α1 := M.read b in
    BinOp.Panic.sub α0 α1
  | _, _ => M.impossible
  end.

Module tests.
  (*
      fn test_add() {
          assert_eq!(add(1, 2), 3);
      }
  *)
  Definition test_add (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* _ :=
        let* α0 := M.get_function "unit_testing::add" [] in
        let* α1 :=
          M.call
            α0
            [ Value.Integer Integer.I32 1; Value.Integer Integer.I32 2 ] in
        let* α2 := M.alloc α1 in
        let* α3 := M.alloc (Value.Integer Integer.I32 3) in
        let* α4 := M.alloc (Value.Tuple [ α2; α3 ]) in
        match_operator
          α4
          (Value.Array
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | (_, _) =>
                  let γ0_0 := Tuple.Access.left γ in
                  let γ0_1 := Tuple.Access.right γ in
                  let* left_val := M.copy γ0_0 in
                  let* right_val := M.copy γ0_1 in
                  let* α0 := M.read left_val in
                  let* α1 := M.read α0 in
                  let* α2 := M.read right_val in
                  let* α3 := M.read α2 in
                  let* α4 := M.alloc (UnOp.not (BinOp.Pure.eq α1 α3)) in
                  let* α5 := M.read (M.use α4) in
                  if Value.is_true α5 then
                    let* kind :=
                      M.alloc
                        (Value.StructTuple
                          "core::panicking::AssertKind::Eq"
                          []) in
                    let* α0 :=
                      M.get_function
                        "core::panicking::assert_failed"
                        [ Ty.path "i32"; Ty.path "i32" ] in
                    let* α1 := M.read kind in
                    let* α2 := M.read left_val in
                    let* α3 := M.read right_val in
                    let* α4 :=
                      M.call
                        α0
                        [
                          α1;
                          α2;
                          α3;
                          Value.StructTuple "core::option::Option::None" []
                        ] in
                    let* α0 := M.alloc α4 in
                    let* α1 := M.read α0 in
                    let* α2 := M.never_to_any α1 in
                    M.alloc α2
                  else
                    M.alloc (Value.Tuple [])
                end)
            ]) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      fn test_bad_add() {
          // This assert would fire and test will fail.
          // Please note, that private functions can be tested too!
          assert_eq!(bad_add(1, 2), 3);
      }
  *)
  Definition test_bad_add (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* _ :=
        let* α0 := M.get_function "unit_testing::bad_add" [] in
        let* α1 :=
          M.call
            α0
            [ Value.Integer Integer.I32 1; Value.Integer Integer.I32 2 ] in
        let* α2 := M.alloc α1 in
        let* α3 := M.alloc (Value.Integer Integer.I32 3) in
        let* α4 := M.alloc (Value.Tuple [ α2; α3 ]) in
        match_operator
          α4
          (Value.Array
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | (_, _) =>
                  let γ0_0 := Tuple.Access.left γ in
                  let γ0_1 := Tuple.Access.right γ in
                  let* left_val := M.copy γ0_0 in
                  let* right_val := M.copy γ0_1 in
                  let* α0 := M.read left_val in
                  let* α1 := M.read α0 in
                  let* α2 := M.read right_val in
                  let* α3 := M.read α2 in
                  let* α4 := M.alloc (UnOp.not (BinOp.Pure.eq α1 α3)) in
                  let* α5 := M.read (M.use α4) in
                  if Value.is_true α5 then
                    let* kind :=
                      M.alloc
                        (Value.StructTuple
                          "core::panicking::AssertKind::Eq"
                          []) in
                    let* α0 :=
                      M.get_function
                        "core::panicking::assert_failed"
                        [ Ty.path "i32"; Ty.path "i32" ] in
                    let* α1 := M.read kind in
                    let* α2 := M.read left_val in
                    let* α3 := M.read right_val in
                    let* α4 :=
                      M.call
                        α0
                        [
                          α1;
                          α2;
                          α3;
                          Value.StructTuple "core::option::Option::None" []
                        ] in
                    let* α0 := M.alloc α4 in
                    let* α1 := M.read α0 in
                    let* α2 := M.never_to_any α1 in
                    M.alloc α2
                  else
                    M.alloc (Value.Tuple [])
                end)
            ]) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
End tests.
