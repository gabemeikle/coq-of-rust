(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* number := M.alloc 4 in
  match number with
  | i =>
    let* _ :=
      let* α0 := borrow [ mk_str "Zero
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt
  | i =>
    let* _ :=
      let* α0 := borrow [ mk_str "Greater than zero
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt
  | _ =>
    let* α0 := borrow (mk_str "Should never happen.") (ref str) in
    let* α1 := deref α0 (ref str) in
    let* α2 := borrow α1 (ref str) in
    let* α3 := core.panicking.unreachable_display α2 in
    never_to_any α3
  end.
