(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition division (dividend : i32) (divisor : i32) : M i32 :=
  let* α0 := M.alloc 0 in
  let* α1 := eq divisor α0 in
  let* α2 := use α1 in
  if (α2 : bool) then
    let* _ :=
      let* α0 := std.panicking.begin_panic (mk_str "division by zero") in
      never_to_any α0 in
    never_to_any tt
  else
    div dividend divisor.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _x :=
    let* α0 := M.alloc 0 in
    (alloc.boxed.Box _ alloc.alloc.Global)::["new"] α0 in
  let* _ :=
    let* α0 := M.alloc 3 in
    let* α1 := M.alloc 0 in
    panic.division α0 α1 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "This point won't be reached!
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt in
  Pure tt.
