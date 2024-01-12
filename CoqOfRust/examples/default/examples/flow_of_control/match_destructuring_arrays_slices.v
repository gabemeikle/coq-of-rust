(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Try changing the values in the array, or make it a slice!
    let array = [1, -2, 6];

    match array {
        // Binds the second and the third elements to the respective variables
        [0, second, third] => println!("array[0] = 0, array[1] = {}, array[2] = {}", second, third),

        // Single values can be ignored with _
        [1, _, third] => println!(
            "array[0] = 1, array[2] = {} and array[1] was ignored",
            third
        ),

        // You can also bind some and ignore the rest
        [-1, second, ..] => println!(
            "array[0] = -1, array[1] = {} and all the other ones were ignored",
            second
        ),
        // The code below would not compile
        // [-1, second] => ...

        // Or store them in another array/slice (the type depends on
        // that of the value that is being matched against)
        [3, second, tail @ ..] => println!(
            "array[0] = 3, array[1] = {} and the other elements were {:?}",
            second, tail
        ),

        // Combining these patterns, we can, for example, bind the first and
        // last values, and store the rest of them in a single array
        [first, middle @ .., last] => println!(
            "array[0] = {}, middle = {:?}, array[2] = {}",
            first, middle, last
        ),
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* array : M.Val (array i32.t) :=
    M.alloc [ Integer.of_Z 1; Integer.of_Z (-2); Integer.of_Z 6 ] in
  let* α0 : M.Val unit :=
    match_operator
      array
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | [_; _; _] =>
            let γ0_0 := [0] γ in
            let γ0_1 := [1] γ in
            let γ0_2 := [2] γ in
            let* second := M.copy γ0_1 in
            let* third := M.copy γ0_2 in
            let* _ : M.Val unit :=
              let* α0 : ref str.t :=
                M.read (mk_str "array[0] = 0, array[1] = ") in
              let* α1 : ref str.t := M.read (mk_str ", array[2] = ") in
              let* α2 : ref str.t := M.read (mk_str "
") in
              let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
              let* α4 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α3) in
              let* α5 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α4) in
              let* α6 : core.fmt.rt.Argument.t :=
                M.call
                  (core.fmt.rt.Argument.t::["new_display"] (borrow second)) in
              let* α7 : core.fmt.rt.Argument.t :=
                M.call
                  (core.fmt.rt.Argument.t::["new_display"] (borrow third)) in
              let* α8 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α6; α7 ] in
              let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α8) in
              let* α10 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α9) in
              let* α11 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α5 α10) in
              let* α12 : unit := M.call (std.io.stdio._print α11) in
              M.alloc α12 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | [_; _; _] =>
            let γ0_0 := [0] γ in
            let γ0_1 := [1] γ in
            let γ0_2 := [2] γ in
            let* third := M.copy γ0_2 in
            let* _ : M.Val unit :=
              let* α0 : ref str.t :=
                M.read (mk_str "array[0] = 1, array[2] = ") in
              let* α1 : ref str.t :=
                M.read (mk_str " and array[1] was ignored
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α2) in
              let* α4 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α3) in
              let* α5 : core.fmt.rt.Argument.t :=
                M.call
                  (core.fmt.rt.Argument.t::["new_display"] (borrow third)) in
              let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α5 ] in
              let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α6) in
              let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α7) in
              let* α9 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
              let* α10 : unit := M.call (std.io.stdio._print α9) in
              M.alloc α10 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | (_:: _:: _) =>
            let γ0_0 := [0] γ in
            let γ0_1 := [1] γ in
            let γ0_slice := [2].slice γ in
            let* second := M.copy γ0_1 in
            let* _ : M.Val unit :=
              let* α0 : ref str.t :=
                M.read (mk_str "array[0] = -1, array[1] = ") in
              let* α1 : ref str.t :=
                M.read (mk_str " and all the other ones were ignored
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α2) in
              let* α4 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α3) in
              let* α5 : core.fmt.rt.Argument.t :=
                M.call
                  (core.fmt.rt.Argument.t::["new_display"] (borrow second)) in
              let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α5 ] in
              let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α6) in
              let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α7) in
              let* α9 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
              let* α10 : unit := M.call (std.io.stdio._print α9) in
              M.alloc α10 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | (_:: _:: _) =>
            let γ0_0 := [0] γ in
            let γ0_1 := [1] γ in
            let γ0_slice := [2].slice γ in
            let* second := M.copy γ0_1 in
            let* tail := M.copy γ0_slice in
            let* _ : M.Val unit :=
              let* α0 : ref str.t :=
                M.read (mk_str "array[0] = 3, array[1] = ") in
              let* α1 : ref str.t :=
                M.read (mk_str " and the other elements were ") in
              let* α2 : ref str.t := M.read (mk_str "
") in
              let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
              let* α4 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α3) in
              let* α5 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α4) in
              let* α6 : core.fmt.rt.Argument.t :=
                M.call
                  (core.fmt.rt.Argument.t::["new_display"] (borrow second)) in
              let* α7 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow tail)) in
              let* α8 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α6; α7 ] in
              let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α8) in
              let* α10 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α9) in
              let* α11 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α5 α10) in
              let* α12 : unit := M.call (std.io.stdio._print α11) in
              M.alloc α12 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* _ : M.Val unit :=
            let* α0 : ref str.t := M.read (mk_str "array[0] = ") in
            let* α1 : ref str.t := M.read (mk_str ", middle = ") in
            let* α2 : ref str.t := M.read (mk_str ", array[2] = ") in
            let* α3 : ref str.t := M.read (mk_str "
") in
            let* α4 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2; α3 ] in
            let* α5 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α4) in
            let* α6 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α5) in
            let* α7 : core.fmt.rt.Argument.t :=
              M.call (core.fmt.rt.Argument.t::["new_display"] (borrow first)) in
            let* α8 : core.fmt.rt.Argument.t :=
              M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow middle)) in
            let* α9 : core.fmt.rt.Argument.t :=
              M.call (core.fmt.rt.Argument.t::["new_display"] (borrow last)) in
            let* α10 : M.Val (array core.fmt.rt.Argument.t) :=
              M.alloc [ α7; α8; α9 ] in
            let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc (borrow α10) in
            let* α12 : ref (slice core.fmt.rt.Argument.t) :=
              M.read (pointer_coercion "Unsize" α11) in
            let* α13 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_v1"] α6 α12) in
            let* α14 : unit := M.call (std.io.stdio._print α13) in
            M.alloc α14 in
          M.alloc tt) :
          M (M.Val unit)
      ] in
  M.read α0.
