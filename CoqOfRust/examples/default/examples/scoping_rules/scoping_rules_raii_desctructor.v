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
  Definition drop (self : mut_ref ltac:(Self)) : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    M.function_body
      (let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "ToDrop is being dropped
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (array (ref str.t)) := deref α1 in
          let* α3 : ref (array (ref str.t)) := borrow α2 in
          let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
          let* α5 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α4 in
          let* α6 : ref (slice (ref str.t)) := M.read α5 in
          let* α7 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_const"] α6 in
          let* α8 : unit := std.io.stdio._print α7 in
          M.alloc α8 in
        M.alloc tt in
      let* α0 : M.Val unit := M.alloc tt in
      M.read α0).
  
  Global Instance AssociatedFunction_drop :
    Notations.DoubleColon ltac:(Self) "drop" := {
    Notations.double_colon := drop;
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
Definition main : M unit :=
  M.function_body
    (let* x : M.Val scoping_rules_raii_desctructor.ToDrop.t :=
      M.alloc scoping_rules_raii_desctructor.ToDrop.Build_t in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Made a ToDrop!
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_const"] α6 in
        let* α8 : unit := std.io.stdio._print α7 in
        M.alloc α8 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
