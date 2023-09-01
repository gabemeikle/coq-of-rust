(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let* _ := functions.fizzbuzz_to 100 in
  Pure tt.

Definition is_divisible_by
    `{H' : State.Trait}
    (lhs : u32)
    (rhs : u32)
    : M (H := H') bool :=
  let* _ :=
    let* α0 := rhs.["eq"] 0 in
    if (α0 : bool) then
      let* _ := Return false in
      Pure tt
    else
      Pure tt in
  let* α0 := lhs.["rem"] rhs in
  α0.["eq"] 0.

Definition fizzbuzz `{H' : State.Trait} (n : u32) : M (H := H') unit :=
  let* α0 := functions.is_divisible_by n 15 in
  if (α0 : bool) then
    let* _ :=
      let* _ :=
        let* α0 := format_arguments::["new_const"] (addr_of [ "fizzbuzz
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure tt
  else
    let* α0 := functions.is_divisible_by n 3 in
    if (α0 : bool) then
      let* _ :=
        let* _ :=
          let* α0 := format_arguments::["new_const"] (addr_of [ "fizz
" ]) in
          std.io.stdio._print α0 in
        Pure tt in
      Pure tt
    else
      let* α0 := functions.is_divisible_by n 5 in
      if (α0 : bool) then
        let* _ :=
          let* _ :=
            let* α0 := format_arguments::["new_const"] (addr_of [ "buzz
" ]) in
            std.io.stdio._print α0 in
          Pure tt in
        Pure tt
      else
        let* _ :=
          let* _ :=
            let* α0 := format_argument::["new_display"] (addr_of n) in
            let* α1 :=
              format_arguments::["new_v1"]
                (addr_of [ ""; "
" ])
                (addr_of [ α0 ]) in
            std.io.stdio._print α1 in
          Pure tt in
        Pure tt.

Definition fizzbuzz_to `{H' : State.Trait} (n : u32) : M (H := H') unit :=
  let* α0 := std.ops.RangeInclusive::["new"] 1 n in
  let* α1 := α0.["into_iter"] in
  match α1 with
  | iter =>
    loop
      (let* _ :=
        let* α0 := (addr_of iter).["next"] in
        match α0 with
        | core.option.Option.None  => Break
        | core.option.Option.Some n =>
          let* _ := functions.fizzbuzz n in
          Pure tt
        end in
      Pure tt)
  end.
