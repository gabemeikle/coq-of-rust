(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition double_first
    `{ℋ : State.Trait}
    (vec : alloc.vec.Vec (ref str) alloc.vec.Vec.Default.A)
    :
      M
        (core.option.Option
          (core.result.Result i32 core.num.error.ParseIntError)) :=
  M.function_body
    (let* α0 :
        ltac:(refine (ref (alloc.vec.Vec (ref str) alloc.alloc.Global))) :=
      borrow vec in
    let* α1 : ltac:(refine (ref (slice (ref str)))) :=
      (core.ops.deref.Deref.deref
          (Self := alloc.vec.Vec (ref str) alloc.alloc.Global)
          (Trait := ltac:(refine _)))
        α0 in
    let* α2 : ltac:(refine (slice (ref str))) := deref α1 in
    let* α3 : ltac:(refine (ref (slice (ref str)))) := borrow α2 in
    let* α4 : ltac:(refine (core.option.Option (ref (ref str)))) :=
      (slice (ref str))::["first"] α3 in
    (core.option.Option (ref (ref str)))::["map"]
      α4
      (let* α0 : ltac:(refine (ref str)) := deref first in
      let* α1 : ltac:(refine str) := deref α0 in
      let* α2 : ltac:(refine (ref str)) := borrow α1 in
      let* α3 :
          ltac:(refine (core.result.Result i32 core.num.error.ParseIntError)) :=
        str::["parse"] α2 in
      (core.result.Result i32 core.num.error.ParseIntError)::["map"]
        α3
        (let* α0 : ltac:(refine i32) := M.alloc 2 in
        BinOp.mul α0 n))).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* numbers :
        ltac:(refine (alloc.vec.Vec (ref str) alloc.alloc.Global)) :=
      let* α0 : ltac:(refine str) := deref (mk_str "93") in
      let* α1 : ltac:(refine (ref str)) := borrow α0 in
      let* α2 : ltac:(refine str) := deref (mk_str "18") in
      let* α3 : ltac:(refine (ref str)) := borrow α2 in
      let* α4 : ltac:(refine (array (ref str))) :=
        M.alloc [ mk_str "42"; α1; α3 ] in
      let* α5 :
          ltac:(refine
            (alloc.boxed.Box (array (ref str)) alloc.alloc.Global)) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α4 in
      let* α6 :
          ltac:(refine
            (alloc.boxed.Box (slice (ref str)) alloc.alloc.Global)) :=
        pointer_coercion "Unsize" α5 in
      (slice (ref str))::["into_vec"] α6 in
    let* empty : ltac:(refine (alloc.vec.Vec (ref str) alloc.alloc.Global)) :=
      (alloc.vec.Vec (ref str) alloc.alloc.Global)::["new"] in
    let* strings : ltac:(refine (alloc.vec.Vec (ref str) alloc.alloc.Global)) :=
      let* α0 : ltac:(refine str) := deref (mk_str "93") in
      let* α1 : ltac:(refine (ref str)) := borrow α0 in
      let* α2 : ltac:(refine str) := deref (mk_str "18") in
      let* α3 : ltac:(refine (ref str)) := borrow α2 in
      let* α4 : ltac:(refine (array (ref str))) :=
        M.alloc [ mk_str "tofu"; α1; α3 ] in
      let* α5 :
          ltac:(refine
            (alloc.boxed.Box (array (ref str)) alloc.alloc.Global)) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α4 in
      let* α6 :
          ltac:(refine
            (alloc.boxed.Box (slice (ref str)) alloc.alloc.Global)) :=
        pointer_coercion "Unsize" α5 in
      (slice (ref str))::["into_vec"] α6 in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "The first doubled is "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 :
            ltac:(refine
              (core.option.Option
                (core.result.Result i32 core.num.error.ParseIntError))) :=
          pulling_results_out_of_options.double_first numbers in
        let* α6 :
            ltac:(refine
              (ref
                (core.option.Option
                  (core.result.Result i32 core.num.error.ParseIntError)))) :=
          borrow α5 in
        let* α7 :
            ltac:(refine
              (core.option.Option
                (core.result.Result i32 core.num.error.ParseIntError))) :=
          deref α6 in
        let* α8 :
            ltac:(refine
              (ref
                (core.option.Option
                  (core.result.Result i32 core.num.error.ParseIntError)))) :=
          borrow α7 in
        let* α9 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α8 in
        let* α10 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α9 ] in
        let* α11 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α10 in
        let* α12 : ltac:(refine (array core.fmt.rt.Argument)) := deref α11 in
        let* α13 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α12 in
        let* α14 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α14 in
        std.io.stdio._print α15 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "The first doubled is "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 :
            ltac:(refine
              (core.option.Option
                (core.result.Result i32 core.num.error.ParseIntError))) :=
          pulling_results_out_of_options.double_first empty in
        let* α6 :
            ltac:(refine
              (ref
                (core.option.Option
                  (core.result.Result i32 core.num.error.ParseIntError)))) :=
          borrow α5 in
        let* α7 :
            ltac:(refine
              (core.option.Option
                (core.result.Result i32 core.num.error.ParseIntError))) :=
          deref α6 in
        let* α8 :
            ltac:(refine
              (ref
                (core.option.Option
                  (core.result.Result i32 core.num.error.ParseIntError)))) :=
          borrow α7 in
        let* α9 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α8 in
        let* α10 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α9 ] in
        let* α11 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α10 in
        let* α12 : ltac:(refine (array core.fmt.rt.Argument)) := deref α11 in
        let* α13 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α12 in
        let* α14 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α14 in
        std.io.stdio._print α15 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "The first doubled is "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 :
            ltac:(refine
              (core.option.Option
                (core.result.Result i32 core.num.error.ParseIntError))) :=
          pulling_results_out_of_options.double_first strings in
        let* α6 :
            ltac:(refine
              (ref
                (core.option.Option
                  (core.result.Result i32 core.num.error.ParseIntError)))) :=
          borrow α5 in
        let* α7 :
            ltac:(refine
              (core.option.Option
                (core.result.Result i32 core.num.error.ParseIntError))) :=
          deref α6 in
        let* α8 :
            ltac:(refine
              (ref
                (core.option.Option
                  (core.result.Result i32 core.num.error.ParseIntError)))) :=
          borrow α7 in
        let* α9 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α8 in
        let* α10 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α9 ] in
        let* α11 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α10 in
        let* α12 : ltac:(refine (array core.fmt.rt.Argument)) := deref α11 in
        let* α13 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α12 in
        let* α14 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α14 in
        std.io.stdio._print α15 in
      M.alloc tt in
    M.alloc tt).
