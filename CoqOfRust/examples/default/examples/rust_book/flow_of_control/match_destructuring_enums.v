(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Color *)

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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* color :=
      M.alloc
        (match_destructuring_enums.Color.RGB
          ((Integer.of_Z 122) : Ty.path "u32")
          ((Integer.of_Z 17) : Ty.path "u32")
          ((Integer.of_Z 40) : Ty.path "u32")) in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "What color is it?
") in
        let* α1 := M.alloc [ α0 ] in
        let* α2 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" (borrow α1) ] in
        let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
        M.alloc α3 in
      M.alloc tt in
    let* α0 :=
      match_operator
        color
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.Red =>
              let* _ :=
                let* α0 := M.read (mk_str "The color is Red!
") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ pointer_coercion "Unsize" (borrow α1) ] in
                let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.Blue =>
              let* _ :=
                let* α0 := M.read (mk_str "The color is Blue!
") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ pointer_coercion "Unsize" (borrow α1) ] in
                let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.Green =>
              let* _ :=
                let* α0 := M.read (mk_str "The color is Green!
") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ pointer_coercion "Unsize" (borrow α1) ] in
                let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.RGB _ _ _ =>
              let γ0_0 :=
                (M.var "match_destructuring_enums::Color::Get_RGB_0") γ in
              let γ0_1 :=
                (M.var "match_destructuring_enums::Color::Get_RGB_1") γ in
              let γ0_2 :=
                (M.var "match_destructuring_enums::Color::Get_RGB_2") γ in
              let* r := M.copy γ0_0 in
              let* g := M.copy γ0_1 in
              let* b := M.copy γ0_2 in
              let* _ :=
                let* α0 := M.read (mk_str "Red: ") in
                let* α1 := M.read (mk_str ", green: ") in
                let* α2 := M.read (mk_str ", and blue: ") in
                let* α3 := M.read (mk_str "!
") in
                let* α4 := M.alloc [ α0; α1; α2; α3 ] in
                let* α5 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow r ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow g ] in
                let* α7 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow b ] in
                let* α8 := M.alloc [ α5; α6; α7 ] in
                let* α9 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      pointer_coercion "Unsize" (borrow α4);
                      pointer_coercion "Unsize" (borrow α8)
                    ] in
                let* α10 := M.call (M.var "std::io::stdio::_print") [ α9 ] in
                M.alloc α10 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.HSV _ _ _ =>
              let γ0_0 :=
                (M.var "match_destructuring_enums::Color::Get_HSV_0") γ in
              let γ0_1 :=
                (M.var "match_destructuring_enums::Color::Get_HSV_1") γ in
              let γ0_2 :=
                (M.var "match_destructuring_enums::Color::Get_HSV_2") γ in
              let* h := M.copy γ0_0 in
              let* s := M.copy γ0_1 in
              let* v := M.copy γ0_2 in
              let* _ :=
                let* α0 := M.read (mk_str "Hue: ") in
                let* α1 := M.read (mk_str ", saturation: ") in
                let* α2 := M.read (mk_str ", value: ") in
                let* α3 := M.read (mk_str "!
") in
                let* α4 := M.alloc [ α0; α1; α2; α3 ] in
                let* α5 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow h ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow s ] in
                let* α7 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow v ] in
                let* α8 := M.alloc [ α5; α6; α7 ] in
                let* α9 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      pointer_coercion "Unsize" (borrow α4);
                      pointer_coercion "Unsize" (borrow α8)
                    ] in
                let* α10 := M.call (M.var "std::io::stdio::_print") [ α9 ] in
                M.alloc α10 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.HSL _ _ _ =>
              let γ0_0 :=
                (M.var "match_destructuring_enums::Color::Get_HSL_0") γ in
              let γ0_1 :=
                (M.var "match_destructuring_enums::Color::Get_HSL_1") γ in
              let γ0_2 :=
                (M.var "match_destructuring_enums::Color::Get_HSL_2") γ in
              let* h := M.copy γ0_0 in
              let* s := M.copy γ0_1 in
              let* l := M.copy γ0_2 in
              let* _ :=
                let* α0 := M.read (mk_str "Hue: ") in
                let* α1 := M.read (mk_str ", saturation: ") in
                let* α2 := M.read (mk_str ", lightness: ") in
                let* α3 := M.read (mk_str "!
") in
                let* α4 := M.alloc [ α0; α1; α2; α3 ] in
                let* α5 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow h ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow s ] in
                let* α7 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow l ] in
                let* α8 := M.alloc [ α5; α6; α7 ] in
                let* α9 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      pointer_coercion "Unsize" (borrow α4);
                      pointer_coercion "Unsize" (borrow α8)
                    ] in
                let* α10 := M.call (M.var "std::io::stdio::_print") [ α9 ] in
                M.alloc α10 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.CMY _ _ _ =>
              let γ0_0 :=
                (M.var "match_destructuring_enums::Color::Get_CMY_0") γ in
              let γ0_1 :=
                (M.var "match_destructuring_enums::Color::Get_CMY_1") γ in
              let γ0_2 :=
                (M.var "match_destructuring_enums::Color::Get_CMY_2") γ in
              let* c := M.copy γ0_0 in
              let* m := M.copy γ0_1 in
              let* y := M.copy γ0_2 in
              let* _ :=
                let* α0 := M.read (mk_str "Cyan: ") in
                let* α1 := M.read (mk_str ", magenta: ") in
                let* α2 := M.read (mk_str ", yellow: ") in
                let* α3 := M.read (mk_str "!
") in
                let* α4 := M.alloc [ α0; α1; α2; α3 ] in
                let* α5 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow c ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow m ] in
                let* α7 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow y ] in
                let* α8 := M.alloc [ α5; α6; α7 ] in
                let* α9 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      pointer_coercion "Unsize" (borrow α4);
                      pointer_coercion "Unsize" (borrow α8)
                    ] in
                let* α10 := M.call (M.var "std::io::stdio::_print") [ α9 ] in
                M.alloc α10 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.CMYK _ _ _ _ =>
              let γ0_0 :=
                (M.var "match_destructuring_enums::Color::Get_CMYK_0") γ in
              let γ0_1 :=
                (M.var "match_destructuring_enums::Color::Get_CMYK_1") γ in
              let γ0_2 :=
                (M.var "match_destructuring_enums::Color::Get_CMYK_2") γ in
              let γ0_3 :=
                (M.var "match_destructuring_enums::Color::Get_CMYK_3") γ in
              let* c := M.copy γ0_0 in
              let* m := M.copy γ0_1 in
              let* y := M.copy γ0_2 in
              let* k := M.copy γ0_3 in
              let* _ :=
                let* α0 := M.read (mk_str "Cyan: ") in
                let* α1 := M.read (mk_str ", magenta: ") in
                let* α2 := M.read (mk_str ", yellow: ") in
                let* α3 := M.read (mk_str ", key (black): ") in
                let* α4 := M.read (mk_str "!
") in
                let* α5 := M.alloc [ α0; α1; α2; α3; α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow c ] in
                let* α7 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow m ] in
                let* α8 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow y ] in
                let* α9 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow k ] in
                let* α10 := M.alloc [ α6; α7; α8; α9 ] in
                let* α11 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      pointer_coercion "Unsize" (borrow α5);
                      pointer_coercion "Unsize" (borrow α10)
                    ] in
                let* α12 := M.call (M.var "std::io::stdio::_print") [ α11 ] in
                M.alloc α12 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple []
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
