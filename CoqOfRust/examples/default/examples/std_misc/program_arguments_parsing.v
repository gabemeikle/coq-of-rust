(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn increase(number: i32) {
    println!("{}", number + 1);
}
*)
Definition increase (number : i32.t) : M unit :=
  let* number := M.alloc number in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : i32.t := M.read number in
      let* α4 : i32.t := BinOp.Panic.add α3 ((Integer.of_Z 1) : i32.t) in
      let* α5 : M.Val i32.t := M.alloc α4 in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α5)) in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α7))) in
      let* α9 : unit := M.call (std.io.stdio._print α8) in
      M.alloc α9 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn decrease(number: i32) {
    println!("{}", number - 1);
}
*)
Definition decrease (number : i32.t) : M unit :=
  let* number := M.alloc number in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : i32.t := M.read number in
      let* α4 : i32.t := BinOp.Panic.sub α3 ((Integer.of_Z 1) : i32.t) in
      let* α5 : M.Val i32.t := M.alloc α4 in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α5)) in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α7))) in
      let* α9 : unit := M.call (std.io.stdio._print α8) in
      M.alloc α9 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

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
Definition help : M unit :=
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t :=
        M.read
          (mk_str
            "usage:
match_args <string>
    Check whether given string is the answer.
match_args {increase|decrease} <integer>
    Increase or decrease given integer by one.
") in
      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
      let* α2 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_const"]
            (pointer_coercion "Unsize" (borrow α1))) in
      let* α3 : unit := M.call (std.io.stdio._print α2) in
      M.alloc α3 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

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
Definition main : M unit :=
  let return_ := M.return_ (R := unit) in
  M.catch_return
    (let* args :
        M.Val (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
      let* α0 :
          std.env.Args.t ->
            M (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.iterator.Iterator.collect
            (Self := std.env.Args.t)
            (B := alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)
            (Trait := ℐ))) in
      let* α1 : std.env.Args.t := M.call std.env.args in
      let* α2 : alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t :=
        M.call (α0 α1) in
      M.alloc α2 in
    let* α0 : usize.t :=
      M.call
        ((alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)::["len"]
          (borrow args)) in
    let* α1 : M.Val usize.t := M.alloc α0 in
    let* α0 : M.Val unit :=
      match_operator
        α1
        [
          fun γ =>
            (let* _ : M.Val unit :=
              let* _ : M.Val unit :=
                let* α0 : ref str.t :=
                  M.read
                    (mk_str
                      "My name is 'match_args'. Try passing some arguments!
") in
                let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
                let* α2 : core.fmt.Arguments.t :=
                  M.call
                    (core.fmt.Arguments.t::["new_const"]
                      (pointer_coercion "Unsize" (borrow α1))) in
                let* α3 : unit := M.call (std.io.stdio._print α2) in
                M.alloc α3 in
              M.alloc tt in
            M.alloc tt) :
            M (M.Val unit);
          fun γ =>
            (let* α0 : (ref alloc.string.String.t) -> M (ref _) :=
              ltac:(M.get_method (fun ℐ =>
                core.ops.deref.Deref.deref
                  (Self := alloc.string.String.t)
                  (Trait := ℐ))) in
            let* α1 :
                (ref
                    (alloc.vec.Vec.t
                      alloc.string.String.t
                      alloc.alloc.Global.t))
                  ->
                  usize.t ->
                  M (ref _) :=
              ltac:(M.get_method (fun ℐ =>
                core.ops.index.Index.index
                  (Self :=
                    alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)
                  (Idx := usize.t)
                  (Trait := ℐ))) in
            let* α2 : ref alloc.string.String.t :=
              M.call (α1 (borrow args) ((Integer.of_Z 1) : usize.t)) in
            let* α3 : ref str.t := M.call (α0 α2) in
            let* α4 :
                core.result.Result.t i32.t core.num.error.ParseIntError.t :=
              M.call (str.t::["parse"] α3) in
            let* α5 :
                M.Val
                  (core.result.Result.t i32.t core.num.error.ParseIntError.t) :=
              M.alloc α4 in
            match_operator
              α5
              [
                fun γ =>
                  (let* α0 := M.read γ in
                  match α0 with
                  | core.result.Result.Ok _ =>
                    let γ0_0 := core.result.Result.Get_Ok_0 γ in
                    let* _ : M.Val unit :=
                      let* α0 : ref str.t :=
                        M.read (mk_str "This is the answer!
") in
                      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
                      let* α2 : core.fmt.Arguments.t :=
                        M.call
                          (core.fmt.Arguments.t::["new_const"]
                            (pointer_coercion "Unsize" (borrow α1))) in
                      let* α3 : unit := M.call (std.io.stdio._print α2) in
                      M.alloc α3 in
                    M.alloc tt
                  | _ => M.break_match
                  end) :
                  M (M.Val unit);
                fun γ =>
                  (let* _ : M.Val unit :=
                    let* α0 : ref str.t :=
                      M.read (mk_str "This is not the answer.
") in
                    let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
                    let* α2 : core.fmt.Arguments.t :=
                      M.call
                        (core.fmt.Arguments.t::["new_const"]
                          (pointer_coercion "Unsize" (borrow α1))) in
                    let* α3 : unit := M.call (std.io.stdio._print α2) in
                    M.alloc α3 in
                  M.alloc tt) :
                  M (M.Val unit)
              ]) :
            M (M.Val unit);
          fun γ =>
            (let* cmd : M.Val (ref alloc.string.String.t) :=
              let* α0 :
                  (ref
                      (alloc.vec.Vec.t
                        alloc.string.String.t
                        alloc.alloc.Global.t))
                    ->
                    usize.t ->
                    M (ref _) :=
                ltac:(M.get_method (fun ℐ =>
                  core.ops.index.Index.index
                    (Self :=
                      alloc.vec.Vec.t
                        alloc.string.String.t
                        alloc.alloc.Global.t)
                    (Idx := usize.t)
                    (Trait := ℐ))) in
              let* α1 : ref alloc.string.String.t :=
                M.call (α0 (borrow args) ((Integer.of_Z 1) : usize.t)) in
              M.alloc α1 in
            let* num : M.Val (ref alloc.string.String.t) :=
              let* α0 :
                  (ref
                      (alloc.vec.Vec.t
                        alloc.string.String.t
                        alloc.alloc.Global.t))
                    ->
                    usize.t ->
                    M (ref _) :=
                ltac:(M.get_method (fun ℐ =>
                  core.ops.index.Index.index
                    (Self :=
                      alloc.vec.Vec.t
                        alloc.string.String.t
                        alloc.alloc.Global.t)
                    (Idx := usize.t)
                    (Trait := ℐ))) in
              let* α1 : ref alloc.string.String.t :=
                M.call (α0 (borrow args) ((Integer.of_Z 2) : usize.t)) in
              M.alloc α1 in
            let* number : M.Val i32.t :=
              let* α0 : (ref alloc.string.String.t) -> M (ref _) :=
                ltac:(M.get_method (fun ℐ =>
                  core.ops.deref.Deref.deref
                    (Self := alloc.string.String.t)
                    (Trait := ℐ))) in
              let* α1 : ref alloc.string.String.t := M.read num in
              let* α2 : ref str.t := M.call (α0 α1) in
              let* α3 :
                  core.result.Result.t i32.t core.num.error.ParseIntError.t :=
                M.call (str.t::["parse"] α2) in
              let* α4 :
                  M.Val
                    (core.result.Result.t
                      i32.t
                      core.num.error.ParseIntError.t) :=
                M.alloc α3 in
              let* α5 : M.Val i32.t :=
                match_operator
                  α4
                  [
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.result.Result.Ok _ =>
                        let γ0_0 := core.result.Result.Get_Ok_0 γ in
                        let* n := M.copy γ0_0 in
                        M.pure n
                      | _ => M.break_match
                      end) :
                      M (M.Val i32.t);
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.result.Result.Err _ =>
                        let γ0_0 := core.result.Result.Get_Err_0 γ in
                        let* _ : M.Val unit :=
                          let* _ : M.Val unit :=
                            let* α0 : ref str.t :=
                              M.read
                                (mk_str
                                  "error: second argument not an integer
") in
                            let* α1 : M.Val (array (ref str.t)) :=
                              M.alloc [ α0 ] in
                            let* α2 : core.fmt.Arguments.t :=
                              M.call
                                (core.fmt.Arguments.t::["new_const"]
                                  (pointer_coercion "Unsize" (borrow α1))) in
                            let* α3 : unit :=
                              M.call (std.io.stdio._eprint α2) in
                            M.alloc α3 in
                          M.alloc tt in
                        let* _ : M.Val unit :=
                          let* α0 : unit :=
                            M.call program_arguments_parsing.help in
                          M.alloc α0 in
                        let* α0 : M.Val unit := M.alloc tt in
                        let* α0 : M.Val never.t := return_ α0 in
                        let* α1 := M.read α0 in
                        let* α2 : i32.t := never_to_any α1 in
                        M.alloc α2
                      | _ => M.break_match
                      end) :
                      M (M.Val i32.t)
                  ] in
              M.copy α5 in
            let* α0 :
                (ref alloc.string.String.t) ->
                  core.ops.range.RangeFull.t ->
                  M (ref _) :=
              ltac:(M.get_method (fun ℐ =>
                core.ops.index.Index.index
                  (Self := alloc.string.String.t)
                  (Idx := core.ops.range.RangeFull.t)
                  (Trait := ℐ))) in
            let* α1 : ref alloc.string.String.t := M.read cmd in
            let* α2 : ref str.t :=
              M.call (α0 α1 core.ops.range.RangeFull.Build) in
            let* α3 : M.Val (ref str.t) := M.alloc α2 in
            match_operator
              α3
              [
                fun γ =>
                  (let* α0 : i32.t := M.read number in
                  let* α1 : unit :=
                    M.call (program_arguments_parsing.increase α0) in
                  M.alloc α1) :
                  M (M.Val unit);
                fun γ =>
                  (let* α0 : i32.t := M.read number in
                  let* α1 : unit :=
                    M.call (program_arguments_parsing.decrease α0) in
                  M.alloc α1) :
                  M (M.Val unit);
                fun γ =>
                  (let* _ : M.Val unit :=
                    let* _ : M.Val unit :=
                      let* α0 : ref str.t :=
                        M.read (mk_str "error: invalid command
") in
                      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
                      let* α2 : core.fmt.Arguments.t :=
                        M.call
                          (core.fmt.Arguments.t::["new_const"]
                            (pointer_coercion "Unsize" (borrow α1))) in
                      let* α3 : unit := M.call (std.io.stdio._eprint α2) in
                      M.alloc α3 in
                    M.alloc tt in
                  let* _ : M.Val unit :=
                    let* α0 : unit := M.call program_arguments_parsing.help in
                    M.alloc α0 in
                  M.alloc tt) :
                  M (M.Val unit)
              ]) :
            M (M.Val unit);
          fun γ =>
            (let* _ : M.Val unit :=
              let* α0 : unit := M.call program_arguments_parsing.help in
              M.alloc α0 in
            M.alloc tt) :
            M (M.Val unit)
        ] in
    M.read α0).
