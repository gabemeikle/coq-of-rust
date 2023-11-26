(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let triple = (0, -2, 3);
    // TODO ^ Try different values for `triple`

    println!("Tell me about {:?}", triple);
    // Match can be used to destructure a tuple
    match triple {
        // Destructure the second and third elements
        (0, y, z) => println!("First is `0`, `y` is {:?}, and `z` is {:?}", y, z),
        (1, ..) => println!("First is `1` and the rest doesn't matter"),
        (.., 2) => println!("last is `2` and the rest doesn't matter"),
        (3, .., 4) => println!("First is `3`, last is `4`, and the rest doesn't matter"),
        // `..` can be used to ignore the rest of the tuple
        _ => println!("It doesn't matter what they are"),
        // `_` means don't bind the value to a variable
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* triple : M.Val ((i32.t * i32.t) * i32.t) :=
      let* α0 : M.Val i32.t := M.alloc 0 in
      let* α1 : i32.t := M.read α0 in
      let* α2 : M.Val i32.t := M.alloc (- 2) in
      let* α3 : i32.t := M.read α2 in
      let* α4 : M.Val i32.t := M.alloc 3 in
      let* α5 : i32.t := M.read α4 in
      M.alloc (α1, α3, α5) in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Tell me about "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref ((i32.t * i32.t) * i32.t) := borrow triple in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
        let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
        let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
        let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
        let* α13 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α12 in
        let* α14 : unit := std.io.stdio._print α13 in
        M.alloc α14 in
      M.alloc tt in
    let* α0 : (i32.t * i32.t) * i32.t := M.read triple in
    let* α0 : M.Val unit :=
      match α0 with
      | (_, y, z) =>
        let* z := M.alloc z in
        let* y := M.alloc y in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc
              [
                mk_str "First is `0`, `y` is ";
                mk_str ", and `z` is ";
                mk_str "
"
              ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref i32.t := borrow y in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_debug"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : ref i32.t := borrow z in
          let* α9 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_debug"] α8 in
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
      | (_) =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "First is `1` and the rest doesn't matter
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
        M.alloc tt
      | (_) =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "last is `2` and the rest doesn't matter
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
        M.alloc tt
      | (_, _) =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc
              [ mk_str "First is `3`, last is `4`, and the rest doesn't matter
"
              ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_const"] α4 in
          let* α6 : unit := std.io.stdio._print α5 in
          M.alloc α6 in
        M.alloc tt
      | _ =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "It doesn't matter what they are
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
        M.alloc tt
      end in
    M.read α0).
