(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Centimeters";
    ty_params := [];
    fields := [ Ty.path "f64" ];
  } *)

Module Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.
  Definition Self : Ty.t := Ty.path "derive::Centimeters".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "derive::Centimeters")
      (* Trait polymorphic types *) []
      (* Instance *) [].
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
      let* α1 := M.read (M.get_struct_tuple_field α0 "derive::Centimeters" 0) in
      let* α2 := M.read other in
      let* α3 := M.read (M.get_struct_tuple_field α2 "derive::Centimeters" 0) in
      M.pure (BinOp.Pure.eq α1 α3)
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "derive::Centimeters")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
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
        M.get_trait_method
          "core::cmp::PartialOrd"
          (Ty.path "f64")
          [ Ty.path "f64" ]
          "partial_cmp"
          [] in
      let* α1 := M.read self in
      let* α2 := M.read other in
      M.call_closure
        α0
        [
          M.get_struct_tuple_field α1 "derive::Centimeters" 0;
          M.get_struct_tuple_field α2 "derive::Centimeters" 0
        ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialOrd"
      (* Self *) (Ty.path "derive::Centimeters")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("partial_cmp", InstanceField.Method partial_cmp) ].
End Impl_core_cmp_PartialOrd_for_derive_Centimeters.

(* StructTuple
  {
    name := "Inches";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

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
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_tuple_field1_finish"
          [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Inches") in
      let* α3 := M.read self in
      let* α4 := M.alloc (M.get_struct_tuple_field α3 "derive::Inches" 0) in
      M.call_closure α0 [ α1; α2; M.pointer_coercion (* Unsize *) α4 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "derive::Inches")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
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
              let* γ := M.read γ in
              let* γ1_0 :=
                M.get_struct_tuple_field_or_break_match γ "derive::Inches" 0 in
              let* inches := M.copy γ1_0 in
              let* α0 := M.read inches in
              let* α1 := M.read UnsupportedLiteral in
              let* α2 := BinOp.Panic.mul (M.rust_cast α0) α1 in
              M.alloc (Value.StructTuple "derive::Centimeters" [ α2 ])
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_to_centimeters :
    M.IsAssociatedFunction Self "to_centimeters" to_centimeters.
End Impl_derive_Inches.

(* StructTuple
  {
    name := "Seconds";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _one_second :=
      M.alloc
        (Value.StructTuple "derive::Seconds" [ Value.Integer Integer.I32 1 ]) in
    let* foot :=
      M.alloc
        (Value.StructTuple "derive::Inches" [ Value.Integer Integer.I32 12 ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "One foot equals ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "derive::Inches" ] in
        let* α6 := M.call_closure α5 [ foot ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* meter :=
      let* α0 := M.read UnsupportedLiteral in
      M.alloc (Value.StructTuple "derive::Centimeters" [ α0 ]) in
    let* cmp :=
      let* α0 :=
        M.get_trait_method
          "core::cmp::PartialOrd"
          (Ty.path "derive::Centimeters")
          [ Ty.path "derive::Centimeters" ]
          "lt"
          [] in
      let* α1 :=
        M.get_associated_function
          (Ty.path "derive::Inches")
          "to_centimeters"
          [] in
      let* α2 := M.call_closure α1 [ foot ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.call_closure α0 [ α3; meter ] in
      let* α5 := M.alloc α4 in
      let* α6 := M.read (M.use α5) in
      let* α7 :=
        if Value.is_true α6 then
          M.pure (mk_str "smaller")
        else
          let* α0 := M.read (mk_str "bigger") in
          M.alloc α0 in
      M.copy α7 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "One foot is ") in
        let* α3 := M.read (mk_str " than one meter.
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α6 := M.call_closure α5 [ cmp ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
