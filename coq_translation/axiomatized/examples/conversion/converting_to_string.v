(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Circle.
Section Circle.
  Record t : Set := {
    radius : i32.t;
  }.
  
  Global Instance Get_radius : Notation.Dot "radius" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(radius) : M _;
  }.
  Global Instance Get_AF_radius : Notation.DoubleColon t "radius" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(radius) : M _;
  }.
End Circle.
End Circle.

Module  Impl_core_fmt_Display_for_converting_to_string_Circle_t.
Section Impl_core_fmt_Display_for_converting_to_string_Circle_t.
  Ltac Self := exact converting_to_string.Circle.t.
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "Circle of radius {}", self.radius)
      }
  *)
  Parameter fmt :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (mut_ref core.fmt.Formatter.t)) ->
        M (M.Val ltac:(core.fmt.Result)).
  
  Global Instance AssociatedFunction_fmt :
    Notation.DoubleColon ltac:(Self) "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Display.Trait ltac:(Self) := {
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
Parameter main : M (M.Val unit).
