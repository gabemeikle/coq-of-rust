(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Circle.
  Unset Primitive Projections.
  Record t : Set := {
    radius : i32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_radius : Notation.Dot "radius" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Circle.
Definition Circle : Set := @Circle.t.

Module Impl_core_fmt_Display_for_converting_to_string_Circle.
  Definition Self := converting_to_string.Circle.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref It_is_here!)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    let* α0 := format_argument::["new_display"] (addr_of self.["radius"]) in
    let* α1 :=
      format_arguments::["new_v1"]
        (addr_of [ "Circle of radius " ])
        (addr_of [ α0 ]) in
    f.["write_fmt"] α1.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Display.Trait Self := {
    core.fmt.Display.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Display_for_converting_to_string_Circle.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let circle := {| converting_to_string.Circle.radius := 6; |} in
  let* _ :=
    let* _ :=
      let* α0 := circle.["to_string"] in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.
