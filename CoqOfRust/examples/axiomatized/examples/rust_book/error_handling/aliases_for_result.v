(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom AliasedResult :
    fun T =>
      Ty.apply
        (Ty.path "core::result::Result")
        [T; Ty.apply (Ty.path "core::num::error::ParseIntError") []].

Parameter multiply :
    (Ty.apply (Ty.path "ref") [Ty.path "str"]) ->
      (Ty.apply (Ty.path "ref") [Ty.path "str"]) ->
      Ty.apply
        (Ty.path "core::result::Result")
        [Ty.path "i32";
          Ty.apply (Ty.path "core::num::error::ParseIntError") []].

Parameter print :
    (Ty.apply
        (Ty.path "core::result::Result")
        [Ty.path "i32";
          Ty.apply (Ty.path "core::num::error::ParseIntError") []])
      ->
      Ty.path "unit".

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : Ty.path "unit".
