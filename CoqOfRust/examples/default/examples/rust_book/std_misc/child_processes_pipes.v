(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition PANGRAM : Value.t :=
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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* process :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "std::process::Command")
          "spawn"
          [] in
      let* α1 :=
        M.get_associated_function
          (Ty.path "std::process::Command")
          "stdout"
          [ Ty.path "std::process::Stdio" ] in
      let* α2 :=
        M.get_associated_function
          (Ty.path "std::process::Command")
          "stdin"
          [ Ty.path "std::process::Stdio" ] in
      let* α3 :=
        M.get_associated_function
          (Ty.path "std::process::Command")
          "new"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α4 := M.read (mk_str "wc") in
      let* α5 := M.call_closure α3 [ α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 :=
        M.get_associated_function (Ty.path "std::process::Stdio") "piped" [] in
      let* α8 := M.call_closure α7 [] in
      let* α9 := M.call_closure α2 [ α6; α8 ] in
      let* α10 :=
        M.get_associated_function (Ty.path "std::process::Stdio") "piped" [] in
      let* α11 := M.call_closure α10 [] in
      let* α12 := M.call_closure α1 [ α9; α11 ] in
      let* α13 := M.call_closure α0 [ α12 ] in
      let* α14 := M.alloc α13 in
      let* α15 :=
        match_operator
          α14
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
              let* α2 := M.read (mk_str "couldn't spawn wc: ") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "std::io::error::Error" ] in
              let* α5 := M.call_closure α4 [ why ] in
              let* α6 := M.alloc (Value.Array [ α5 ]) in
              let* α7 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α3;
                    M.pointer_coercion (* Unsize *) α6
                  ] in
              let* α8 := M.call_closure α0 [ α7 ] in
              let* α9 := M.never_to_any α8 in
              M.alloc α9;
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::result::Result::Ok"
                  0 in
              let* process := M.copy γ0_0 in
              M.pure process
          ] in
      M.copy α15 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "std::io::Write"
          (Ty.path "std::process::ChildStdin")
          []
          "write_all"
          [] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "std::process::ChildStdin" ])
          "unwrap"
          [] in
      let* α2 :=
        M.read
          (M.get_struct_record_field process "std::process::Child" "stdin") in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.alloc α3 in
      let* α5 := M.get_associated_function (Ty.path "str") "as_bytes" [] in
      let* α6 := M.get_constant "child_processes_pipes::PANGRAM" in
      let* α7 := M.read α6 in
      let* α8 := M.read α7 in
      let* α9 := M.call_closure α5 [ α8 ] in
      let* α10 := M.call_closure α0 [ α4; α9 ] in
      let* α11 := M.alloc α10 in
      match_operator
        α11
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
            let* α2 := M.read (mk_str "couldn't write to wc stdin: ") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in
            let* α4 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "std::io::error::Error" ] in
            let* α5 := M.call_closure α4 [ why ] in
            let* α6 := M.alloc (Value.Array [ α5 ]) in
            let* α7 :=
              M.call_closure
                α1
                [
                  M.pointer_coercion (* Unsize *) α3;
                  M.pointer_coercion (* Unsize *) α6
                ] in
            let* α8 := M.call_closure α0 [ α7 ] in
            let* α9 := M.never_to_any α8 in
            M.alloc α9;
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
                  "new_const"
                  [] in
              let* α2 := M.read (mk_str "sent pangram to wc
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 :=
                M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call_closure α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple [])
        ] in
    let* s :=
      let* α0 :=
        M.get_associated_function (Ty.path "alloc::string::String") "new" [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* α0 :=
      M.get_trait_method
        "std::io::Read"
        (Ty.path "std::process::ChildStdout")
        []
        "read_to_string"
        [] in
    let* α1 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::option::Option")
          [ Ty.path "std::process::ChildStdout" ])
        "unwrap"
        [] in
    let* α2 :=
      M.read
        (M.get_struct_record_field process "std::process::Child" "stdout") in
    let* α3 := M.call_closure α1 [ α2 ] in
    let* α4 := M.alloc α3 in
    let* α5 := M.call_closure α0 [ α4; s ] in
    let* α6 := M.alloc α5 in
    let* α0 :=
      match_operator
        α6
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
            let* α2 := M.read (mk_str "couldn't read wc stdout: ") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in
            let* α4 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "std::io::error::Error" ] in
            let* α5 := M.call_closure α4 [ why ] in
            let* α6 := M.alloc (Value.Array [ α5 ]) in
            let* α7 :=
              M.call_closure
                α1
                [
                  M.pointer_coercion (* Unsize *) α3;
                  M.pointer_coercion (* Unsize *) α6
                ] in
            let* α8 := M.call_closure α0 [ α7 ] in
            let* α9 := M.never_to_any α8 in
            M.alloc α9;
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
              let* α2 := M.read (mk_str "wc responded with:
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "alloc::string::String" ] in
              let* α5 := M.call_closure α4 [ s ] in
              let* α6 := M.alloc (Value.Array [ α5 ]) in
              let* α7 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α3;
                    M.pointer_coercion (* Unsize *) α6
                  ] in
              let* α8 := M.call_closure α0 [ α7 ] in
              M.alloc α8 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
