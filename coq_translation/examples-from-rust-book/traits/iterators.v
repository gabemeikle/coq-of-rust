(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Fibonacci.
  Record t : Set := {
    curr : u32;
    next : u32;
  }.
End Fibonacci.
Definition Fibonacci : Set := Fibonacci.t.

Module Impl_Iterator_for_Fibonacci.
  Definition Self := Fibonacci.
  
  #[global] Instance I : Iterator.Class Self := {|
    Item := u32;
    next
      (self : mut_ref Fibonacci) :=
      let current := self.curr in
      assign self.curr := self.next ;;
      assign self.next := add current self.next ;;
      Some current;
  |}.
Module ImplFibonacci.

Definition fibonacci (_ : unit) :=
  {| Fibonacci.curr := 0; Fibonacci.next := 1; |}.

Definition main (_ : unit) :=
  let sequence := {| Range.start := 0; Range.end := 3; |} in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Four consecutive `next` calls on 0..3\n"]
      []) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["> ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug (next sequence)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["> ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug (next sequence)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["> ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug (next sequence)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["> ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug (next sequence)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Iterate through 0..3 using `for`\n"]
      []) ;;
  tt ;;
  match into_iter {| Range.start := 0; Range.end := 3; |} with
  | iter =>
    loop
      match next iter with
      | {|  |} => Break
      | {| Some.0 := i; |} =>
        _crate.io._print
          (_crate::fmt::ImplArguments.new_v1
            ["> ";"\n"]
            [_crate::fmt::ImplArgumentV1.new_display i]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["The first four terms of the Fibonacci sequence are: \n"]
      []) ;;
  tt ;;
  match into_iter (take (fibonacci tt) 4) with
  | iter =>
    loop
      match next iter with
      | {|  |} => Break
      | {| Some.0 := i; |} =>
        _crate.io._print
          (_crate::fmt::ImplArguments.new_v1
            ["> ";"\n"]
            [_crate::fmt::ImplArgumentV1.new_display i]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["The next four terms of the Fibonacci sequence are: \n"]
      []) ;;
  tt ;;
  match into_iter (take (skip (fibonacci tt) 4) 4) with
  | iter =>
    loop
      match next iter with
      | {|  |} => Break
      | {| Some.0 := i; |} =>
        _crate.io._print
          (_crate::fmt::ImplArguments.new_v1
            ["> ";"\n"]
            [_crate::fmt::ImplArgumentV1.new_display i]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end ;;
  let array := [1;3;3;7] in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Iterate the following array ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug array]) ;;
  tt ;;
  match into_iter (iter array) with
  | iter =>
    loop
      match next iter with
      | {|  |} => Break
      | {| Some.0 := i; |} =>
        _crate.io._print
          (_crate::fmt::ImplArguments.new_v1
            ["> ";"\n"]
            [_crate::fmt::ImplArgumentV1.new_display i]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end.
