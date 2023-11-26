(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Because of the annotation, the compiler knows that `elem` has type u8.
    let elem = 5u8;

    // Create an empty vector (a growable array).
    let mut vec = Vec::new();
    // At this point the compiler doesn't know the exact type of `vec`, it
    // just knows that it's a vector of something (`Vec<_>`).

    // Insert `elem` in the vector.
    vec.push(elem);
    // Aha! Now the compiler knows that `vec` is a vector of `u8`s (`Vec<u8>`)
    // TODO ^ Try commenting out the `vec.push(elem)` line

    println!("{:?}", vec);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* elem : M.Val u8.t :=
      let* α0 : M.Val u8.t := M.alloc 5 in
      M.copy α0 in
    let* vec : M.Val (alloc.vec.Vec.t u8.t alloc.alloc.Global.t) :=
      let* α0 : alloc.vec.Vec.t u8.t alloc.alloc.Global.t :=
        (alloc.vec.Vec.t u8.t alloc.alloc.Global.t)::["new"] in
      M.alloc α0 in
    let* _ : M.Val unit :=
      let* α0 : mut_ref (alloc.vec.Vec.t u8.t alloc.alloc.Global.t) :=
        borrow_mut vec in
      let* α1 : u8.t := M.read elem in
      let* α2 : unit :=
        (alloc.vec.Vec.t u8.t alloc.alloc.Global.t)::["push"] α0 α1 in
      M.alloc α2 in
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
        let* α7 : ref (alloc.vec.Vec.t u8.t alloc.alloc.Global.t) :=
          borrow vec in
        let* α8 : M.Val (alloc.vec.Vec.t u8.t alloc.alloc.Global.t) :=
          deref α7 in
        let* α9 : ref (alloc.vec.Vec.t u8.t alloc.alloc.Global.t) :=
          borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
        let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    M.alloc tt).
