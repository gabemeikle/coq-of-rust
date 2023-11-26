(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Ltac NanoSecond := exact u64.t.

Ltac Inch := exact u64.t.

Ltac U64 := exact u64.t.

(*
fn main() {
    // `NanoSecond` = `Inch` = `U64` = `u64`.
    let nanoseconds: NanoSecond = 5 as U64;
    let inches: Inch = 2 as U64;

    // Note that type aliases *don't* provide any extra type safety, because
    // aliases are *not* new types
    println!(
        "{} nanoseconds + {} inches = {} unit?",
        nanoseconds,
        inches,
        nanoseconds + inches
    );
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* nanoseconds : M.Val u64.t :=
      let* α0 : M.Val u64.t := M.alloc 5 in
      let* α1 : M.Val u64.t := use α0 in
      M.copy α1 in
    let* inches : M.Val u64.t :=
      let* α0 : M.Val u64.t := M.alloc 2 in
      let* α1 : M.Val u64.t := use α0 in
      M.copy α1 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc
            [
              mk_str "";
              mk_str " nanoseconds + ";
              mk_str " inches = ";
              mk_str " unit?
"
            ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref u64.t := borrow nanoseconds in
        let* α8 : M.Val u64.t := deref α7 in
        let* α9 : ref u64.t := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : ref u64.t := borrow inches in
        let* α13 : M.Val u64.t := deref α12 in
        let* α14 : ref u64.t := borrow α13 in
        let* α15 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α14 in
        let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
        let* α17 : M.Val u64.t := BinOp.add nanoseconds inches in
        let* α18 : ref u64.t := borrow α17 in
        let* α19 : M.Val u64.t := deref α18 in
        let* α20 : ref u64.t := borrow α19 in
        let* α21 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α20 in
        let* α22 : M.Val core.fmt.rt.Argument.t := M.alloc α21 in
        let* α23 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α11; α16; α22 ] in
        let* α24 : ref (array core.fmt.rt.Argument.t) := borrow α23 in
        let* α25 : M.Val (array core.fmt.rt.Argument.t) := deref α24 in
        let* α26 : ref (array core.fmt.rt.Argument.t) := borrow α25 in
        let* α27 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α26 in
        let* α28 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α27 in
        let* α29 : ref (slice core.fmt.rt.Argument.t) := M.read α28 in
        let* α30 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α29 in
        let* α31 : unit := std.io.stdio._print α30 in
        M.alloc α31 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
