(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* strings :=
    let* α0 := deref (mk_str "tofu") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "93") str in
    let* α3 := borrow α2 str in
    let* α4 := deref (mk_str "999") str in
    let* α5 := borrow α4 str in
    let* α6 := deref (mk_str "18") str in
    let* α7 := borrow α6 str in
    let* α8 :=
      (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"]
        [ mk_str "42"; α1; α3; α5; α7 ] in
    let* α9 := pointer_coercion "Unsize" α8 in
    (Slice _)::["into_vec"] α9 in
  let* errors := (alloc.vec.Vec _ alloc.alloc.Global)::["new"] in
  let* numbers :=
    let* α0 := core.iter.traits.collect.IntoIterator.into_iter strings in
    let* α1 :=
      core.iter.traits.iterator.Iterator.map
        α0
        let* α0 := deref s str in
        let* α1 := borrow α0 str in
        str::["parse"] α1 in
    let* α2 :=
      core.iter.traits.iterator.Iterator.filter_map
        α1
        let* α0 :=
          (core.result.Result _ _)::["map_err"]
            r
            let* α0 :=
              borrow_mut
                errors
                (alloc.vec.Vec
                  core.num.error.ParseIntError
                  alloc.alloc.Global) in
            (alloc.vec.Vec _ _)::["push"] α0 e in
        (core.result.Result _ _)::["ok"] α0 in
    core.iter.traits.iterator.Iterator.collect α2 in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "Numbers: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow numbers (alloc.vec.Vec u8 alloc.alloc.Global) in
      let* α5 := deref α4 (alloc.vec.Vec u8 alloc.alloc.Global) in
      let* α6 := borrow α5 (alloc.vec.Vec u8 alloc.alloc.Global) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "Errors: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow
          errors
          (alloc.vec.Vec core.num.error.ParseIntError alloc.alloc.Global) in
      let* α5 :=
        deref
          α4
          (alloc.vec.Vec core.num.error.ParseIntError alloc.alloc.Global) in
      let* α6 :=
        borrow
          α5
          (alloc.vec.Vec core.num.error.ParseIntError alloc.alloc.Global) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  Pure tt.
