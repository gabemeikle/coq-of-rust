(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Number";
    ty_params := [];
    fields := [ ("value", Ty.path "i32") ];
  } *)

Module Impl_core_convert_From_i32_for_into_Number.
  Definition Self : Ty.t := Ty.path "into::Number".
  
  (*
      fn from(item: i32) -> Self {
          Number { value: item }
      }
  *)
  Definition from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ item ] =>
      let* item := M.alloc item in
      let* α0 := M.read item in
      M.pure (Value.StructRecord "into::Number" [ ("value", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      (* Self *) (Ty.path "into::Number")
      (* Trait polymorphic types *) [ (* T *) Ty.path "i32" ]
      (* Instance *) [ ("from", InstanceField.Method from) ].
End Impl_core_convert_From_i32_for_into_Number.

(*
fn main() {
    <i32 as std::convert::Into<Number>>::into(5);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::convert::Into"
          "into"
          [ (* Self *) Ty.path "i32"; (* T *) Ty.path "into::Number" ] in
      let* α1 := M.call α0 [ Value.Integer Integer.I32 5 ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
