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
  M.function_body
    (let* array : M.Val (array i32.t) :=
      let* α0 : M.Val i32.t := M.alloc 1 in
      let* α1 : M.Val i32.t := M.alloc (- 2) in
      let* α2 : M.Val i32.t := M.alloc 6 in
      M.alloc [ α0; α1; α2 ] in
    let* α0 := M.read array in
    let* α0 : M.Val unit :=
      match α0 with
      | [_; second; third] =>
        let* third := M.alloc third in
        let* second := M.alloc second in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc
              [
                mk_str "array[0] = 0, array[1] = ";
                mk_str ", array[2] = ";
                mk_str "
"
              ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref i32.t := borrow second in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : ref i32.t := borrow third in
          let* α9 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α8 in
          let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
          let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
            M.alloc [ α7; α10 ] in
          let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
          let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α12 in
          let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α13 in
          let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
          let* α16 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α15 in
          let* α17 : unit := std.io.stdio._print α16 in
          M.alloc α17 in
        M.alloc tt
      | [_; _; third] =>
        let* third := M.alloc third in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc
              [
                mk_str "array[0] = 1, array[2] = ";
                mk_str " and array[1] was ignored
"
              ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref i32.t := borrow third in
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
      | (_:: second:: _) =>
        let* second := M.alloc second in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc
              [
                mk_str "array[0] = -1, array[1] = ";
                mk_str " and all the other ones were ignored
"
              ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref i32.t := borrow second in
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
      | (_:: second:: (_ as tail)) =>
        let* tail := M.alloc tail in
        let* second := M.alloc second in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc
              [
                mk_str "array[0] = 3, array[1] = ";
                mk_str " and the other elements were ";
                mk_str "
"
              ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref i32.t := borrow second in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : ref (array i32.t) := borrow tail in
          let* α9 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_debug"] α8 in
          let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
          let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
            M.alloc [ α7; α10 ] in
          let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
          let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α12 in
          let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α13 in
          let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
          let* α16 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α15 in
          let* α17 : unit := std.io.stdio._print α16 in
          M.alloc α17 in
        M.alloc tt
      | _ =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc
              [
                mk_str "array[0] = ";
                mk_str ", middle = ";
                mk_str ", array[2] = ";
                mk_str "
"
              ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref i32.t := borrow first in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : ref (array i32.t) := borrow middle in
          let* α9 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_debug"] α8 in
          let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
          let* α11 : ref i32.t := borrow last in
          let* α12 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α11 in
          let* α13 : M.Val core.fmt.rt.Argument.t := M.alloc α12 in
          let* α14 : M.Val (array core.fmt.rt.Argument.t) :=
            M.alloc [ α7; α10; α13 ] in
          let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
          let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α15 in
          let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α16 in
          let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
          let* α19 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α18 in
          let* α20 : unit := std.io.stdio._print α19 in
          M.alloc α20 in
        M.alloc tt
      end in
    M.read α0).
