(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter function : (list Ty.t) -> (list Value.t) -> M.

Module cool.
  Parameter function : (list Ty.t) -> (list Value.t) -> M.
End cool.

Module my.
  Parameter function : (list Ty.t) -> (list Value.t) -> M.
  
  Module cool.
    Parameter function : (list Ty.t) -> (list Value.t) -> M.
  End cool.
  
  Parameter indirect_call : (list Ty.t) -> (list Value.t) -> M.
End my.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
