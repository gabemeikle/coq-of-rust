(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Circle.
Section Circle.
  Record t : Set := {
    radius : i32.t;
  }.
  
  Definition Get_radius :=
    Ref.map (fun α => Some α.(radius)) (fun β α => Some (α <| radius := β |>)).
End Circle.
End Circle.

Module  Impl_core_fmt_Display_for_converting_to_string_Circle_t.
Section Impl_core_fmt_Display_for_converting_to_string_Circle_t.
  Definition Self : Set := converting_to_string.Circle.t.
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "Circle of radius {}", self.radius)
      }
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "Circle of radius ") in
    let* α2 : M.Val (array (ref str.t)) := M.alloc [ α1 ] in
    let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
    let* α4 : ref (slice (ref str.t)) :=
      M.read (pointer_coercion "Unsize" α3) in
    let* α5 : ref converting_to_string.Circle.t := M.read self in
    let* α6 : core.fmt.rt.Argument.t :=
      M.call
        (core.fmt.rt.Argument.t::["new_display"]
          (borrow (converting_to_string.Circle.Get_radius (deref α5)))) in
    let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
    let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
      M.alloc (borrow α7) in
    let* α9 : ref (slice core.fmt.rt.Argument.t) :=
      M.read (pointer_coercion "Unsize" α8) in
    let* α10 : core.fmt.Arguments.t :=
      M.call (core.fmt.Arguments.t::["new_v1"] α4 α9) in
    M.call (core.fmt.Formatter.t::["write_fmt"] α0 α10).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Display.Trait Self := {
    core.fmt.Display.fmt := fmt;
  }.
End Impl_core_fmt_Display_for_converting_to_string_Circle_t.
End Impl_core_fmt_Display_for_converting_to_string_Circle_t.

(*
fn main() {
    let circle = Circle { radius: 6 };
    circle.to_string();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* circle : M.Val converting_to_string.Circle.t :=
    M.alloc {| converting_to_string.Circle.radius := Integer.of_Z 6; |} in
  let* _ : M.Val alloc.string.String.t :=
    let* α0 : _ :=
      ltac:(M.get_method (fun ℐ =>
        alloc.string.ToString.to_string
          (Self := converting_to_string.Circle.t)
          (Trait := ℐ))) in
    let* α1 : alloc.string.String.t := M.call (α0 (borrow circle)) in
    M.alloc α1 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
