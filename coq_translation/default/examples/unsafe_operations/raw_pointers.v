(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* raw_p : ltac:(refine (ref u32)) :=
      let* α0 : ltac:(refine u32) := M.alloc 10 in
      addr_of α0 in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine u32) := deref raw_p in
      let* α1 : ltac:(refine u32) := M.alloc 10 in
      let* α2 : ltac:(refine bool) := BinOp.eq α0 α1 in
      let* α3 : ltac:(refine bool) := UnOp.not α2 in
      let* α4 : ltac:(refine bool) := use α3 in
      if (α4 : bool) then
        let* α0 : ltac:(refine never) :=
          core.panicking.panic (mk_str "assertion failed: *raw_p == 10") in
        never_to_any α0
      else
        M.alloc tt in
    M.alloc tt).
