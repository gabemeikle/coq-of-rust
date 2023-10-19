(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  Module OpenBox.
    Section OpenBox.
      Context {T : Set}.
      Unset Primitive Projections.
      Record t `{State.Trait} : Set := {
        contents : T;
      }.
      Global Set Primitive Projections.
      
      Global Instance Get_contents `{State.Trait} : Notation.Dot "contents" := {
        Notation.dot x := let* x := M.read x in Pure x.(contents) : M _;
      }.
      Global Instance Get_AF_contents `{State.Trait}
        : Notation.DoubleColon t "contents" := {
        Notation.double_colon x
          :=
          let* x := M.read x in Pure x.(contents) : M _;
      }.
    End OpenBox.
  End OpenBox.
  Definition OpenBox (T : Set) `{State.Trait} : Set :=
    M.val (OpenBox.t (T := T)).
  
  Module ClosedBox.
    Section ClosedBox.
      Context {T : Set}.
      Unset Primitive Projections.
      Record t `{State.Trait} : Set := {
        contents : T;
      }.
      Global Set Primitive Projections.
      
      Global Instance Get_contents `{State.Trait} : Notation.Dot "contents" := {
        Notation.dot x := let* x := M.read x in Pure x.(contents) : M _;
      }.
      Global Instance Get_AF_contents `{State.Trait}
        : Notation.DoubleColon t "contents" := {
        Notation.double_colon x
          :=
          let* x := M.read x in Pure x.(contents) : M _;
      }.
    End ClosedBox.
  End ClosedBox.
  Definition ClosedBox (T : Set) `{State.Trait} : Set :=
    M.val (ClosedBox.t (T := T)).
  
  Module Impl_struct_visibility_my_ClosedBox_T.
    Definition Self `{State.Trait} : Set := struct_visibility.my.ClosedBox T.
    
    Definition new
        `{State.Trait}
        (contents : T)
        : M (struct_visibility.my.ClosedBox T) :=
      M.alloc {| struct_visibility.my.ClosedBox.contents := contents; |}.
    
    Global Instance AssociatedFunction_new `{State.Trait} :
      Notation.DoubleColon Self "new" := {
      Notation.double_colon := new;
    }.
  End Impl_struct_visibility_my_ClosedBox_T.
End my.

Module OpenBox.
  Section OpenBox.
    Context {T : Set}.
    Unset Primitive Projections.
    Record t `{State.Trait} : Set := {
      contents : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_contents `{State.Trait} : Notation.Dot "contents" := {
      Notation.dot x := let* x := M.read x in Pure x.(contents) : M _;
    }.
    Global Instance Get_AF_contents `{State.Trait}
      : Notation.DoubleColon t "contents" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(contents) : M _;
    }.
  End OpenBox.
End OpenBox.
Definition OpenBox (T : Set) `{State.Trait} : Set := M.val (OpenBox.t (T := T)).

Module ClosedBox.
  Section ClosedBox.
    Context {T : Set}.
    Unset Primitive Projections.
    Record t `{State.Trait} : Set := {
      contents : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_contents `{State.Trait} : Notation.Dot "contents" := {
      Notation.dot x := let* x := M.read x in Pure x.(contents) : M _;
    }.
    Global Instance Get_AF_contents `{State.Trait}
      : Notation.DoubleColon t "contents" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(contents) : M _;
    }.
  End ClosedBox.
End ClosedBox.
Definition ClosedBox (T : Set) `{State.Trait} : Set :=
  M.val (ClosedBox.t (T := T)).

Module Impl_struct_visibility_my_ClosedBox_T_2.
  Definition Self `{State.Trait} : Set := struct_visibility.my.ClosedBox T.
  
  Definition new
      `{State.Trait}
      (contents : T)
      : M (struct_visibility.my.ClosedBox T) :=
    M.alloc {| struct_visibility.my.ClosedBox.contents := contents; |}.
  
  Global Instance AssociatedFunction_new `{State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
End Impl_struct_visibility_my_ClosedBox_T_2.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* open_box :=
    M.alloc
      {| struct_visibility.my.OpenBox.contents := mk_str "public information";
      |} in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "The open box contains: "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := open_box.["contents"] in
      let* α5 := borrow α4 (ref str) in
      let* α6 := deref α5 (ref str) in
      let* α7 := borrow α6 (ref str) in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 := borrow [ α8 ] (list core.fmt.rt.Argument) in
      let* α10 := deref α9 (list core.fmt.rt.Argument) in
      let* α11 := borrow α10 (list core.fmt.rt.Argument) in
      let* α12 := pointer_coercion "Unsize" α11 in
      let* α13 := core.fmt.Arguments::["new_v1"] α3 α12 in
      std.io.stdio._print α13 in
    Pure tt in
  let* _closed_box :=
    (struct_visibility.my.ClosedBox _)::["new"]
      (mk_str "classified information") in
  Pure tt.
