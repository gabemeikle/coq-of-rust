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
Definition main : M unit :=
  let* path : M.Val (ref std.path.Path.t) :=
    let* α0 : ref str.t := M.read (mk_str "hello.txt") in
    let* α1 : ref std.path.Path.t := M.call (std.path.Path.t::["new"] α0) in
    M.alloc α1 in
  let* display : M.Val std.path.Display.t :=
    let* α0 : ref std.path.Path.t := M.read path in
    let* α1 : std.path.Display.t := M.call (std.path.Path.t::["display"] α0) in
    M.alloc α1 in
  let* file : M.Val std.fs.File.t :=
    let* α0 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
      M.call (std.fs.File.t::["open"] (borrow path)) in
    let* α1 : M.Val (core.result.Result.t std.fs.File.t std.io.error.Error.t) :=
      M.alloc α0 in
    let* α2 : M.Val std.fs.File.t :=
      match_operator
        α1
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Err _ =>
              let γ0_0 := core.result.Result.Get_Err_0 γ in
              let* why := M.copy γ0_0 in
              let* α0 : ref str.t := M.read (mk_str "couldn't open ") in
              let* α1 : ref str.t := M.read (mk_str ": ") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : core.fmt.rt.Argument.t :=
                M.call
                  (core.fmt.rt.Argument.t::["new_display"] (borrow display)) in
              let* α4 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow why)) in
              let* α5 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α3; α4 ] in
              let* α6 : core.fmt.Arguments.t :=
                M.call
                  (core.fmt.Arguments.t::["new_v1"]
                    (pointer_coercion "Unsize" (borrow α2))
                    (pointer_coercion "Unsize" (borrow α5))) in
              let* α7 : never.t := M.call (core.panicking.panic_fmt α6) in
              let* α8 : std.fs.File.t := never_to_any α7 in
              M.alloc α8
            | _ => M.break_match
            end) :
            M (M.Val std.fs.File.t);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let γ0_0 := core.result.Result.Get_Ok_0 γ in
              let* file := M.copy γ0_0 in
              M.pure file
            | _ => M.break_match
            end) :
            M (M.Val std.fs.File.t)
        ] in
    M.copy α2 in
  let* s : M.Val alloc.string.String.t :=
    let* α0 : alloc.string.String.t := M.call alloc.string.String.t::["new"] in
    M.alloc α0 in
  let* α0 :
      (mut_ref std.fs.File.t) ->
        (mut_ref alloc.string.String.t) ->
        M (core.result.Result.t usize.t std.io.error.Error.t) :=
    ltac:(M.get_method (fun ℐ =>
      std.io.Read.read_to_string (Self := std.fs.File.t) (Trait := ℐ))) in
  let* α1 : core.result.Result.t usize.t std.io.error.Error.t :=
    M.call (α0 (borrow_mut file) (borrow_mut s)) in
  let* α2 : M.Val (core.result.Result.t usize.t std.io.error.Error.t) :=
    M.alloc α1 in
  let* α0 : M.Val unit :=
    match_operator
      α2
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.result.Result.Err _ =>
            let γ0_0 := core.result.Result.Get_Err_0 γ in
            let* why := M.copy γ0_0 in
            let* α0 : ref str.t := M.read (mk_str "couldn't read ") in
            let* α1 : ref str.t := M.read (mk_str ": ") in
            let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
            let* α3 : core.fmt.rt.Argument.t :=
              M.call
                (core.fmt.rt.Argument.t::["new_display"] (borrow display)) in
            let* α4 : core.fmt.rt.Argument.t :=
              M.call (core.fmt.rt.Argument.t::["new_display"] (borrow why)) in
            let* α5 : M.Val (array core.fmt.rt.Argument.t) :=
              M.alloc [ α3; α4 ] in
            let* α6 : core.fmt.Arguments.t :=
              M.call
                (core.fmt.Arguments.t::["new_v1"]
                  (pointer_coercion "Unsize" (borrow α2))
                  (pointer_coercion "Unsize" (borrow α5))) in
            let* α7 : never.t := M.call (core.panicking.panic_fmt α6) in
            let* α8 : unit := never_to_any α7 in
            M.alloc α8
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.result.Result.Ok _ =>
            let γ0_0 := core.result.Result.Get_Ok_0 γ in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "") in
              let* α1 : ref str.t := M.read (mk_str " contains:
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : core.fmt.rt.Argument.t :=
                M.call
                  (core.fmt.rt.Argument.t::["new_display"] (borrow display)) in
              let* α4 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow s)) in
              let* α5 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α3; α4 ] in
              let* α6 : core.fmt.Arguments.t :=
                M.call
                  (core.fmt.Arguments.t::["new_v1"]
                    (pointer_coercion "Unsize" (borrow α2))
                    (pointer_coercion "Unsize" (borrow α5))) in
              let* α7 : unit := M.call (std.io.stdio._print α6) in
              M.alloc α7 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit)
      ] in
  M.read α0.
