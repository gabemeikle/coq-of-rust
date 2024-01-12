(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Assign a reference of type `i32`. The `&` signifies there
    // is a reference being assigned.
    let reference = &4;

    match reference {
        // If `reference` is pattern matched against `&val`, it results
        // in a comparison like:
        // `&i32`
        // `&val`
        // ^ We see that if the matching `&`s are dropped, then the `i32`
        // should be assigned to `val`.
        &val => println!("Got a value via destructuring: {:?}", val),
    }

    // To avoid the `&`, you dereference before matching.
    match *reference {
        val => println!("Got a value via dereferencing: {:?}", val),
    }

    // What if you don't start with a reference? `reference` was a `&`
    // because the right side was already a reference. This is not
    // a reference because the right side is not one.
    let _not_a_reference = 3;

    // Rust provides `ref` for exactly this purpose. It modifies the
    // assignment so that a reference is created for the element; this
    // reference is assigned.
    let ref _is_a_reference = 3;

    // Accordingly, by defining 2 values without references, references
    // can be retrieved via `ref` and `ref mut`.
    let value = 5;
    let mut mut_value = 6;

    // Use `ref` keyword to create a reference.
    match value {
        ref r => println!("Got a reference to a value: {:?}", r),
    }

    // Use `ref mut` similarly.
    match mut_value {
        ref mut m => {
            // Got a reference. Gotta dereference it before we can
            // add anything to it.
            *m += 10;
            println!("We added 10. `mut_value`: {:?}", m);
        }
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* reference : M.Val (ref i32.t) :=
    let* α0 : M.Val i32.t := M.alloc ((Integer.of_Z 4) : i32.t) in
    M.alloc (borrow α0) in
  let* _ : M.Val unit :=
    match_operator
      reference
      [
        fun γ =>
          (let* γ :=
            let* α0 := M.read γ in
            M.pure (deref α0) in
          let* val := M.copy γ in
          let* _ : M.Val unit :=
            let* α0 : ref str.t :=
              M.read (mk_str "Got a value via destructuring: ") in
            let* α1 : ref str.t := M.read (mk_str "
") in
            let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
            let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
            let* α4 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α3) in
            let* α5 : core.fmt.rt.Argument.t :=
              M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow val)) in
            let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
            let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc (borrow α6) in
            let* α8 : ref (slice core.fmt.rt.Argument.t) :=
              M.read (pointer_coercion "Unsize" α7) in
            let* α9 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
            let* α10 : unit := M.call (std.io.stdio._print α9) in
            M.alloc α10 in
          M.alloc tt) :
          M (M.Val unit)
      ] in
  let* _ : M.Val unit :=
    let* α0 : ref i32.t := M.read reference in
    match_operator
      (deref α0)
      [
        fun γ =>
          (let* val := M.copy γ in
          let* _ : M.Val unit :=
            let* α0 : ref str.t :=
              M.read (mk_str "Got a value via dereferencing: ") in
            let* α1 : ref str.t := M.read (mk_str "
") in
            let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
            let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
            let* α4 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α3) in
            let* α5 : core.fmt.rt.Argument.t :=
              M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow val)) in
            let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
            let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc (borrow α6) in
            let* α8 : ref (slice core.fmt.rt.Argument.t) :=
              M.read (pointer_coercion "Unsize" α7) in
            let* α9 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
            let* α10 : unit := M.call (std.io.stdio._print α9) in
            M.alloc α10 in
          M.alloc tt) :
          M (M.Val unit)
      ] in
  let* _not_a_reference : M.Val i32.t := M.alloc ((Integer.of_Z 3) : i32.t) in
  let* _is_a_reference : M.Val i32.t := M.alloc ((Integer.of_Z 3) : i32.t) in
  let* value : M.Val i32.t := M.alloc ((Integer.of_Z 5) : i32.t) in
  let* mut_value : M.Val i32.t := M.alloc ((Integer.of_Z 6) : i32.t) in
  let* _ : M.Val unit :=
    match_operator
      value
      [
        fun γ =>
          (let* r := M.alloc (borrow γ) in
          let* _ : M.Val unit :=
            let* α0 : ref str.t :=
              M.read (mk_str "Got a reference to a value: ") in
            let* α1 : ref str.t := M.read (mk_str "
") in
            let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
            let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
            let* α4 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α3) in
            let* α5 : core.fmt.rt.Argument.t :=
              M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow r)) in
            let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
            let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc (borrow α6) in
            let* α8 : ref (slice core.fmt.rt.Argument.t) :=
              M.read (pointer_coercion "Unsize" α7) in
            let* α9 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
            let* α10 : unit := M.call (std.io.stdio._print α9) in
            M.alloc α10 in
          M.alloc tt) :
          M (M.Val unit)
      ] in
  let* α0 : M.Val unit :=
    match_operator
      mut_value
      [
        fun γ =>
          (let* m := M.alloc (borrow_mut γ) in
          let* _ : M.Val unit :=
            let* β : M.Val i32.t :=
              let* α0 : mut_ref i32.t := M.read m in
              M.pure (deref α0) in
            let* α0 := M.read β in
            let* α1 := BinOp.Panic.add α0 ((Integer.of_Z 10) : i32.t) in
            assign β α1 in
          let* _ : M.Val unit :=
            let* _ : M.Val unit :=
              let* α0 : ref str.t :=
                M.read (mk_str "We added 10. `mut_value`: ") in
              let* α1 : ref str.t := M.read (mk_str "
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α2) in
              let* α4 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α3) in
              let* α5 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow m)) in
              let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α5 ] in
              let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α6) in
              let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α7) in
              let* α9 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
              let* α10 : unit := M.call (std.io.stdio._print α9) in
              M.alloc α10 in
            M.alloc tt in
          M.alloc tt) :
          M (M.Val unit)
      ] in
  M.read α0.
