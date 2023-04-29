(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let pangram := "the quick brown fox jumps over the lazy dog" in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Pangram: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] pangram ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"] [ "Words in reverse
" ] [  ]) ;;
  tt ;;
  match LangItem pangram.["split_whitespace"].["rev"] with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := word; |} =>
        _crate.io._print
          (_crate.fmt.Arguments::["new_v1"]
            [ "> "; "
" ]
            [ _crate.fmt.ArgumentV1::["new_display"] word ]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end ;;
  let chars := pangram.["chars"].["collect"] in
  chars.["sort"] ;;
  chars.["dedup"] ;;
  let string := String::["new"] tt in
  match LangItem chars with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := c; |} =>
        string.["push"] c ;;
        string.["push_str"] ", " ;;
        tt
      end ;;
      tt
      from
      for
  end ;;
  let chars_to_trim := [ " "%char; ","%char ] in
  let trimmed_str := string.["trim_matches"] chars_to_trim in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Used characters: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] trimmed_str ]) ;;
  tt ;;
  let alice := String::["from"] "I like dogs" in
  let bob := alice.["replace"] "dog" "cat" in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Alice says: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] alice ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Bob says: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] bob ]) ;;
  tt ;;
  tt.
