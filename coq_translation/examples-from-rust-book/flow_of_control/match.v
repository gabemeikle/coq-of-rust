(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition main (_ : unit) :=
  let number := 13 in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Tell me about ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display number]) ;;
  tt ;;
  match number with
  | Int(1, Unsuffixed) =>
    _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["One!\n"] []) ;;
    tt
  |
      (Int(2, Unsuffixed)|Int(3, Unsuffixed)|Int(5, Unsuffixed)|Int(7, Unsuffixed)|Int(11, Unsuffixed))
      =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1 ["This is a prime\n"] []) ;;
    tt
  | _ =>
    _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["A teen\n"] []) ;;
    tt
  | _ =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1 ["Ain't special\n"] []) ;;
    tt
  end ;;
  let boolean := true in
  let binary :=
    match boolean with
    | Bool(false) => 0
    | Bool(true) => 1
    end in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";" -> ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display
        boolean;_crate::fmt::ImplArgumentV1.new_display binary]) ;;
  tt ;;
  tt.
