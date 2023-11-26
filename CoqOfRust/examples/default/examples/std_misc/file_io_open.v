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
  M.function_body
    (let* path : M.Val (ref std.path.Path.t) :=
      let* α0 : ref str.t := M.read (mk_str "hello.txt") in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : ref std.path.Path.t := std.path.Path.t::["new"] α2 in
      M.alloc α3 in
    let* display : M.Val std.path.Display.t :=
      let* α0 : ref std.path.Path.t := M.read path in
      let* α1 : M.Val std.path.Path.t := deref α0 in
      let* α2 : ref std.path.Path.t := borrow α1 in
      let* α3 : std.path.Display.t := std.path.Path.t::["display"] α2 in
      M.alloc α3 in
    let* file : M.Val std.fs.File.t :=
      let* α0 : ref (ref std.path.Path.t) := borrow path in
      let* α1 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
        std.fs.File.t::["open"] α0 in
      let* α2 :
          M.Val (core.result.Result.t std.fs.File.t std.io.error.Error.t) :=
        M.alloc α1 in
      let* α3 := M.read α2 in
      let* α4 : M.Val std.fs.File.t :=
        match α3 with
        | core.result.Result.Err why =>
          let* why := M.alloc why in
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "couldn't open "; mk_str ": " ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref std.path.Display.t := borrow display in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : ref std.io.error.Error.t := borrow why in
          let* α9 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α8 in
          let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
          let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
            M.alloc [ α7; α10 ] in
          let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
          let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α12 in
          let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α13 in
          let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
          let* α16 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α15 in
          let* α17 : never.t := core.panicking.panic_fmt α16 in
          let* α18 : M.Val never.t := M.alloc α17 in
          never_to_any α18
        | core.result.Result.Ok file =>
          let* file := M.alloc file in
          M.pure file
        end in
      M.copy α4 in
    let* s : M.Val alloc.string.String.t :=
      let* α0 : alloc.string.String.t := alloc.string.String.t::["new"] in
      M.alloc α0 in
    let* α0 : mut_ref std.fs.File.t := borrow_mut file in
    let* α1 : mut_ref alloc.string.String.t := borrow_mut s in
    let* α2 : core.result.Result.t usize.t std.io.error.Error.t :=
      (std.io.Read.read_to_string
          (Self := std.fs.File.t)
          (Trait := ltac:(refine _)))
        α0
        α1 in
    let* α3 : M.Val (core.result.Result.t usize.t std.io.error.Error.t) :=
      M.alloc α2 in
    let* α4 := M.read α3 in
    let* α0 : M.Val unit :=
      match α4 with
      | core.result.Result.Err why =>
        let* why := M.alloc why in
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "couldn't read "; mk_str ": " ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref std.path.Display.t := borrow display in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : ref std.io.error.Error.t := borrow why in
        let* α9 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α8 in
        let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
        let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α7; α10 ] in
        let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
        let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α12 in
        let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
        let* α16 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α15 in
        let* α17 : never.t := core.panicking.panic_fmt α16 in
        let* α18 : M.Val never.t := M.alloc α17 in
        never_to_any α18
      | core.result.Result.Ok _ =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str ""; mk_str " contains:
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref std.path.Display.t := borrow display in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : ref alloc.string.String.t := borrow s in
          let* α9 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α8 in
          let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
          let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
            M.alloc [ α7; α10 ] in
          let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
          let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α12 in
          let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α13 in
          let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
          let* α16 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α15 in
          let* α17 : unit := std.io.stdio._print α16 in
          M.alloc α17 in
        M.alloc tt
      end in
    M.read α0).
