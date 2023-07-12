(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} (_ : unit) : M (H := H) unit :=
  let pangram := "the quick brown fox jumps over the lazy dog" in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of pangram) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Pangram: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "Words in reverse
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* _ :=
    let* α0 := pangram.["split_whitespace"] in
    let* α1 := α0.["rev"] in
    let* α2 := LangItem α1 in
    match α2 with
    | iter =>
      while
        (let* _ :=
          let* α0 := LangItem (addr_of iter) in
          match α0 with
          | None => Break
          | Some {| Some.0 := word; |} =>
            let* _ :=
              let* _ :=
                let* α0 := format_argument::["new_display"] (addr_of word) in
                let* α1 :=
                  format_arguments::["new_v1"]
                    (addr_of [ "> "; "
" ])
                    (addr_of [ α0 ]) in
                std.io.stdio._print α1 in
              Pure tt in
            Pure tt
          end in
        Pure tt)
    end in
  let* chars :=
    let* α0 := pangram.["chars"] in
    α0.["collect"] in
  let* _ := chars.["sort"] in
  let* _ := chars.["dedup"] in
  let* string := alloc.string.String::["new"] tt in
  let* _ :=
    let* α0 := LangItem chars in
    match α0 with
    | iter =>
      while
        (let* _ :=
          let* α0 := LangItem (addr_of iter) in
          match α0 with
          | None => Break
          | Some {| Some.0 := c; |} =>
            let* _ := string.["push"] c in
            let* _ := string.["push_str"] ", " in
            Pure tt
          end in
        Pure tt)
    end in
  let chars_to_trim := addr_of [ " "%char; ","%char ] in
  let* trimmed_str := string.["trim_matches"] chars_to_trim in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of trimmed_str) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Used characters: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* alice := alloc.string.String::["from"] "I like dogs" in
  let* bob := alice.["replace"] "dog" "cat" in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of alice) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Alice says: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of bob) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Bob says: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
