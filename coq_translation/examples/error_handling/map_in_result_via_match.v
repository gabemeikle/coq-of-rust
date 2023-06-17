(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition multiply
    (first_number_str : ref str)
    (second_number_str : ref str)
    : M (Result i32 std.num.ParseIntError) :=
  let* α0 := first_number_str.["parse"] in
  match α0 with
  | Ok first_number =>
    let* α0 := second_number_str.["parse"] in
    match α0 with
    | Ok second_number =>
      let* α0 := first_number.["mul"] second_number in
      Pure (Ok α0)
    | Err e => Pure (Err e)
    end
  | Err e => Pure (Err e)
  end.

Definition print (result : Result i32 std.num.ParseIntError) : M unit :=
  match result with
  | Ok n =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of n) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "n is "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt
  | Err e =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of e) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Error: "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let* twenty := multiply "10" "2" in
  let* _ := print twenty in
  let* tt := multiply "t" "2" in
  let* _ := print tt in
  Pure tt.
