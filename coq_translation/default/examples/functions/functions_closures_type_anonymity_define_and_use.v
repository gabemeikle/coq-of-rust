(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition apply
    `{ℋ : State.Trait}
    {F : Set}
    {ℋ_0 : core.ops.function.Fn.Trait F (Args := unit)}
    (f : F)
    : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref F)) := borrow f in
      let* α1 : ltac:(refine unit) := M.alloc tt in
      (core.ops.function.Fn.call (Self := F) (Trait := ltac:(refine _)))
        α0
        α1 in
    M.alloc tt).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* x : ltac:(refine i32) := M.alloc 7 in
    let print :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str ""; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (ref i32)) := borrow x in
        let* α4 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α3 in
        let* α5 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α5 in
        let* α7 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      functions_closures_type_anonymity_define_and_use.apply print in
    M.alloc tt).
