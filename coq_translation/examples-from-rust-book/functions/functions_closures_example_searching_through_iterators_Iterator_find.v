(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let vec1 := ComplexTypePath.into_vec [ 1; 2; 3 ] in
  let vec2 := ComplexTypePath.into_vec [ 4; 5; 6 ] in
  let iter := method "iter" vec1 in
  let into_iter := method "into_iter" vec2 in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Find 2 in vec1: "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_debug
          (method "find" iter (fun x => eqb x 2))
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Find 2 in vec2: "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_debug
          (method "find" into_iter (fun x => eqb x 2))
      ]) ;;
  tt ;;
  let array1 := [ 1; 2; 3 ] in
  let array2 := [ 4; 5; 6 ] in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Find 2 in array1: "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_debug
          (method "find" (method "iter" array1) (fun x => eqb x 2))
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Find 2 in array2: "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_debug
          (method "find" (method "into_iter" array2) (fun x => eqb x 2))
      ]) ;;
  tt ;;
  tt.
