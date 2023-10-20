(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* output :=
    let* α0 := std.process.Command::["new"] (mk_str "rustc") in
    let* α1 := borrow_mut α0 std.process.Command in
    let* α2 := std.process.Command::["arg"] α1 (mk_str "--version") in
    let* α3 := deref α2 std.process.Command in
    let* α4 := borrow_mut α3 std.process.Command in
    let* α5 := std.process.Command::["output"] α4 in
    (core.result.Result _ _)::["unwrap_or_else"]
      α5
      let* α0 :=
        borrow [ mk_str "failed to execute process: " ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow e std.io.error.Error in
      let* α5 := deref α4 std.io.error.Error in
      let* α6 := borrow α5 std.io.error.Error in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      let* α13 := core.panicking.panic_fmt α12 in
      never_to_any α13 in
  let* α0 := output.["status"] in
  let* α1 := borrow α0 std.process.ExitStatus in
  let* α2 := std.process.ExitStatus::["success"] α1 in
  let* α3 := use α2 in
  if (α3 : bool) then
    let* s :=
      let* α0 := output.["stdout"] in
      let* α1 := borrow α0 (alloc.vec.Vec u8 alloc.alloc.Global) in
      let* α2 := deref α1 (alloc.vec.Vec u8 alloc.alloc.Global) in
      let* α3 := borrow α2 (alloc.vec.Vec u8 alloc.alloc.Global) in
      let* α4 := core.ops.deref.Deref.deref α3 in
      let* α5 := deref α4 (Slice u8) in
      let* α6 := borrow α5 (Slice u8) in
      alloc.string.String::["from_utf8_lossy"] α6 in
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow
            [ mk_str "rustc succeeded and stdout was:
" ]
            (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow s (alloc.borrow.Cow str) in
        let* α5 := deref α4 (alloc.borrow.Cow str) in
        let* α6 := borrow α5 (alloc.borrow.Cow str) in
        let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
        let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
        let* α9 := deref α8 (list core.fmt.rt.Argument) in
        let* α10 := borrow α9 (list core.fmt.rt.Argument) in
        let* α11 := pointer_coercion "Unsize" α10 in
        let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
        std.io.stdio._print α12 in
      Pure tt in
    Pure tt
  else
    let* s :=
      let* α0 := output.["stderr"] in
      let* α1 := borrow α0 (alloc.vec.Vec u8 alloc.alloc.Global) in
      let* α2 := deref α1 (alloc.vec.Vec u8 alloc.alloc.Global) in
      let* α3 := borrow α2 (alloc.vec.Vec u8 alloc.alloc.Global) in
      let* α4 := core.ops.deref.Deref.deref α3 in
      let* α5 := deref α4 (Slice u8) in
      let* α6 := borrow α5 (Slice u8) in
      alloc.string.String::["from_utf8_lossy"] α6 in
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow [ mk_str "rustc failed and stderr was:
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow s (alloc.borrow.Cow str) in
        let* α5 := deref α4 (alloc.borrow.Cow str) in
        let* α6 := borrow α5 (alloc.borrow.Cow str) in
        let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
        let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
        let* α9 := deref α8 (list core.fmt.rt.Argument) in
        let* α10 := borrow α9 (list core.fmt.rt.Argument) in
        let* α11 := pointer_coercion "Unsize" α10 in
        let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
        std.io.stdio._print α12 in
      Pure tt in
    Pure tt.
