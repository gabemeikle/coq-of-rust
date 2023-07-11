(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module ToDrop.
  Inductive t : Set := Build.
End ToDrop.
Definition ToDrop := ToDrop.t.

Module Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.
  Definition Self := scoping_rules_raii_desctructor.ToDrop.
  
  Parameter drop : mut_ref Self -> M unit.
  
  Global Instance Method_drop : Notation.Dot "drop" := {
    Notation.dot := drop;
  }.
  
  Global Instance I : core.ops.drop.Drop.Trait Self := {
    core.ops.drop.Drop.drop := drop;
  }.
End Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
