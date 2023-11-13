(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let n = 5;

    if n < 0 {
        print!("{} is negative", n);
    } else if n > 0 {
        print!("{} is positive", n);
    } else {
        print!("{} is zero", n);
    }

    let big_n = if n < 10 && n > -10 {
        println!(", and is a small number, increase ten-fold");

        // This expression returns an `i32`.
        10 * n
    } else {
        println!(", and is a big number, halve the number");

        // This expression must return an `i32` as well.
        n / 2
        // TODO ^ Try suppressing this expression with a semicolon.
    };
    //   ^ Don't forget to put a semicolon here! All `let` bindings need it.

    println!("{} -> {}", n, big_n);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* n : ltac:(refine (M.Val i32.t)) := M.alloc 5 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
      let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.lt n α0 in
      let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
      let* α3 := M.read α2 in
      if (α3 : bool) then
        let* _ : ltac:(refine (M.Val unit)) :=
          let* _ : ltac:(refine (M.Val unit)) :=
            let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
              M.alloc [ mk_str ""; mk_str " is negative" ] in
            let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
              borrow α0 in
            let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
              pointer_coercion "Unsize" α1 in
            let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow n in
            let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
              core.fmt.rt.Argument.t::["new_display"] α3 in
            let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
              M.alloc [ α4 ] in
            let* α6 :
                ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
              borrow α5 in
            let* α7 :
                ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
              pointer_coercion "Unsize" α6 in
            let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
              core.fmt.Arguments.t::["new_v1"] α2 α7 in
            std.io.stdio._print α8 in
          M.alloc tt in
        M.alloc tt
      else
        let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
        let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.gt n α0 in
        let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
        let* α3 := M.read α2 in
        if (α3 : bool) then
          let* _ : ltac:(refine (M.Val unit)) :=
            let* _ : ltac:(refine (M.Val unit)) :=
              let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
                M.alloc [ mk_str ""; mk_str " is positive" ] in
              let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
                borrow α0 in
              let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
                pointer_coercion "Unsize" α1 in
              let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow n in
              let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                core.fmt.rt.Argument.t::["new_display"] α3 in
              let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
                M.alloc [ α4 ] in
              let* α6 :
                  ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
                borrow α5 in
              let* α7 :
                  ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
                pointer_coercion "Unsize" α6 in
              let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
                core.fmt.Arguments.t::["new_v1"] α2 α7 in
              std.io.stdio._print α8 in
            M.alloc tt in
          M.alloc tt
        else
          let* _ : ltac:(refine (M.Val unit)) :=
            let* _ : ltac:(refine (M.Val unit)) :=
              let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
                M.alloc [ mk_str ""; mk_str " is zero" ] in
              let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
                borrow α0 in
              let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
                pointer_coercion "Unsize" α1 in
              let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow n in
              let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                core.fmt.rt.Argument.t::["new_display"] α3 in
              let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
                M.alloc [ α4 ] in
              let* α6 :
                  ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
                borrow α5 in
              let* α7 :
                  ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
                pointer_coercion "Unsize" α6 in
              let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
                core.fmt.Arguments.t::["new_v1"] α2 α7 in
              std.io.stdio._print α8 in
            M.alloc tt in
          M.alloc tt in
    let* big_n : ltac:(refine (M.Val i32.t)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 10 in
      let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.lt n α0 in
      let* α2 : ltac:(refine (M.Val i32.t)) := M.alloc (- 10) in
      let* α3 : ltac:(refine (M.Val bool.t)) := BinOp.gt n α2 in
      let* α4 : ltac:(refine (M.Val bool.t)) := BinOp.and α1 α3 in
      let* α5 : ltac:(refine (M.Val bool.t)) := use α4 in
      let* α6 := M.read α5 in
      if (α6 : bool) then
        let* _ : ltac:(refine (M.Val unit)) :=
          let* _ : ltac:(refine (M.Val unit)) :=
            let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
              M.alloc
                [ mk_str ", and is a small number, increase ten-fold
" ] in
            let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
              borrow α0 in
            let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
              pointer_coercion "Unsize" α1 in
            let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
              core.fmt.Arguments.t::["new_const"] α2 in
            std.io.stdio._print α3 in
          M.alloc tt in
        let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 10 in
        BinOp.mul α0 n
      else
        let* _ : ltac:(refine (M.Val unit)) :=
          let* _ : ltac:(refine (M.Val unit)) :=
            let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
              M.alloc [ mk_str ", and is a big number, halve the number
" ] in
            let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
              borrow α0 in
            let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
              pointer_coercion "Unsize" α1 in
            let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
              core.fmt.Arguments.t::["new_const"] α2 in
            std.io.stdio._print α3 in
          M.alloc tt in
        let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 2 in
        BinOp.div n α0 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str ""; mk_str " -> "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow n in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (ref i32.t))) := borrow big_n in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4; α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    M.alloc tt).
