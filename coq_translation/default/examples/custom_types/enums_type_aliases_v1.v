(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module VeryVerboseEnumOfThingsToDoWithNumbers.
  Inductive t : Set :=
  | Add
  | Subtract.
End VeryVerboseEnumOfThingsToDoWithNumbers.

Ltac Operations :=
  exact enums_type_aliases_v1.VeryVerboseEnumOfThingsToDoWithNumbers.t.

(*
fn main() {
    // We can refer to each variant via its alias, not its long and inconvenient
    // name.
    let x = Operations::Add;
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* x :
        ltac:(refine
          (M.Val
            enums_type_aliases_v1.VeryVerboseEnumOfThingsToDoWithNumbers.t)) :=
      M.alloc
        enums_type_aliases_v1.VeryVerboseEnumOfThingsToDoWithNumbers.Add in
    M.alloc tt).
