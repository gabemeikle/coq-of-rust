(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Years.
Section Years.
  Record t : Set := {
    x0 : i64.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
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
  M.function_body
    (let* years : M.Val generics_new_type_idiom_as_base_type.Years.t :=
      let* α0 : M.Val i64.t := M.alloc 42 in
      let* α1 : i64.t := M.read α0 in
      M.alloc (generics_new_type_idiom_as_base_type.Years.Build_t α1) in
    let* years_as_primitive_1 : M.Val i64.t := M.copy years.["0"] in
    let* 'generics_new_type_idiom_as_base_type.Years.Build_t
          years_as_primitive_2 :
        M.Val generics_new_type_idiom_as_base_type.Years.t :=
      M.copy years in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
