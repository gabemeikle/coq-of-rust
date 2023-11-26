(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    assert_eq!(result, 20);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* counter : M.Val i32.t :=
      let* α0 : M.Val i32.t := M.alloc 0 in
      M.copy α0 in
    let* result : M.Val i32.t :=
      let* α0 : M.Val i32.t :=
        loop
          (let* _ : M.Val unit :=
            let* α0 : M.Val i32.t := M.alloc 1 in
            assign_op add counter α0 in
          let* α0 : M.Val i32.t := M.alloc 10 in
          let* α1 : M.Val bool.t := BinOp.eq counter α0 in
          let* α2 : M.Val bool.t := use α1 in
          let* α3 : bool.t := M.read α2 in
          if (α3 : bool) then
            let* _ : M.Val never.t := Break in
            let* α0 : M.Val unit := M.alloc tt in
            never_to_any α0
          else
            M.alloc tt) in
      M.copy α0 in
    let* _ : M.Val unit :=
      let* α0 : ref i32.t := borrow result in
      let* α1 : M.Val i32.t := M.alloc 20 in
      let* α2 : ref i32.t := borrow α1 in
      let* α3 : M.Val ((ref i32.t) * (ref i32.t)) := M.alloc (α0, α2) in
      let* α4 := M.read α3 in
      match α4 with
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
    M.alloc tt).
