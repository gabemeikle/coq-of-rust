(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Integer addition
    println!("1 + 2 = {}", 1u32 + 2);

    // Integer subtraction
    println!("1 - 2 = {}", 1i32 - 2);
    // TODO ^ Try changing `1i32` to `1u32` to see why the type is important

    // Short-circuiting boolean logic
    println!("true AND false is {}", true && false);
    println!("true OR false is {}", true || false);
    println!("NOT true is {}", !true);

    // Bitwise operations
    println!("0011 AND 0101 is {:04b}", 0b0011u32 & 0b0101);
    println!("0011 OR 0101 is {:04b}", 0b0011u32 | 0b0101);
    println!("0011 XOR 0101 is {:04b}", 0b0011u32 ^ 0b0101);
    println!("1 << 5 is {}", 1u32 << 5);
    println!("0x80 >> 2 is 0x{:x}", 0x80u32 >> 2);

    // Use underscores to improve readability!
    println!("One million is written as {}", 1_000_000u32);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "1 + 2 = "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val u32.t := M.alloc 1 in
        let* α8 : M.Val u32.t := M.alloc 2 in
        let* α9 : M.Val u32.t := BinOp.add α7 α8 in
        let* α10 : ref u32.t := borrow α9 in
        let* α11 : M.Val u32.t := deref α10 in
        let* α12 : ref u32.t := borrow α11 in
        let* α13 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α12 in
        let* α14 : M.Val core.fmt.rt.Argument.t := M.alloc α13 in
        let* α15 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α14 ] in
        let* α16 : ref (array core.fmt.rt.Argument.t) := borrow α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := deref α16 in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α18 in
        let* α20 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α19 in
        let* α21 : ref (slice core.fmt.rt.Argument.t) := M.read α20 in
        let* α22 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α21 in
        let* α23 : unit := std.io.stdio._print α22 in
        M.alloc α23 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "1 - 2 = "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val i32.t := M.alloc 1 in
        let* α8 : M.Val i32.t := M.alloc 2 in
        let* α9 : M.Val i32.t := BinOp.sub α7 α8 in
        let* α10 : ref i32.t := borrow α9 in
        let* α11 : M.Val i32.t := deref α10 in
        let* α12 : ref i32.t := borrow α11 in
        let* α13 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α12 in
        let* α14 : M.Val core.fmt.rt.Argument.t := M.alloc α13 in
        let* α15 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α14 ] in
        let* α16 : ref (array core.fmt.rt.Argument.t) := borrow α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := deref α16 in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α18 in
        let* α20 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α19 in
        let* α21 : ref (slice core.fmt.rt.Argument.t) := M.read α20 in
        let* α22 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α21 in
        let* α23 : unit := std.io.stdio._print α22 in
        M.alloc α23 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "true AND false is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val bool.t := M.alloc true in
        let* α8 : M.Val bool.t := M.alloc false in
        let* α9 : M.Val bool.t := BinOp.and α7 α8 in
        let* α10 : ref bool.t := borrow α9 in
        let* α11 : M.Val bool.t := deref α10 in
        let* α12 : ref bool.t := borrow α11 in
        let* α13 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α12 in
        let* α14 : M.Val core.fmt.rt.Argument.t := M.alloc α13 in
        let* α15 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α14 ] in
        let* α16 : ref (array core.fmt.rt.Argument.t) := borrow α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := deref α16 in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α18 in
        let* α20 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α19 in
        let* α21 : ref (slice core.fmt.rt.Argument.t) := M.read α20 in
        let* α22 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α21 in
        let* α23 : unit := std.io.stdio._print α22 in
        M.alloc α23 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "true OR false is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val bool.t := M.alloc true in
        let* α8 : M.Val bool.t := M.alloc false in
        let* α9 : M.Val bool.t := BinOp.or α7 α8 in
        let* α10 : ref bool.t := borrow α9 in
        let* α11 : M.Val bool.t := deref α10 in
        let* α12 : ref bool.t := borrow α11 in
        let* α13 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α12 in
        let* α14 : M.Val core.fmt.rt.Argument.t := M.alloc α13 in
        let* α15 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α14 ] in
        let* α16 : ref (array core.fmt.rt.Argument.t) := borrow α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := deref α16 in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α18 in
        let* α20 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α19 in
        let* α21 : ref (slice core.fmt.rt.Argument.t) := M.read α20 in
        let* α22 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α21 in
        let* α23 : unit := std.io.stdio._print α22 in
        M.alloc α23 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "NOT true is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val bool.t := M.alloc true in
        let* α8 : M.Val bool.t := UnOp.not α7 in
        let* α9 : ref bool.t := borrow α8 in
        let* α10 : M.Val bool.t := deref α9 in
        let* α11 : ref bool.t := borrow α10 in
        let* α12 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α11 in
        let* α13 : M.Val core.fmt.rt.Argument.t := M.alloc α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α13 ] in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (array core.fmt.rt.Argument.t) := deref α15 in
        let* α17 : ref (array core.fmt.rt.Argument.t) := borrow α16 in
        let* α18 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α17 in
        let* α19 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α18 in
        let* α20 : ref (slice core.fmt.rt.Argument.t) := M.read α19 in
        let* α21 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α20 in
        let* α22 : unit := std.io.stdio._print α21 in
        M.alloc α22 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "0011 AND 0101 is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val u32.t := M.alloc 3 in
        let* α8 : M.Val u32.t := M.alloc 5 in
        let* α9 : M.Val u32.t := BinOp.bit_and α7 α8 in
        let* α10 : ref u32.t := borrow α9 in
        let* α11 : M.Val u32.t := deref α10 in
        let* α12 : ref u32.t := borrow α11 in
        let* α13 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_binary"] α12 in
        let* α14 : M.Val core.fmt.rt.Argument.t := M.alloc α13 in
        let* α15 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α14 ] in
        let* α16 : ref (array core.fmt.rt.Argument.t) := borrow α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := deref α16 in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α18 in
        let* α20 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α19 in
        let* α21 : ref (slice core.fmt.rt.Argument.t) := M.read α20 in
        let* α22 : M.Val usize.t := M.alloc 0 in
        let* α23 : usize.t := M.read α22 in
        let* α24 : M.Val char.t := M.alloc " "%char in
        let* α25 : char.t := M.read α24 in
        let* α26 : M.Val u32.t := M.alloc 8 in
        let* α27 : u32.t := M.read α26 in
        let* α28 : M.Val usize.t := M.alloc 4 in
        let* α29 : usize.t := M.read α28 in
        let* α30 : core.fmt.rt.Count.t := "unimplemented parent_kind" α29 in
        let* α31 : core.fmt.rt.Placeholder.t :=
          core.fmt.rt.Placeholder.t::["new"]
            α23
            α25
            core.fmt.rt.Alignment.Unknown
            α27
            core.fmt.rt.Count.Implied
            α30 in
        let* α32 : M.Val core.fmt.rt.Placeholder.t := M.alloc α31 in
        let* α33 : M.Val (array core.fmt.rt.Placeholder.t) := M.alloc [ α32 ] in
        let* α34 : ref (array core.fmt.rt.Placeholder.t) := borrow α33 in
        let* α35 : M.Val (array core.fmt.rt.Placeholder.t) := deref α34 in
        let* α36 : ref (array core.fmt.rt.Placeholder.t) := borrow α35 in
        let* α37 : M.Val (ref (array core.fmt.rt.Placeholder.t)) :=
          M.alloc α36 in
        let* α38 : M.Val (ref (slice core.fmt.rt.Placeholder.t)) :=
          pointer_coercion "Unsize" α37 in
        let* α39 : ref (slice core.fmt.rt.Placeholder.t) := M.read α38 in
        let* α0 : core.fmt.rt.UnsafeArg.t := core.fmt.rt.UnsafeArg.t::["new"] in
        let* α40 : M.Val core.fmt.rt.UnsafeArg.t := M.alloc α0 in
        let* α41 : core.fmt.rt.UnsafeArg.t := M.read α40 in
        let* α42 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1_formatted"] α6 α21 α39 α41 in
        let* α43 : unit := std.io.stdio._print α42 in
        M.alloc α43 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "0011 OR 0101 is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val u32.t := M.alloc 3 in
        let* α8 : M.Val u32.t := M.alloc 5 in
        let* α9 : M.Val u32.t := BinOp.bit_or α7 α8 in
        let* α10 : ref u32.t := borrow α9 in
        let* α11 : M.Val u32.t := deref α10 in
        let* α12 : ref u32.t := borrow α11 in
        let* α13 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_binary"] α12 in
        let* α14 : M.Val core.fmt.rt.Argument.t := M.alloc α13 in
        let* α15 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α14 ] in
        let* α16 : ref (array core.fmt.rt.Argument.t) := borrow α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := deref α16 in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α18 in
        let* α20 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α19 in
        let* α21 : ref (slice core.fmt.rt.Argument.t) := M.read α20 in
        let* α22 : M.Val usize.t := M.alloc 0 in
        let* α23 : usize.t := M.read α22 in
        let* α24 : M.Val char.t := M.alloc " "%char in
        let* α25 : char.t := M.read α24 in
        let* α26 : M.Val u32.t := M.alloc 8 in
        let* α27 : u32.t := M.read α26 in
        let* α28 : M.Val usize.t := M.alloc 4 in
        let* α29 : usize.t := M.read α28 in
        let* α30 : core.fmt.rt.Count.t := "unimplemented parent_kind" α29 in
        let* α31 : core.fmt.rt.Placeholder.t :=
          core.fmt.rt.Placeholder.t::["new"]
            α23
            α25
            core.fmt.rt.Alignment.Unknown
            α27
            core.fmt.rt.Count.Implied
            α30 in
        let* α32 : M.Val core.fmt.rt.Placeholder.t := M.alloc α31 in
        let* α33 : M.Val (array core.fmt.rt.Placeholder.t) := M.alloc [ α32 ] in
        let* α34 : ref (array core.fmt.rt.Placeholder.t) := borrow α33 in
        let* α35 : M.Val (array core.fmt.rt.Placeholder.t) := deref α34 in
        let* α36 : ref (array core.fmt.rt.Placeholder.t) := borrow α35 in
        let* α37 : M.Val (ref (array core.fmt.rt.Placeholder.t)) :=
          M.alloc α36 in
        let* α38 : M.Val (ref (slice core.fmt.rt.Placeholder.t)) :=
          pointer_coercion "Unsize" α37 in
        let* α39 : ref (slice core.fmt.rt.Placeholder.t) := M.read α38 in
        let* α0 : core.fmt.rt.UnsafeArg.t := core.fmt.rt.UnsafeArg.t::["new"] in
        let* α40 : M.Val core.fmt.rt.UnsafeArg.t := M.alloc α0 in
        let* α41 : core.fmt.rt.UnsafeArg.t := M.read α40 in
        let* α42 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1_formatted"] α6 α21 α39 α41 in
        let* α43 : unit := std.io.stdio._print α42 in
        M.alloc α43 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "0011 XOR 0101 is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val u32.t := M.alloc 3 in
        let* α8 : M.Val u32.t := M.alloc 5 in
        let* α9 : M.Val u32.t := BinOp.bit_xor α7 α8 in
        let* α10 : ref u32.t := borrow α9 in
        let* α11 : M.Val u32.t := deref α10 in
        let* α12 : ref u32.t := borrow α11 in
        let* α13 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_binary"] α12 in
        let* α14 : M.Val core.fmt.rt.Argument.t := M.alloc α13 in
        let* α15 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α14 ] in
        let* α16 : ref (array core.fmt.rt.Argument.t) := borrow α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := deref α16 in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α18 in
        let* α20 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α19 in
        let* α21 : ref (slice core.fmt.rt.Argument.t) := M.read α20 in
        let* α22 : M.Val usize.t := M.alloc 0 in
        let* α23 : usize.t := M.read α22 in
        let* α24 : M.Val char.t := M.alloc " "%char in
        let* α25 : char.t := M.read α24 in
        let* α26 : M.Val u32.t := M.alloc 8 in
        let* α27 : u32.t := M.read α26 in
        let* α28 : M.Val usize.t := M.alloc 4 in
        let* α29 : usize.t := M.read α28 in
        let* α30 : core.fmt.rt.Count.t := "unimplemented parent_kind" α29 in
        let* α31 : core.fmt.rt.Placeholder.t :=
          core.fmt.rt.Placeholder.t::["new"]
            α23
            α25
            core.fmt.rt.Alignment.Unknown
            α27
            core.fmt.rt.Count.Implied
            α30 in
        let* α32 : M.Val core.fmt.rt.Placeholder.t := M.alloc α31 in
        let* α33 : M.Val (array core.fmt.rt.Placeholder.t) := M.alloc [ α32 ] in
        let* α34 : ref (array core.fmt.rt.Placeholder.t) := borrow α33 in
        let* α35 : M.Val (array core.fmt.rt.Placeholder.t) := deref α34 in
        let* α36 : ref (array core.fmt.rt.Placeholder.t) := borrow α35 in
        let* α37 : M.Val (ref (array core.fmt.rt.Placeholder.t)) :=
          M.alloc α36 in
        let* α38 : M.Val (ref (slice core.fmt.rt.Placeholder.t)) :=
          pointer_coercion "Unsize" α37 in
        let* α39 : ref (slice core.fmt.rt.Placeholder.t) := M.read α38 in
        let* α0 : core.fmt.rt.UnsafeArg.t := core.fmt.rt.UnsafeArg.t::["new"] in
        let* α40 : M.Val core.fmt.rt.UnsafeArg.t := M.alloc α0 in
        let* α41 : core.fmt.rt.UnsafeArg.t := M.read α40 in
        let* α42 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1_formatted"] α6 α21 α39 α41 in
        let* α43 : unit := std.io.stdio._print α42 in
        M.alloc α43 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "1 << 5 is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val u32.t := M.alloc 1 in
        let* α8 : M.Val i32.t := M.alloc 5 in
        let* α9 : M.Val u32.t := BinOp.shl α7 α8 in
        let* α10 : ref u32.t := borrow α9 in
        let* α11 : M.Val u32.t := deref α10 in
        let* α12 : ref u32.t := borrow α11 in
        let* α13 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α12 in
        let* α14 : M.Val core.fmt.rt.Argument.t := M.alloc α13 in
        let* α15 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α14 ] in
        let* α16 : ref (array core.fmt.rt.Argument.t) := borrow α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := deref α16 in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α18 in
        let* α20 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α19 in
        let* α21 : ref (slice core.fmt.rt.Argument.t) := M.read α20 in
        let* α22 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α21 in
        let* α23 : unit := std.io.stdio._print α22 in
        M.alloc α23 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "0x80 >> 2 is 0x"; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val u32.t := M.alloc 128 in
        let* α8 : M.Val i32.t := M.alloc 2 in
        let* α9 : M.Val u32.t := BinOp.shr α7 α8 in
        let* α10 : ref u32.t := borrow α9 in
        let* α11 : M.Val u32.t := deref α10 in
        let* α12 : ref u32.t := borrow α11 in
        let* α13 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_lower_hex"] α12 in
        let* α14 : M.Val core.fmt.rt.Argument.t := M.alloc α13 in
        let* α15 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α14 ] in
        let* α16 : ref (array core.fmt.rt.Argument.t) := borrow α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := deref α16 in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α18 in
        let* α20 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α19 in
        let* α21 : ref (slice core.fmt.rt.Argument.t) := M.read α20 in
        let* α22 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α21 in
        let* α23 : unit := std.io.stdio._print α22 in
        M.alloc α23 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "One million is written as 1000000
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ ] in
        let* α8 : ref (array core.fmt.rt.Argument.t) := borrow α7 in
        let* α9 : M.Val (array core.fmt.rt.Argument.t) := deref α8 in
        let* α10 : ref (array core.fmt.rt.Argument.t) := borrow α9 in
        let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α10 in
        let* α12 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α11 in
        let* α13 : ref (slice core.fmt.rt.Argument.t) := M.read α12 in
        let* α14 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α13 in
        let* α15 : unit := std.io.stdio._print α14 in
        M.alloc α15 in
      M.alloc tt in
    M.alloc tt).
