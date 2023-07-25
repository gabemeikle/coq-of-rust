(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let bytestring :=
    [116, 104, 105, 115, 32, 105, 115, 32, 97, 32, 98, 121, 116, 101, 32, 115, 116, 114, 105, 110, 103] in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of bytestring) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "A byte string: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let escaped := [82, 117, 115, 116, 32, 97, 115, 32, 98, 121, 116, 101, 115] in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of escaped) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Some escaped bytes: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let raw_bytestring :=
    [92, 117, 123, 50, 49, 49, 68, 125, 32, 105, 115, 32, 110, 111, 116, 32, 101, 115, 99, 97, 112, 101, 100, 32, 104, 101, 114, 101] in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of raw_bytestring) in
      let* α1 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* α0 := core.str.converts.from_utf8 raw_bytestring in
    match α0 with
    | core.result.Result.Ok my_str =>
      let* _ :=
        let* _ :=
          let* α0 := format_argument::["new_display"] (addr_of my_str) in
          let* α1 :=
            format_arguments::["new_v1"]
              (addr_of [ "And the same as text: '"; "'
" ])
              (addr_of [ α0 ]) in
          std.io.stdio._print α1 in
        Pure tt in
      Pure tt
    end in
  let _quotes :=
    [89, 111, 117, 32, 99, 97, 110, 32, 97, 108, 115, 111, 32, 117, 115, 101, 32, 34, 102, 97, 110, 99, 105, 101, 114, 34, 32, 102, 111, 114, 109, 97, 116, 116, 105, 110, 103, 44, 32, 92, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 108, 105, 107, 101, 32, 119, 105, 116, 104, 32, 110, 111, 114, 109, 97, 108, 32, 114, 97, 119, 32, 115, 116, 114, 105, 110, 103, 115] in
  let shift_jis := [130, 230, 130, 168, 130, 177, 130, 187] in
  let* _ :=
    let* α0 := core.str.converts.from_utf8 shift_jis in
    match α0 with
    | core.result.Result.Ok my_str =>
      let* _ :=
        let* α0 := format_argument::["new_display"] (addr_of my_str) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "Conversion successful: '"; "'
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt
    | core.result.Result.Err e =>
      let* _ :=
        let* α0 := format_argument::["new_debug"] (addr_of e) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "Conversion failed: "; "
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt
    end in
  Pure tt.
