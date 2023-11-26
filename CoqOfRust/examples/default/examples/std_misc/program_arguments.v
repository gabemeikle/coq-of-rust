(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let args: Vec<String> = env::args().collect();

    // The first argument is the path that was used to call the program.
    println!("My path is {}.", args[0]);

    // The rest of the arguments are the passed command line parameters.
    // Call the program like this:
    //   $ ./args arg1 arg2
    println!("I got {:?} arguments: {:?}.", args.len() - 1, &args[1..]);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* args :
        M.Val (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
      let* α0 : std.env.Args.t := std.env.args in
      let* α1 : alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t :=
        (core.iter.traits.iterator.Iterator.collect
            (Self := std.env.Args.t)
            (Trait := ltac:(refine _)))
          α0 in
      M.alloc α1 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "My path is "; mk_str ".
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 :
            ref (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
          borrow args in
        let* α8 : M.Val usize.t := M.alloc 0 in
        let* α9 : usize.t := M.read α8 in
        let* α10 : ref alloc.string.String.t :=
          (core.ops.index.Index.index
              (Self :=
                alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)
              (Trait := ltac:(refine _)))
            α7
            α9 in
        let* α11 : M.Val alloc.string.String.t := deref α10 in
        let* α12 : ref alloc.string.String.t := borrow α11 in
        let* α13 : M.Val alloc.string.String.t := deref α12 in
        let* α14 : ref alloc.string.String.t := borrow α13 in
        let* α15 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α14 in
        let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α16 ] in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (array core.fmt.rt.Argument.t) := deref α18 in
        let* α20 : ref (array core.fmt.rt.Argument.t) := borrow α19 in
        let* α21 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α20 in
        let* α22 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α21 in
        let* α23 : ref (slice core.fmt.rt.Argument.t) := M.read α22 in
        let* α24 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α23 in
        let* α25 : unit := std.io.stdio._print α24 in
        M.alloc α25 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "I got "; mk_str " arguments: "; mk_str ".
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 :
            ref (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
          borrow args in
        let* α8 : usize.t :=
          (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)::["len"]
            α7 in
        let* α9 : M.Val usize.t := M.alloc α8 in
        let* α10 : M.Val usize.t := M.alloc 1 in
        let* α11 : M.Val usize.t := BinOp.sub α9 α10 in
        let* α12 : ref usize.t := borrow α11 in
        let* α13 : M.Val usize.t := deref α12 in
        let* α14 : ref usize.t := borrow α13 in
        let* α15 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α14 in
        let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
        let* α17 :
            ref (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
          borrow args in
        let* α18 : M.Val usize.t := M.alloc 1 in
        let* α19 : usize.t := M.read α18 in
        let* α20 : ref (slice alloc.string.String.t) :=
          (core.ops.index.Index.index
              (Self :=
                alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)
              (Trait := ltac:(refine _)))
            α17
            {| core.ops.range.RangeFrom.start := α19; |} in
        let* α21 : M.Val (slice alloc.string.String.t) := deref α20 in
        let* α22 : ref (slice alloc.string.String.t) := borrow α21 in
        let* α23 : M.Val (ref (slice alloc.string.String.t)) := M.alloc α22 in
        let* α24 : ref (ref (slice alloc.string.String.t)) := borrow α23 in
        let* α25 : M.Val (ref (slice alloc.string.String.t)) := deref α24 in
        let* α26 : ref (ref (slice alloc.string.String.t)) := borrow α25 in
        let* α27 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α26 in
        let* α28 : M.Val core.fmt.rt.Argument.t := M.alloc α27 in
        let* α29 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α16; α28 ] in
        let* α30 : ref (array core.fmt.rt.Argument.t) := borrow α29 in
        let* α31 : M.Val (array core.fmt.rt.Argument.t) := deref α30 in
        let* α32 : ref (array core.fmt.rt.Argument.t) := borrow α31 in
        let* α33 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α32 in
        let* α34 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α33 in
        let* α35 : ref (slice core.fmt.rt.Argument.t) := M.read α34 in
        let* α36 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α35 in
        let* α37 : unit := std.io.stdio._print α36 in
        M.alloc α37 in
      M.alloc tt in
    M.alloc tt).
