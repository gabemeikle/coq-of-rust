(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Make `optional` of type `Option<i32>`
    let mut optional = Some(0);

    // This reads: "while `let` destructures `optional` into
    // `Some(i)`, evaluate the block (`{}`). Else `break`".
    while let Some(i) = optional {
        if i > 9 {
            println!("Greater than 9, quit!");
            optional = None;
        } else {
            println!("`i` is `{:?}`. Try again.", i);
            optional = Some(i + 1);
        }
        // ^ Less rightward drift and doesn't require
        // explicitly handling the failing case.
    }
    // ^ `if let` had additional optional `else`/`else if`
    // clauses. `while let` does not have these.
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* optional : M.Val (core.option.Option.t i32.t) :=
      let* α0 : M.Val i32.t := M.alloc 0 in
      let* α1 : i32.t := M.read α0 in
      M.alloc (core.option.Option.Some α1) in
    let* α0 : M.Val unit :=
      loop
        (let* α0 : M.Val bool.t :=
          let_if core.option.Option.Some i := optional in
        let* α1 : bool.t := M.read α0 in
        if (α1 : bool) then
          let* α0 : M.Val i32.t := M.alloc 9 in
          let* α1 : M.Val bool.t := BinOp.gt i α0 in
          let* α2 : M.Val bool.t := use α1 in
          let* α3 : bool.t := M.read α2 in
          if (α3 : bool) then
            let* _ : M.Val unit :=
              let* _ : M.Val unit :=
                let* α0 : M.Val (array (ref str.t)) :=
                  M.alloc [ mk_str "Greater than 9, quit!
" ] in
                let* α1 : ref (array (ref str.t)) := borrow α0 in
                let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
                let* α3 : M.Val (ref (slice (ref str.t))) :=
                  pointer_coercion "Unsize" α2 in
                let* α4 : ref (slice (ref str.t)) := M.read α3 in
                let* α5 : core.fmt.Arguments.t :=
                  core.fmt.Arguments.t::["new_const"] α4 in
                let* α6 : unit := std.io.stdio._print α5 in
                M.alloc α6 in
              M.alloc tt in
            let* _ : M.Val unit := assign optional core.option.Option.None in
            M.alloc tt
          else
            let* _ : M.Val unit :=
              let* _ : M.Val unit :=
                let* α0 : M.Val (array (ref str.t)) :=
                  M.alloc [ mk_str "`i` is `"; mk_str "`. Try again.
" ] in
                let* α1 : ref (array (ref str.t)) := borrow α0 in
                let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
                let* α3 : M.Val (ref (slice (ref str.t))) :=
                  pointer_coercion "Unsize" α2 in
                let* α4 : ref (slice (ref str.t)) := M.read α3 in
                let* α5 : ref i32.t := borrow i in
                let* α6 : core.fmt.rt.Argument.t :=
                  core.fmt.rt.Argument.t::["new_debug"] α5 in
                let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
                let* α8 : M.Val (array core.fmt.rt.Argument.t) :=
                  M.alloc [ α7 ] in
                let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
                let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                  M.alloc α9 in
                let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
                  pointer_coercion "Unsize" α10 in
                let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
                let* α13 : core.fmt.Arguments.t :=
                  core.fmt.Arguments.t::["new_v1"] α4 α12 in
                let* α14 : unit := std.io.stdio._print α13 in
                M.alloc α14 in
              M.alloc tt in
            let* _ : M.Val unit :=
              let* α0 : M.Val i32.t := M.alloc 1 in
              let* α1 : M.Val i32.t := BinOp.add i α0 in
              let* α2 : i32.t := M.read α1 in
              assign optional (core.option.Option.Some α2) in
            M.alloc tt
        else
          let* _ : M.Val unit :=
            let* α0 : M.Val never.t := Break in
            never_to_any α0 in
          let* α0 : M.Val unit := M.alloc tt in
          never_to_any α0) in
    M.read α0).
