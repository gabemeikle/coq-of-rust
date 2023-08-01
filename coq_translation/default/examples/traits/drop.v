(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Droppable.
  Unset Primitive Projections.
  Record t : Set := {
    name : ref str;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Droppable.
Definition Droppable : Set := @Droppable.t.

Module Impl_core_ops_drop_Drop_for_drop_Droppable.
  Definition Self := drop.Droppable.
  
  Definition drop
      `{H : State.Trait}
      (self : mut_ref It_is_here!)
      : M (H := H) unit :=
    let* _ :=
      let* _ :=
        let* α0 := format_argument::["new_display"] (addr_of self.["name"]) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "> Dropping "; "
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt in
    Pure tt.
  
  Global Instance Method_drop `{H : State.Trait} : Notation.Dot "drop" := {
    Notation.dot := drop;
  }.
  
  Global Instance I : core.ops.drop.Drop.Trait Self := {
    core.ops.drop.Drop.drop `{H : State.Trait} := drop;
  }.
End Impl_core_ops_drop_Drop_for_drop_Droppable.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let _a := {| drop.Droppable.name := "a"; |} in
  let* _ :=
    let _b := {| drop.Droppable.name := "b"; |} in
    let* _ :=
      let _c := {| drop.Droppable.name := "c"; |} in
      let _d := {| drop.Droppable.name := "d"; |} in
      let* _ :=
        let* _ :=
          let* α0 :=
            format_arguments::["new_const"] (addr_of [ "Exiting block B
" ]) in
          std.io.stdio._print α0 in
        Pure tt in
      Pure tt in
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "Just exited block B
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"] (addr_of [ "Exiting block A
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "Just exited block A
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* _ := core.mem.drop _a in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "end of the main function
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  Pure tt.
