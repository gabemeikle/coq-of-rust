(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition PANGRAM
    : Ty.apply (Ty.path "ref") [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ] :=
  M.run (M.alloc (mk_str "the quick brown fox jumped over the lazy dog
")).

(*
fn main() {
    // Spawn the `wc` command
    let process = match Command::new("wc")
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .spawn()
    {
        Err(why) => panic!("couldn't spawn wc: {}", why),
        Ok(process) => process,
    };

    // Write a string to the `stdin` of `wc`.
    //
    // `stdin` has type `Option<ChildStdin>`, but since we know this instance
    // must have one, we can directly `unwrap` it.
    match process.stdin.unwrap().write_all(PANGRAM.as_bytes()) {
        Err(why) => panic!("couldn't write to wc stdin: {}", why),
        Ok(_) => println!("sent pangram to wc"),
    }

    // Because `stdin` does not live after the above calls, it is `drop`ed,
    // and the pipe is closed.
    //
    // This is very important, otherwise `wc` wouldn't start processing the
    // input we just sent.

    // The `stdout` field also has type `Option<ChildStdout>` so must be unwrapped.
    let mut s = String::new();
    match process.stdout.unwrap().read_to_string(&mut s) {
        Err(why) => panic!("couldn't read wc stdout: {}", why),
        Ok(_) => print!("wc responded with:\n{}", s),
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* process :=
      let* α0 := M.read (mk_str "wc") in
      let* α1 := M.call (Ty.path "std::process::Command")::["new"] [ α0 ] in
      let* α2 := M.alloc α1 in
      let* α3 := M.call (Ty.path "std::process::Stdio")::["piped"] [] in
      let* α4 :=
        M.call
          (Ty.path "std::process::Command")::["stdin"]
          [ borrow_mut α2; α3 ] in
      let* α5 := M.call (Ty.path "std::process::Stdio")::["piped"] [] in
      let* α6 :=
        M.call (Ty.path "std::process::Command")::["stdout"] [ α4; α5 ] in
      let* α7 := M.call (Ty.path "std::process::Command")::["spawn"] [ α6 ] in
      let* α8 := M.alloc α7 in
      let* α9 :=
        match_operator
          α8
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.result.Result.Err _ =>
                let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
                let* why := M.copy γ0_0 in
                let* α0 := M.read (mk_str "couldn't spawn wc: ") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow why ] in
                let* α3 := M.alloc [ α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      pointer_coercion "Unsize" (borrow α1);
                      pointer_coercion "Unsize" (borrow α3)
                    ] in
                let* α5 := M.call (M.var "core::panicking::panic_fmt") [ α4 ] in
                let* α6 := never_to_any α5 in
                M.alloc α6
              | _ => M.break_match 
              end) :
              Ty.path "std::process::Child";
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.result.Result.Ok _ =>
                let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
                let* process := M.copy γ0_0 in
                M.pure process
              | _ => M.break_match 
              end) :
              Ty.path "std::process::Child"
          ] in
      M.copy α9 in
    let* _ :=
      let* α0 :=
        M.get_method
          "std::io::Write"
          "write_all"
          [ (* Self *) Ty.path "std::process::ChildStdin" ] in
      let* α1 := M.read ((M.var "std::process::Child::Get_stdin") process) in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "core::option::Option")
              [ Ty.path "std::process::ChildStdin" ])::["unwrap"]
          [ α1 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.read (M.var "child_processes_pipes::PANGRAM") in
      let* α5 := M.read (deref α4) in
      let* α6 := M.call (Ty.path "str")::["as_bytes"] [ α5 ] in
      let* α7 := M.call α0 [ borrow_mut α3; α6 ] in
      let* α8 := M.alloc α7 in
      match_operator
        α8
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Err _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
              let* why := M.copy γ0_0 in
              let* α0 := M.read (mk_str "couldn't write to wc stdin: ") in
              let* α1 := M.alloc [ α0 ] in
              let* α2 :=
                M.call
                  (Ty.path "core::fmt::rt::Argument")::["new_display"]
                  [ borrow why ] in
              let* α3 := M.alloc [ α2 ] in
              let* α4 :=
                M.call
                  (Ty.path "core::fmt::Arguments")::["new_v1"]
                  [
                    pointer_coercion "Unsize" (borrow α1);
                    pointer_coercion "Unsize" (borrow α3)
                  ] in
              let* α5 := M.call (M.var "core::panicking::panic_fmt") [ α4 ] in
              let* α6 := never_to_any α5 in
              M.alloc α6
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
              let* _ :=
                let* α0 := M.read (mk_str "sent pangram to wc
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
            Ty.tuple []
        ] in
    let* s :=
      let* α0 := M.call (Ty.path "alloc::string::String")::["new"] [] in
      M.alloc α0 in
    let* α0 :=
      M.get_method
        "std::io::Read"
        "read_to_string"
        [ (* Self *) Ty.path "std::process::ChildStdout" ] in
    let* α1 := M.read ((M.var "std::process::Child::Get_stdout") process) in
    let* α2 :=
      M.call
        (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "std::process::ChildStdout" ])::["unwrap"]
        [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 := M.call α0 [ borrow_mut α3; borrow_mut s ] in
    let* α5 := M.alloc α4 in
    let* α0 :=
      match_operator
        α5
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Err _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
              let* why := M.copy γ0_0 in
              let* α0 := M.read (mk_str "couldn't read wc stdout: ") in
              let* α1 := M.alloc [ α0 ] in
              let* α2 :=
                M.call
                  (Ty.path "core::fmt::rt::Argument")::["new_display"]
                  [ borrow why ] in
              let* α3 := M.alloc [ α2 ] in
              let* α4 :=
                M.call
                  (Ty.path "core::fmt::Arguments")::["new_v1"]
                  [
                    pointer_coercion "Unsize" (borrow α1);
                    pointer_coercion "Unsize" (borrow α3)
                  ] in
              let* α5 := M.call (M.var "core::panicking::panic_fmt") [ α4 ] in
              let* α6 := never_to_any α5 in
              M.alloc α6
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
              let* _ :=
                let* α0 := M.read (mk_str "wc responded with:
") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow s ] in
                let* α3 := M.alloc [ α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      pointer_coercion "Unsize" (borrow α1);
                      pointer_coercion "Unsize" (borrow α3)
                    ] in
                let* α5 := M.call (M.var "std::io::stdio::_print") [ α4 ] in
                M.alloc α5 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple []
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
