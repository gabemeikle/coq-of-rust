(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* _ :=
    let* val :=
      let* α0 := M.alloc 1 in
      let* α1 := M.alloc 2 in
      add α0 α1 in
    let* _ :=
      let* _ :=
        let* α0 := borrow [ mk_str "1 + 2 = "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow val usize in
        let* α5 := deref α4 usize in
        let* α6 := borrow α5 usize in
        let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
        let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
        let* α9 := deref α8 (list core.fmt.rt.Argument) in
        let* α10 := borrow α9 (list core.fmt.rt.Argument) in
        let* α11 := pointer_coercion "Unsize" α10 in
        let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
        std.io.stdio._print α12 in
      Pure tt in
    Pure tt in
  let* _ :=
    let* val :=
      let* α0 := M.alloc 3 in
      let* α1 := M.alloc 4 in
      add α0 α1 in
    let* _ :=
      let* _ :=
        let* α0 := borrow [ mk_str "3 + 4 = "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow val usize in
        let* α5 := deref α4 usize in
        let* α6 := borrow α5 usize in
        let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
        let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
        let* α9 := deref α8 (list core.fmt.rt.Argument) in
        let* α10 := borrow α9 (list core.fmt.rt.Argument) in
        let* α11 := pointer_coercion "Unsize" α10 in
        let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
        std.io.stdio._print α12 in
      Pure tt in
    Pure tt in
  let* val :=
    let* α0 := M.alloc 2 in
    let* α1 := M.alloc 3 in
    let* α2 := mul α0 α1 in
    let* α3 := M.alloc 1 in
    add α2 α3 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "(2 * 3) + 1 = "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow val usize in
      let* α5 := deref α4 usize in
      let* α6 := borrow α5 usize in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  Pure tt.
