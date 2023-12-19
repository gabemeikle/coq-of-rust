(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn call_me<F: Fn()>(f: F) {
    f();
}
*)
Definition call_me
    {F : Set}
    {ℋ_0 : core.ops.function.Fn.Trait F (Args := unit)}
    (f : F)
    : M unit :=
  let* f : M.Val F := M.alloc f in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      M.call
        ((core.ops.function.Fn.call (Self := F) (Trait := ltac:(refine _)))
          (borrow f)
          tt) in
    M.alloc α0 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn function() {
    println!("I'm a function!");
}
*)
Definition function : M unit :=
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "I'm a function!
") in
      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
      let* α3 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α2) in
      let* α4 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_const"] α3) in
      let* α5 : unit := M.call (std.io.stdio._print α4) in
      M.alloc α5 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn main() {
    // Define a closure satisfying the `Fn` bound
    let closure = || println!("I'm a closure!");

    call_me(closure);
    call_me(function);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* closure : M.Val type not implemented :=
    M.copy
      (let* _ : M.Val unit :=
        let* α0 : ref str.t := M.read (mk_str "I'm a closure!
") in
        let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
        let* α3 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α2) in
        let* α4 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_const"] α3) in
        let* α5 : unit := M.call (std.io.stdio._print α4) in
        M.alloc α5 in
      M.alloc tt) in
  let* _ : M.Val unit :=
    let* α0 : type not implemented := M.read closure in
    let* α1 : unit := M.call (functions_closures_input_functions.call_me α0) in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      M.call
        (functions_closures_input_functions.call_me
          functions_closures_input_functions.function) in
    M.alloc α0 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
