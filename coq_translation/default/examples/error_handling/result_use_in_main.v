(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (core.result.Result unit core.num.error.ParseIntError) :=
  let number_str := mk_str "10" in
  let* number :=
    let* α0 := deref number_str str in
    let* α1 := borrow α0 str in
    let* α2 := str::["parse"] α1 in
    match α2 with
    | core.result.Result number => Pure number
    | core.result.Result e =>
      let* α0 := Return (core.result.Result.Err e) in
      never_to_any α0
    end in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str ""; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow number i32 in
      let* α5 := deref α4 i32 in
      let* α6 := borrow α5 i32 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  Pure (core.result.Result.Ok tt).
