(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    let mut a = 0;
    unsafe {
        asm!(
            "mov {0}, 10",
            "2:",
            "sub {0}, 1",
            "cmp {0}, 3",
            "jle 2f",
            "jmp 2b",
            "2:",
            "add {0}, 2",
            out(reg) a
        );
    }
    assert_eq!(a, 5);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* a := M.alloc (Value.Integer Integer.I32 0) in
    let* _ :=
      let _ := InlineAssembly in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 := M.alloc (Value.Integer Integer.I32 5) in
      let* α1 := M.alloc (Value.Tuple [ a; α0 ]) in
      match_operator
        α1
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
