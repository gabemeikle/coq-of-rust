(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() -> Result<(), ParseIntError> {
    let number_str = "10";
    let number = match number_str.parse::<i32>() {
        Ok(number) => number,
        Err(e) => return Err(e),
    };
    println!("{}", number);
    Ok(())
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let return_ :=
      M.return_
        (R :=
          Ty.apply
            (Ty.path "core::result::Result")
            [ Ty.tuple []; Ty.path "core::num::error::ParseIntError" ]) in
    M.catch_return
      (let* number_str := M.copy (mk_str "10") in
      let* number :=
        let* α0 := M.read number_str in
        let* α1 := M.call (Ty.path "str")::["parse"] [ α0 ] in
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
                  let* number := M.copy γ0_0 in
                  M.pure number
                | _ => M.break_match 
                end) :
                Ty.path "i32";
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.result.Result.Err _ =>
                  let γ0_0 := (M.var "core::result::Result::Get_Err_0") γ in
                  let* e := M.copy γ0_0 in
                  let* α0 := M.read e in
                  let* α1 := return_ (core.result.Result.Err α0) in
                  let* α2 := M.read α1 in
                  let* α3 := never_to_any α2 in
                  M.alloc α3
                | _ => M.break_match 
                end) :
                Ty.path "i32"
            ] in
        M.copy α3 in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "") in
          let* α1 := M.read (mk_str "
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow number ] in
          let* α4 := M.alloc [ α3 ] in
          let* α5 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α2);
                pointer_coercion "Unsize" (borrow α4)
              ] in
          let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
          M.alloc α6 in
        M.alloc tt in
      let* α0 := M.alloc (core.result.Result.Ok tt) in
      M.read α0)
  | _, _ => M.impossible
  end.
