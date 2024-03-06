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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* counter := M.alloc ((Integer.of_Z 0) : Ty.path "i32") in
    let* result :=
      let* α0 :=
        M.loop
          (let* _ :=
            let β := counter in
            let* α0 := M.read β in
            let* α1 :=
              (M.var "BinOp::Panic::add")
                α0
                ((Integer.of_Z 1) : Ty.path "i32") in
            (M.var "assign") β α1 in
          let* α0 := M.read counter in
          let* α1 :=
            M.alloc
              ((M.var "BinOp::Pure::eq")
                α0
                ((Integer.of_Z 10) : Ty.path "i32")) in
          let* α2 := M.read (use α1) in
          if α2 then
            let* α0 := M.break in
            let* α1 := M.read α0 in
            let* α2 := never_to_any α1 in
            M.alloc α2
          else
            M.alloc tt) in
      M.copy α0 in
    let* _ :=
      let* α0 := M.alloc ((Integer.of_Z 20) : Ty.path "i32") in
      let* α1 := M.alloc (borrow result, borrow α0) in
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
              let* α0 := M.read left_val in
              let* α1 := M.read (deref α0) in
              let* α2 := M.read right_val in
              let* α3 := M.read (deref α2) in
              let* α4 :=
                M.alloc
                  ((M.var "UnOp::not") ((M.var "BinOp::Pure::eq") α1 α3)) in
              let* α5 := M.read (use α4) in
              if α5 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.read kind in
                let* α1 := M.read left_val in
                let* α2 := M.read right_val in
                let* α3 :=
                  M.call
                    ((M.var "core::panicking::assert_failed")
                      α0
                      α1
                      α2
                      core.option.Option.None) in
                let* α0 := M.alloc α3 in
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
