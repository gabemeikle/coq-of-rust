(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition some_number : M (core.option.Option u32) :=
  let* α0 := M.alloc 42 in
  Pure (core.option.Option.Some α0).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* α0 := match_binding_destructure_enum_variants.some_number in
  match α0 with
  | core.option.Option (_ as n) =>
    let* _ :=
      let* α0 :=
        borrow [ mk_str "The Answer: "; mk_str "!
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow n u32 in
      let* α5 := deref α4 u32 in
      let* α6 := borrow α5 u32 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt
  | core.option.Option n =>
    let* _ :=
      let* α0 :=
        borrow [ mk_str "Not interesting... "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow n u32 in
      let* α5 := deref α4 u32 in
      let* α6 := borrow α5 u32 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt
  | _ => Pure tt
  end.
