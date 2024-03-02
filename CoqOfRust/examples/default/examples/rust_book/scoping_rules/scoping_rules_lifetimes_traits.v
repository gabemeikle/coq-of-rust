(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "scoping_rules_lifetimes_traits::Borrowed") [].
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "Borrowed") in
      let* α2 := M.read (mk_str "x") in
      let* α3 := M.read self in
      let* α4 :=
        M.alloc
          (borrow
            ((M.var "scoping_rules_lifetimes_traits::Borrowed::Get_x")
              (deref α3))) in
      M.call
        ((Ty.apply
              (Ty.path "core::fmt::Formatter")
              [])::["debug_struct_field1_finish"]
          α0
          α1
          α2
          (pointer_coercion "Unsize" (borrow α4)))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_fmt : Instance.t := {
    Notations.double_colon := fmt;
  }.
  
  Definition ℐ : Instance.t := [("fmt", fmt)].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed.

Module  Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed.
Section Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "scoping_rules_lifetimes_traits::Borrowed") [].
  
  (*
      fn default() -> Self {
          Self { x: &10 }
      }
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 := M.alloc ((Integer.of_Z 10) : Ty.path "i32") in
      M.pure {| scoping_rules_lifetimes_traits.Borrowed.x := borrow α0; |}
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  Definition ℐ : Instance.t := [("default", default)].
End Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed.
End Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed.

(*
fn main() {
    let b: Borrowed = Default::default();
    println!("b is {:?}", b);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* b :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self :=
              Ty.apply (Ty.path "scoping_rules_lifetimes_traits::Borrowed") [])
            (Trait := ℐ))) in
      let* α1 := M.call α0 in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "b is ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow b)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
