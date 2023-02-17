(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

(* Approximation *)

Definition u8 : Set := Z.
Definition u16 : Set := Z.
Definition u32 : Set := Z.
Definition u64 : Set := Z.
Definition u128 : Set := Z.

Definition i8 : Set := Z.
Definition i16 : Set := Z.
Definition i32 : Set := Z.
Definition i64 : Set := Z.
Definition i128 : Set := Z.

Definition f32 : Set := Z.
Definition f64 : Set := Z.

Definition main (_ : unit) :=
  let pangram := "the quick brown fox jumps over the lazy dog" in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Pangram: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display pangram]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Words in reverse\n"] []) ;;
  tt ;;
  match into_iter (rev (split_whitespace pangram)) with
  | iter =>
    loop match next iter with
    | {|  |} => Break
    | {| Some.0 := word; |} =>
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["> ";"\n"]
          [_crate::fmt::ImplArgumentV1.new_display word]) ;;
      tt ;;
      tt
    end ;;
    tt from for
  end ;;
  let chars := collect (chars pangram) in
  sort chars ;;
  dedup chars ;;
  let string := ImplString.new tt in
  match into_iter chars with
  | iter =>
    loop match next iter with
    | {|  |} => Break
    | {| Some.0 := c; |} =>
      push string c ;;
      push_str string ", " ;;
      tt
    end ;;
    tt from for
  end ;;
  let chars_to_trim := [ ;,] in
  let trimmed_str := trim_matches string chars_to_trim in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Used characters: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display trimmed_str]) ;;
  tt ;;
  let alice := ImplString.from "I like dogs" in
  let bob := replace alice "dog" "cat" in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Alice says: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display alice]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Bob says: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display bob]) ;;
  tt ;;
  tt.