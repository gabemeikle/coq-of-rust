(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* n := M.alloc 1 in
  loop
    (let* α0 := M.alloc 101 in
    let* α1 := BinOp.lt n α0 in
    let* α2 := use α1 in
    if (α2 : bool) then
      let* _ :=
        let* α0 := M.alloc 15 in
        let* α1 := BinOp.rem n α0 in
        let* α2 := M.alloc 0 in
        let* α3 := BinOp.eq α1 α2 in
        let* α4 := use α3 in
        if (α4 : bool) then
          let* _ :=
            let* _ :=
              let* α0 := borrow [ mk_str "fizzbuzz
" ] (list (ref str)) in
              let* α1 := deref α0 (list (ref str)) in
              let* α2 := borrow α1 (list (ref str)) in
              let* α3 := pointer_coercion "Unsize" α2 in
              let* α4 := core.fmt.Arguments::["new_const"] α3 in
              std.io.stdio._print α4 in
            M.alloc tt in
          M.alloc tt
        else
          let* α0 := M.alloc 3 in
          let* α1 := BinOp.rem n α0 in
          let* α2 := M.alloc 0 in
          let* α3 := BinOp.eq α1 α2 in
          let* α4 := use α3 in
          if (α4 : bool) then
            let* _ :=
              let* _ :=
                let* α0 := borrow [ mk_str "fizz
" ] (list (ref str)) in
                let* α1 := deref α0 (list (ref str)) in
                let* α2 := borrow α1 (list (ref str)) in
                let* α3 := pointer_coercion "Unsize" α2 in
                let* α4 := core.fmt.Arguments::["new_const"] α3 in
                std.io.stdio._print α4 in
              M.alloc tt in
            M.alloc tt
          else
            let* α0 := M.alloc 5 in
            let* α1 := BinOp.rem n α0 in
            let* α2 := M.alloc 0 in
            let* α3 := BinOp.eq α1 α2 in
            let* α4 := use α3 in
            if (α4 : bool) then
              let* _ :=
                let* _ :=
                  let* α0 := borrow [ mk_str "buzz
" ] (list (ref str)) in
                  let* α1 := deref α0 (list (ref str)) in
                  let* α2 := borrow α1 (list (ref str)) in
                  let* α3 := pointer_coercion "Unsize" α2 in
                  let* α4 := core.fmt.Arguments::["new_const"] α3 in
                  std.io.stdio._print α4 in
                M.alloc tt in
              M.alloc tt
            else
              let* _ :=
                let* _ :=
                  let* α0 :=
                    borrow [ mk_str ""; mk_str "
" ] (list (ref str)) in
                  let* α1 := deref α0 (list (ref str)) in
                  let* α2 := borrow α1 (list (ref str)) in
                  let* α3 := pointer_coercion "Unsize" α2 in
                  let* α4 := borrow n i32 in
                  let* α5 := deref α4 i32 in
                  let* α6 := borrow α5 i32 in
                  let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
                  let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
                  let* α9 := deref α8 (list core.fmt.rt.Argument) in
                  let* α10 := borrow α9 (list core.fmt.rt.Argument) in
                  let* α11 := pointer_coercion "Unsize" α10 in
                  let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
                  std.io.stdio._print α12 in
                M.alloc tt in
              M.alloc tt in
      let* _ :=
        let* α0 := M.alloc 1 in
        assign_op add n α0 in
      M.alloc tt
    else
      let* _ :=
        let* α0 := Break in
        never_to_any α0 in
      let* α0 := M.alloc tt in
      never_to_any α0).
