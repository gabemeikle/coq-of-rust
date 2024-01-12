(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Number.
  Inductive t : Set :=
  | Zero
  | One
  | Two.
End Number.

Module Color.
  Inductive t : Set :=
  | Red
  | Green
  | Blue.
End Color.

(*
fn main() {
    // `enums` can be cast as integers.
    println!("zero is {}", Number::Zero as i32);
    println!("one is {}", Number::One as i32);

    println!("roses are #{:06x}", Color::Red as i32);
    println!("violets are #{:06x}", Color::Blue as i32);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "zero is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : isize.t := M.read 0 in
      let* α6 : i32.t := M.cast α5 in
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
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "one is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : isize.t := M.read 1 in
      let* α6 : i32.t := M.cast α5 in
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
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "roses are #") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : isize.t := M.read enums_c_like.Color.Red in
      let* α6 : isize.t := M.read 0 in
      let* α7 : isize.t := BinOp.Panic.add α5 α6 in
      let* α8 : i32.t := M.cast α7 in
      let* α9 : M.Val i32.t := M.alloc α8 in
      let* α10 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_lower_hex"] (borrow α9)) in
      let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
      let* α12 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α11) in
      let* α13 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α12) in
      let* α14 : core.fmt.rt.Placeholder.t :=
        M.call
          (core.fmt.rt.Placeholder.t::["new"]
            ((Integer.of_Z 0) : usize.t)
            " "%char
            core.fmt.rt.Alignment.Unknown
            ((Integer.of_Z 8) : u32.t)
            core.fmt.rt.Count.Implied
            (core.fmt.rt.Count.Is ((Integer.of_Z 6) : usize.t))) in
      let* α15 : M.Val (array core.fmt.rt.Placeholder.t) := M.alloc [ α14 ] in
      let* α16 : M.Val (ref (array core.fmt.rt.Placeholder.t)) :=
        M.alloc (borrow α15) in
      let* α17 : ref (slice core.fmt.rt.Placeholder.t) :=
        M.read (pointer_coercion "Unsize" α16) in
      let* α18 : core.fmt.rt.UnsafeArg.t :=
        M.call core.fmt.rt.UnsafeArg.t::["new"] in
      let* α19 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1_formatted"] α4 α13 α17 α18) in
      let* α20 : unit := M.call (std.io.stdio._print α19) in
      M.alloc α20 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "violets are #") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : isize.t := M.read enums_c_like.Color.Blue in
      let* α6 : isize.t := M.read 0 in
      let* α7 : isize.t := BinOp.Panic.add α5 α6 in
      let* α8 : i32.t := M.cast α7 in
      let* α9 : M.Val i32.t := M.alloc α8 in
      let* α10 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_lower_hex"] (borrow α9)) in
      let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
      let* α12 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α11) in
      let* α13 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α12) in
      let* α14 : core.fmt.rt.Placeholder.t :=
        M.call
          (core.fmt.rt.Placeholder.t::["new"]
            ((Integer.of_Z 0) : usize.t)
            " "%char
            core.fmt.rt.Alignment.Unknown
            ((Integer.of_Z 8) : u32.t)
            core.fmt.rt.Count.Implied
            (core.fmt.rt.Count.Is ((Integer.of_Z 6) : usize.t))) in
      let* α15 : M.Val (array core.fmt.rt.Placeholder.t) := M.alloc [ α14 ] in
      let* α16 : M.Val (ref (array core.fmt.rt.Placeholder.t)) :=
        M.alloc (borrow α15) in
      let* α17 : ref (slice core.fmt.rt.Placeholder.t) :=
        M.read (pointer_coercion "Unsize" α16) in
      let* α18 : core.fmt.rt.UnsafeArg.t :=
        M.call core.fmt.rt.UnsafeArg.t::["new"] in
      let* α19 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1_formatted"] α4 α13 α17 α18) in
      let* α20 : unit := M.call (std.io.stdio._print α19) in
      M.alloc α20 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
