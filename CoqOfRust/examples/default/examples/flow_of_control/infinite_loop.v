(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut count = 0u32;

    println!("Let's count until infinity!");

    // Infinite loop
    loop {
        count += 1;

        if count == 3 {
            println!("three");

            // Skip the rest of this iteration
            continue;
        }

        println!("{}", count);

        if count == 5 {
            println!("OK, that's enough");

            // Exit this loop
            break;
        }
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* count : M.Val u32.t :=
      let* α0 : M.Val u32.t := M.alloc 0 in
      M.copy α0 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Let's count until infinity!
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_const"] α6 in
        let* α8 : unit := std.io.stdio._print α7 in
        M.alloc α8 in
      M.alloc tt in
    loop
      (let* _ : M.Val unit :=
        let* α0 : M.Val u32.t := M.alloc 1 in
        assign_op add count α0 in
      let* _ : M.Val unit :=
        let* α0 : M.Val u32.t := M.alloc 3 in
        let* α1 : M.Val bool.t := BinOp.eq count α0 in
        let* α2 : M.Val bool.t := use α1 in
        let* α3 : bool.t := M.read α2 in
        if (α3 : bool) then
          let* _ : M.Val unit :=
            let* _ : M.Val unit :=
              let* α0 : M.Val (array (ref str.t)) :=
                M.alloc [ mk_str "three
" ] in
              let* α1 : ref (array (ref str.t)) := borrow α0 in
              let* α2 : M.Val (array (ref str.t)) := deref α1 in
              let* α3 : ref (array (ref str.t)) := borrow α2 in
              let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
              let* α5 : M.Val (ref (slice (ref str.t))) :=
                pointer_coercion "Unsize" α4 in
              let* α6 : ref (slice (ref str.t)) := M.read α5 in
              let* α7 : core.fmt.Arguments.t :=
                core.fmt.Arguments.t::["new_const"] α6 in
              let* α8 : unit := std.io.stdio._print α7 in
              M.alloc α8 in
            M.alloc tt in
          let* _ : M.Val never.t := Continue in
          let* α0 : M.Val unit := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt in
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str ""; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (array (ref str.t)) := deref α1 in
          let* α3 : ref (array (ref str.t)) := borrow α2 in
          let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
          let* α5 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α4 in
          let* α6 : ref (slice (ref str.t)) := M.read α5 in
          let* α7 : ref u32.t := borrow count in
          let* α8 : M.Val u32.t := deref α7 in
          let* α9 : ref u32.t := borrow α8 in
          let* α10 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α9 in
          let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
          let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
          let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
          let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
          let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
          let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α15 in
          let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α16 in
          let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
          let* α19 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α6 α18 in
          let* α20 : unit := std.io.stdio._print α19 in
          M.alloc α20 in
        M.alloc tt in
      let* α0 : M.Val u32.t := M.alloc 5 in
      let* α1 : M.Val bool.t := BinOp.eq count α0 in
      let* α2 : M.Val bool.t := use α1 in
      let* α3 : bool.t := M.read α2 in
      if (α3 : bool) then
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : M.Val (array (ref str.t)) :=
              M.alloc [ mk_str "OK, that's enough
" ] in
            let* α1 : ref (array (ref str.t)) := borrow α0 in
            let* α2 : M.Val (array (ref str.t)) := deref α1 in
            let* α3 : ref (array (ref str.t)) := borrow α2 in
            let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
            let* α5 : M.Val (ref (slice (ref str.t))) :=
              pointer_coercion "Unsize" α4 in
            let* α6 : ref (slice (ref str.t)) := M.read α5 in
            let* α7 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_const"] α6 in
            let* α8 : unit := std.io.stdio._print α7 in
            M.alloc α8 in
          M.alloc tt in
        let* _ : M.Val never.t := Break in
        let* α0 : M.Val unit := M.alloc tt in
        never_to_any α0
      else
        M.alloc tt)).
