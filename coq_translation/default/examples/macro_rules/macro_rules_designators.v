(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition foo `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "You called "; mk_str "()
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref (ref str))) := borrow (mk_str "foo") in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α3 in
        let* α5 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α5 in
        let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    M.alloc tt).

Definition bar `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "You called "; mk_str "()
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref (ref str))) := borrow (mk_str "bar") in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α3 in
        let* α5 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α5 in
        let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    M.alloc tt).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) := macro_rules_designators.foo in
    let* _ : ltac:(refine unit) := macro_rules_designators.bar in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str ""; mk_str " = "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref (ref str))) := borrow (mk_str "1u32 + 1") in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α3 in
        let* α5 : ltac:(refine u32) := M.alloc 1 in
        let* α6 : ltac:(refine u32) := M.alloc 1 in
        let* α7 : ltac:(refine u32) := BinOp.add α5 α6 in
        let* α8 : ltac:(refine (ref u32)) := borrow α7 in
        let* α9 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α8 in
        let* α10 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4; α9 ] in
        let* α11 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α10 in
        let* α12 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α11 in
        let* α13 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α12 in
        std.io.stdio._print α13 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str ""; mk_str " = "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref (ref str))) :=
          borrow (mk_str "{ let x = 1u32; x * x + 2 * x - 1 }") in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α3 in
        let* x : ltac:(refine u32) := M.alloc 1 in
        let* α0 : ltac:(refine u32) := BinOp.mul x x in
        let* α1 : ltac:(refine u32) := M.alloc 2 in
        let* α2 : ltac:(refine u32) := BinOp.mul α1 x in
        let* α3 : ltac:(refine u32) := BinOp.add α0 α2 in
        let* α4 : ltac:(refine u32) := M.alloc 1 in
        let* α5 : ltac:(refine u32) := BinOp.sub α3 α4 in
        let* α6 : ltac:(refine (ref u32)) := borrow α5 in
        let* α7 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α6 in
        let* α8 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4; α7 ] in
        let* α9 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α8 in
        let* α10 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α9 in
        let* α11 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α10 in
        std.io.stdio._print α11 in
      M.alloc tt in
    M.alloc tt).
