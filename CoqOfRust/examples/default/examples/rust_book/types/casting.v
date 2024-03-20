(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let decimal = 65.4321_f32;

    // Error! No implicit conversion
    // let integer: u8 = decimal;
    // FIXME ^ Comment out this line

    // Explicit conversion
    let integer = decimal as u8;
    let character = integer as char;

    // Error! There are limitations in conversion rules.
    // A float cannot be directly converted to a char.
    // let character = decimal as char;
    // FIXME ^ Comment out this line

    println!("Casting: {} -> {} -> {}", decimal, integer, character);

    // when casting any value to an unsigned type, T,
    // T::MAX + 1 is added or subtracted until the value
    // fits into the new type

    // 1000 already fits in a u16
    println!("1000 as a u16 is: {}", 1000 as u16);

    // 1000 - 256 - 256 - 256 = 232
    // Under the hood, the first 8 least significant bits (LSB) are kept,
    // while the rest towards the most significant bit (MSB) get truncated.
    println!("1000 as a u8 is : {}", 1000 as u8);
    // -1 + 256 = 255
    println!("  -1 as a u8 is : {}", (-1i8) as u8);

    // For positive numbers, this is the same as the modulus
    println!("1000 mod 256 is : {}", 1000 % 256);

    // When casting to a signed type, the (bitwise) result is the same as
    // first casting to the corresponding unsigned type. If the most significant
    // bit of that value is 1, then the value is negative.

    // Unless it already fits, of course.
    println!(" 128 as a i16 is: {}", 128 as i16);

    // 128 as u8 -> 128, whose value in 8-bit two's complement representation is:
    println!(" 128 as a i8 is : {}", 128 as i8);

    // repeating the example above
    // 1000 as u8 -> 232
    println!("1000 as a u8 is : {}", 1000 as u8);
    // and the value of 232 in 8-bit two's complement representation is -24
    println!(" 232 as a i8 is : {}", 232 as i8);

    // Since Rust 1.45, the `as` keyword performs a *saturating cast*
    // when casting from float to int. If the floating point value exceeds
    // the upper bound or is less than the lower bound, the returned value
    // will be equal to the bound crossed.

    // 300.0 as u8 is 255
    println!(" 300.0 as u8 is : {}", 300.0_f32 as u8);
    // -100.0 as u8 is 0
    println!("-100.0 as u8 is : {}", -100.0_f32 as u8);
    // nan as u8 is 0
    println!("   nan as u8 is : {}", f32::NAN as u8);

    // This behavior incurs a small runtime cost and can be avoided
    // with unsafe methods, however the results might overflow and
    // return **unsound values**. Use these methods wisely:
    unsafe {
        // 300.0 as u8 is 44
        println!(" 300.0 as u8 is : {}", 300.0_f32.to_int_unchecked::<u8>());
        // -100.0 as u8 is 156
        println!(
            "-100.0 as u8 is : {}",
            (-100.0_f32).to_int_unchecked::<u8>()
        );
        // nan as u8 is 0
        println!("   nan as u8 is : {}", f32::NAN.to_int_unchecked::<u8>());
    }
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* decimal := M.copy UnsupportedLiteral in
    let* integer :=
      let* α0 := M.read decimal in
      M.alloc (M.rust_cast α0) in
    let* character :=
      let* α0 := M.read integer in
      M.alloc (M.rust_cast α0) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Casting: ") in
        let* α3 := M.read (mk_str " -> ") in
        let* α4 := M.read (mk_str " -> ") in
        let* α5 := M.read (mk_str "
") in
        let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
        let* α7 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "f32" ] in
        let* α8 := M.call_closure α7 [ decimal ] in
        let* α9 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u8" ] in
        let* α10 := M.call_closure α9 [ integer ] in
        let* α11 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "char" ] in
        let* α12 := M.call_closure α11 [ character ] in
        let* α13 := M.alloc (Value.Array [ α8; α10; α12 ]) in
        let* α14 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α6;
              M.pointer_coercion (* Unsize *) α13
            ] in
        let* α15 := M.call_closure α0 [ α14 ] in
        M.alloc α15 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "1000 as a u16 is: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u16" ] in
        let* α6 := M.alloc (Value.Integer Integer.U16 1000) in
        let* α7 := M.call_closure α5 [ M.use α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call_closure α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "1000 as a u8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u8" ] in
        let* α6 := M.alloc (Value.Integer Integer.U8 1000) in
        let* α7 := M.call_closure α5 [ M.use α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call_closure α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "  -1 as a u8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u8" ] in
        let* α6 := M.alloc (M.rust_cast (Value.Integer Integer.I8 (-1))) in
        let* α7 := M.call_closure α5 [ α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call_closure α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "1000 mod 256 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "i32" ] in
        let* α6 :=
          BinOp.Panic.rem
            (Value.Integer Integer.I32 1000)
            (Value.Integer Integer.I32 256) in
        let* α7 := M.alloc α6 in
        let* α8 := M.call_closure α5 [ α7 ] in
        let* α9 := M.alloc (Value.Array [ α8 ]) in
        let* α10 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α9
            ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str " 128 as a i16 is: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "i16" ] in
        let* α6 := M.alloc (Value.Integer Integer.I16 128) in
        let* α7 := M.call_closure α5 [ M.use α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call_closure α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str " 128 as a i8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "i8" ] in
        let* α6 := M.alloc (Value.Integer Integer.I8 128) in
        let* α7 := M.call_closure α5 [ M.use α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call_closure α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "1000 as a u8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u8" ] in
        let* α6 := M.alloc (Value.Integer Integer.U8 1000) in
        let* α7 := M.call_closure α5 [ M.use α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call_closure α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str " 232 as a i8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "i8" ] in
        let* α6 := M.alloc (Value.Integer Integer.I8 232) in
        let* α7 := M.call_closure α5 [ M.use α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call_closure α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str " 300.0 as u8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u8" ] in
        let* α6 := M.read UnsupportedLiteral in
        let* α7 := M.alloc (M.rust_cast α6) in
        let* α8 := M.call_closure α5 [ α7 ] in
        let* α9 := M.alloc (Value.Array [ α8 ]) in
        let* α10 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α9
            ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "-100.0 as u8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u8" ] in
        let* α6 := M.read UnsupportedLiteral in
        let* α7 := M.alloc (M.rust_cast α6) in
        let* α8 := M.call_closure α5 [ α7 ] in
        let* α9 := M.alloc (Value.Array [ α8 ]) in
        let* α10 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α9
            ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "   nan as u8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u8" ] in
        let* α6 := M.get_constant "core::f32::NAN" in
        let* α7 := M.read α6 in
        let* α8 := M.alloc (M.rust_cast α7) in
        let* α9 := M.call_closure α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str " 300.0 as u8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u8" ] in
        let* α6 :=
          M.get_associated_function
            (Ty.path "f32")
            "to_int_unchecked"
            [ Ty.path "u8" ] in
        let* α7 := M.read UnsupportedLiteral in
        let* α8 := M.call_closure α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call_closure α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call_closure α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "-100.0 as u8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u8" ] in
        let* α6 :=
          M.get_associated_function
            (Ty.path "f32")
            "to_int_unchecked"
            [ Ty.path "u8" ] in
        let* α7 := M.read UnsupportedLiteral in
        let* α8 := M.call_closure α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call_closure α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call_closure α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "   nan as u8 is : ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u8" ] in
        let* α6 :=
          M.get_associated_function
            (Ty.path "f32")
            "to_int_unchecked"
            [ Ty.path "u8" ] in
        let* α7 := M.get_constant "core::f32::NAN" in
        let* α8 := M.read α7 in
        let* α9 := M.call_closure α6 [ α8 ] in
        let* α10 := M.alloc α9 in
        let* α11 := M.call_closure α5 [ α10 ] in
        let* α12 := M.alloc (Value.Array [ α11 ]) in
        let* α13 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α12
            ] in
        let* α14 := M.call_closure α0 [ α13 ] in
        M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
