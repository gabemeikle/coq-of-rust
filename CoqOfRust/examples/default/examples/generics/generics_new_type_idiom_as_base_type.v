(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Years.
Section Years.
  Record t : Set := {
    x0 : i64.t;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
End Years.
End Years.

(*
fn main() {
    let years = Years(42);
    let years_as_primitive_1: i64 = years.0; // Tuple
    let Years(years_as_primitive_2) = years; // Destructuring
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* years : M.Val generics_new_type_idiom_as_base_type.Years.t :=
    M.alloc
      (generics_new_type_idiom_as_base_type.Years.Build_t
        ((Integer.of_Z 42) : i64.t)) in
  let* years_as_primitive_1 : M.Val i64.t :=
    M.copy (generics_new_type_idiom_as_base_type.Years.Get_0 years) in
  let* α0 : M.Val unit :=
    match_operator
      years
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | generics_new_type_idiom_as_base_type.Years.Build_t _ =>
            let γ0_0 := generics_new_type_idiom_as_base_type.Years.Get_0 γ in
            let* years_as_primitive_2 := M.copy γ0_0 in
            M.alloc tt
          end) :
          M (M.Val unit)
      ] in
  M.read α0.
