(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Val";
    ty_params := [];
    fields := [ ("val", Ty.path "f64") ];
  } *)

(* StructRecord
  {
    name := "GenVal";
    ty_params := [ ("T", None) ];
    fields := [ ("gen_val", T) ];
  } *)

Module Impl_generics_implementation_Val.
  Definition Self : Ty.t := Ty.path "generics_implementation::Val".
  
  (*
      fn value(&self) -> &f64 {
          &self.val
      }
  *)
  Definition value (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.pure (M.get_struct_record α0 "val")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_value : M.IsAssociatedFunction Self "value" value.
End Impl_generics_implementation_Val.

Module Impl_generics_implementation_GenVal_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_implementation::GenVal") [ T ].
  
  (*
      fn value(&self) -> &T {
          &self.gen_val
      }
  *)
  Definition value (T : Ty.t) (𝜏 : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self T in
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.pure (M.get_struct_record α0 "gen_val")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_value :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "value" (value T).
End Impl_generics_implementation_GenVal_T.

(*
fn main() {
    let x = Val { val: 3.0 };
    let y = GenVal { gen_val: 3i32 };

    println!("{}, {}", x.value(), y.value());
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x :=
      let* α0 := M.read UnsupportedLiteral in
      M.alloc
        (Value.StructRecord "generics_implementation::Val" [ ("val", α0) ]) in
    let* y :=
      M.alloc
        (Value.StructRecord
          "generics_implementation::GenVal"
          [ ("gen_val", Value.Integer Integer.I32 3) ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str ", ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α7 :=
          M.get_associated_function
            (Ty.path "generics_implementation::Val")
            "value" in
        let* α8 := M.call_closure α7 [ x ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call_closure α6 [ α9 ] in
        let* α11 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α12 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "generics_implementation::GenVal")
              [ Ty.path "i32" ])
            "value" in
        let* α13 := M.call_closure α12 [ y ] in
        let* α14 := M.alloc α13 in
        let* α15 := M.call_closure α11 [ α14 ] in
        let* α16 := M.alloc (Value.Array [ α10; α15 ]) in
        let* α17 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α16
            ] in
        let* α18 := M.call_closure α0 [ α17 ] in
        M.alloc α18 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
