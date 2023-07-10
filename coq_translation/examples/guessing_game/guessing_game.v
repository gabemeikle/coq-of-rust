(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} (_ : unit) : M (H := H) unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "Guess the number!
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* secret_number :=
    let* α0 := rand.thread_rng tt in
    let* α1 := LangItem 1 100 in
    α0.["gen_range"] α1 in
  while
    (let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "Please input your guess.
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    let* guess := alloc.string.String::["new"] tt in
    let* _ :=
      let* α0 := std.io.stdio.stdin tt in
      let* α1 := α0.["read_line"] (addr_of guess) in
      α1.["expect"] "Failed to read line" in
    let* guess :=
      let* α0 := guess.["trim"] in
      let* α1 := α0.["parse"] in
      match α1 with
      | core.result.Result.Ok num => Pure num
      | core.result.Result.Err _ => Pure Continue
      end in
    let* _ :=
      let* _ :=
        let* α0 := format_argument::["new_display"] (addr_of guess) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "You guessed: "; "
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt in
    let* α0 := guess.["cmp"] (addr_of secret_number) in
    match α0 with
    | core.cmp.Ordering.Less =>
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"] (addr_of [ "Too small!
" ]) in
        std.io.stdio._print α0 in
      Pure tt
    | core.cmp.Ordering.Greater =>
      let* _ :=
        let* α0 := format_arguments::["new_const"] (addr_of [ "Too big!
" ]) in
        std.io.stdio._print α0 in
      Pure tt
    | core.cmp.Ordering.Equal =>
      let* _ :=
        let* _ :=
          let* α0 :=
            format_arguments::["new_const"] (addr_of [ "You win!
" ]) in
          std.io.stdio._print α0 in
        Pure tt in
      let _ := Break in
      Pure tt
    end).
