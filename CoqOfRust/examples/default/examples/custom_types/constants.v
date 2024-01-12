(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition LANGUAGE : M.Val (ref str.t) := M.run (M.pure (mk_str "Rust")).

Definition THRESHOLD : M.Val i32.t :=
  M.run (M.alloc ((Integer.of_Z 10) : i32.t)).

(*
fn is_big(n: i32) -> bool {
    // Access constant in some function
    n > THRESHOLD
}
*)
Definition is_big (n : i32.t) : M bool.t :=
  let* n := M.alloc n in
  let* α0 : i32.t := M.read n in
  let* α1 : i32.t := M.read constants.THRESHOLD in
  M.pure (BinOp.Pure.gt α0 α1).

(*
fn main() {
    let n = 16;

    // Access constant in the main thread
    println!("This is {}", LANGUAGE);
    println!("The threshold is {}", THRESHOLD);
    println!("{} is {}", n, if is_big(n) { "big" } else { "small" });

    // Error! Cannot modify a `const`.
    // THRESHOLD = 5;
    // FIXME ^ Comment out this line
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* n : M.Val i32.t := M.alloc ((Integer.of_Z 16) : i32.t) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "This is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : ref (ref str.t) := M.read constants.LANGUAGE in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] α5) in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α7) in
      let* α9 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α8) in
      let* α10 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α9) in
      let* α11 : unit := M.call (std.io.stdio._print α10) in
      M.alloc α11 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "The threshold is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow constants.THRESHOLD)) in
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
      let* α0 : ref str.t := M.read (mk_str "") in
      let* α1 : ref str.t := M.read (mk_str " is ") in
      let* α2 : ref str.t := M.read (mk_str "
") in
      let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
      let* α4 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α3) in
      let* α5 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α4) in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow n)) in
      let* α7 : i32.t := M.read n in
      let* α8 : bool.t := M.call (constants.is_big α7) in
      let* α9 : M.Val bool.t := M.alloc α8 in
      let* α10 : bool.t := M.read (use α9) in
      let* α11 : M.Val (ref str.t) :=
        if α10 then
          M.pure (mk_str "big")
        else
          let* α0 : ref str.t := M.read (mk_str "small") in
          M.alloc α0 in
      let* α12 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α11)) in
      let* α13 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6; α12 ] in
      let* α14 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α13) in
      let* α15 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α14) in
      let* α16 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α5 α15) in
      let* α17 : unit := M.call (std.io.stdio._print α16) in
      M.alloc α17 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
