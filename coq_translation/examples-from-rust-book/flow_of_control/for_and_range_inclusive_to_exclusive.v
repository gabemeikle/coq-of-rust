(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition main (_ : unit) :=
  match into_iter {| Range.start := 1; Range.end := 101; |} with
  | iter =>
    loop
      match next iter with
      | {|  |} => Break
      | {| Some.0 := n; |} =>
        if eq (rem n 15) 0 then
          _crate.io._print
            (_crate::fmt::ImplArguments.new_v1 ["fizzbuzz\n"] []) ;;
          tt ;;
          tt
        else
          if eq (rem n 3) 0 then
            _crate.io._print
              (_crate::fmt::ImplArguments.new_v1 ["fizz\n"] []) ;;
            tt ;;
            tt
          else
            if eq (rem n 5) 0 then
              _crate.io._print
                (_crate::fmt::ImplArguments.new_v1 ["buzz\n"] []) ;;
              tt ;;
              tt
            else
              _crate.io._print
                (_crate::fmt::ImplArguments.new_v1
                  ["";"\n"]
                  [_crate::fmt::ImplArgumentV1.new_display n]) ;;
              tt ;;
              tt
      end ;;
      tt
      from
      for
  end.
