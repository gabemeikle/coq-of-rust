(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module ToDrop.
  Section ToDrop.
    Context `{State.Trait}.
    
    Inductive t : Set := Build.
  End ToDrop.
End ToDrop.
Definition ToDrop := @ToDrop.t.

Module Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.
  Section Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.
    Context `{State.Trait}.
    
    Definition Self : Set := scoping_rules_raii_desctructor.ToDrop.
    
    Definition drop (self : mut_ref Self) : M unit :=
      let* _ :=
        let* _ :=
          let* α0 :=
            borrow [ mk_str "ToDrop is being dropped
" ] (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := core.fmt.Arguments::["new_const"] α3 in
          std.io.stdio._print α4 in
        Pure tt in
      Pure tt.
    
    Global Instance AssociatedFunction_drop :
      Notation.DoubleColon Self "drop" := {
      Notation.double_colon := drop;
    }.
    
    Global Instance I : core.ops.drop.Drop.Trait Self := {
      core.ops.drop.Drop.drop := drop;
    }.
  End Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.
  Global Hint Resolve I : core.
End Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let x := scoping_rules_raii_desctructor.ToDrop.Build_t tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "Made a ToDrop!
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt in
  Pure tt.
