(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Ltac AliasedResult T :=
  exact (core.result.Result.t T core.num.error.ParseIntError.t).

(*
fn multiply(first_number_str: &str, second_number_str: &str) -> AliasedResult<i32> {
    first_number_str.parse::<i32>().and_then(|first_number| {
        second_number_str
            .parse::<i32>()
            .map(|second_number| first_number * second_number)
    })
}
*)
Parameter multiply :
    (M.Val (ref str.t)) ->
      (M.Val (ref str.t)) ->
      M (M.Val ltac:(aliases_for_result.AliasedResult i32.t)).

(*
fn print(result: AliasedResult<i32>) {
    match result {
        Ok(n) => println!("n is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Parameter print :
    (M.Val ltac:(aliases_for_result.AliasedResult i32.t)) -> M (M.Val unit).

(*
fn main() {
    print(multiply("10", "2"));
    print(multiply("t", "2"));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
