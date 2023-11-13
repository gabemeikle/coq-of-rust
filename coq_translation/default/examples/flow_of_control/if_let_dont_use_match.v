(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Make `optional` of type `Option<i32>`
    let optional = Some(7);

    match optional {
        Some(i) => {
            println!("This is a really long string and `{:?}`", i);
            // ^ Needed 2 indentations just so we could destructure
            // `i` from the option.
        }
        _ => {}
        // ^ Required because `match` is exhaustive. Doesn't it seem
        // like wasted space?
    };
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* optional : ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 7 in
      let* α1 := M.read α0 in
      M.alloc (core.option.Option.Some α1) in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 := M.read optional in
      match α0 with
      | core.option.Option.Some i =>
        let* i := M.alloc i in
        let* _ : ltac:(refine (M.Val unit)) :=
          let* _ : ltac:(refine (M.Val unit)) :=
            let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
              M.alloc
                [ mk_str "This is a really long string and `"; mk_str "`
" ] in
            let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
              borrow α0 in
            let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
              pointer_coercion "Unsize" α1 in
            let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow i in
            let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
              core.fmt.rt.Argument.t::["new_debug"] α3 in
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
      | _ => M.alloc tt
      end in
    M.alloc tt).
