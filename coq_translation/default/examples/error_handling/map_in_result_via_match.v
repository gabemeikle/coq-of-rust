(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition multiply
    (first_number_str : ref str)
    (second_number_str : ref str)
    : M (core.result.Result i32 core.num.error.ParseIntError) :=
  let* α0 := deref first_number_str str in
  let* α1 := borrow α0 str in
  let* α2 := str::["parse"] α1 in
  match α2 with
  | core.result.Result first_number =>
    let* α0 := deref second_number_str str in
    let* α1 := borrow α0 str in
    let* α2 := str::["parse"] α1 in
    match α2 with
    | core.result.Result second_number =>
      let* α0 := mul first_number second_number in
      Pure (core.result.Result.Ok α0)
    | core.result.Result e => Pure (core.result.Result.Err e)
    end
  | core.result.Result e => Pure (core.result.Result.Err e)
  end.

Definition print
    (result : core.result.Result i32 core.num.error.ParseIntError)
    : M unit :=
  match result with
  | core.result.Result n =>
    let* _ :=
      let* α0 := borrow [ mk_str "n is "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow n i32 in
      let* α5 := deref α4 i32 in
      let* α6 := borrow α5 i32 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt
  | core.result.Result e =>
    let* _ :=
      let* α0 := borrow [ mk_str "Error: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow e core.num.error.ParseIntError in
      let* α5 := deref α4 core.num.error.ParseIntError in
      let* α6 := borrow α5 core.num.error.ParseIntError in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* twenty :=
    let* α0 := deref (mk_str "10") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "2") str in
    let* α3 := borrow α2 str in
    map_in_result_via_match.multiply α1 α3 in
  let* _ := map_in_result_via_match.print twenty in
  let* tt :=
    let* α0 := deref (mk_str "t") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "2") str in
    let* α3 := borrow α2 str in
    map_in_result_via_match.multiply α1 α3 in
  let* _ := map_in_result_via_match.print tt in
  Pure tt.
