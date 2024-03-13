(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "ToDrop";
    ty_params := [];
  } *)

Module Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.
  Definition Self : Ty.t := Ty.path "scoping_rules_raii_desctructor::ToDrop".
  
  (*
      fn drop(&mut self) {
          println!("ToDrop is being dropped");
      }
  *)
  Definition drop (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_const" in
          let* α2 := M.read (mk_str "ToDrop is being dropped
") in
          let* α3 := M.alloc (Value.Array [ α2 ]) in
          let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
          let* α5 := M.call_closure α0 [ α4 ] in
          M.alloc α5 in
        M.alloc (Value.Tuple []) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::drop::Drop"
      (* Self *) (Ty.path "scoping_rules_raii_desctructor::ToDrop")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("drop", InstanceField.Method drop) ].
End Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.

(*
fn main() {
    let x = ToDrop;
    println!("Made a ToDrop!");
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x :=
      M.alloc (Value.StructTuple "scoping_rules_raii_desctructor::ToDrop" []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const" in
        let* α2 := M.read (mk_str "Made a ToDrop!
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call_closure α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
