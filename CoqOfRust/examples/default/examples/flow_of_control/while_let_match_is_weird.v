(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Make `optional` of type `Option<i32>`
    let mut optional = Some(0);

    // Repeatedly try this test.
    loop {
        match optional {
            // If `optional` destructures, evaluate the block.
            Some(i) => {
                if i > 9 {
                    println!("Greater than 9, quit!");
                    optional = None;
                } else {
                    println!("`i` is `{:?}`. Try again.", i);
                    optional = Some(i + 1);
                }
                // ^ Requires 3 indentations!
            }
            // Quit the loop when the destructure fails:
            _ => {
                break;
            } // ^ Why should this be required? There must be a better way!
        }
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* optional : M.Val (core.option.Option.t i32.t) :=
    M.alloc (core.option.Option.Some (Integer.of_Z 0)) in
  let* α0 : M.Val unit :=
    M.loop
      (match_operator
        optional
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let γ0_0 := core.option.Option.Get_Some_0 γ in
              let* i := M.copy γ0_0 in
              let* α0 : i32.t := M.read i in
              let* α1 : M.Val bool.t :=
                M.alloc (BinOp.Pure.gt α0 (Integer.of_Z 9)) in
              let* α2 : bool.t := M.read (use α1) in
              if α2 then
                let* _ : M.Val unit :=
                  let* _ : M.Val unit :=
                    let* α0 : ref str.t :=
                      M.read (mk_str "Greater than 9, quit!
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
                let* _ : M.Val unit :=
                  assign optional core.option.Option.None in
                M.alloc tt
              else
                let* _ : M.Val unit :=
                  let* _ : M.Val unit :=
                    let* α0 : ref str.t := M.read (mk_str "`i` is `") in
                    let* α1 : ref str.t := M.read (mk_str "`. Try again.
") in
                    let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
                    let* α3 : M.Val (ref (array (ref str.t))) :=
                      M.alloc (borrow α2) in
                    let* α4 : ref (slice (ref str.t)) :=
                      M.read (pointer_coercion "Unsize" α3) in
                    let* α5 : core.fmt.rt.Argument.t :=
                      M.call
                        (core.fmt.rt.Argument.t::["new_debug"] (borrow i)) in
                    let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                      M.alloc [ α5 ] in
                    let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                      M.alloc (borrow α6) in
                    let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                      M.read (pointer_coercion "Unsize" α7) in
                    let* α9 : core.fmt.Arguments.t :=
                      M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
                    let* α10 : unit := M.call (std.io.stdio._print α9) in
                    M.alloc α10 in
                  M.alloc tt in
                let* _ : M.Val unit :=
                  let* α0 : i32.t := M.read i in
                  let* α1 : i32.t := BinOp.Panic.add α0 (Integer.of_Z 1) in
                  assign optional (core.option.Option.Some α1) in
                M.alloc tt
            | _ => M.break_match
            end) :
            M (M.Val unit);
          fun γ =>
            (let* _ : M.Val never.t := M.break in
            let* α0 : M.Val unit := M.alloc tt in
            let* α1 := M.read α0 in
            let* α2 : unit := never_to_any α1 in
            M.alloc α2) :
            M (M.Val unit)
        ]) in
  M.read α0.
