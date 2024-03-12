(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "Borrowed";
    ty_params := [];
    fields := [ ("x", Ty.apply (Ty.path "&") [ Ty.path "i32" ]) ];
  } *)

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed.
  Definition Self : Ty.t := Ty.path "scoping_rules_lifetimes_traits::Borrowed".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_struct_field1_finish" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Borrowed") in
      let* α3 := M.read (mk_str "x") in
      let* α4 := M.read self in
      let* α5 := M.alloc (M.get_struct_record α4 "x") in
      M.call α0 [ α1; α2; α3; M.pointer_coercion (* Unsize *) α5 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "scoping_rules_lifetimes_traits::Borrowed")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed.

Module Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed.
  Definition Self : Ty.t := Ty.path "scoping_rules_lifetimes_traits::Borrowed".
  
  (*
      fn default() -> Self {
          Self { x: &10 }
      }
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 := M.alloc (Value.Integer Integer.I32 10) in
      M.pure
        (Value.StructRecord
          "scoping_rules_lifetimes_traits::Borrowed"
          [ ("x", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "scoping_rules_lifetimes_traits::Borrowed")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed.

(*
fn main() {
    let b: Borrowed = Default::default();
    println!("b is {:?}", b);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* b :=
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "scoping_rules_lifetimes_traits::Borrowed" ] in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "b is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ b ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
