(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* _ :=
    let* _ :=
      let* α0 := 1.["add"] 2 in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "1 + 2 = "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := 1.["sub"] 2 in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "1 - 2 = "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := true.["andb"] false in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "true AND false is "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := true.["or"] false in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "true OR false is "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := true.["not"] in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "NOT true is "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := 3.["bitand"] 5 in
      let* α1 := format_argument::["new_binary"] (addr_of α0) in
      let* α2 := LanguageItem.format_count::["Is"] 4 in
      let* α3 :=
        LanguageItem.format_placeholder::["new"]
          0
          " "%char
          LanguageItem.format_alignment::["Unknown"]
          8
          LanguageItem.format_count::["Implied"]
          α2 in
      let* α4 := LanguageItem.format_unsafe_arg::["new"] in
      let* α5 :=
        format_arguments::["new_v1_formatted"]
          (addr_of [ "0011 AND 0101 is "; "
" ])
          (addr_of [ α1 ])
          (addr_of [ α3 ])
          α4 in
      std.io.stdio._print α5 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := 3.["bitor"] 5 in
      let* α1 := format_argument::["new_binary"] (addr_of α0) in
      let* α2 := LanguageItem.format_count::["Is"] 4 in
      let* α3 :=
        LanguageItem.format_placeholder::["new"]
          0
          " "%char
          LanguageItem.format_alignment::["Unknown"]
          8
          LanguageItem.format_count::["Implied"]
          α2 in
      let* α4 := LanguageItem.format_unsafe_arg::["new"] in
      let* α5 :=
        format_arguments::["new_v1_formatted"]
          (addr_of [ "0011 OR 0101 is "; "
" ])
          (addr_of [ α1 ])
          (addr_of [ α3 ])
          α4 in
      std.io.stdio._print α5 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := 3.["bitxor"] 5 in
      let* α1 := format_argument::["new_binary"] (addr_of α0) in
      let* α2 := LanguageItem.format_count::["Is"] 4 in
      let* α3 :=
        LanguageItem.format_placeholder::["new"]
          0
          " "%char
          LanguageItem.format_alignment::["Unknown"]
          8
          LanguageItem.format_count::["Implied"]
          α2 in
      let* α4 := LanguageItem.format_unsafe_arg::["new"] in
      let* α5 :=
        format_arguments::["new_v1_formatted"]
          (addr_of [ "0011 XOR 0101 is "; "
" ])
          (addr_of [ α1 ])
          (addr_of [ α3 ])
          α4 in
      std.io.stdio._print α5 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := 1.["shl"] 5 in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "1 << 5 is "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := 128.["shr"] 2 in
      let* α1 := format_argument::["new_lower_hex"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "0x80 >> 2 is 0x"; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_v1"]
          (addr_of [ "One million is written as 1000000
" ])
          (addr_of [ ]) in
      std.io.stdio._print α0 in
    Pure tt in
  Pure tt.
