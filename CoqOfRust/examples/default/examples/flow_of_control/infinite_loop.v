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
  let* count : M.Val u32.t := M.alloc ((Integer.of_Z 0) : u32.t) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Let's count until infinity!
") in
      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
      let* α3 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α2) in
      let* α4 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_const"] α3) in
      let* α5 : unit := M.call (std.io.stdio._print α4) in
      M.alloc α5 in
    M.alloc tt in
  let* α0 : M.Val unit :=
    M.loop
      (let* _ : M.Val unit :=
        let β : M.Val u32.t := count in
        let* α0 := M.read β in
        let* α1 := BinOp.Panic.add α0 ((Integer.of_Z 1) : u32.t) in
        assign β α1 in
      let* _ : M.Val unit :=
        let* α0 : u32.t := M.read count in
        let* α1 : M.Val bool.t :=
          M.alloc (BinOp.Pure.eq α0 ((Integer.of_Z 3) : u32.t)) in
        let* α2 : bool.t := M.read (use α1) in
        if α2 then
          let* _ : M.Val unit :=
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "three
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt in
          let* α0 : M.Val never.t := M.continue in
          let* α1 := M.read α0 in
          let* α2 : unit := never_to_any α1 in
          M.alloc α2
        else
          M.alloc tt in
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "") in
          let* α1 : ref str.t := M.read (mk_str "
") in
          let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
          let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
          let* α4 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α3) in
          let* α5 : core.fmt.rt.Argument.t :=
            M.call (core.fmt.rt.Argument.t::["new_display"] (borrow count)) in
          let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
          let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc (borrow α6) in
          let* α8 : ref (slice core.fmt.rt.Argument.t) :=
            M.read (pointer_coercion "Unsize" α7) in
          let* α9 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
          let* α10 : unit := M.call (std.io.stdio._print α9) in
          M.alloc α10 in
        M.alloc tt in
      let* α0 : u32.t := M.read count in
      let* α1 : M.Val bool.t :=
        M.alloc (BinOp.Pure.eq α0 ((Integer.of_Z 5) : u32.t)) in
      let* α2 : bool.t := M.read (use α1) in
      if α2 then
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : ref str.t := M.read (mk_str "OK, that's enough
") in
            let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
            let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
            let* α3 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α2) in
            let* α4 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_const"] α3) in
            let* α5 : unit := M.call (std.io.stdio._print α4) in
            M.alloc α5 in
          M.alloc tt in
        let* α0 : M.Val never.t := M.break in
        let* α1 := M.read α0 in
        let* α2 : unit := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt) in
  M.read α0.
