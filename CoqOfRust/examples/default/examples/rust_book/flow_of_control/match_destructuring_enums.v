(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Color *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Red";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Blue";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Green";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "RGB";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "HSV";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "HSL";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "CMY";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "CMYK";
        item :=
          StructTuple
            [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      }
    ];
} *)

(*
fn main() {
    let color = Color::RGB(122, 17, 40);
    // TODO ^ Try different variants for `color`

    println!("What color is it?");
    // An `enum` can be destructured using a `match`.
    match color {
        Color::Red => println!("The color is Red!"),
        Color::Blue => println!("The color is Blue!"),
        Color::Green => println!("The color is Green!"),
        Color::RGB(r, g, b) => println!("Red: {}, green: {}, and blue: {}!", r, g, b),
        Color::HSV(h, s, v) => println!("Hue: {}, saturation: {}, value: {}!", h, s, v),
        Color::HSL(h, s, l) => println!("Hue: {}, saturation: {}, lightness: {}!", h, s, l),
        Color::CMY(c, m, y) => println!("Cyan: {}, magenta: {}, yellow: {}!", c, m, y),
        Color::CMYK(c, m, y, k) => println!(
            "Cyan: {}, magenta: {}, yellow: {}, key (black): {}!",
            c, m, y, k
        ),
        // Don't need another arm because all variants have been examined
    }
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* color :=
      M.alloc
        (Value.StructTuple
          "match_destructuring_enums::Color::RGB"
          [
            Value.Integer Integer.U32 122;
            Value.Integer Integer.U32 17;
            Value.Integer Integer.U32 40
          ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const" in
        let* α2 := M.read (mk_str "What color is it?
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call_closure α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* α0 :=
      match_operator
        color
        [
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 := M.read (mk_str "The color is Red!
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 :=
                M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call_closure α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 := M.read (mk_str "The color is Blue!
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 :=
                M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call_closure α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 := M.read (mk_str "The color is Green!
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 :=
                M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call_closure α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::RGB"
                0 in
            let* γ0_1 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::RGB"
                1 in
            let* γ0_2 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::RGB"
                2 in
            let* r := M.copy γ0_0 in
            let* g := M.copy γ0_1 in
            let* b := M.copy γ0_2 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "Red: ") in
              let* α3 := M.read (mk_str ", green: ") in
              let* α4 := M.read (mk_str ", and blue: ") in
              let* α5 := M.read (mk_str "!
") in
              let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
              let* α7 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α8 := M.call_closure α7 [ r ] in
              let* α9 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α10 := M.call_closure α9 [ g ] in
              let* α11 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α12 := M.call_closure α11 [ b ] in
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
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::HSV"
                0 in
            let* γ0_1 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::HSV"
                1 in
            let* γ0_2 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::HSV"
                2 in
            let* h := M.copy γ0_0 in
            let* s := M.copy γ0_1 in
            let* v := M.copy γ0_2 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "Hue: ") in
              let* α3 := M.read (mk_str ", saturation: ") in
              let* α4 := M.read (mk_str ", value: ") in
              let* α5 := M.read (mk_str "!
") in
              let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
              let* α7 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α8 := M.call_closure α7 [ h ] in
              let* α9 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α10 := M.call_closure α9 [ s ] in
              let* α11 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α12 := M.call_closure α11 [ v ] in
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
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::HSL"
                0 in
            let* γ0_1 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::HSL"
                1 in
            let* γ0_2 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::HSL"
                2 in
            let* h := M.copy γ0_0 in
            let* s := M.copy γ0_1 in
            let* l := M.copy γ0_2 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "Hue: ") in
              let* α3 := M.read (mk_str ", saturation: ") in
              let* α4 := M.read (mk_str ", lightness: ") in
              let* α5 := M.read (mk_str "!
") in
              let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
              let* α7 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α8 := M.call_closure α7 [ h ] in
              let* α9 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α10 := M.call_closure α9 [ s ] in
              let* α11 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α12 := M.call_closure α11 [ l ] in
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
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::CMY"
                0 in
            let* γ0_1 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::CMY"
                1 in
            let* γ0_2 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::CMY"
                2 in
            let* c := M.copy γ0_0 in
            let* m := M.copy γ0_1 in
            let* y := M.copy γ0_2 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "Cyan: ") in
              let* α3 := M.read (mk_str ", magenta: ") in
              let* α4 := M.read (mk_str ", yellow: ") in
              let* α5 := M.read (mk_str "!
") in
              let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
              let* α7 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α8 := M.call_closure α7 [ c ] in
              let* α9 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α10 := M.call_closure α9 [ m ] in
              let* α11 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α12 := M.call_closure α11 [ y ] in
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
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::CMYK"
                0 in
            let* γ0_1 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::CMYK"
                1 in
            let* γ0_2 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::CMYK"
                2 in
            let* γ0_3 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "match_destructuring_enums::Color::CMYK"
                3 in
            let* c := M.copy γ0_0 in
            let* m := M.copy γ0_1 in
            let* y := M.copy γ0_2 in
            let* k := M.copy γ0_3 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "Cyan: ") in
              let* α3 := M.read (mk_str ", magenta: ") in
              let* α4 := M.read (mk_str ", yellow: ") in
              let* α5 := M.read (mk_str ", key (black): ") in
              let* α6 := M.read (mk_str "!
") in
              let* α7 := M.alloc (Value.Array [ α2; α3; α4; α5; α6 ]) in
              let* α8 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α9 := M.call_closure α8 [ c ] in
              let* α10 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α11 := M.call_closure α10 [ m ] in
              let* α12 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α13 := M.call_closure α12 [ y ] in
              let* α14 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α15 := M.call_closure α14 [ k ] in
              let* α16 := M.alloc (Value.Array [ α9; α11; α13; α15 ]) in
              let* α17 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α7;
                    M.pointer_coercion (* Unsize *) α16
                  ] in
              let* α18 := M.call_closure α0 [ α17 ] in
              M.alloc α18 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
