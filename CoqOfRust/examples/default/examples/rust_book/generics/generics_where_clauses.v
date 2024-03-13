(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
Module PrintInOption.
  
End PrintInOption.

Module Impl_generics_where_clauses_PrintInOption_for_T.
  Definition Self (T : Ty.t) : Ty.t := T.
  
  (*
      fn print_in_option(self) {
          println!("{:?}", Some(self));
      }
  *)
  Definition print_in_option
      (T : Ty.t)
      (𝜏 : list Ty.t)
      (α : list Value.t)
      : M :=
    let Self : Ty.t := Self T in
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_debug" in
          let* α6 := M.read self in
          let* α7 :=
            M.alloc (Value.StructTuple "core::option::Option::Some" [ α6 ]) in
          let* α8 := M.call_closure α5 [ α7 ] in
          let* α9 := M.alloc (Value.Array [ α8 ]) in
          let* α10 :=
            M.call_closure
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α9
              ] in
          let* α11 := M.call_closure α0 [ α10 ] in
          M.alloc α11 in
        M.alloc (Value.Tuple []) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "generics_where_clauses::PrintInOption"
      (* Self *) T
      (* Trait polymorphic types *) []
      (* Instance *)
        [ ("print_in_option", InstanceField.Method (print_in_option T)) ].
End Impl_generics_where_clauses_PrintInOption_for_T.

(*
fn main() {
    let vec = vec![1, 2, 3];

    vec.print_in_option();
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* vec :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec" in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply (Ty.path "array") [ Ty.path "i32" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new" in
      let* α2 :=
        M.alloc
          (Value.Array
            [
              Value.Integer Integer.I32 1;
              Value.Integer Integer.I32 2;
              Value.Integer Integer.I32 3
            ]) in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.read α3 in
      let* α5 := M.call_closure α0 [ M.pointer_coercion (* Unsize *) α4 ] in
      M.alloc α5 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "generics_where_clauses::PrintInOption"
          "print_in_option"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α1 := M.read vec in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
