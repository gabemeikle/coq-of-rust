(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} (_ : unit) : M (H := H) unit :=
  let count := 0 in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "Let's count until infinity!
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  while
    (let* _ := count.["add_assign"] 1 in
    let* _ :=
      let* α0 := count.["eq"] 3 in
      if (α0 : bool) then
        let* _ :=
          let* _ :=
            let* α0 := format_arguments::["new_const"] (addr_of [ "three
" ]) in
            std.io.stdio._print α0 in
          Pure tt in
        let _ := Continue in
        Pure tt
      else
        Pure tt in
    let* _ :=
      let* _ :=
        let* α0 := format_argument::["new_display"] (addr_of count) in
        let* α1 :=
          format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt in
    let* α0 := count.["eq"] 5 in
    if (α0 : bool) then
      let* _ :=
        let* _ :=
          let* α0 :=
            format_arguments::["new_const"]
              (addr_of [ "OK, that's enough
" ]) in
          std.io.stdio._print α0 in
        Pure tt in
      let _ := Break in
      Pure tt
    else
      Pure tt).
