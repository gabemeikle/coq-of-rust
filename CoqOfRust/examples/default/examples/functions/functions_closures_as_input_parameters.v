(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn apply<F>(f: F)
where
    // The closure takes no input and returns nothing.
    F: FnOnce(),
{
    // ^ TODO: Try changing this to `Fn` or `FnMut`.

    f();
}
*)
Definition apply
    {F : Set}
    {ℋ_0 : core.ops.function.FnOnce.Trait F (Args := unit)}
    (f : F)
    : M unit :=
  let* f := M.alloc f in
  let* _ : M.Val unit :=
    let* α0 : F := M.read f in
    let* α1 : unit :=
      M.call
        ((core.ops.function.FnOnce.call_once
            (Self := F)
            (Trait := ltac:(refine _)))
          α0
          tt) in
    M.alloc α1 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn apply_to_3<F>(f: F) -> i32
where
    // The closure takes an `i32` and returns an `i32`.
    F: Fn(i32) -> i32,
{
    f(3)
}
*)
Definition apply_to_3
    {F : Set}
    {ℋ_0 : core.ops.function.Fn.Trait F (Args := i32.t)}
    (f : F)
    : M i32.t :=
  let* f := M.alloc f in
  M.call
    ((core.ops.function.Fn.call (Self := F) (Trait := ltac:(refine _)))
      (borrow f)
      (Integer.of_Z 3)).

(*
fn main() {
    use std::mem;

    let greeting = "hello";
    // A non-copy type.
    // `to_owned` creates owned data from borrowed one
    let mut farewell = "goodbye".to_owned();

    // Capture 2 variables: `greeting` by reference and
    // `farewell` by value.
    let diary = || {
        // `greeting` is by reference: requires `Fn`.
        println!("I said {}.", greeting);

        // Mutation forces `farewell` to be captured by
        // mutable reference. Now requires `FnMut`.
        farewell.push_str("!!!");
        println!("Then I screamed {}.", farewell);
        println!("Now I can sleep. zzzzz");

        // Manually calling drop forces `farewell` to
        // be captured by value. Now requires `FnOnce`.
        mem::drop(farewell);
    };

    // Call the function which applies the closure.
    apply(diary);

    // `double` satisfies `apply_to_3`'s trait bound
    let double = |x| 2 * x;

    println!("3 doubled: {}", apply_to_3(double));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* greeting : M.Val (ref str.t) := M.copy (mk_str "hello") in
  let* farewell : M.Val alloc.string.String.t :=
    let* α0 : ref str.t := M.read (mk_str "goodbye") in
    let* α1 : alloc.string.String.t :=
      M.call
        ((alloc.borrow.ToOwned.to_owned
            (Self := str.t)
            (Trait := ltac:(refine _)))
          α0) in
    M.alloc α1 in
  let* diary : M.Val (unit -> M unit) :=
    M.alloc
      ((let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "I said ") in
          let* α1 : ref str.t := M.read (mk_str ".
") in
          let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
          let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
          let* α4 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α3) in
          let* α5 : core.fmt.rt.Argument.t :=
            M.call
              (core.fmt.rt.Argument.t::["new_display"] (borrow greeting)) in
          let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
          let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc (borrow α6) in
          let* α8 : ref (slice core.fmt.rt.Argument.t) :=
            M.read (pointer_coercion "Unsize" α7) in
          let* α9 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
          let* α10 : unit := M.call (std.io.stdio._print α9) in
          M.alloc α10 in
        M.alloc tt in
      let* _ : M.Val unit :=
        let* α0 : ref str.t := M.read (mk_str "!!!") in
        let* α1 : unit :=
          M.call
            (alloc.string.String.t::["push_str"] (borrow_mut farewell) α0) in
        M.alloc α1 in
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "Then I screamed ") in
          let* α1 : ref str.t := M.read (mk_str ".
") in
          let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
          let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
          let* α4 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α3) in
          let* α5 : core.fmt.rt.Argument.t :=
            M.call
              (core.fmt.rt.Argument.t::["new_display"] (borrow farewell)) in
          let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
          let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc (borrow α6) in
          let* α8 : ref (slice core.fmt.rt.Argument.t) :=
            M.read (pointer_coercion "Unsize" α7) in
          let* α9 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
          let* α10 : unit := M.call (std.io.stdio._print α9) in
          M.alloc α10 in
        M.alloc tt in
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "Now I can sleep. zzzzz
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
      let* _ : M.Val unit :=
        let* α0 : alloc.string.String.t := M.read farewell in
        let* α1 : unit := M.call (core.mem.drop α0) in
        M.alloc α1 in
      let* α0 : M.Val unit := M.alloc tt in
      M.read α0) :
      M unit) in
  let* _ : M.Val unit :=
    let* α0 : unit -> M unit := M.read diary in
    let* α1 : unit :=
      M.call (functions_closures_as_input_parameters.apply α0) in
    M.alloc α1 in
  let* double : M.Val (i32.t -> M i32.t) :=
    M.alloc
      (fun (x : i32.t) =>
        (let* x := M.alloc x in
        let* α0 : i32.t := M.read x in
        BinOp.Panic.mul (Integer.of_Z 2) α0) :
        M i32.t) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "3 doubled: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : i32.t -> M i32.t := M.read double in
      let* α6 : i32.t :=
        M.call (functions_closures_as_input_parameters.apply_to_3 α5) in
      let* α7 : M.Val i32.t := M.alloc α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
      let* α9 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8 ] in
      let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α9) in
      let* α11 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α10) in
      let* α12 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
      let* α13 : unit := M.call (std.io.stdio._print α12) in
      M.alloc α13 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
