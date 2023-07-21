(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_v1"] (addr_of [ "31 days
" ]) (addr_of [ ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_v1"]
          (addr_of [ "Alice, this is Bob. Bob, this is Alice
" ])
          (addr_of [ ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_v1"]
          (addr_of [ "the quick brown fox jumps over the lazy dog
" ])
          (addr_of [ ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_v1"]
          (addr_of [ "Base 10:               69420
" ])
          (addr_of [ ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_binary"] (addr_of 69420) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Base 2 (binary):       "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_octal"] (addr_of 69420) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Base 8 (octal):        "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_lower_hex"] (addr_of 69420) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Base 16 (hexadecimal): "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_upper_hex"] (addr_of 69420) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Base 16 (hexadecimal): "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of 1) in
      let* α1 := LanguageItem.format_count::["Is"] 5 in
      let* α2 :=
        LanguageItem.format_placeholder::["new"]
          0
          " "%char
          LanguageItem.format_alignment::["Right"]
          0
          LanguageItem.format_count::["Implied"]
          α1 in
      let* α3 := LanguageItem.format_unsafe_arg::["new"] in
      let* α4 :=
        format_arguments::["new_v1_formatted"]
          (addr_of [ ""; "
" ])
          (addr_of [ α0 ])
          (addr_of [ α2 ])
          α3 in
      std.io.stdio._print α4 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of 1) in
      let* α1 := LanguageItem.format_count::["Is"] 5 in
      let* α2 :=
        LanguageItem.format_placeholder::["new"]
          0
          "0"%char
          LanguageItem.format_alignment::["Left"]
          0
          LanguageItem.format_count::["Implied"]
          α1 in
      let* α3 := LanguageItem.format_unsafe_arg::["new"] in
      let* α4 :=
        format_arguments::["new_v1_formatted"]
          (addr_of [ ""; "
" ])
          (addr_of [ α0 ])
          (addr_of [ α2 ])
          α3 in
      std.io.stdio._print α4 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of 1) in
      let* α1 := format_argument::["from_usize"] (addr_of 5) in
      let* α2 := LanguageItem.format_count::["Param"] 1 in
      let* α3 :=
        LanguageItem.format_placeholder::["new"]
          0
          "0"%char
          LanguageItem.format_alignment::["Right"]
          0
          LanguageItem.format_count::["Implied"]
          α2 in
      let* α4 := LanguageItem.format_unsafe_arg::["new"] in
      let* α5 :=
        format_arguments::["new_v1_formatted"]
          (addr_of [ ""; "
" ])
          (addr_of [ α0; α1 ])
          (addr_of [ α3 ])
          α4 in
      std.io.stdio._print α5 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_v1"]
          (addr_of [ "My name is Bond, James Bond
" ])
          (addr_of [ ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let number := 1 (* 1.0 *) in
  let width := 5 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of number) in
      let* α1 := format_argument::["from_usize"] (addr_of width) in
      let* α2 := LanguageItem.format_count::["Param"] 1 in
      let* α3 :=
        LanguageItem.format_placeholder::["new"]
          0
          " "%char
          LanguageItem.format_alignment::["Right"]
          0
          LanguageItem.format_count::["Implied"]
          α2 in
      let* α4 := LanguageItem.format_unsafe_arg::["new"] in
      let* α5 :=
        format_arguments::["new_v1_formatted"]
          (addr_of [ ""; "
" ])
          (addr_of [ α0; α1 ])
          (addr_of [ α3 ])
          α4 in
      std.io.stdio._print α5 in
    Pure tt in
  Pure tt.

Module Structure.
  Unset Primitive Projections.
  Record t : Set := {
    _ : i32;
  }.
  Global Set Primitive Projections.

  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Structure.
Definition Structure := Structure.t.
