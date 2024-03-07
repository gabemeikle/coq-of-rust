(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // You can use escapes to write bytes by their hexadecimal values...
    let byte_escape = "I'm writing \x52\x75\x73\x74!";
    println!("What are you doing\x3F (\\x3F means ?) {}", byte_escape);

    // ...or Unicode code points.
    let unicode_codepoint = "\u{211D}";
    let character_name = "\"DOUBLE-STRUCK CAPITAL R\"";

    println!(
        "Unicode character {} (U+211D) is called {}",
        unicode_codepoint, character_name
    );

    let long_string = "String literals
                        can span multiple lines.
                        The linebreak and indentation here ->\
                        <- can be escaped too!";
    println!("{}", long_string);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* byte_escape := M.copy (mk_str "I'm writing Rust!") in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "What are you doing? (\x3F means ?) ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow byte_escape ] in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α4)
            ] in
        let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
        M.alloc α6 in
      M.alloc tt in
    let* unicode_codepoint := M.copy (mk_str (String.String "029" "")) in
    let* character_name := M.copy (mk_str """DOUBLE-STRUCK CAPITAL R""") in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "Unicode character ") in
        let* α1 := M.read (mk_str " (U+211D) is called ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α0; α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow unicode_codepoint ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow character_name ] in
        let* α6 := M.alloc [ α4; α5 ] in
        let* α7 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α3);
              pointer_coercion "Unsize" (borrow α6)
            ] in
        let* α8 := M.call (M.var "std::io::stdio::_print") [ α7 ] in
        M.alloc α8 in
      M.alloc tt in
    let* long_string :=
      M.copy
        (mk_str
          "String literals
                        can span multiple lines.
                        The linebreak and indentation here -><- can be escaped too!") in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow long_string ] in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α4)
            ] in
        let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
