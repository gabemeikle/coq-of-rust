(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition double_first
    `{ℋ : State.Trait}
    (vec : alloc.vec.Vec (ref str) alloc.vec.Vec.Default.A)
    : M i32 :=
  let* first :=
    let* α0 := borrow vec (alloc.vec.Vec (ref str) alloc.alloc.Global) in
    let* α1 :=
      (core.ops.deref.Deref.deref
          (Self := (alloc.vec.Vec (ref str) alloc.alloc.Global)))
        α0 in
    let* α2 := deref α1 (Slice (ref str)) in
    let* α3 := borrow α2 (Slice (ref str)) in
    let* α4 := (Slice T)::["first"] α3 in
    (core.option.Option T)::["unwrap"] α4 in
  let* α0 := M.alloc 2 in
  let* α1 := deref first (ref str) in
  let* α2 := deref α1 str in
  let* α3 := borrow α2 str in
  let* α4 := str::["parse"] α3 in
  let* α5 := (core.result.Result T E)::["unwrap"] α4 in
  BinOp.mul α0 α5.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* numbers :=
    let* α0 := deref (mk_str "93") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "18") str in
    let* α3 := borrow α2 str in
    let* α4 :=
      (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"]
        [ mk_str "42"; α1; α3 ] in
    let* α5 := pointer_coercion "Unsize" α4 in
    (Slice T)::["into_vec"] α5 in
  let* empty := (alloc.vec.Vec T alloc.alloc.Global)::["new"] in
  let* strings :=
    let* α0 := deref (mk_str "93") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "18") str in
    let* α3 := borrow α2 str in
    let* α4 :=
      (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"]
        [ mk_str "tofu"; α1; α3 ] in
    let* α5 := pointer_coercion "Unsize" α4 in
    (Slice T)::["into_vec"] α5 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "The first doubled is "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := multiple_error_types.double_first numbers in
      let* α5 := borrow α4 i32 in
      let* α6 := deref α5 i32 in
      let* α7 := borrow α6 i32 in
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
        borrow
          [ mk_str "The first doubled is "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := multiple_error_types.double_first empty in
      let* α5 := borrow α4 i32 in
      let* α6 := deref α5 i32 in
      let* α7 := borrow α6 i32 in
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
        borrow
          [ mk_str "The first doubled is "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := multiple_error_types.double_first strings in
      let* α5 := borrow α4 i32 in
      let* α6 := deref α5 i32 in
      let* α7 := borrow α6 i32 in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 := borrow [ α8 ] (list core.fmt.rt.Argument) in
      let* α10 := deref α9 (list core.fmt.rt.Argument) in
      let* α11 := borrow α10 (list core.fmt.rt.Argument) in
      let* α12 := pointer_coercion "Unsize" α11 in
      let* α13 := core.fmt.Arguments::["new_v1"] α3 α12 in
      std.io.stdio._print α13 in
    M.alloc tt in
  M.alloc tt.
