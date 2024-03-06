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
Definition multiply (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [first_number_str; second_number_str] =>
    let* first_number_str := M.alloc first_number_str in
    let* second_number_str := M.alloc second_number_str in
    let* α0 := M.read first_number_str in
    let* α1 := M.call ((Ty.path "str")::["parse"] α0) in
    let* α2 := M.alloc α1 in
    let* α3 :=
      match_operator
        α2
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
              let* first_number := M.copy γ0_0 in
              let* α0 := M.read second_number_str in
              let* α1 := M.call ((Ty.path "str")::["parse"] α0) in
              let* α2 := M.alloc α1 in
              match_operator
                α2
                [
                  fun γ =>
                    (let* α0 := M.read γ in
                    match α0 with
                    | core.result.Result.Ok _ =>
                      let γ0_0 := (M.var "core::result::Result::Get_Ok_0") γ in
                      let* second_number := M.copy γ0_0 in
                      let* α0 := M.read first_number in
                      let* α1 := M.read second_number in
                      let* α2 := (M.var "BinOp::Panic::mul") α0 α1 in
                      M.alloc (core.result.Result.Ok α2)
                    | _ => M.break_match
                    end) :
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [Ty.path "i32";
                        Ty.path "core::num::error::ParseIntError"];
                  fun γ =>
                    (let* α0 := M.read γ in
                    match α0 with
                    | core.result.Result.Err _ =>
                      let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
                      let* e := M.copy γ0_0 in
                      let* α0 := M.read e in
                      M.alloc (core.result.Result.Err α0)
                    | _ => M.break_match
                    end) :
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [Ty.path "i32"; Ty.path "core::num::error::ParseIntError"]
                ]
            | _ => M.break_match
            end) :
            Ty.apply
              (Ty.path "core::result::Result")
              [Ty.path "i32"; Ty.path "core::num::error::ParseIntError"];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Err _ =>
              let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
              let* e := M.copy γ0_0 in
              let* α0 := M.read e in
              M.alloc (core.result.Result.Err α0)
            | _ => M.break_match
            end) :
            Ty.apply
              (Ty.path "core::result::Result")
              [Ty.path "i32"; Ty.path "core::num::error::ParseIntError"]
        ] in
    M.read α3
  | _, _ => M.impossible
  end.

(*
fn print(result: Result<i32, ParseIntError>) {
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
    // This still presents a reasonable answer.
    let twenty = multiply("10", "2");
    print(twenty);

    // The following now provides a much more helpful error message.
    let tt = multiply("t", "2");
    print(tt);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* twenty :=
      let* α0 := M.read (mk_str "10") in
      let* α1 := M.read (mk_str "2") in
      let* α2 := M.call ((M.var "map_in_result_via_match::multiply") α0 α1) in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.read twenty in
      let* α1 := M.call ((M.var "map_in_result_via_match::print") α0) in
      M.alloc α1 in
    let* tt_ :=
      let* α0 := M.read (mk_str "t") in
      let* α1 := M.read (mk_str "2") in
      let* α2 := M.call ((M.var "map_in_result_via_match::multiply") α0 α1) in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.read tt_ in
      let* α1 := M.call ((M.var "map_in_result_via_match::print") α0) in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
