(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn multiply(first_number_str: &str, second_number_str: &str) -> Result<i32, ParseIntError> {
    let first_number = match first_number_str.parse::<i32>() {
        Ok(first_number) => first_number,
        Err(e) => return Err(e),
    };

    let second_number = match second_number_str.parse::<i32>() {
        Ok(second_number) => second_number,
        Err(e) => return Err(e),
    };

    Ok(first_number * second_number)
}
*)
Definition multiply (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ first_number_str; second_number_str ] =>
    let* first_number_str := M.alloc first_number_str in
    let* second_number_str := M.alloc second_number_str in
    let* first_number :=
      let* α0 :=
        M.get_associated_function (Ty.path "str") "parse" [ Ty.path "i32" ] in
      let* α1 := M.read first_number_str in
      let* α2 := M.call_closure α0 [ α1 ] in
      let* α3 := M.alloc α2 in
      let* α4 :=
        match_operator
          α3
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::result::Result::Ok"
                  0 in
              let* first_number := M.copy γ0_0 in
              M.pure first_number;
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::result::Result::Err"
                  0 in
              let* e := M.copy γ0_0 in
              let* α0 := M.read e in
              let* α1 :=
                M.return_
                  (Value.StructTuple "core::result::Result::Err" [ α0 ]) in
              let* α2 := M.read α1 in
              let* α3 := M.never_to_any α2 in
              M.alloc α3
          ] in
      M.copy α4 in
    let* second_number :=
      let* α0 :=
        M.get_associated_function (Ty.path "str") "parse" [ Ty.path "i32" ] in
      let* α1 := M.read second_number_str in
      let* α2 := M.call_closure α0 [ α1 ] in
      let* α3 := M.alloc α2 in
      let* α4 :=
        match_operator
          α3
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::result::Result::Ok"
                  0 in
              let* second_number := M.copy γ0_0 in
              M.pure second_number;
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::result::Result::Err"
                  0 in
              let* e := M.copy γ0_0 in
              let* α0 := M.read e in
              let* α1 :=
                M.return_
                  (Value.StructTuple "core::result::Result::Err" [ α0 ]) in
              let* α2 := M.read α1 in
              let* α3 := M.never_to_any α2 in
              M.alloc α3
          ] in
      M.copy α4 in
    let* α0 := M.read first_number in
    let* α1 := M.read second_number in
    let* α2 := BinOp.Panic.mul α0 α1 in
    let* α0 := M.alloc (Value.StructTuple "core::result::Result::Ok" [ α2 ]) in
    M.read α0
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
  | [], [ result ] =>
    let* result := M.alloc result in
    let* α0 :=
      match_operator
        result
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Ok"
                0 in
            let* n := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "n is ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "i32" ] in
              let* α6 := M.call_closure α5 [ n ] in
              let* α7 := M.alloc (Value.Array [ α6 ]) in
              let* α8 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α4;
                    M.pointer_coercion (* Unsize *) α7
                  ] in
              let* α9 := M.call_closure α0 [ α8 ] in
              M.alloc α9 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Err"
                0 in
            let* e := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "Error: ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "core::num::error::ParseIntError" ] in
              let* α6 := M.call_closure α5 [ e ] in
              let* α7 := M.alloc (Value.Array [ α6 ]) in
              let* α8 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α4;
                    M.pointer_coercion (* Unsize *) α7
                  ] in
              let* α9 := M.call_closure α0 [ α8 ] in
              M.alloc α9 in
            M.alloc (Value.Tuple [])
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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.get_function "early_returns::print" [] in
      let* α1 := M.get_function "early_returns::multiply" [] in
      let* α2 := M.read (mk_str "10") in
      let* α3 := M.read (mk_str "2") in
      let* α4 := M.call_closure α1 [ α2; α3 ] in
      let* α5 := M.call_closure α0 [ α4 ] in
      M.alloc α5 in
    let* _ :=
      let* α0 := M.get_function "early_returns::print" [] in
      let* α1 := M.get_function "early_returns::multiply" [] in
      let* α2 := M.read (mk_str "t") in
      let* α3 := M.read (mk_str "2") in
      let* α4 := M.call_closure α1 [ α2; α3 ] in
      let* α5 := M.call_closure α0 [ α4 ] in
      M.alloc α5 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
