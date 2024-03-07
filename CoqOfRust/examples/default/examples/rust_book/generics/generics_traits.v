(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Empty *)

(* Struct Null *)

(* Trait *)
Module DoubleDrop.
  
End DoubleDrop.

Module Impl_generics_traits_DoubleDrop_T_for_U.
  Definition Self (T U : Ty.t) : Ty.t := U.
  
  (*
      fn double_drop(self, _: T) {}
  *)
  Definition double_drop (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ T; U ], [ self; Pattern ] =>
      let* self := M.alloc self in
      let* Pattern := M.alloc Pattern in
      M.pure tt
    | _, _ => M.impossible
    end.
  
  Definition ℐ (T U : Ty.t) : Instance.t :=
    [ ("double_drop", InstanceField.Method (double_drop T U)) ].
End Impl_generics_traits_DoubleDrop_T_for_U.

(*
fn main() {
    let empty = Empty;
    let null = Null;

    // Deallocate `empty` and `null`.
    empty.double_drop(null);

    //empty;
    //null;
    // ^ TODO: Try uncommenting these lines.
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* empty := M.alloc generics_traits.Empty.Build in
    let* null := M.alloc generics_traits.Null.Build in
    let* _ :=
      let* α0 :=
        M.get_method
          "generics_traits::DoubleDrop"
          "double_drop"
          [
            (* Self *) Ty.path "generics_traits::Empty";
            (* T *) Ty.path "generics_traits::Null"
          ] in
      let* α1 := M.read empty in
      let* α2 := M.read null in
      let* α3 := M.call α0 [ α1; α2 ] in
      M.alloc α3 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
