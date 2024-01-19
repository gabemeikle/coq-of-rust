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
  
  Definition Red_discriminant : isize.t := Integer.of_Z 16711680.
  Definition Green_discriminant : isize.t := Integer.of_Z 65280.
  Definition Blue_discriminant : isize.t := Integer.of_Z 255.
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
      let* α3 : M.Val i32.t :=
        M.alloc (rust_cast ((Integer.of_Z 0) : isize.t)) in
      let* α4 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α3)) in
      let* α5 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α4 ] in
      let* α6 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α5))) in
      let* α7 : unit := M.call (std.io.stdio._print α6) in
      M.alloc α7 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "one is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val i32.t :=
        M.alloc (rust_cast ((Integer.of_Z 1) : isize.t)) in
      let* α4 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α3)) in
      let* α5 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α4 ] in
      let* α6 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α5))) in
      let* α7 : unit := M.call (std.io.stdio._print α6) in
      M.alloc α7 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "roses are #") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : isize.t :=
        BinOp.Panic.add
          enums_c_like.Color.Red_discriminant
          ((Integer.of_Z 0) : isize.t) in
      let* α4 : M.Val i32.t := M.alloc (rust_cast α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_lower_hex"] (borrow α4)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : core.fmt.rt.Placeholder.t :=
        M.call
          (core.fmt.rt.Placeholder.t::["new"]
            ((Integer.of_Z 0) : usize.t)
            " "%char
            core.fmt.rt.Alignment.Unknown
            ((Integer.of_Z 8) : u32.t)
            core.fmt.rt.Count.Implied
            (core.fmt.rt.Count.Is ((Integer.of_Z 6) : usize.t))) in
      let* α8 : M.Val (array core.fmt.rt.Placeholder.t) := M.alloc [ α7 ] in
      let* α9 : core.fmt.rt.UnsafeArg.t :=
        M.call core.fmt.rt.UnsafeArg.t::["new"] in
      let* α10 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1_formatted"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α6))
            (pointer_coercion "Unsize" (borrow α8))
            α9) in
      let* α11 : unit := M.call (std.io.stdio._print α10) in
      M.alloc α11 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "violets are #") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : isize.t :=
        BinOp.Panic.add
          enums_c_like.Color.Blue_discriminant
          ((Integer.of_Z 0) : isize.t) in
      let* α4 : M.Val i32.t := M.alloc (rust_cast α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_lower_hex"] (borrow α4)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : core.fmt.rt.Placeholder.t :=
        M.call
          (core.fmt.rt.Placeholder.t::["new"]
            ((Integer.of_Z 0) : usize.t)
            " "%char
            core.fmt.rt.Alignment.Unknown
            ((Integer.of_Z 8) : u32.t)
            core.fmt.rt.Count.Implied
            (core.fmt.rt.Count.Is ((Integer.of_Z 6) : usize.t))) in
      let* α8 : M.Val (array core.fmt.rt.Placeholder.t) := M.alloc [ α7 ] in
      let* α9 : core.fmt.rt.UnsafeArg.t :=
        M.call core.fmt.rt.UnsafeArg.t::["new"] in
      let* α10 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1_formatted"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α6))
            (pointer_coercion "Unsize" (borrow α8))
            α9) in
      let* α11 : unit := M.call (std.io.stdio._print α10) in
      M.alloc α11 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
