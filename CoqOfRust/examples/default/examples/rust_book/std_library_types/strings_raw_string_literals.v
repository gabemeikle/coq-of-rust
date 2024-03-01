(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let raw_str = r"Escapes don't work here: \x3F \u{211D}";
    println!("{}", raw_str);

    // If you need quotes in a raw string, add a pair of #s
    let quotes = r#"And then I said: "There is no escape!""#;
    println!("{}", quotes);

    // If you need "# in your string, just use more #s in the delimiter.
    // You can use up to 65535 #s.
    let longer_delimiter = r###"A string with "# in it. And even "##!"###;
    println!("{}", longer_delimiter);
}
"
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* raw_str : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
      M.copy (mk_str "Escapes don't work here: \x3F \u{211D}") in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow raw_str)) in
        let* α4 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α3 ] in
        let* α5 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 : Ty.tuple := M.call (std.io.stdio._print α5) in
        M.alloc α6 in
      M.alloc tt in
    let* quotes : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
      M.copy (mk_str "And then I said: ""There is no escape!""") in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow quotes)) in
        let* α4 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α3 ] in
        let* α5 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 : Ty.tuple := M.call (std.io.stdio._print α5) in
        M.alloc α6 in
      M.alloc tt in
    let* longer_delimiter : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
      M.copy (mk_str "A string with ""# in it. And even ""##!") in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow longer_delimiter)) in
        let* α4 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α3 ] in
        let* α5 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 : Ty.tuple := M.call (std.io.stdio._print α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
