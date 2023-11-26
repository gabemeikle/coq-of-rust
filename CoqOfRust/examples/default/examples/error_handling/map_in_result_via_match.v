(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn multiply(first_number_str: &str, second_number_str: &str) -> Result<i32, ParseIntError> {
    match first_number_str.parse::<i32>() {
        Ok(first_number) => match second_number_str.parse::<i32>() {
            Ok(second_number) => Ok(first_number * second_number),
            Err(e) => Err(e),
        },
        Err(e) => Err(e),
    }
}
*)
Definition multiply
    (first_number_str : ref str.t)
    (second_number_str : ref str.t)
    : M (core.result.Result.t i32.t core.num.error.ParseIntError.t) :=
  let* first_number_str : M.Val (ref str.t) := M.alloc first_number_str in
  let* second_number_str : M.Val (ref str.t) := M.alloc second_number_str in
  M.function_body
    (let* α0 : ref str.t := M.read first_number_str in
    let* α1 : M.Val str.t := deref α0 in
    let* α2 : ref str.t := borrow α1 in
    let* α3 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
      str.t::["parse"] α2 in
    let* α4 :
        M.Val (core.result.Result.t i32.t core.num.error.ParseIntError.t) :=
      M.alloc α3 in
    let* α5 := M.read α4 in
    let* α6 :
        M.Val (core.result.Result.t i32.t core.num.error.ParseIntError.t) :=
      match α5 with
      | core.result.Result.Ok first_number =>
        let* first_number := M.alloc first_number in
        let* α0 : ref str.t := M.read second_number_str in
        let* α1 : M.Val str.t := deref α0 in
        let* α2 : ref str.t := borrow α1 in
        let* α3 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
          str.t::["parse"] α2 in
        let* α4 :
            M.Val (core.result.Result.t i32.t core.num.error.ParseIntError.t) :=
          M.alloc α3 in
        let* α5 := M.read α4 in
        match α5 with
        | core.result.Result.Ok second_number =>
          let* second_number := M.alloc second_number in
          let* α0 : M.Val i32.t := BinOp.mul first_number second_number in
          let* α1 : i32.t := M.read α0 in
          M.alloc (core.result.Result.Ok α1)
        | core.result.Result.Err e =>
          let* e := M.alloc e in
          let* α0 : core.num.error.ParseIntError.t := M.read e in
          M.alloc (core.result.Result.Err α0)
        end
      | core.result.Result.Err e =>
        let* e := M.alloc e in
        let* α0 : core.num.error.ParseIntError.t := M.read e in
        M.alloc (core.result.Result.Err α0)
      end in
    M.read α6).

(*
fn print(result: Result<i32, ParseIntError>) {
    match result {
        Ok(n) => println!("n is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Definition print
    (result : core.result.Result.t i32.t core.num.error.ParseIntError.t)
    : M unit :=
  let* result :
      M.Val (core.result.Result.t i32.t core.num.error.ParseIntError.t) :=
    M.alloc result in
  M.function_body
    (let* α0 := M.read result in
    let* α1 : M.Val unit :=
      match α0 with
      | core.result.Result.Ok n =>
        let* n := M.alloc n in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "n is "; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref i32.t := borrow n in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
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
        M.alloc tt
      | core.result.Result.Err e =>
        let* e := M.alloc e in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "Error: "; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref core.num.error.ParseIntError.t := borrow e in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
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
        M.alloc tt
      end in
    M.read α1).

(*
fn main() {
    // This still presents a reasonable answer.
    let twenty = multiply("10", "2");
    print(twenty);

    // The following now provides a much more helpful error message.
    let tt = multiply("t", "2");
    print(tt);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* twenty :
        M.Val (core.result.Result.t i32.t core.num.error.ParseIntError.t) :=
      let* α0 : ref str.t := M.read (mk_str "10") in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : ref str.t := M.read (mk_str "2") in
      let* α4 : M.Val str.t := deref α3 in
      let* α5 : ref str.t := borrow α4 in
      let* α6 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
        map_in_result_via_match.multiply α2 α5 in
      M.alloc α6 in
    let* _ : M.Val unit :=
      let* α0 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
        M.read twenty in
      let* α1 : unit := map_in_result_via_match.print α0 in
      M.alloc α1 in
    let* tt :
        M.Val (core.result.Result.t i32.t core.num.error.ParseIntError.t) :=
      let* α0 : ref str.t := M.read (mk_str "t") in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : ref str.t := M.read (mk_str "2") in
      let* α4 : M.Val str.t := deref α3 in
      let* α5 : ref str.t := borrow α4 in
      let* α6 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
        map_in_result_via_match.multiply α2 α5 in
      M.alloc α6 in
    let* _ : M.Val unit :=
      let* α0 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
        M.read tt in
      let* α1 : unit := map_in_result_via_match.print α0 in
      M.alloc α1 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
