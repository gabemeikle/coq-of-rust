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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* path :=
      let* α0 := M.get_associated_function (Ty.path "std::path::Path") "new" in
      let* α1 := M.read (mk_str ".") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _display :=
      let* α0 :=
        M.get_associated_function (Ty.path "std::path::Path") "display" in
      let* α1 := M.read path in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* new_path :=
      let* α0 := M.get_associated_function (Ty.path "std::path::Path") "join" in
      let* α1 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          "deref"
          [ (* Self *) Ty.path "std::path::PathBuf" ] in
      let* α2 := M.get_associated_function (Ty.path "std::path::Path") "join" in
      let* α3 := M.read path in
      let* α4 := M.read (mk_str "a") in
      let* α5 := M.call α2 [ α3; α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 := M.call α1 [ α6 ] in
      let* α8 := M.read (mk_str "b") in
      let* α9 := M.call α0 [ α7; α8 ] in
      M.alloc α9 in
    let* _ :=
      let* α0 :=
        M.get_associated_function (Ty.path "std::path::PathBuf") "push" in
      let* α1 := M.read (mk_str "c") in
      let* α2 := M.call α0 [ new_path; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.get_associated_function (Ty.path "std::path::PathBuf") "push" in
      let* α1 := M.read (mk_str "myfile.tar.gz") in
      let* α2 := M.call α0 [ new_path; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "std::path::PathBuf")
          "set_file_name" in
      let* α1 := M.read (mk_str "package.tgz") in
      let* α2 := M.call α0 [ new_path; α1 ] in
      M.alloc α2 in
    let* α0 := M.get_associated_function (Ty.path "std::path::Path") "to_str" in
    let* α1 :=
      M.get_trait_method
        "core::ops::deref::Deref"
        "deref"
        [ (* Self *) Ty.path "std::path::PathBuf" ] in
    let* α2 := M.call α1 [ new_path ] in
    let* α3 := M.call α0 [ α2 ] in
    let* α4 := M.alloc α3 in
    let* α0 :=
      match_operator
        α4
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.None =>
              let* α0 := M.get_function "std::panicking::begin_panic" in
              let* α1 :=
                M.read (mk_str "new path is not a valid UTF-8 sequence") in
              let* α2 := M.call α0 [ α1 ] in
              let* α3 := M.never_to_any α2 in
              M.alloc α3
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::option::Option::Get_Some_0" in
                M.pure (α0 γ) in
              let* s := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1" in
                let* α2 := M.read (mk_str "new path is ") in
                let* α3 := M.read (mk_str "
") in
                let* α4 := M.alloc [ α2; α3 ] in
                let* α5 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display" in
                let* α6 := M.call α5 [ s ] in
                let* α7 := M.alloc [ α6 ] in
                let* α8 :=
                  M.call
                    α1
                    [
                      M.pointer_coercion "Unsize" α4;
                      M.pointer_coercion "Unsize" α7
                    ] in
                let* α9 := M.call α0 [ α8 ] in
                M.alloc α9 in
              M.alloc (Value.Tuple [])
            | _ => M.break_match 
            end)
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
