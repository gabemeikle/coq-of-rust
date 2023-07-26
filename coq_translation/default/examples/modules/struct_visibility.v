(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  Module OpenBox.
    Section OpenBox.
      Context [T : Set].
      Unset Primitive Projections.
      Record t : Set := {
        contents : T;
      }.
      Global Set Primitive Projections.
      
      Global Instance Get_contents : Notation.Dot "contents" := {
        Notation.dot '(Build_t x0) := x0;
      }.
    End OpenBox.
  End OpenBox.
  Definition OpenBox : Set := OpenBox.t.
  
  Module ClosedBox.
    Section ClosedBox.
      Context [T : Set].
      Unset Primitive Projections.
      Record t : Set := {
        contents : T;
      }.
      Global Set Primitive Projections.
      
      Global Instance Get_contents : Notation.Dot "contents" := {
        Notation.dot '(Build_t x0) := x0;
      }.
    End ClosedBox.
  End ClosedBox.
  Definition ClosedBox : Set := ClosedBox.t.
  
  Module Impl_struct_visibility_my_ClosedBox_T.
    Definition Self := struct_visibility.my.ClosedBox T.
    
    Definition new
        `{H : State.Trait}
        (contents : T)
        : M (H := H) (struct_visibility.my.ClosedBox T) :=
      Pure {| struct_visibility.my.ClosedBox.contents := contents; |}.
    
    Global Instance AssociatedFunction_new `{H : State.Trait} :
      Notation.DoubleColon Self "new" := {
      Notation.double_colon := new;
    }.
  End Impl_struct_visibility_my_ClosedBox_T.
End my.

Module OpenBox.
  Section OpenBox.
    Context [T : Set].
    Unset Primitive Projections.
    Record t : Set := {
      contents : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_contents : Notation.Dot "contents" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End OpenBox.
End OpenBox.
Definition OpenBox : Set := OpenBox.t.

Module ClosedBox.
  Section ClosedBox.
    Context [T : Set].
    Unset Primitive Projections.
    Record t : Set := {
      contents : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_contents : Notation.Dot "contents" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End ClosedBox.
End ClosedBox.
Definition ClosedBox : Set := ClosedBox.t.

Module Impl_struct_visibility_my_ClosedBox_T_2.
  Definition Self := struct_visibility.my.ClosedBox T.
  
  Definition new
      `{H : State.Trait}
      (contents : T)
      : M (H := H) (struct_visibility.my.ClosedBox T) :=
    Pure {| struct_visibility.my.ClosedBox.contents := contents; |}.
  
  Global Instance AssociatedFunction_new `{H : State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
End Impl_struct_visibility_my_ClosedBox_T_2.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let open_box :=
    {| struct_visibility.my.OpenBox.contents := "public information"; |} in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_display"] (addr_of open_box.["contents"]) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "The open box contains: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _closed_box :=
    struct_visibility.my.ClosedBox::["new"] "classified information" in
  Pure tt.
