(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* immutable_box := alloc.boxed.Box::["new"] 5 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of immutable_box) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "immutable_box contains "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let mutable_box := immutable_box in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of mutable_box) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "mutable_box contains "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* α0 := mutable_box.["deref"] in
    assign α0 4 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of mutable_box) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "mutable_box now contains "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
