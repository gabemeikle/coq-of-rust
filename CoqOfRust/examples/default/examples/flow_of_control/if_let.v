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
Definition main : M unit :=
  let* number : M.Val (core.option.Option.t i32.t) :=
    M.alloc (core.option.Option.Some ((Integer.of_Z 7) : i32.t)) in
  let* letter : M.Val (core.option.Option.t i32.t) :=
    M.alloc core.option.Option.None in
  let* emoticon : M.Val (core.option.Option.t i32.t) :=
    M.alloc core.option.Option.None in
  let* _ : M.Val unit :=
    match_operator
      number
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.option.Option.Some _ =>
            let γ0_0 := core.option.Option.Get_Some_0 γ in
            let* i := M.copy γ0_0 in
            let* _ : M.Val unit :=
              let* _ : M.Val unit :=
                let* α0 : ref str.t := M.read (mk_str "Matched ") in
                let* α1 : ref str.t := M.read (mk_str "!
") in
                let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
                let* α3 : core.fmt.rt.Argument.t :=
                  M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow i)) in
                let* α4 : M.Val (array core.fmt.rt.Argument.t) :=
                  M.alloc [ α3 ] in
                let* α5 : core.fmt.Arguments.t :=
                  M.call
                    (core.fmt.Arguments.t::["new_v1"]
                      (pointer_coercion "Unsize" (borrow α2))
                      (pointer_coercion "Unsize" (borrow α4))) in
                let* α6 : unit := M.call (std.io.stdio._print α5) in
                M.alloc α6 in
              M.alloc tt in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ => (M.alloc tt) : M (M.Val unit)
      ] in
  let* _ : M.Val unit :=
    match_operator
      letter
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.option.Option.Some _ =>
            let γ0_0 := core.option.Option.Get_Some_0 γ in
            let* i := M.copy γ0_0 in
            let* _ : M.Val unit :=
              let* _ : M.Val unit :=
                let* α0 : ref str.t := M.read (mk_str "Matched ") in
                let* α1 : ref str.t := M.read (mk_str "!
") in
                let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
                let* α3 : core.fmt.rt.Argument.t :=
                  M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow i)) in
                let* α4 : M.Val (array core.fmt.rt.Argument.t) :=
                  M.alloc [ α3 ] in
                let* α5 : core.fmt.Arguments.t :=
                  M.call
                    (core.fmt.Arguments.t::["new_v1"]
                      (pointer_coercion "Unsize" (borrow α2))
                      (pointer_coercion "Unsize" (borrow α4))) in
                let* α6 : unit := M.call (std.io.stdio._print α5) in
                M.alloc α6 in
              M.alloc tt in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* _ : M.Val unit :=
            let* _ : M.Val unit :=
              let* α0 : ref str.t :=
                M.read
                  (mk_str "Didn't match a number. Let's go with a letter!
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : core.fmt.Arguments.t :=
                M.call
                  (core.fmt.Arguments.t::["new_const"]
                    (pointer_coercion "Unsize" (borrow α1))) in
              let* α3 : unit := M.call (std.io.stdio._print α2) in
              M.alloc α3 in
            M.alloc tt in
          M.alloc tt) :
          M (M.Val unit)
      ] in
  let* i_like_letters : M.Val bool.t := M.alloc false in
  let* α0 : M.Val unit :=
    match_operator
      emoticon
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.option.Option.Some _ =>
            let γ0_0 := core.option.Option.Get_Some_0 γ in
            let* i := M.copy γ0_0 in
            let* _ : M.Val unit :=
              let* _ : M.Val unit :=
                let* α0 : ref str.t := M.read (mk_str "Matched ") in
                let* α1 : ref str.t := M.read (mk_str "!
") in
                let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
                let* α3 : core.fmt.rt.Argument.t :=
                  M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow i)) in
                let* α4 : M.Val (array core.fmt.rt.Argument.t) :=
                  M.alloc [ α3 ] in
                let* α5 : core.fmt.Arguments.t :=
                  M.call
                    (core.fmt.Arguments.t::["new_v1"]
                      (pointer_coercion "Unsize" (borrow α2))
                      (pointer_coercion "Unsize" (borrow α4))) in
                let* α6 : unit := M.call (std.io.stdio._print α5) in
                M.alloc α6 in
              M.alloc tt in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* α0 : bool.t := M.read (use i_like_letters) in
          if α0 then
            let* _ : M.Val unit :=
              let* _ : M.Val unit :=
                let* α0 : ref str.t :=
                  M.read
                    (mk_str
                      "Didn't match a number. Let's go with a letter!
") in
                let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
                let* α2 : core.fmt.Arguments.t :=
                  M.call
                    (core.fmt.Arguments.t::["new_const"]
                      (pointer_coercion "Unsize" (borrow α1))) in
                let* α3 : unit := M.call (std.io.stdio._print α2) in
                M.alloc α3 in
              M.alloc tt in
            M.alloc tt
          else
            let* _ : M.Val unit :=
              let* _ : M.Val unit :=
                let* α0 : ref str.t :=
                  M.read
                    (mk_str
                      "I don't like letters. Let's go with an emoticon :)!
") in
                let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
                let* α2 : core.fmt.Arguments.t :=
                  M.call
                    (core.fmt.Arguments.t::["new_const"]
                      (pointer_coercion "Unsize" (borrow α1))) in
                let* α3 : unit := M.call (std.io.stdio._print α2) in
                M.alloc α3 in
              M.alloc tt in
            M.alloc tt) :
          M (M.Val unit)
      ] in
  M.read α0.
