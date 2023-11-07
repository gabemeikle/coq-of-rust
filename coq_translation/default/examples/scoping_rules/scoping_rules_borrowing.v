(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition eat_box_i32
    `{ℋ : State.Trait}
    (boxed_i32 : alloc.boxed.Box i32 alloc.boxed.Box.Default.A)
    : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "Destroying box that contains "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 :
            ltac:(refine (ref (alloc.boxed.Box i32 alloc.alloc.Global))) :=
          borrow boxed_i32 in
        let* α6 : ltac:(refine (alloc.boxed.Box i32 alloc.alloc.Global)) :=
          deref α5 in
        let* α7 :
            ltac:(refine (ref (alloc.boxed.Box i32 alloc.alloc.Global))) :=
          borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    M.alloc tt).

Definition borrow_i32 `{ℋ : State.Trait} (borrowed_i32 : ref i32) : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "This int is: "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (ref i32))) := borrow borrowed_i32 in
        let* α6 : ltac:(refine (ref i32)) := deref α5 in
        let* α7 : ltac:(refine (ref (ref i32))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    M.alloc tt).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* boxed_i32 : ltac:(refine (alloc.boxed.Box i32 alloc.alloc.Global)) :=
      let* α0 : ltac:(refine i32) := M.alloc 5 in
      (alloc.boxed.Box i32 alloc.alloc.Global)::["new"] α0 in
    let* stacked_i32 : ltac:(refine i32) := M.alloc 6 in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref (alloc.boxed.Box i32 alloc.alloc.Global))) :=
        borrow boxed_i32 in
      let* α1 : ltac:(refine (alloc.boxed.Box i32 alloc.alloc.Global)) :=
        deref α0 in
      let* α2 : ltac:(refine i32) := deref α1 in
      let* α3 : ltac:(refine (ref i32)) := borrow α2 in
      scoping_rules_borrowing.borrow_i32 α3 in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref i32)) := borrow stacked_i32 in
      let* α1 : ltac:(refine i32) := deref α0 in
      let* α2 : ltac:(refine (ref i32)) := borrow α1 in
      scoping_rules_borrowing.borrow_i32 α2 in
    let* _ : ltac:(refine unit) :=
      let* _ref_to_i32 : ltac:(refine (ref i32)) :=
        let* α0 :
            ltac:(refine (ref (alloc.boxed.Box i32 alloc.alloc.Global))) :=
          borrow boxed_i32 in
        let* α1 : ltac:(refine (alloc.boxed.Box i32 alloc.alloc.Global)) :=
          deref α0 in
        let* α2 : ltac:(refine i32) := deref α1 in
        borrow α2 in
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine i32) := deref _ref_to_i32 in
        let* α1 : ltac:(refine (ref i32)) := borrow α0 in
        scoping_rules_borrowing.borrow_i32 α1 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      scoping_rules_borrowing.eat_box_i32 boxed_i32 in
    M.alloc tt).
