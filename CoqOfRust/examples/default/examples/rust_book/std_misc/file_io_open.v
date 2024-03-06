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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* path :=
      let* α0 := M.read (mk_str "hello.txt") in
      let* α1 := M.call ((Ty.path "std::path::Path")::["new"] α0) in
      M.alloc α1 in
    let* display :=
      let* α0 := M.read path in
      let* α1 := M.call ((Ty.path "std::path::Path")::["display"] α0) in
      M.alloc α1 in
    let* file :=
      let* α0 := M.call ((Ty.path "std::fs::File")::["open"] (borrow path)) in
      let* α1 := M.alloc α0 in
      let* α2 :=
        match_operator
          α1
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.result.Result.Err _ =>
                let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
                let* why := M.copy γ0_0 in
                let* α0 := M.read (mk_str "couldn't open ") in
                let* α1 := M.read (mk_str ": ") in
                let* α2 := M.alloc [ α0; α1 ] in
                let* α3 :=
                  M.call
                    ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                      (borrow display)) in
                let* α4 :=
                  M.call
                    ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                      (borrow why)) in
                let* α5 := M.alloc [ α3; α4 ] in
                let* α6 :=
                  M.call
                    ((Ty.path "core::fmt::Arguments")::["new_v1"]
                      (pointer_coercion "Unsize" (borrow α2))
                      (pointer_coercion "Unsize" (borrow α5))) in
                let* α7 := M.call ((M.var "core::panicking::panic_fmt") α6) in
                let* α8 := never_to_any α7 in
                M.alloc α8
              | _ => M.break_match
              end) :
              Ty.path "std::fs::File";
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.result.Result.Ok _ =>
                let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
                let* file := M.copy γ0_0 in
                M.pure file
              | _ => M.break_match
              end) :
              Ty.path "std::fs::File"
          ] in
      M.copy α2 in
    let* s :=
      let* α0 := M.call (Ty.path "alloc::string::String")::["new"] in
      M.alloc α0 in
    let* α0 :=
      ltac:(M.get_method (fun ℐ =>
        std.io.Read.read_to_string
          (Self := Ty.path "std::fs::File")
          (Trait := ℐ))) in
    let* α1 := M.call (α0 (borrow_mut file) (borrow_mut s)) in
    let* α2 := M.alloc α1 in
    let* α0 :=
      match_operator
        α2
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Err _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
              let* why := M.copy γ0_0 in
              let* α0 := M.read (mk_str "couldn't read ") in
              let* α1 := M.read (mk_str ": ") in
              let* α2 := M.alloc [ α0; α1 ] in
              let* α3 :=
                M.call
                  ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                    (borrow display)) in
              let* α4 :=
                M.call
                  ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                    (borrow why)) in
              let* α5 := M.alloc [ α3; α4 ] in
              let* α6 :=
                M.call
                  ((Ty.path "core::fmt::Arguments")::["new_v1"]
                    (pointer_coercion "Unsize" (borrow α2))
                    (pointer_coercion "Unsize" (borrow α5))) in
              let* α7 := M.call ((M.var "core::panicking::panic_fmt") α6) in
              let* α8 := never_to_any α7 in
              M.alloc α8
            | _ => M.break_match
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
              let* _ :=
                let* α0 := M.read (mk_str "") in
                let* α1 := M.read (mk_str " contains:
") in
                let* α2 := M.alloc [ α0; α1 ] in
                let* α3 :=
                  M.call
                    ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                      (borrow display)) in
                let* α4 :=
                  M.call
                    ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                      (borrow s)) in
                let* α5 := M.alloc [ α3; α4 ] in
                let* α6 :=
                  M.call
                    ((Ty.path "core::fmt::Arguments")::["new_v1"]
                      (pointer_coercion "Unsize" (borrow α2))
                      (pointer_coercion "Unsize" (borrow α5))) in
                let* α7 := M.call ((M.var "std::io::stdio::_print") α6) in
                M.alloc α7 in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple []
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
