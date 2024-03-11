(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "Number";
    ty_params := [];
    fields := [ ("value", Ty.path "i32") ];
  } *)

Module Impl_core_convert_From_i32_for_from_Number.
  (*
      fn from(item: i32) -> Self {
          Number { value: item }
      }
  *)
  Definition from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ item ] =>
      let* item := M.alloc item in
      let* α0 := M.read item in
      M.pure (Value.StructRecord "from::Number" [ ("value", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      (* Self *) (Ty.path "from::Number")
      (* Trait polymorphic types *) [ (* T *) Ty.path "i32" ]
      (* Instance *) [ ("from", InstanceField.Method from) ]
      (* Instance polymorphic types *) [].
End Impl_core_convert_From_i32_for_from_Number.

(*
fn main() {
    Number::from(30);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::convert::From"
          "from"
          [ (* Self *) Ty.path "from::Number"; (* T *) Ty.path "i32" ] in
      let* α1 := M.call α0 [ Value.Integer Integer.I32 30 ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
