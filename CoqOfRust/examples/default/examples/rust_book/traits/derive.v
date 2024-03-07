(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Centimeters *)

Module Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.
  Definition Self : Ty.t := Ty.path "derive::Centimeters".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.

Module Impl_core_cmp_PartialEq_for_derive_Centimeters.
  Definition Self : Ty.t := Ty.path "derive::Centimeters".
  
  (*
  PartialEq
  *)
  Definition eq (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      let* α0 := M.read self in
      let* α1 := M.read ((M.var "derive::Centimeters::Get_0") (deref α0)) in
      let* α2 := M.read other in
      let* α3 := M.read ((M.var "derive::Centimeters::Get_0") (deref α2)) in
      M.pure ((M.var "BinOp::Pure::eq") α1 α3)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_derive_Centimeters.

Module Impl_core_cmp_PartialOrd_for_derive_Centimeters.
  Definition Self : Ty.t := Ty.path "derive::Centimeters".
  
  (*
  PartialOrd
  *)
  Definition partial_cmp (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      let* α0 :=
        M.get_method
          "core::cmp::PartialOrd"
          "partial_cmp"
          [ (* Self *) Ty.path "f64"; (* Rhs *) Ty.path "f64" ] in
      let* α1 := M.read self in
      let* α2 := M.read other in
      M.call
        α0
        [
          borrow ((M.var "derive::Centimeters::Get_0") (deref α1));
          borrow ((M.var "derive::Centimeters::Get_0") (deref α2))
        ]
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t :=
    [ ("partial_cmp", InstanceField.Method partial_cmp) ].
End Impl_core_cmp_PartialOrd_for_derive_Centimeters.

(* Struct Inches *)

Module Impl_core_fmt_Debug_for_derive_Inches.
  Definition Self : Ty.t := Ty.path "derive::Inches".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "Inches") in
      let* α2 := M.read self in
      let* α3 :=
        M.alloc (borrow ((M.var "derive::Inches::Get_0") (deref α2))) in
      M.call
        (Ty.path "core::fmt::Formatter")::["debug_tuple_field1_finish"]
        [ α0; α1; pointer_coercion "Unsize" (borrow α3) ]
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_derive_Inches.

Module Impl_derive_Inches.
  Definition Self : Ty.t := Ty.path "derive::Inches".
  
  (*
      fn to_centimeters(&self) -> Centimeters {
          let &Inches(inches) = self;
  
          Centimeters(inches as f64 * 2.54)
      }
  *)
  Definition to_centimeters (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          self
          [
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | derive.Inches.Build_t _ =>
                let γ1_0 := (M.var "derive::Inches::Get_0") γ in
                let* inches := M.copy γ1_0 in
                let* α0 := M.read inches in
                let* α1 := M.read (UnsupportedLiteral : Ty.path "f64") in
                let* α2 := (M.var "BinOp::Panic::mul") (rust_cast α0) α1 in
                M.alloc (derive.Centimeters.Build_t α2)
              end) :
              Ty.path "derive::Centimeters"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
End Impl_derive_Inches.

(* Struct Seconds *)

(*
fn main() {
    let _one_second = Seconds(1);

    // Error: `Seconds` can't be printed; it doesn't implement the `Debug` trait
    //println!("One second looks like: {:?}", _one_second);
    // TODO ^ Try uncommenting this line

    // Error: `Seconds` can't be compared; it doesn't implement the `PartialEq` trait
    //let _this_is_true = (_one_second == _one_second);
    // TODO ^ Try uncommenting this line

    let foot = Inches(12);

    println!("One foot equals {:?}", foot);

    let meter = Centimeters(100.0);

    let cmp = if foot.to_centimeters() < meter {
        "smaller"
    } else {
        "bigger"
    };

    println!("One foot is {} than one meter.", cmp);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _one_second :=
      M.alloc (derive.Seconds.Build_t ((Integer.of_Z 1) : Ty.path "i32")) in
    let* foot :=
      M.alloc (derive.Inches.Build_t ((Integer.of_Z 12) : Ty.path "i32")) in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "One foot equals ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow foot ] in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α4)
            ] in
        let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
        M.alloc α6 in
      M.alloc tt in
    let* meter :=
      let* α0 := M.read (UnsupportedLiteral : Ty.path "f64") in
      M.alloc (derive.Centimeters.Build_t α0) in
    let* cmp :=
      let* α0 :=
        M.get_method
          "core::cmp::PartialOrd"
          "lt"
          [
            (* Self *) Ty.path "derive::Centimeters";
            (* Rhs *) Ty.path "derive::Centimeters"
          ] in
      let* α1 :=
        M.call (Ty.path "derive::Inches")::["to_centimeters"] [ borrow foot ] in
      let* α2 := M.alloc α1 in
      let* α3 := M.call α0 [ borrow α2; borrow meter ] in
      let* α4 := M.alloc α3 in
      let* α5 := M.read (use α4) in
      let* α6 :=
        if α5 then
          M.pure (mk_str "smaller")
        else
          let* α0 := M.read (mk_str "bigger") in
          M.alloc α0 in
      M.copy α6 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "One foot is ") in
        let* α1 := M.read (mk_str " than one meter.
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow cmp ] in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α4)
            ] in
        let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
