(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom AliasedResult :
    (Ty.path "aliases_for_result::AliasedResult") =
      (fun T =>
        Ty.apply
          (Ty.path "core::result::Result")
          [T; Ty.path "core::num::error::ParseIntError"]).

(*
fn multiply(first_number_str: &str, second_number_str: &str) -> AliasedResult<i32> {
    first_number_str.parse::<i32>().and_then(|first_number| {
        second_number_str
            .parse::<i32>()
            .map(|second_number| first_number * second_number)
    })
}
*)
Definition multiply (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [first_number_str; second_number_str] =>
    let* first_number_str := M.alloc first_number_str in
    let* second_number_str := M.alloc second_number_str in
    let* α0 := M.read first_number_str in
    let* α1 := M.call ((Ty.path "str")::["parse"] α0) in
    M.call
      ((Ty.apply
            (Ty.path "core::result::Result")
            [Ty.path "i32";
              Ty.path "core::num::error::ParseIntError"])::["and_then"]
        α1
        (fun (α0 : Ty.path "i32") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* first_number := M.copy γ in
                let* α0 := M.read second_number_str in
                let* α1 := M.call ((Ty.path "str")::["parse"] α0) in
                M.call
                  ((Ty.apply
                        (Ty.path "core::result::Result")
                        [Ty.path "i32";
                          Ty.path "core::num::error::ParseIntError"])::["map"]
                    α1
                    (fun (α0 : Ty.path "i32") =>
                      (let* α0 := M.alloc α0 in
                      match_operator
                        α0
                        [
                          fun γ =>
                            (let* second_number := M.copy γ in
                            let* α0 := M.read first_number in
                            let* α1 := M.read second_number in
                            (M.var "BinOp::Panic::mul") α0 α1) :
                            Ty.path "i32"
                        ]) :
                      Ty.path "i32"))) :
                Ty.apply
                  (Ty.path "core::result::Result")
                  [Ty.path "i32"; Ty.path "core::num::error::ParseIntError"]
            ]) :
          Ty.apply
            (Ty.path "core::result::Result")
            [Ty.path "i32"; Ty.path "core::num::error::ParseIntError"]))
  | _, _ => M.impossible
  end.

(*
fn print(result: AliasedResult<i32>) {
    match result {
        Ok(n) => println!("n is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Definition print (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [result] =>
    let* result := M.alloc result in
    let* α0 :=
      match_operator
        result
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
              let* n := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.read (mk_str "n is ") in
                let* α1 := M.read (mk_str "
") in
                let* α2 := M.alloc [ α0; α1 ] in
                let* α3 :=
                  M.call
                    ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                      (borrow n)) in
                let* α4 := M.alloc [ α3 ] in
                let* α5 :=
                  M.call
                    ((Ty.path "core::fmt::Arguments")::["new_v1"]
                      (pointer_coercion "Unsize" (borrow α2))
                      (pointer_coercion "Unsize" (borrow α4))) in
                let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
                M.alloc α6 in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Err _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
              let* e := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.read (mk_str "Error: ") in
                let* α1 := M.read (mk_str "
") in
                let* α2 := M.alloc [ α0; α1 ] in
                let* α3 :=
                  M.call
                    ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                      (borrow e)) in
                let* α4 := M.alloc [ α3 ] in
                let* α5 :=
                  M.call
                    ((Ty.path "core::fmt::Arguments")::["new_v1"]
                      (pointer_coercion "Unsize" (borrow α2))
                      (pointer_coercion "Unsize" (borrow α4))) in
                let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
                M.alloc α6 in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple []
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    print(multiply("10", "2"));
    print(multiply("t", "2"));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.read (mk_str "10") in
      let* α1 := M.read (mk_str "2") in
      let* α2 := M.call ((M.var "aliases_for_result::multiply") α0 α1) in
      let* α3 := M.call ((M.var "aliases_for_result::print") α2) in
      M.alloc α3 in
    let* _ :=
      let* α0 := M.read (mk_str "t") in
      let* α1 := M.read (mk_str "2") in
      let* α2 := M.call ((M.var "aliases_for_result::multiply") α0 α1) in
      let* α3 := M.call ((M.var "aliases_for_result::print") α2) in
      M.alloc α3 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
