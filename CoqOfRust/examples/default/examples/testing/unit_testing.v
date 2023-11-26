(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
*)
Definition add (a : i32.t) (b : i32.t) : M i32.t :=
  let* a : M.Val i32.t := M.alloc a in
  let* b : M.Val i32.t := M.alloc b in
  M.function_body
    (let* α0 : M.Val i32.t := BinOp.add a b in
    M.read α0).

(*
fn bad_add(a: i32, b: i32) -> i32 {
    a - b
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition bad_add (a : i32.t) (b : i32.t) : M i32.t :=
  let* a : M.Val i32.t := M.alloc a in
  let* b : M.Val i32.t := M.alloc b in
  M.function_body
    (let* α0 : M.Val i32.t := BinOp.sub a b in
    M.read α0).

Module tests.
  (*
      fn test_add() {
          assert_eq!(add(1, 2), 3);
      }
  *)
  Definition test_add : M unit :=
    M.function_body
      (let* _ : M.Val unit :=
        let* α0 : M.Val i32.t := M.alloc 1 in
        let* α1 : i32.t := M.read α0 in
        let* α2 : M.Val i32.t := M.alloc 2 in
        let* α3 : i32.t := M.read α2 in
        let* α4 : i32.t := unit_testing.add α1 α3 in
        let* α5 : M.Val i32.t := M.alloc α4 in
        let* α6 : ref i32.t := borrow α5 in
        let* α7 : M.Val i32.t := M.alloc 3 in
        let* α8 : ref i32.t := borrow α7 in
        let* α9 : M.Val ((ref i32.t) * (ref i32.t)) := M.alloc (α6, α8) in
        let* α10 := M.read α9 in
        match α10 with
        | (left_val, right_val) =>
          let* right_val := M.alloc right_val in
          let* left_val := M.alloc left_val in
          let* α0 : ref i32.t := M.read left_val in
          let* α1 : M.Val i32.t := deref α0 in
          let* α2 : ref i32.t := M.read right_val in
          let* α3 : M.Val i32.t := deref α2 in
          let* α4 : M.Val bool.t := BinOp.eq α1 α3 in
          let* α5 : M.Val bool.t := UnOp.not α4 in
          let* α6 : M.Val bool.t := use α5 in
          let* α7 : bool.t := M.read α6 in
          if (α7 : bool) then
            let* kind : M.Val core.panicking.AssertKind.t :=
              M.alloc core.panicking.AssertKind.Eq in
            let* _ : M.Val never.t :=
              let* α0 : core.panicking.AssertKind.t := M.read kind in
              let* α1 : ref i32.t := M.read left_val in
              let* α2 : M.Val i32.t := deref α1 in
              let* α3 : ref i32.t := borrow α2 in
              let* α4 : M.Val i32.t := deref α3 in
              let* α5 : ref i32.t := borrow α4 in
              let* α6 : ref i32.t := M.read right_val in
              let* α7 : M.Val i32.t := deref α6 in
              let* α8 : ref i32.t := borrow α7 in
              let* α9 : M.Val i32.t := deref α8 in
              let* α10 : ref i32.t := borrow α9 in
              let* α11 : never.t :=
                core.panicking.assert_failed
                  α0
                  α5
                  α10
                  core.option.Option.None in
              M.alloc α11 in
            let* α0 : M.Val unit := M.alloc tt in
            never_to_any α0
          else
            M.alloc tt
        end in
      let* α0 : M.Val unit := M.alloc tt in
      M.read α0).
  
  (*
      fn test_bad_add() {
          // This assert would fire and test will fail.
          // Please note, that private functions can be tested too!
          assert_eq!(bad_add(1, 2), 3);
      }
  *)
  Definition test_bad_add : M unit :=
    M.function_body
      (let* _ : M.Val unit :=
        let* α0 : M.Val i32.t := M.alloc 1 in
        let* α1 : i32.t := M.read α0 in
        let* α2 : M.Val i32.t := M.alloc 2 in
        let* α3 : i32.t := M.read α2 in
        let* α4 : i32.t := unit_testing.bad_add α1 α3 in
        let* α5 : M.Val i32.t := M.alloc α4 in
        let* α6 : ref i32.t := borrow α5 in
        let* α7 : M.Val i32.t := M.alloc 3 in
        let* α8 : ref i32.t := borrow α7 in
        let* α9 : M.Val ((ref i32.t) * (ref i32.t)) := M.alloc (α6, α8) in
        let* α10 := M.read α9 in
        match α10 with
        | (left_val, right_val) =>
          let* right_val := M.alloc right_val in
          let* left_val := M.alloc left_val in
          let* α0 : ref i32.t := M.read left_val in
          let* α1 : M.Val i32.t := deref α0 in
          let* α2 : ref i32.t := M.read right_val in
          let* α3 : M.Val i32.t := deref α2 in
          let* α4 : M.Val bool.t := BinOp.eq α1 α3 in
          let* α5 : M.Val bool.t := UnOp.not α4 in
          let* α6 : M.Val bool.t := use α5 in
          let* α7 : bool.t := M.read α6 in
          if (α7 : bool) then
            let* kind : M.Val core.panicking.AssertKind.t :=
              M.alloc core.panicking.AssertKind.Eq in
            let* _ : M.Val never.t :=
              let* α0 : core.panicking.AssertKind.t := M.read kind in
              let* α1 : ref i32.t := M.read left_val in
              let* α2 : M.Val i32.t := deref α1 in
              let* α3 : ref i32.t := borrow α2 in
              let* α4 : M.Val i32.t := deref α3 in
              let* α5 : ref i32.t := borrow α4 in
              let* α6 : ref i32.t := M.read right_val in
              let* α7 : M.Val i32.t := deref α6 in
              let* α8 : ref i32.t := borrow α7 in
              let* α9 : M.Val i32.t := deref α8 in
              let* α10 : ref i32.t := borrow α9 in
              let* α11 : never.t :=
                core.panicking.assert_failed
                  α0
                  α5
                  α10
                  core.option.Option.None in
              M.alloc α11 in
            let* α0 : M.Val unit := M.alloc tt in
            never_to_any α0
          else
            M.alloc tt
        end in
      let* α0 : M.Val unit := M.alloc tt in
      M.read α0).
End tests.

(*
    fn test_add() {
        assert_eq!(add(1, 2), 3);
    }
*)
Definition test_add : M unit :=
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : M.Val i32.t := M.alloc 1 in
      let* α1 : i32.t := M.read α0 in
      let* α2 : M.Val i32.t := M.alloc 2 in
      let* α3 : i32.t := M.read α2 in
      let* α4 : i32.t := unit_testing.add α1 α3 in
      let* α5 : M.Val i32.t := M.alloc α4 in
      let* α6 : ref i32.t := borrow α5 in
      let* α7 : M.Val i32.t := M.alloc 3 in
      let* α8 : ref i32.t := borrow α7 in
      let* α9 : M.Val ((ref i32.t) * (ref i32.t)) := M.alloc (α6, α8) in
      let* α10 := M.read α9 in
      match α10 with
      | (left_val, right_val) =>
        let* right_val := M.alloc right_val in
        let* left_val := M.alloc left_val in
        let* α0 : ref i32.t := M.read left_val in
        let* α1 : M.Val i32.t := deref α0 in
        let* α2 : ref i32.t := M.read right_val in
        let* α3 : M.Val i32.t := deref α2 in
        let* α4 : M.Val bool.t := BinOp.eq α1 α3 in
        let* α5 : M.Val bool.t := UnOp.not α4 in
        let* α6 : M.Val bool.t := use α5 in
        let* α7 : bool.t := M.read α6 in
        if (α7 : bool) then
          let* kind : M.Val core.panicking.AssertKind.t :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : M.Val never.t :=
            let* α0 : core.panicking.AssertKind.t := M.read kind in
            let* α1 : ref i32.t := M.read left_val in
            let* α2 : M.Val i32.t := deref α1 in
            let* α3 : ref i32.t := borrow α2 in
            let* α4 : M.Val i32.t := deref α3 in
            let* α5 : ref i32.t := borrow α4 in
            let* α6 : ref i32.t := M.read right_val in
            let* α7 : M.Val i32.t := deref α6 in
            let* α8 : ref i32.t := borrow α7 in
            let* α9 : M.Val i32.t := deref α8 in
            let* α10 : ref i32.t := borrow α9 in
            let* α11 : never.t :=
              core.panicking.assert_failed α0 α5 α10 core.option.Option.None in
            M.alloc α11 in
          let* α0 : M.Val unit := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).

(*
    fn test_bad_add() {
        // This assert would fire and test will fail.
        // Please note, that private functions can be tested too!
        assert_eq!(bad_add(1, 2), 3);
    }
*)
Definition test_bad_add : M unit :=
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : M.Val i32.t := M.alloc 1 in
      let* α1 : i32.t := M.read α0 in
      let* α2 : M.Val i32.t := M.alloc 2 in
      let* α3 : i32.t := M.read α2 in
      let* α4 : i32.t := unit_testing.bad_add α1 α3 in
      let* α5 : M.Val i32.t := M.alloc α4 in
      let* α6 : ref i32.t := borrow α5 in
      let* α7 : M.Val i32.t := M.alloc 3 in
      let* α8 : ref i32.t := borrow α7 in
      let* α9 : M.Val ((ref i32.t) * (ref i32.t)) := M.alloc (α6, α8) in
      let* α10 := M.read α9 in
      match α10 with
      | (left_val, right_val) =>
        let* right_val := M.alloc right_val in
        let* left_val := M.alloc left_val in
        let* α0 : ref i32.t := M.read left_val in
        let* α1 : M.Val i32.t := deref α0 in
        let* α2 : ref i32.t := M.read right_val in
        let* α3 : M.Val i32.t := deref α2 in
        let* α4 : M.Val bool.t := BinOp.eq α1 α3 in
        let* α5 : M.Val bool.t := UnOp.not α4 in
        let* α6 : M.Val bool.t := use α5 in
        let* α7 : bool.t := M.read α6 in
        if (α7 : bool) then
          let* kind : M.Val core.panicking.AssertKind.t :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : M.Val never.t :=
            let* α0 : core.panicking.AssertKind.t := M.read kind in
            let* α1 : ref i32.t := M.read left_val in
            let* α2 : M.Val i32.t := deref α1 in
            let* α3 : ref i32.t := borrow α2 in
            let* α4 : M.Val i32.t := deref α3 in
            let* α5 : ref i32.t := borrow α4 in
            let* α6 : ref i32.t := M.read right_val in
            let* α7 : M.Val i32.t := deref α6 in
            let* α8 : ref i32.t := borrow α7 in
            let* α9 : M.Val i32.t := deref α8 in
            let* α10 : ref i32.t := borrow α9 in
            let* α11 : never.t :=
              core.panicking.assert_failed α0 α5 α10 core.option.Option.None in
            M.alloc α11 in
          let* α0 : M.Val unit := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
