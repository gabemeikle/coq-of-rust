(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module A.
  Section A.
    Context `{ℋ : State.Trait}.
    
    Inductive t : Set := Build.
  End A.
End A.
Definition A := @A.t.

Module S.
  Section S.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : generics_functions.A;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
  End S.
End S.
Definition S `{ℋ : State.Trait} : Set := M.val S.t.

Module SGen.
  Section SGen.
    Context `{ℋ : State.Trait}.
    
    Context {T : Set}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
  End SGen.
End SGen.
Definition SGen `{ℋ : State.Trait} (T : Set) : Set := M.val (SGen.t (T := T)).

Definition reg_fn `{ℋ : State.Trait} (_s : generics_functions.S) : M unit :=
  M.alloc tt.

Definition gen_spec_t
    `{ℋ : State.Trait}
    (_s : generics_functions.SGen generics_functions.A)
    : M unit :=
  M.alloc tt.

Definition gen_spec_i32
    `{ℋ : State.Trait}
    (_s : generics_functions.SGen i32)
    : M unit :=
  M.alloc tt.

Definition generic
    `{ℋ : State.Trait}
    {T : Set}
    (_s : generics_functions.SGen T)
    : M unit :=
  M.alloc tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* _ :=
    let* α0 := M.alloc generics_functions.A.Build_t in
    let* α1 := M.alloc (generics_functions.S.Build_t α0) in
    generics_functions.reg_fn α1 in
  let* _ :=
    let* α0 := M.alloc generics_functions.A.Build_t in
    let* α1 := M.alloc (generics_functions.SGen.Build_t α0) in
    generics_functions.gen_spec_t α1 in
  let* _ :=
    let* α0 := M.alloc 6 in
    let* α1 := M.alloc (generics_functions.SGen.Build_t α0) in
    generics_functions.gen_spec_i32 α1 in
  let* _ :=
    let* α0 := M.alloc "a"%char in
    let* α1 := M.alloc (generics_functions.SGen.Build_t α0) in
    generics_functions.generic α1 in
  let* _ :=
    let* α0 := M.alloc "c"%char in
    let* α1 := M.alloc (generics_functions.SGen.Build_t α0) in
    generics_functions.generic α1 in
  M.alloc tt.
