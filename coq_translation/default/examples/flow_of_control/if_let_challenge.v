(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Inductive t `{ℋ : State.Trait} : Set :=
  | Bar.
End Foo.
Definition Foo `{ℋ : State.Trait} : Set := Foo.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* a := M.alloc (if_let_challenge.Foo.Bar tt) in
  let* α0 := let_if if_let_challenge.Foo  := a in
  if (α0 : bool) then
    let* _ :=
      let* _ :=
        let* α0 := borrow [ mk_str "a is foobar
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := core.fmt.Arguments::["new_const"] α3 in
        std.io.stdio._print α4 in
      M.alloc tt in
    M.alloc tt
  else
    M.alloc tt.
