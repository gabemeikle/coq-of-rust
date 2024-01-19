(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let outer_var = 42;

    // A regular function can't refer to variables in the enclosing environment
    //fn function(i: i32) -> i32 { i + outer_var }
    // TODO: uncomment the line above and see the compiler error. The compiler
    // suggests that we define a closure instead.

    // Closures are anonymous, here we are binding them to references
    // Annotation is identical to function annotation but is optional
    // as are the `{}` wrapping the body. These nameless functions
    // are assigned to appropriately named variables.
    let closure_annotated = |i: i32| -> i32 { i + outer_var };
    let closure_inferred = |i| i + outer_var;

    // Call the closures.
    println!("closure_annotated: {}", closure_annotated(1));
    println!("closure_inferred: {}", closure_inferred(1));
    // Once closure's type has been inferred, it cannot be inferred again with another type.
    //println!("cannot reuse closure_inferred with another type: {}", closure_inferred(42i64));
    // TODO: uncomment the line above and see the compiler error.

    // A closure taking no arguments which returns an `i32`.
    // The return type is inferred.
    let one = || 1;
    println!("closure returning one: {}", one());
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* outer_var : M.Val i32.t := M.alloc ((Integer.of_Z 42) : i32.t) in
  let* closure_annotated : M.Val (i32.t -> M i32.t) :=
    M.alloc
      (fun (α0 : i32.t) =>
        (let* α0 := M.alloc α0 in
        match_operator
          α0
          [
            fun γ =>
              (let* i := M.copy γ in
              let* α0 : i32.t := M.read i in
              let* α1 : i32.t := M.read outer_var in
              BinOp.Panic.add α0 α1) :
              M i32.t
          ]) :
        M i32.t) in
  let* closure_inferred : M.Val (i32.t -> M i32.t) :=
    M.alloc
      (fun (α0 : i32.t) =>
        (let* α0 := M.alloc α0 in
        match_operator
          α0
          [
            fun γ =>
              (let* i := M.copy γ in
              let* α0 : i32.t := M.read i in
              let* α1 : i32.t := M.read outer_var in
              BinOp.Panic.add α0 α1) :
              M i32.t
          ]) :
        M i32.t) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "closure_annotated: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : (ref (i32.t -> M i32.t)) -> i32.t -> M _ :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.function.Fn.call
            (Self := i32.t -> M i32.t)
            (Args := i32.t)
            (Trait := ℐ))) in
      let* α4 : i32.t :=
        M.call (α3 (borrow closure_annotated) ((Integer.of_Z 1) : i32.t)) in
      let* α5 : M.Val i32.t := M.alloc α4 in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α5)) in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α7))) in
      let* α9 : unit := M.call (std.io.stdio._print α8) in
      M.alloc α9 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "closure_inferred: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : (ref (i32.t -> M i32.t)) -> i32.t -> M _ :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.function.Fn.call
            (Self := i32.t -> M i32.t)
            (Args := i32.t)
            (Trait := ℐ))) in
      let* α4 : i32.t :=
        M.call (α3 (borrow closure_inferred) ((Integer.of_Z 1) : i32.t)) in
      let* α5 : M.Val i32.t := M.alloc α4 in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α5)) in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α7))) in
      let* α9 : unit := M.call (std.io.stdio._print α8) in
      M.alloc α9 in
    M.alloc tt in
  let* one : M.Val (unit -> M i32.t) :=
    M.alloc
      (fun (α0 : unit) =>
        (let* α0 := M.alloc α0 in
        match_operator
          α0
          [ fun γ => (M.pure ((Integer.of_Z 1) : i32.t)) : M i32.t ]) :
        M i32.t) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "closure returning one: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : (ref (unit -> M i32.t)) -> unit -> M _ :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.function.Fn.call
            (Self := unit -> M i32.t)
            (Args := unit)
            (Trait := ℐ))) in
      let* α4 : i32.t := M.call (α3 (borrow one) tt) in
      let* α5 : M.Val i32.t := M.alloc α4 in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α5)) in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α7))) in
      let* α9 : unit := M.call (std.io.stdio._print α8) in
      M.alloc α9 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
