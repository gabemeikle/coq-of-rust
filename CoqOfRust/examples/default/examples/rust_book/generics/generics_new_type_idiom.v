(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "Years";
    ty_params := [];
    fields := [ Ty.path "i64" ];
  } *)

(* Struct
  {
    name := "Days";
    ty_params := [];
    fields := [ Ty.path "i64" ];
  } *)

Module Impl_generics_new_type_idiom_Years.
  Definition Self : Ty.t := Ty.path "generics_new_type_idiom::Years".
  
  (*
      pub fn to_days(&self) -> Days {
          Days(self.0 * 365)
      }
  *)
  Definition to_days (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 := M.read (M.get_struct_tuple α0 0) in
      let* α2 := BinOp.Panic.mul α1 (Value.Integer Integer.I64 365) in
      M.pure (Value.StructTuple "generics_new_type_idiom::Days" [ α2 ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_to_days :
    M.IsAssociatedFunction Self "to_days" to_days [].
End Impl_generics_new_type_idiom_Years.

Module Impl_generics_new_type_idiom_Days.
  Definition Self : Ty.t := Ty.path "generics_new_type_idiom::Days".
  
  (*
      pub fn to_years(&self) -> Years {
          Years(self.0 / 365)
      }
  *)
  Definition to_years (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 := M.read (M.get_struct_tuple α0 0) in
      let* α2 := BinOp.Panic.div α1 (Value.Integer Integer.I64 365) in
      M.pure (Value.StructTuple "generics_new_type_idiom::Years" [ α2 ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_to_years :
    M.IsAssociatedFunction Self "to_years" to_years [].
End Impl_generics_new_type_idiom_Days.

(*
fn old_enough(age: &Years) -> bool {
    age.0 >= 18
}
*)
Definition old_enough (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ age ] =>
    let* age := M.alloc age in
    let* α0 := M.read age in
    let* α1 := M.read (M.get_struct_tuple α0 0) in
    M.pure (BinOp.Pure.ge α1 (Value.Integer Integer.I64 18))
  | _, _ => M.impossible
  end.

(*
fn main() {
    let age = Years(5);
    let age_days = age.to_days();
    println!("Old enough {}", old_enough(&age));
    println!("Old enough {}", old_enough(&age_days.to_years()));
    // println!("Old enough {}", old_enough(&age_days));
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* age :=
      M.alloc
        (Value.StructTuple
          "generics_new_type_idiom::Years"
          [ Value.Integer Integer.I64 5 ]) in
    let* age_days :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "generics_new_type_idiom::Years")
          "to_days" in
      let* α1 := M.call α0 [ age ] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Old enough ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.get_function "generics_new_type_idiom::old_enough" [] in
        let* α7 := M.call α6 [ age ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Old enough ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.get_function "generics_new_type_idiom::old_enough" [] in
        let* α7 :=
          M.get_associated_function
            (Ty.path "generics_new_type_idiom::Days")
            "to_years" in
        let* α8 := M.call α7 [ age_days ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call α6 [ α9 ] in
        let* α11 := M.alloc α10 in
        let* α12 := M.call α5 [ α11 ] in
        let* α13 := M.alloc (Value.Array [ α12 ]) in
        let* α14 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α13
            ] in
        let* α15 := M.call α0 [ α14 ] in
        M.alloc α15 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
