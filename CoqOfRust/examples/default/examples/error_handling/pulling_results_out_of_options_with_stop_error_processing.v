(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn double_first(vec: Vec<&str>) -> Result<Option<i32>, ParseIntError> {
    let opt = vec.first().map(|first| first.parse::<i32>().map(|n| 2 * n));

    opt.map_or(Ok(None), |r| r.map(Some))
}
*)
Definition double_first
    (vec : alloc.vec.Vec.t (ref str.t) alloc.vec.Vec.Default.A)
    :
      M
        (core.result.Result.t
          (core.option.Option.t i32.t)
          core.num.error.ParseIntError.t) :=
  let* vec := M.alloc vec in
  let* opt :
      M.Val
        (core.option.Option.t
          (core.result.Result.t i32.t core.num.error.ParseIntError.t)) :=
    let* α0 : ref (slice (ref str.t)) :=
      M.call
        ((core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          (borrow vec)) in
    let* α1 : core.option.Option.t (ref (ref str.t)) :=
      M.call ((slice (ref str.t))::["first"] α0) in
    let* α2 :
        core.option.Option.t
          (core.result.Result.t i32.t core.num.error.ParseIntError.t) :=
      M.call
        ((core.option.Option.t (ref (ref str.t)))::["map"]
          α1
          (fun (first : ref (ref str.t)) =>
            (let* first := M.alloc first in
            let* α0 : ref (ref str.t) := M.read first in
            let* α1 : ref str.t := M.read (deref α0) in
            let* α2 :
                core.result.Result.t i32.t core.num.error.ParseIntError.t :=
              M.call (str.t::["parse"] α1) in
            M.call
              ((core.result.Result.t
                    i32.t
                    core.num.error.ParseIntError.t)::["map"]
                α2
                (fun (n : i32.t) =>
                  (let* n := M.alloc n in
                  let* α0 : i32.t := M.read n in
                  BinOp.Panic.mul (Integer.of_Z 2) α0) :
                  M i32.t))) :
            M (core.result.Result.t i32.t core.num.error.ParseIntError.t))) in
    M.alloc α2 in
  let* α0 :
      core.option.Option.t
        (core.result.Result.t i32.t core.num.error.ParseIntError.t) :=
    M.read opt in
  let* α1 :
      core.result.Result.t
        (core.option.Option.t i32.t)
        core.num.error.ParseIntError.t :=
    M.call
      ((core.option.Option.t
            (core.result.Result.t
              i32.t
              core.num.error.ParseIntError.t))::["map_or"]
        α0
        (core.result.Result.Ok core.option.Option.None)
        (fun (r : core.result.Result.t i32.t core.num.error.ParseIntError.t) =>
          (let* r := M.alloc r in
          let* α0 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
            M.read r in
          M.call
            ((core.result.Result.t
                  i32.t
                  core.num.error.ParseIntError.t)::["map"]
              α0
              "unimplemented parent_kind")) :
          M
            (core.result.Result.t
              (core.option.Option.t i32.t)
              core.num.error.ParseIntError.t))) in
  let* α0 :
      M.Val
        (core.result.Result.t
          (core.option.Option.t i32.t)
          core.num.error.ParseIntError.t) :=
    M.alloc α1 in
  M.read α0.

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    println!("The first doubled is {:?}", double_first(numbers));
    println!("The first doubled is {:?}", double_first(empty));
    println!("The first doubled is {:?}", double_first(strings));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* numbers : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
    let* α0 : ref str.t := M.read (mk_str "42") in
    let* α1 : ref str.t := M.read (mk_str "93") in
    let* α2 : ref str.t := M.read (mk_str "18") in
    let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
    let* α4 :
        M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3) in
    let* α5 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
      M.read (pointer_coercion "Unsize" α4) in
    let* α6 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call ((slice (ref str.t))::["into_vec"] α5) in
    M.alloc α6 in
  let* empty : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)::["new"] in
    M.alloc α0 in
  let* strings : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
    let* α0 : ref str.t := M.read (mk_str "tofu") in
    let* α1 : ref str.t := M.read (mk_str "93") in
    let* α2 : ref str.t := M.read (mk_str "18") in
    let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
    let* α4 :
        M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3) in
    let* α5 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
      M.read (pointer_coercion "Unsize" α4) in
    let* α6 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call ((slice (ref str.t))::["into_vec"] α5) in
    M.alloc α6 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "The first doubled is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        M.read numbers in
      let* α6 :
          core.result.Result.t
            (core.option.Option.t i32.t)
            core.num.error.ParseIntError.t :=
        M.call
          (pulling_results_out_of_options_with_stop_error_processing.double_first
            α5) in
      let* α7 :
          M.Val
            (core.result.Result.t
              (core.option.Option.t i32.t)
              core.num.error.ParseIntError.t) :=
        M.alloc α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow α7)) in
      let* α9 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8 ] in
      let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α9) in
      let* α11 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α10) in
      let* α12 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
      let* α13 : unit := M.call (std.io.stdio._print α12) in
      M.alloc α13 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "The first doubled is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        M.read empty in
      let* α6 :
          core.result.Result.t
            (core.option.Option.t i32.t)
            core.num.error.ParseIntError.t :=
        M.call
          (pulling_results_out_of_options_with_stop_error_processing.double_first
            α5) in
      let* α7 :
          M.Val
            (core.result.Result.t
              (core.option.Option.t i32.t)
              core.num.error.ParseIntError.t) :=
        M.alloc α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow α7)) in
      let* α9 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8 ] in
      let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α9) in
      let* α11 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α10) in
      let* α12 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
      let* α13 : unit := M.call (std.io.stdio._print α12) in
      M.alloc α13 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "The first doubled is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        M.read strings in
      let* α6 :
          core.result.Result.t
            (core.option.Option.t i32.t)
            core.num.error.ParseIntError.t :=
        M.call
          (pulling_results_out_of_options_with_stop_error_processing.double_first
            α5) in
      let* α7 :
          M.Val
            (core.result.Result.t
              (core.option.Option.t i32.t)
              core.num.error.ParseIntError.t) :=
        M.alloc α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow α7)) in
      let* α9 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8 ] in
      let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α9) in
      let* α11 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α10) in
      let* α12 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
      let* α13 : unit := M.call (std.io.stdio._print α12) in
      M.alloc α13 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
