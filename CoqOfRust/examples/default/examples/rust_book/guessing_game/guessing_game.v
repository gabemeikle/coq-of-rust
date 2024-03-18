(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn gen_range() -> u32 {
    todo!()
}
*)
Definition gen_range (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 := M.get_function "core::panicking::panic" [] in
    let* α1 := M.read (mk_str "not yet implemented") in
    let* α2 := M.call_closure α0 [ α1 ] in
    M.never_to_any α2
  | _, _ => M.impossible
  end.

(*
fn main() {
    println!("Guess the number!");
    let secret_number = gen_range();
    // println!("The secret number is: {secret_number}");
    loop {
        println!("Please input your guess.");

        let mut guess = String::new();

        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");

        // shadowing previous var {guess}.
        // We do shadowing when we want to convert var from one type to another
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        println!("You guessed: {guess}");

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }
    }
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const"
            [] in
        let* α2 := M.read (mk_str "Guess the number!
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call_closure α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* secret_number :=
      let* α0 := M.get_function "guessing_game::gen_range" [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* α0 :=
      M.loop
        (let* _ :=
          let* _ :=
            let* α0 := M.get_function "std::io::stdio::_print" [] in
            let* α1 :=
              M.get_associated_function
                (Ty.path "core::fmt::Arguments")
                "new_const"
                [] in
            let* α2 := M.read (mk_str "Please input your guess.
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in
            let* α4 :=
              M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
            let* α5 := M.call_closure α0 [ α4 ] in
            M.alloc α5 in
          M.alloc (Value.Tuple []) in
        let* guess :=
          let* α0 :=
            M.get_associated_function
              (Ty.path "alloc::string::String")
              "new"
              [] in
          let* α1 := M.call_closure α0 [] in
          M.alloc α1 in
        let* _ :=
          let* α0 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "usize"; Ty.path "std::io::error::Error" ])
              "expect"
              [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "std::io::stdio::Stdin")
              "read_line"
              [] in
          let* α2 := M.get_function "std::io::stdio::stdin" [] in
          let* α3 := M.call_closure α2 [] in
          let* α4 := M.alloc α3 in
          let* α5 := M.call_closure α1 [ α4; guess ] in
          let* α6 := M.read (mk_str "Failed to read line") in
          let* α7 := M.call_closure α0 [ α5; α6 ] in
          M.alloc α7 in
        let* guess :=
          let* α0 :=
            M.get_associated_function
              (Ty.path "str")
              "parse"
              [ Ty.path "u32" ] in
          let* α1 := M.get_associated_function (Ty.path "str") "trim" [] in
          let* α2 :=
            M.get_trait_method
              "core::ops::deref::Deref"
              (Ty.path "alloc::string::String")
              []
              "deref"
              [] in
          let* α3 := M.call_closure α2 [ guess ] in
          let* α4 := M.call_closure α1 [ α3 ] in
          let* α5 := M.call_closure α0 [ α4 ] in
          let* α6 := M.alloc α5 in
          let* α7 :=
            match_operator
              α6
              [
                fun γ =>
                  let* γ0_0 :=
                    M.get_struct_tuple_field_or_break_match
                      γ
                      "core::result::Result::Ok"
                      0 in
                  let* num := M.copy γ0_0 in
                  M.pure num;
                fun γ =>
                  let* γ0_0 :=
                    M.get_struct_tuple_field_or_break_match
                      γ
                      "core::result::Result::Err"
                      0 in
                  let* α0 := M.continue in
                  let* α1 := M.read α0 in
                  let* α2 := M.never_to_any α1 in
                  M.alloc α2
              ] in
          M.copy α7 in
        let* _ :=
          let* _ :=
            let* α0 := M.get_function "std::io::stdio::_print" [] in
            let* α1 :=
              M.get_associated_function
                (Ty.path "core::fmt::Arguments")
                "new_v1"
                [] in
            let* α2 := M.read (mk_str "You guessed: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            let* α5 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "u32" ] in
            let* α6 := M.call_closure α5 [ guess ] in
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
          M.alloc (Value.Tuple []) in
        let* α0 :=
          M.get_trait_method "core::cmp::Ord" (Ty.path "u32") [] "cmp" [] in
        let* α1 := M.call_closure α0 [ guess; secret_number ] in
        let* α2 := M.alloc α1 in
        match_operator
          α2
          [
            fun γ =>
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_const"
                    [] in
                let* α2 := M.read (mk_str "Too small!
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
                    "new_const"
                    [] in
                let* α2 := M.read (mk_str "Too big!
") in
                let* α3 := M.alloc (Value.Array [ α2 ]) in
                let* α4 :=
                  M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                let* α5 := M.call_closure α0 [ α4 ] in
                M.alloc α5 in
              M.alloc (Value.Tuple []);
            fun γ =>
              let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" [] in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_const"
                      [] in
                  let* α2 := M.read (mk_str "You win!
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  let* α4 :=
                    M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                  let* α5 := M.call_closure α0 [ α4 ] in
                  M.alloc α5 in
                M.alloc (Value.Tuple []) in
              let* α0 := M.break in
              let* α1 := M.read α0 in
              let* α2 := M.never_to_any α1 in
              M.alloc α2
          ]) in
    M.read α0
  | _, _ => M.impossible
  end.
