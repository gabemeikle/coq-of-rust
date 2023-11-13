(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  ToDrop.
Section ToDrop.
  Inductive t : Set := Build.
End ToDrop.
End ToDrop.

Module  Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop_t.
Section Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop_t.
  Ltac Self := exact scoping_rules_raii_desctructor.ToDrop.t.
  
  (*
      fn drop(&mut self) {
          println!("ToDrop is being dropped");
      }
  *)
  Definition drop (self : M.Val (mut_ref ltac:(Self))) : M (M.Val unit) :=
    M.function_body
      (let* _ : ltac:(refine (M.Val unit)) :=
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
            M.alloc [ mk_str "ToDrop is being dropped
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt in
      M.alloc tt).
  
  Global Instance AssociatedFunction_drop :
    Notation.DoubleColon ltac:(Self) "drop" := {
    Notation.double_colon := drop;
  }.
  
  Global Instance ℐ : core.ops.drop.Drop.Trait ltac:(Self) := {
    core.ops.drop.Drop.drop := drop;
  }.
End Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop_t.
End Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop_t.

(*
fn main() {
    let x = ToDrop;
    println!("Made a ToDrop!");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* x : ltac:(refine (M.Val scoping_rules_raii_desctructor.ToDrop.t)) :=
      M.alloc scoping_rules_raii_desctructor.ToDrop.Build_t in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Made a ToDrop!
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_const"] α2 in
        std.io.stdio._print α3 in
      M.alloc tt in
    M.alloc tt).
