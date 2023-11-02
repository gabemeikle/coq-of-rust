(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Number.
  Section Number.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      value : i32;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_value : Notation.Dot "value" := {
      Notation.dot x := let* x := M.read x in Pure x.(value) : M _;
    }.
    Global Instance Get_AF_value : Notation.DoubleColon t "value" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(value) : M _;
    }.
  End Number.
End Number.
Definition Number `{ℋ : State.Trait} : Set := M.val Number.t.

Module Impl_core_convert_From_i32_for_from_Number.
  Section Impl_core_convert_From_i32_for_from_Number.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := from.Number.
    
    Definition from (item : i32) : M Self :=
      M.alloc {| from.Number.value := item; |}.
    
    Global Instance AssociatedFunction_from :
      Notation.DoubleColon Self "from" := {
      Notation.double_colon := from;
    }.
    
    Global Instance ℐ : core.convert.From.Trait Self (T := i32) := {
      core.convert.From.from := from;
    }.
  End Impl_core_convert_From_i32_for_from_Number.
End Impl_core_convert_From_i32_for_from_Number.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* _ :=
    let* α0 := M.alloc 30 in
    (core.convert.From.from (Self := from.Number) (Trait := ltac:(refine _)))
      α0 in
  M.alloc tt.
