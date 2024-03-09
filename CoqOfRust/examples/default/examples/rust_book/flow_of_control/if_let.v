(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // All have type `Option<i32>`
    let number = Some(7);
    let letter: Option<i32> = None;
    let emoticon: Option<i32> = None;

    // The `if let` construct reads: "if `let` destructures `number` into
    // `Some(i)`, evaluate the block (`{}`)".
    if let Some(i) = number {
        println!("Matched {:?}!", i);
    }

    // If you need to specify a failure, use an else:
    if let Some(i) = letter {
        println!("Matched {:?}!", i);
    } else {
        // Destructure failed. Change to the failure case.
        println!("Didn't match a number. Let's go with a letter!");
    }

    // Provide an altered failing condition.
    let i_like_letters = false;

    if let Some(i) = emoticon {
        println!("Matched {:?}!", i);
    // Destructure failed. Evaluate an `else if` condition to see if the
    // alternate failure branch should be taken:
    } else if i_like_letters {
        println!("Didn't match a number. Let's go with a letter!");
    } else {
        // The condition evaluated false. This branch is the default:
        println!("I don't like letters. Let's go with an emoticon :)!");
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* number :=
      M.alloc
        (Value.StructTuple
          "core::option::Option::Some"
          [ Value.Integer Integer.I32 7 ]) in
    let* letter := M.alloc core.option.Option.None in
    let* emoticon := M.alloc core.option.Option.None in
    let* _ :=
      match_operator
        number
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::option::Option::Get_Some_0" in
                M.pure (α0 γ) in
              let* i := M.copy γ0_0 in
              let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_v1" in
                  let* α2 := M.read (mk_str "Matched ") in
                  let* α3 := M.read (mk_str "!
") in
                  let* α4 := M.alloc [ α2; α3 ] in
                  let* α5 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug" in
                  let* α6 := M.call α5 [ i ] in
                  let* α7 := M.alloc [ α6 ] in
                  let* α8 :=
                    M.call
                      α1
                      [
                        M.pointer_coercion "Unsize" α4;
                        M.pointer_coercion "Unsize" α7
                      ] in
                  let* α9 := M.call α0 [ α8 ] in
                  M.alloc α9 in
                M.alloc (Value.Tuple []) in
              M.alloc (Value.Tuple [])
            | _ => M.break_match 
            end);
          fun γ => (M.alloc (Value.Tuple []))
        ] in
    let* _ :=
      match_operator
        letter
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::option::Option::Get_Some_0" in
                M.pure (α0 γ) in
              let* i := M.copy γ0_0 in
              let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_v1" in
                  let* α2 := M.read (mk_str "Matched ") in
                  let* α3 := M.read (mk_str "!
") in
                  let* α4 := M.alloc [ α2; α3 ] in
                  let* α5 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug" in
                  let* α6 := M.call α5 [ i ] in
                  let* α7 := M.alloc [ α6 ] in
                  let* α8 :=
                    M.call
                      α1
                      [
                        M.pointer_coercion "Unsize" α4;
                        M.pointer_coercion "Unsize" α7
                      ] in
                  let* α9 := M.call α0 [ α8 ] in
                  M.alloc α9 in
                M.alloc (Value.Tuple []) in
              M.alloc (Value.Tuple [])
            | _ => M.break_match 
            end);
          fun γ =>
            (let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_const" in
                let* α2 :=
                  M.read
                    (mk_str
                      "Didn't match a number. Let's go with a letter!
") in
                let* α3 := M.alloc [ α2 ] in
                let* α4 := M.call α1 [ M.pointer_coercion "Unsize" α3 ] in
                let* α5 := M.call α0 [ α4 ] in
                M.alloc α5 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []))
        ] in
    let* i_like_letters := M.alloc false in
    let* α0 :=
      match_operator
        emoticon
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::option::Option::Get_Some_0" in
                M.pure (α0 γ) in
              let* i := M.copy γ0_0 in
              let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_v1" in
                  let* α2 := M.read (mk_str "Matched ") in
                  let* α3 := M.read (mk_str "!
") in
                  let* α4 := M.alloc [ α2; α3 ] in
                  let* α5 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug" in
                  let* α6 := M.call α5 [ i ] in
                  let* α7 := M.alloc [ α6 ] in
                  let* α8 :=
                    M.call
                      α1
                      [
                        M.pointer_coercion "Unsize" α4;
                        M.pointer_coercion "Unsize" α7
                      ] in
                  let* α9 := M.call α0 [ α8 ] in
                  M.alloc α9 in
                M.alloc (Value.Tuple []) in
              M.alloc (Value.Tuple [])
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read (M.use i_like_letters) in
            if α0 then
              let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_const" in
                  let* α2 :=
                    M.read
                      (mk_str
                        "Didn't match a number. Let's go with a letter!
") in
                  let* α3 := M.alloc [ α2 ] in
                  let* α4 := M.call α1 [ M.pointer_coercion "Unsize" α3 ] in
                  let* α5 := M.call α0 [ α4 ] in
                  M.alloc α5 in
                M.alloc (Value.Tuple []) in
              M.alloc (Value.Tuple [])
            else
              let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_const" in
                  let* α2 :=
                    M.read
                      (mk_str
                        "I don't like letters. Let's go with an emoticon :)!
") in
                  let* α3 := M.alloc [ α2 ] in
                  let* α4 := M.call α1 [ M.pointer_coercion "Unsize" α3 ] in
                  let* α5 := M.call α0 [ α4 ] in
                  M.alloc α5 in
                M.alloc (Value.Tuple []) in
              M.alloc (Value.Tuple []))
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
