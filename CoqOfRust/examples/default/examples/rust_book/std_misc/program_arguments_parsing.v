(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn increase(number: i32) {
    println!("{}", number + 1);
}
*)
Definition increase (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ number ] =>
    let* number := M.alloc number in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 := M.read number in
        let* α4 :=
          (M.var "BinOp::Panic::add") α3 ((Integer.of_Z 1) : Ty.path "i32") in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow α5 ] in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α7)
            ] in
        let* α9 := M.call (M.var "std::io::stdio::_print") [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn decrease(number: i32) {
    println!("{}", number - 1);
}
*)
Definition decrease (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ number ] =>
    let* number := M.alloc number in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 := M.read number in
        let* α4 :=
          (M.var "BinOp::Panic::sub") α3 ((Integer.of_Z 1) : Ty.path "i32") in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow α5 ] in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α7)
            ] in
        let* α9 := M.call (M.var "std::io::stdio::_print") [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn help() {
    println!(
        "usage:
match_args <string>
    Check whether given string is the answer.
match_args {{increase|decrease}} <integer>
    Increase or decrease given integer by one."
    );
}
*)
Definition help (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 :=
          M.read
            (mk_str
              "usage:
match_args <string>
    Check whether given string is the answer.
match_args {increase|decrease} <integer>
    Increase or decrease given integer by one.
") in
        let* α1 := M.alloc [ α0 ] in
        let* α2 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" (borrow α1) ] in
        let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
        M.alloc α3 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let args: Vec<String> = env::args().collect();

    match args.len() {
        // no arguments passed
        1 => {
            println!("My name is 'match_args'. Try passing some arguments!");
        }
        // one argument passed
        2 => match args[1].parse() {
            Ok(42) => println!("This is the answer!"),
            _ => println!("This is not the answer."),
        },
        // one command and one argument passed
        3 => {
            let cmd = &args[1];
            let num = &args[2];
            // parse the number
            let number: i32 = match num.parse() {
                Ok(n) => n,
                Err(_) => {
                    eprintln!("error: second argument not an integer");
                    help();
                    return;
                }
            };
            // parse the command
            match &cmd[..] {
                "increase" => increase(number),
                "decrease" => decrease(number),
                _ => {
                    eprintln!("error: invalid command");
                    help();
                }
            }
        }
        // all the other cases
        _ => {
            // show a help message
            help();
        }
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let return_ := M.return_ (R := Ty.path "unit") in
    M.catch_return
      (let* args :=
        let* α0 :=
          M.get_method
            "core::iter::traits::iterator::Iterator"
            "collect"
            [
              (* Self *) Ty.path "std::env::Args";
              (* B *)
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [
                    Ty.path "alloc::string::String";
                    Ty.path "alloc::alloc::Global"
                  ]
            ] in
        let* α1 := M.call (M.var "std::env::args") [] in
        let* α2 := M.call α0 [ α1 ] in
        M.alloc α2 in
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "alloc::vec::Vec")
              [ Ty.path "alloc::string::String"; Ty.path "alloc::alloc::Global"
              ])::["len"]
          [ borrow args ] in
      let* α1 := M.alloc α0 in
      let* α0 :=
        match_operator
          α1
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | usize.Make 1 =>
                let* _ :=
                  let* _ :=
                    let* α0 :=
                      M.read
                        (mk_str
                          "My name is 'match_args'. Try passing some arguments!
") in
                    let* α1 := M.alloc [ α0 ] in
                    let* α2 :=
                      M.call
                        (Ty.path "core::fmt::Arguments")::["new_const"]
                        [ pointer_coercion "Unsize" (borrow α1) ] in
                    let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
                    M.alloc α3 in
                  M.alloc tt in
                M.alloc tt
              | _ => M.break_match 
              end) :
              Ty.tuple [];
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | usize.Make 2 =>
                let* α0 :=
                  M.get_method
                    "core::ops::deref::Deref"
                    "deref"
                    [ (* Self *) Ty.path "alloc::string::String" ] in
                let* α1 :=
                  M.get_method
                    "core::ops::index::Index"
                    "index"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [
                            Ty.path "alloc::string::String";
                            Ty.path "alloc::alloc::Global"
                          ];
                      (* Idx *) Ty.path "usize"
                    ] in
                let* α2 :=
                  M.call
                    α1
                    [ borrow args; (Integer.of_Z 1) : Ty.path "usize" ] in
                let* α3 := M.call α0 [ α2 ] in
                let* α4 := M.call (Ty.path "str")::["parse"] [ α3 ] in
                let* α5 := M.alloc α4 in
                match_operator
                  α5
                  [
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.result.Result.Ok _ =>
                        let γ0_0 :=
                          (M.var "core::result::Result::Get_Ok_0") γ in
                        let* α0 := M.read γ0_0 in
                        match α0 with
                        | i32.Make 42 =>
                          let* _ :=
                            let* α0 := M.read (mk_str "This is the answer!
") in
                            let* α1 := M.alloc [ α0 ] in
                            let* α2 :=
                              M.call
                                (Ty.path "core::fmt::Arguments")::["new_const"]
                                [ pointer_coercion "Unsize" (borrow α1) ] in
                            let* α3 :=
                              M.call (M.var "std::io::stdio::_print") [ α2 ] in
                            M.alloc α3 in
                          M.alloc tt
                        | _ => M.break_match 
                        end
                      | _ => M.break_match 
                      end) :
                      Ty.tuple [];
                    fun γ =>
                      (let* _ :=
                        let* α0 := M.read (mk_str "This is not the answer.
") in
                        let* α1 := M.alloc [ α0 ] in
                        let* α2 :=
                          M.call
                            (Ty.path "core::fmt::Arguments")::["new_const"]
                            [ pointer_coercion "Unsize" (borrow α1) ] in
                        let* α3 :=
                          M.call (M.var "std::io::stdio::_print") [ α2 ] in
                        M.alloc α3 in
                      M.alloc tt) :
                      Ty.tuple []
                  ]
              | _ => M.break_match 
              end) :
              Ty.tuple [];
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | usize.Make 3 =>
                let* cmd :=
                  let* α0 :=
                    M.get_method
                      "core::ops::index::Index"
                      "index"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "alloc::vec::Vec")
                            [
                              Ty.path "alloc::string::String";
                              Ty.path "alloc::alloc::Global"
                            ];
                        (* Idx *) Ty.path "usize"
                      ] in
                  let* α1 :=
                    M.call
                      α0
                      [ borrow args; (Integer.of_Z 1) : Ty.path "usize" ] in
                  M.alloc α1 in
                let* num :=
                  let* α0 :=
                    M.get_method
                      "core::ops::index::Index"
                      "index"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "alloc::vec::Vec")
                            [
                              Ty.path "alloc::string::String";
                              Ty.path "alloc::alloc::Global"
                            ];
                        (* Idx *) Ty.path "usize"
                      ] in
                  let* α1 :=
                    M.call
                      α0
                      [ borrow args; (Integer.of_Z 2) : Ty.path "usize" ] in
                  M.alloc α1 in
                let* number :=
                  let* α0 :=
                    M.get_method
                      "core::ops::deref::Deref"
                      "deref"
                      [ (* Self *) Ty.path "alloc::string::String" ] in
                  let* α1 := M.read num in
                  let* α2 := M.call α0 [ α1 ] in
                  let* α3 := M.call (Ty.path "str")::["parse"] [ α2 ] in
                  let* α4 := M.alloc α3 in
                  let* α5 :=
                    match_operator
                      α4
                      [
                        fun γ =>
                          (let* α0 := M.read γ in
                          match α0 with
                          | core.result.Result.Ok _ =>
                            let γ0_0 :=
                              (M.var "core::result::Result::Get_Ok_0") γ in
                            let* n := M.copy γ0_0 in
                            M.pure n
                          | _ => M.break_match 
                          end) :
                          Ty.path "i32";
                        fun γ =>
                          (let* α0 := M.read γ in
                          match α0 with
                          | core.result.Result.Err _ =>
                            let γ0_0 :=
                              (M.var "core::result::Result::Get_Err_0") γ in
                            let* _ :=
                              let* _ :=
                                let* α0 :=
                                  M.read
                                    (mk_str
                                      "error: second argument not an integer
") in
                                let* α1 := M.alloc [ α0 ] in
                                let* α2 :=
                                  M.call
                                    (Ty.path
                                        "core::fmt::Arguments")::["new_const"]
                                    [ pointer_coercion "Unsize" (borrow α1) ] in
                                let* α3 :=
                                  M.call
                                    (M.var "std::io::stdio::_eprint")
                                    [ α2 ] in
                                M.alloc α3 in
                              M.alloc tt in
                            let* _ :=
                              let* α0 :=
                                M.call
                                  (M.var "program_arguments_parsing::help")
                                  [] in
                              M.alloc α0 in
                            let* α0 := return_ tt in
                            let* α1 := M.read α0 in
                            let* α2 := never_to_any α1 in
                            M.alloc α2
                          | _ => M.break_match 
                          end) :
                          Ty.path "i32"
                      ] in
                  M.copy α5 in
                let* α0 :=
                  M.get_method
                    "core::ops::index::Index"
                    "index"
                    [
                      (* Self *) Ty.path "alloc::string::String";
                      (* Idx *) Ty.path "core::ops::range::RangeFull"
                    ] in
                let* α1 := M.read cmd in
                let* α2 := M.call α0 [ α1; core.ops.range.RangeFull.Build ] in
                let* α3 := M.alloc α2 in
                match_operator
                  α3
                  [
                    fun γ =>
                      (let* α0 := M.read number in
                      let* α1 :=
                        M.call
                          (M.var "program_arguments_parsing::increase")
                          [ α0 ] in
                      M.alloc α1) :
                      Ty.tuple [];
                    fun γ =>
                      (let* α0 := M.read number in
                      let* α1 :=
                        M.call
                          (M.var "program_arguments_parsing::decrease")
                          [ α0 ] in
                      M.alloc α1) :
                      Ty.tuple [];
                    fun γ =>
                      (let* _ :=
                        let* _ :=
                          let* α0 :=
                            M.read (mk_str "error: invalid command
") in
                          let* α1 := M.alloc [ α0 ] in
                          let* α2 :=
                            M.call
                              (Ty.path "core::fmt::Arguments")::["new_const"]
                              [ pointer_coercion "Unsize" (borrow α1) ] in
                          let* α3 :=
                            M.call (M.var "std::io::stdio::_eprint") [ α2 ] in
                          M.alloc α3 in
                        M.alloc tt in
                      let* _ :=
                        let* α0 :=
                          M.call (M.var "program_arguments_parsing::help") [] in
                        M.alloc α0 in
                      M.alloc tt) :
                      Ty.tuple []
                  ]
              | _ => M.break_match 
              end) :
              Ty.tuple [];
            fun γ =>
              (let* _ :=
                let* α0 :=
                  M.call (M.var "program_arguments_parsing::help") [] in
                M.alloc α0 in
              M.alloc tt) :
              Ty.tuple []
          ] in
      M.read α0)
  | _, _ => M.impossible
  end.
