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
  let* counter : M.Val i32.t := M.alloc ((Integer.of_Z 0) : i32.t) in
  let* result : M.Val i32.t :=
    let* α0 : M.Val i32.t :=
      M.loop
        (let* _ : M.Val unit :=
          let β : M.Val i32.t := counter in
          let* α0 := M.read β in
          let* α1 := BinOp.Panic.add α0 ((Integer.of_Z 1) : i32.t) in
          assign β α1 in
        let* α0 : i32.t := M.read counter in
        let* α1 : M.Val bool.t :=
          M.alloc (BinOp.Pure.eq α0 ((Integer.of_Z 10) : i32.t)) in
        let* α2 : bool.t := M.read (use α1) in
        if α2 then
          let* _ : M.Val never.t := M.break in
          let* α0 : M.Val unit := M.alloc tt in
          let* α1 := M.read α0 in
          let* α2 : unit := never_to_any α1 in
          M.alloc α2
        else
          M.alloc tt) in
    M.copy α0 in
  let* _ : M.Val unit :=
    let* α0 : M.Val i32.t := M.alloc ((Integer.of_Z 20) : i32.t) in
    let* α1 : M.Val ((ref i32.t) * (ref i32.t)) :=
      M.alloc (borrow result, borrow α0) in
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
            let* α0 : ref i32.t := M.read left_val in
            let* α1 : i32.t := M.read (deref α0) in
            let* α2 : ref i32.t := M.read right_val in
            let* α3 : i32.t := M.read (deref α2) in
            let* α4 : M.Val bool.t :=
              M.alloc (UnOp.not (BinOp.Pure.eq α1 α3)) in
            let* α5 : bool.t := M.read (use α4) in
            if α5 then
              let* kind : M.Val core.panicking.AssertKind.t :=
                M.alloc core.panicking.AssertKind.Eq in
              let* _ : M.Val never.t :=
                let* α0 : core.panicking.AssertKind.t := M.read kind in
                let* α1 : ref i32.t := M.read left_val in
                let* α2 : ref i32.t := M.read right_val in
                let* α3 : never.t :=
                  M.call
                    (core.panicking.assert_failed
                      α0
                      α1
                      α2
                      core.option.Option.None) in
                M.alloc α3 in
              let* α0 : M.Val unit := M.alloc tt in
              let* α1 := M.read α0 in
              let* α2 : unit := never_to_any α1 in
              M.alloc α2
            else
              M.alloc tt
          end) :
          M (M.Val unit)
      ] in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
