(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.





Module  Impl_generics_implementation_Val.
Section Impl_generics_implementation_Val.
  Definition Self : Set := Ty.apply (Ty.path "generics_implementation::Val") [].
  
  (*
      fn value(&self) -> &f64 {
          &self.val
      }
  *)
  Definition value (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.pure
        (borrow ((M.var "generics_implementation::Val::Get_val") (deref α0)))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_value : Instance.t := {
    Notations.double_colon := value;
  }.
End Impl_generics_implementation_Val.
End Impl_generics_implementation_Val.

Module  Impl_generics_implementation_GenVal_T.
Section Impl_generics_implementation_GenVal_T.
  Context {T : Set}.
  
  Definition Self : Set :=
    Ty.apply (Ty.path "generics_implementation::GenVal") [T].
  
  (*
      fn value(&self) -> &T {
          &self.gen_val
      }
  *)
  Definition value (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.pure
        (borrow
          ((M.var "generics_implementation::GenVal::Get_gen_val") (deref α0)))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_value : Instance.t := {
    Notations.double_colon := value;
  }.
End Impl_generics_implementation_GenVal_T.
End Impl_generics_implementation_GenVal_T.

(*
fn main() {
    let x = Val { val: 3.0 };
    let y = GenVal { gen_val: 3i32 };

    println!("{}, {}", x.value(), y.value());
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x :=
      let* α0 := M.read (UnsupportedLiteral : Ty.path "f64") in
      M.alloc {| generics_implementation.Val.val := α0; |} in
    let* y :=
      M.alloc
        {|
          generics_implementation.GenVal.gen_val :=
            (Integer.of_Z 3) : Ty.path "i32";
        |} in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "") in
        let* α1 := M.read (mk_str ", ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α0; α1; α2 ] in
        let* α4 :=
          M.call
            ((Ty.apply (Ty.path "generics_implementation::Val") [])::["value"]
              (borrow x)) in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α5)) in
        let* α7 :=
          M.call
            ((Ty.apply
                  (Ty.path "generics_implementation::GenVal")
                  [Ty.path "i32"])::["value"]
              (borrow y)) in
        let* α8 := M.alloc α7 in
        let* α9 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow α8)) in
        let* α10 := M.alloc [ α6; α9 ] in
        let* α11 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α3))
              (pointer_coercion "Unsize" (borrow α10))) in
        let* α12 := M.call ((M.var "std::io::stdio::_print") α11) in
        M.alloc α12 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
