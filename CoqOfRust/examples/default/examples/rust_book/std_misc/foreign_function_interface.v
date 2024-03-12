(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error ForeignMod.

(*
fn cos(z: Complex) -> Complex {
    unsafe { ccosf(z) }
}
*)
Definition cos (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ z ] =>
    let* z := M.alloc z in
    let* α0 := M.get_function "foreign_function_interface::ccosf" [] in
    let* α1 := M.read z in
    M.call α0 [ α1 ]
  | _, _ => M.impossible
  end.

(*
fn main() {
    // z = -1 + 0i
    let z = Complex { re: -1., im: 0. };

    // calling a foreign function is an unsafe operation
    let z_sqrt = unsafe { csqrtf(z) };

    println!("the square root of {:?} is {:?}", z, z_sqrt);

    // calling safe API wrapped around unsafe operation
    println!("cos({:?}) = {:?}", z, cos(z));
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* z :=
      let* α0 := M.read UnsupportedLiteral in
      let* α1 := M.read UnsupportedLiteral in
      M.alloc
        (Value.StructRecord
          "foreign_function_interface::Complex"
          [ ("re", α0); ("im", α1) ]) in
    let* z_sqrt :=
      let* α0 := M.get_function "foreign_function_interface::csqrtf" [] in
      let* α1 := M.read z in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "the square root of ") in
        let* α3 := M.read (mk_str " is ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α7 := M.call α6 [ z ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α9 := M.call α8 [ z_sqrt ] in
        let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
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
        let* α2 := M.read (mk_str "cos(") in
        let* α3 := M.read (mk_str ") = ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α7 := M.call α6 [ z ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α9 := M.get_function "foreign_function_interface::cos" [] in
        let* α10 := M.read z in
        let* α11 := M.call α9 [ α10 ] in
        let* α12 := M.alloc α11 in
        let* α13 := M.call α8 [ α12 ] in
        let* α14 := M.alloc (Value.Array [ α7; α13 ]) in
        let* α15 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α14
            ] in
        let* α16 := M.call α0 [ α15 ] in
        M.alloc α16 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(* Struct
  {
    name := "Complex";
    ty_params := [];
    fields := [ ("re", Ty.path "f32"); ("im", Ty.path "f32") ];
  } *)

Module Impl_core_clone_Clone_for_foreign_function_interface_Complex.
  Definition Self : Ty.t := Ty.path "foreign_function_interface::Complex".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator Value.DeclaredButUndefined [ fun γ => M.read self ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "foreign_function_interface::Complex")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_foreign_function_interface_Complex.

Module Impl_core_marker_Copy_for_foreign_function_interface_Complex.
  Definition Self : Ty.t := Ty.path "foreign_function_interface::Complex".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "foreign_function_interface::Complex")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_foreign_function_interface_Complex.

Module Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
  Definition Self : Ty.t := Ty.path "foreign_function_interface::Complex".
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          if self.im < 0. {
              write!(f, "{}-{}i", self.re, -self.im)
          } else {
              write!(f, "{}+{}i", self.re, self.im)
          }
      }
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read self in
      let* α1 := M.read (M.get_struct_record α0 "im") in
      let* α2 := M.read UnsupportedLiteral in
      let* α3 := M.alloc (BinOp.Pure.lt α1 α2) in
      let* α4 := M.read (M.use α3) in
      let* α5 :=
        if Value.is_true α4 then
          let* α0 :=
            M.get_associated_function
              (Ty.path "core::fmt::Formatter")
              "write_fmt" in
          let* α1 := M.read f in
          let* α2 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α3 := M.read (mk_str "") in
          let* α4 := M.read (mk_str "-") in
          let* α5 := M.read (mk_str "i") in
          let* α6 := M.alloc (Value.Array [ α3; α4; α5 ]) in
          let* α7 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α8 := M.read self in
          let* α9 := M.call α7 [ M.get_struct_record α8 "re" ] in
          let* α10 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α11 := M.read self in
          let* α12 := M.read (M.get_struct_record α11 "im") in
          let* α13 := UnOp.Panic.neg α12 in
          let* α14 := M.alloc α13 in
          let* α15 := M.call α10 [ α14 ] in
          let* α16 := M.alloc (Value.Array [ α9; α15 ]) in
          let* α17 :=
            M.call
              α2
              [
                M.pointer_coercion (* Unsize *) α6;
                M.pointer_coercion (* Unsize *) α16
              ] in
          let* α18 := M.call α0 [ α1; α17 ] in
          M.alloc α18
        else
          let* α0 :=
            M.get_associated_function
              (Ty.path "core::fmt::Formatter")
              "write_fmt" in
          let* α1 := M.read f in
          let* α2 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α3 := M.read (mk_str "") in
          let* α4 := M.read (mk_str "+") in
          let* α5 := M.read (mk_str "i") in
          let* α6 := M.alloc (Value.Array [ α3; α4; α5 ]) in
          let* α7 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α8 := M.read self in
          let* α9 := M.call α7 [ M.get_struct_record α8 "re" ] in
          let* α10 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α11 := M.read self in
          let* α12 := M.call α10 [ M.get_struct_record α11 "im" ] in
          let* α13 := M.alloc (Value.Array [ α9; α12 ]) in
          let* α14 :=
            M.call
              α2
              [
                M.pointer_coercion (* Unsize *) α6;
                M.pointer_coercion (* Unsize *) α13
              ] in
          let* α15 := M.call α0 [ α1; α14 ] in
          M.alloc α15 in
      M.read α5
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "foreign_function_interface::Complex")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
