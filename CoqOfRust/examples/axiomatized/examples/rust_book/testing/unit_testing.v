(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter add : (list Ty.t) -> (list Value.t) -> M.

Parameter bad_add : (list Ty.t) -> (list Value.t) -> M.

Module tests.
  Parameter test_add : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter test_bad_add : (list Ty.t) -> (list Value.t) -> M.
End tests.
