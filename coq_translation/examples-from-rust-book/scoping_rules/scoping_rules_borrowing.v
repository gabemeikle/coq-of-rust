(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition eat_box_i32 (boxed_i32 : Box i32) : unit :=
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "Destroying box that contains "; "
" ]
      [ format_argument::["new_display"] boxed_i32 ]) ;;
  tt ;;
  tt.

Definition borrow_i32 (borrowed_i32 : ref i32) : unit :=
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "This int is: "; "
" ]
      [ format_argument::["new_display"] borrowed_i32 ]) ;;
  tt ;;
  tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : unit :=
  let boxed_i32 := Box::["new"] 5 in
  let stacked_i32 := 6 in
  borrow_i32 boxed_i32 ;;
  borrow_i32 stacked_i32 ;;
  let _ref_to_i32 := boxed_i32 in
  borrow_i32 _ref_to_i32 ;;
  tt ;;
  eat_box_i32 boxed_i32 ;;
  tt.
