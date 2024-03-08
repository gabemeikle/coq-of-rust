(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Years *)

(* Struct Days *)

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
      let* α0 := M.var "BinOp::Panic::mul" in
      let* α1 := M.var "generics_new_type_idiom::Years::Get_0" in
      let* α2 := M.read self in
      let* α3 := M.read (α1 α2) in
      let* α4 := α0 α3 ((Integer.of_Z 365) : Ty.path "i64") in
      M.pure (Value.StructTuple "generics_new_type_idiom::Days" [ α4 ])
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
      let* α0 := M.var "BinOp::Panic::div" in
      let* α1 := M.var "generics_new_type_idiom::Days::Get_0" in
      let* α2 := M.read self in
      let* α3 := M.read (α1 α2) in
      let* α4 := α0 α3 ((Integer.of_Z 365) : Ty.path "i64") in
      M.pure (Value.StructTuple "generics_new_type_idiom::Years" [ α4 ])
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
    let* α0 := M.var "BinOp::Pure::ge" in
    let* α1 := M.var "generics_new_type_idiom::Years::Get_0" in
    let* α2 := M.read age in
    let* α3 := M.read (α1 α2) in
    M.pure (α0 α3 ((Integer.of_Z 18) : Ty.path "i64"))
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* age :=
      M.alloc
        (Value.StructTuple
          "generics_new_type_idiom::Years"
          [ (Integer.of_Z 5) : Ty.path "i64" ]) in
    let* age_days :=
      let* α0 :=
        M.call
          (Ty.path "generics_new_type_idiom::Years")::["to_days"]
          [ age ] in
      M.alloc α0 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Old enough ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 := M.var "generics_new_type_idiom::old_enough" in
        let* α5 := M.call α4 [ age ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α6 ] in
        let* α8 := M.alloc [ α7 ] in
        let* α9 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α8 ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Old enough ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 := M.var "generics_new_type_idiom::old_enough" in
        let* α5 :=
          M.call
            (Ty.path "generics_new_type_idiom::Days")::["to_years"]
            [ age_days ] in
        let* α6 := M.alloc α5 in
        let* α7 := M.call α4 [ α6 ] in
        let* α8 := M.alloc α7 in
        let* α9 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α8 ] in
        let* α10 := M.alloc [ α9 ] in
        let* α11 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α10 ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
