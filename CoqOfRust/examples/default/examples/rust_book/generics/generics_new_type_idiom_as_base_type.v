(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Years";
    ty_params := [];
    fields := [ Ty.path "i64" ];
  } *)

(*
fn main() {
    let years = Years(42);
    let years_as_primitive_1: i64 = years.0; // Tuple
    let Years(years_as_primitive_2) = years; // Destructuring
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* years :=
      M.alloc
        (Value.StructTuple
          "generics_new_type_idiom_as_base_type::Years"
          [ Value.Integer Integer.I64 42 ]) in
    let* years_as_primitive_1 :=
      M.copy
        (M.get_struct_tuple_field
          years
          "generics_new_type_idiom_as_base_type::Years"
          0) in
    let* α0 :=
      match_operator
        years
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "generics_new_type_idiom_as_base_type::Years"
                0 in
            let* years_as_primitive_2 := M.copy γ0_0 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
