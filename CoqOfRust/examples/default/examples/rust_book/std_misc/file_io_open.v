(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Create a path to the desired file
    let path = Path::new("hello.txt");
    let display = path.display();

    // Open the path in read-only mode, returns `io::Result<File>`
    let mut file = match File::open(&path) {
        Err(why) => panic!("couldn't open {}: {}", display, why),
        Ok(file) => file,
    };

    // Read the file contents into a string, returns `io::Result<usize>`
    let mut s = String::new();
    match file.read_to_string(&mut s) {
        Err(why) => panic!("couldn't read {}: {}", display, why),
        Ok(_) => print!("{} contains:\n{}", display, s),
    }

    // `file` goes out of scope, and the "hello.txt" file gets closed
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* path :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "std::path::Path")
          "new"
          [ Ty.path "str" ] in
      let* α1 := M.read (mk_str "hello.txt") in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* display :=
      let* α0 :=
        M.get_associated_function (Ty.path "std::path::Path") "display" [] in
      let* α1 := M.read path in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* file :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "std::fs::File")
          "open"
          [
            Ty.apply
              (Ty.path "&")
              [ Ty.apply (Ty.path "&") [ Ty.path "std::path::Path" ] ]
          ] in
      let* α1 := M.call_closure α0 [ path ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        match_operator
          α2
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::result::Result::Err"
                  0 in
              let* why := M.copy γ0_0 in
              let* α0 := M.get_function "core::panicking::panic_fmt" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "couldn't open ") in
              let* α3 := M.read (mk_str ": ") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "std::path::Display" ] in
              let* α6 := M.call_closure α5 [ display ] in
              let* α7 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "std::io::error::Error" ] in
              let* α8 := M.call_closure α7 [ why ] in
              let* α9 := M.alloc (Value.Array [ α6; α8 ]) in
              let* α10 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α4;
                    M.pointer_coercion (* Unsize *) α9
                  ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              let* α12 := M.never_to_any α11 in
              M.alloc α12;
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::result::Result::Ok"
                  0 in
              let* file := M.copy γ0_0 in
              M.pure file
          ] in
      M.copy α3 in
    let* s :=
      let* α0 :=
        M.get_associated_function (Ty.path "alloc::string::String") "new" [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* α0 :=
      M.get_trait_method
        "std::io::Read"
        (Ty.path "std::fs::File")
        []
        "read_to_string"
        [] in
    let* α1 := M.call_closure α0 [ file; s ] in
    let* α2 := M.alloc α1 in
    let* α0 :=
      match_operator
        α2
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Err"
                0 in
            let* why := M.copy γ0_0 in
            let* α0 := M.get_function "core::panicking::panic_fmt" [] in
            let* α1 :=
              M.get_associated_function
                (Ty.path "core::fmt::Arguments")
                "new_v1"
                [] in
            let* α2 := M.read (mk_str "couldn't read ") in
            let* α3 := M.read (mk_str ": ") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            let* α5 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "std::path::Display" ] in
            let* α6 := M.call_closure α5 [ display ] in
            let* α7 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "std::io::error::Error" ] in
            let* α8 := M.call_closure α7 [ why ] in
            let* α9 := M.alloc (Value.Array [ α6; α8 ]) in
            let* α10 :=
              M.call_closure
                α1
                [
                  M.pointer_coercion (* Unsize *) α4;
                  M.pointer_coercion (* Unsize *) α9
                ] in
            let* α11 := M.call_closure α0 [ α10 ] in
            let* α12 := M.never_to_any α11 in
            M.alloc α12;
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Ok"
                0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "") in
              let* α3 := M.read (mk_str " contains:
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "std::path::Display" ] in
              let* α6 := M.call_closure α5 [ display ] in
              let* α7 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "alloc::string::String" ] in
              let* α8 := M.call_closure α7 [ s ] in
              let* α9 := M.alloc (Value.Array [ α6; α8 ]) in
              let* α10 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α4;
                    M.pointer_coercion (* Unsize *) α9
                  ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              M.alloc α11 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
