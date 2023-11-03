(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition LANGUAGE `{ℋ : State.Trait} : ref str :=
  M.run (M.pure (mk_str "Rust")).

Definition THRESHOLD `{ℋ : State.Trait} : i32 := M.run (M.alloc 10).

Definition is_big `{ℋ : State.Trait} (n : i32) : M bool :=
  BinOp.gt n constants.THRESHOLD.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* n := M.alloc 16 in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "This is "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := deref constants.LANGUAGE (ref str) in
      let* α5 := borrow α4 (ref str) in
      let* α6 := deref α5 (ref str) in
      let* α7 := borrow α6 (ref str) in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 := borrow [ α8 ] (list core.fmt.rt.Argument) in
      let* α10 := deref α9 (list core.fmt.rt.Argument) in
      let* α11 := borrow α10 (list core.fmt.rt.Argument) in
      let* α12 := pointer_coercion "Unsize" α11 in
      let* α13 := core.fmt.Arguments::["new_v1"] α3 α12 in
      std.io.stdio._print α13 in
    M.alloc tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "The threshold is "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow constants.THRESHOLD i32 in
      let* α5 := deref α4 i32 in
      let* α6 := borrow α5 i32 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    M.alloc tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str ""; mk_str " is "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow n i32 in
      let* α5 := deref α4 i32 in
      let* α6 := borrow α5 i32 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := constants.is_big n in
      let* α9 := use α8 in
      let* α10 :=
        if (α9 : bool) then
          M.pure (mk_str "big")
        else
          let* α0 := deref (mk_str "small") str in
          borrow α0 str in
      let* α11 := borrow α10 (ref str) in
      let* α12 := deref α11 (ref str) in
      let* α13 := borrow α12 (ref str) in
      let* α14 := core.fmt.rt.Argument::["new_display"] α13 in
      let* α15 := borrow [ α7; α14 ] (list core.fmt.rt.Argument) in
      let* α16 := deref α15 (list core.fmt.rt.Argument) in
      let* α17 := borrow α16 (list core.fmt.rt.Argument) in
      let* α18 := pointer_coercion "Unsize" α17 in
      let* α19 := core.fmt.Arguments::["new_v1"] α3 α18 in
      std.io.stdio._print α19 in
    M.alloc tt in
  M.alloc tt.
