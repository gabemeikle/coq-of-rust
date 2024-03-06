(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
Module HasArea.
  
End HasArea.

(* Enum Rectangle *)

Module Impl_core_fmt_Debug_for_generics_bounds_Rectangle.
  Definition Self : Ty.t := Ty.path "generics_bounds::Rectangle".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "Rectangle") in
      let* α2 := M.read (mk_str "length") in
      let* α3 := M.read self in
      let* α4 := M.read (mk_str "height") in
      let* α5 := M.read self in
      let* α6 :=
        M.alloc
          (borrow
            ((M.var "generics_bounds::Rectangle::Get_height") (deref α5))) in
      M.call
        ((Ty.path "core::fmt::Formatter")::["debug_struct_field2_finish"]
          α0
          α1
          α2
          (pointer_coercion
            "Unsize"
            (borrow
              ((M.var "generics_bounds::Rectangle::Get_length") (deref α3))))
          α4
          (pointer_coercion "Unsize" (borrow α6)))
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Debug_for_generics_bounds_Rectangle.

(* Enum Triangle *)

Module Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle.
  Definition Self : Ty.t := Ty.path "generics_bounds::Rectangle".
  
  (*
      fn area(&self) -> f64 {
          self.length * self.height
      }
  *)
  Definition area (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 :=
        M.read ((M.var "generics_bounds::Rectangle::Get_length") (deref α0)) in
      let* α2 := M.read self in
      let* α3 :=
        M.read ((M.var "generics_bounds::Rectangle::Get_height") (deref α2)) in
      (M.var "BinOp::Panic::mul") α1 α3
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("area", InstanceField.Method area)].
End Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle.

(*
fn print_debug<T: Debug>(t: &T) {
    println!("{:?}", t);
}
*)
Definition print_debug (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [T], [t] =>
    let* t := M.alloc t in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_debug"] (borrow t)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn area<T: HasArea>(t: &T) -> f64 {
    t.area()
}
*)
Definition area (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [T], [t] =>
    let* t := M.alloc t in
    let* α0 :=
      ltac:(M.get_method (fun ℐ =>
        generics_bounds.HasArea.area (Self := T) (Trait := ℐ))) in
    let* α1 := M.read t in
    M.call (α0 α1)
  | _, _ => M.impossible
  end.

(*
fn main() {
    let rectangle = Rectangle {
        length: 3.0,
        height: 4.0,
    };
    let _triangle = Triangle {
        length: 3.0,
        height: 4.0,
    };

    print_debug(&rectangle);
    println!("Area: {}", rectangle.area());

    //print_debug(&_triangle);
    //println!("Area: {}", _triangle.area());
    // ^ TODO: Try uncommenting these.
    // | Error: Does not implement either `Debug` or `HasArea`.
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* rectangle :=
      let* α0 := M.read (UnsupportedLiteral : Ty.path "f64") in
      let* α1 := M.read (UnsupportedLiteral : Ty.path "f64") in
      M.alloc
        {|
          generics_bounds.Rectangle.length := α0;
          generics_bounds.Rectangle.height := α1;
        |} in
    let* _triangle :=
      let* α0 := M.read (UnsupportedLiteral : Ty.path "f64") in
      let* α1 := M.read (UnsupportedLiteral : Ty.path "f64") in
      M.alloc
        {|
          generics_bounds.Triangle.length := α0;
          generics_bounds.Triangle.height := α1;
        |} in
    let* _ :=
      let* α0 :=
        M.call ((M.var "generics_bounds::print_debug") (borrow rectangle)) in
      M.alloc α0 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "Area: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          ltac:(M.get_method (fun ℐ =>
            generics_bounds.HasArea.area
              (Self := Ty.path "generics_bounds::Rectangle")
              (Trait := ℐ))) in
        let* α4 := M.call (α3 (borrow rectangle)) in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_display"]
              (borrow α5)) in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α7))) in
        let* α9 := M.call ((M.var "std::io::stdio::_print") α8) in
        M.alloc α9 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
