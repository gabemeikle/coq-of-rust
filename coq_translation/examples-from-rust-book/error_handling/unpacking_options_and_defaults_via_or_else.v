(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Error Enum.

(* Impl [Fruit] of trait [_crate.fmt.Debug]*)
Module ImplFruit.
  Definition
    fmt
    (self : ref Self)
    (f : ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    match self with
    | Fruit.Apple => _crate::fmt::ImplFormatter.write_str f "Apple"
    | Fruit.Orange => _crate::fmt::ImplFormatter.write_str f "Orange"
    | Fruit.Banana => _crate::fmt::ImplFormatter.write_str f "Banana"
    | Fruit.Kiwi => _crate::fmt::ImplFormatter.write_str f "Kiwi"
    | Fruit.Lemon => _crate::fmt::ImplFormatter.write_str f "Lemon"
    end.
End ImplFruit.
(* End impl [Fruit] *)

Definition main (_ : unit) :=
  let apple := Some Fruit.Apple in
  let no_fruit := None in
  let get_kiwi_as_fallback := fun  => _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Providing kiwi as fallback\n"] []) ;;
  tt ;;
  Some Fruit.Kiwi in
  let get_lemon_as_fallback := fun  => _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["Providing lemon as fallback\n"] []) ;;
  tt ;;
  Some Fruit.Lemon in
  let first_available_fruit := or_else
    (or_else no_fruit get_kiwi_as_fallback)
    get_lemon_as_fallback in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["first_available_fruit: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug first_available_fruit]) ;;
  tt ;;
  tt.