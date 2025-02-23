(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Create a `Path` from an `&'static str`
    let path = Path::new(".");

    // The `display` method returns a `Display`able structure
    let _display = path.display();

    // `join` merges a path with a byte container using the OS specific
    // separator, and returns a `PathBuf`
    let mut new_path = path.join("a").join("b");

    // `push` extends the `PathBuf` with a `&Path`
    new_path.push("c");
    new_path.push("myfile.tar.gz");

    // `set_file_name` updates the file name of the `PathBuf`
    new_path.set_file_name("package.tgz");

    // Convert the `PathBuf` into a string slice
    match new_path.to_str() {
        None => panic!("new path is not a valid UTF-8 sequence"),
        Some(s) => println!("new path is {}", s),
    }
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
      let* α1 := M.read (mk_str ".") in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* _display :=
      let* α0 :=
        M.get_associated_function (Ty.path "std::path::Path") "display" [] in
      let* α1 := M.read path in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* new_path :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "std::path::Path")
          "join"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α1 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          (Ty.path "std::path::PathBuf")
          []
          "deref"
          [] in
      let* α2 :=
        M.get_associated_function
          (Ty.path "std::path::Path")
          "join"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α3 := M.read path in
      let* α4 := M.read (mk_str "a") in
      let* α5 := M.call_closure α2 [ α3; α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 := M.call_closure α1 [ α6 ] in
      let* α8 := M.read (mk_str "b") in
      let* α9 := M.call_closure α0 [ α7; α8 ] in
      M.alloc α9 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "std::path::PathBuf")
          "push"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α1 := M.read (mk_str "c") in
      let* α2 := M.call_closure α0 [ new_path; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "std::path::PathBuf")
          "push"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α1 := M.read (mk_str "myfile.tar.gz") in
      let* α2 := M.call_closure α0 [ new_path; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "std::path::PathBuf")
          "set_file_name"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α1 := M.read (mk_str "package.tgz") in
      let* α2 := M.call_closure α0 [ new_path; α1 ] in
      M.alloc α2 in
    let* α0 :=
      M.get_associated_function (Ty.path "std::path::Path") "to_str" [] in
    let* α1 :=
      M.get_trait_method
        "core::ops::deref::Deref"
        (Ty.path "std::path::PathBuf")
        []
        "deref"
        [] in
    let* α2 := M.call_closure α1 [ new_path ] in
    let* α3 := M.call_closure α0 [ α2 ] in
    let* α4 := M.alloc α3 in
    let* α0 :=
      match_operator
        α4
        [
          fun γ =>
            let* α0 :=
              M.get_function
                "std::panicking::begin_panic"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α1 :=
              M.read (mk_str "new path is not a valid UTF-8 sequence") in
            let* α2 := M.call_closure α0 [ α1 ] in
            let* α3 := M.never_to_any α2 in
            M.alloc α3;
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* s := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "new path is ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
              let* α6 := M.call_closure α5 [ s ] in
              let* α7 := M.alloc (Value.Array [ α6 ]) in
              let* α8 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α4;
                    M.pointer_coercion (* Unsize *) α7
                  ] in
              let* α9 := M.call_closure α0 [ α8 ] in
              M.alloc α9 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
