(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let* child :=
    let* α0 := std.process.Command::["new"] "sleep" in
    let* α1 := α0.["arg"] "5" in
    let* α2 := α1.["spawn"] in
    α2.["unwrap"] in
  let* _result :=
    let* α0 := child.["wait"] in
    α0.["unwrap"] in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "reached end of main
" ]) in
      _crate.io._print α0 in
    Pure tt in
  Pure tt.
