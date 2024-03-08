(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Book *)

Module Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book.
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "scoping_rules_borrowing_mutablity::Book")
      []
      [ ("clone", InstanceField.Method clone) ]
      [].
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book.

Module Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "scoping_rules_borrowing_mutablity::Book")
      []
      []
      [].
End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book.

Parameter borrow_book : (list Ty.t) -> (list Value.t) -> M.

Parameter new_edition : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
