(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::mem;

    let color = String::from("green");

    // A closure to print `color` which immediately borrows (`&`) `color` and
    // stores the borrow and closure in the `print` variable. It will remain
    // borrowed until `print` is used the last time.
    //
    // `println!` only requires arguments by immutable reference so it doesn't
    // impose anything more restrictive.
    let print = || println!("`color`: {}", color);

    // Call the closure using the borrow.
    print();

    // `color` can be borrowed immutably again, because the closure only holds
    // an immutable reference to `color`.
    let _reborrow = &color;
    print();

    // A move or reborrow is allowed after the final use of `print`
    let _color_moved = color;

    let mut count = 0;
    // A closure to increment `count` could take either `&mut count` or `count`
    // but `&mut count` is less restrictive so it takes that. Immediately
    // borrows `count`.
    //
    // A `mut` is required on `inc` because a `&mut` is stored inside. Thus,
    // calling the closure mutates the closure which requires a `mut`.
    let mut inc = || {
        count += 1;
        println!("`count`: {}", count);
    };

    // Call the closure using a mutable borrow.
    inc();

    // The closure still mutably borrows `count` because it is called later.
    // An attempt to reborrow will lead to an error.
    // let _reborrow = &count;
    // ^ TODO: try uncommenting this line.
    inc();

    // The closure no longer needs to borrow `&mut count`. Therefore, it is
    // possible to reborrow without an error
    let _count_reborrowed = &mut count;

    // A non-copy type.
    let movable = Box::new(3);

    // `mem::drop` requires `T` so this must take by value. A copy type
    // would copy into the closure leaving the original untouched.
    // A non-copy must move and so `movable` immediately moves into
    // the closure.
    let consume = || {
        println!("`movable`: {:?}", movable);
        mem::drop(movable);
    };

    // `consume` consumes the variable so this can only be called once.
    consume();
    // consume();
    // ^ TODO: Try uncommenting this line.
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* color :=
      let* α0 :=
        M.get_method
          "core::convert::From"
          "from"
          [
            (* Self *) Ty.path "alloc::string::String";
            (* T *) Ty.apply (Ty.path "ref") [ Ty.path "str" ]
          ] in
      let* α1 := M.read (mk_str "green") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* print :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* α0 := M.read (mk_str "`color`: ") in
                  let* α1 := M.read (mk_str "
") in
                  let* α2 := M.alloc [ α0; α1 ] in
                  let* α3 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_display"]
                      [ borrow color ] in
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
                let* α0 := M.alloc tt in
                M.read α0) :
                Ty.tuple []
            ]) :
          Ty.tuple []) in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::ops::function::Fn"
          "call"
          [
            (* Self *) Ty.function [ Ty.tuple [] ] (Ty.tuple []);
            (* Args *) Ty.tuple []
          ] in
      let* α1 := M.call α0 [ borrow print; tt ] in
      M.alloc α1 in
    let* _reborrow := M.alloc (borrow color) in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::ops::function::Fn"
          "call"
          [
            (* Self *) Ty.function [ Ty.tuple [] ] (Ty.tuple []);
            (* Args *) Ty.tuple []
          ] in
      let* α1 := M.call α0 [ borrow print; tt ] in
      M.alloc α1 in
    let* _color_moved := M.copy color in
    let* count := M.alloc ((Integer.of_Z 0) : Ty.path "i32") in
    let* inc :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let β := count in
                  let* α0 := M.read β in
                  let* α1 :=
                    (M.var "BinOp::Panic::add")
                      α0
                      ((Integer.of_Z 1) : Ty.path "i32") in
                  (M.var "assign") β α1 in
                let* _ :=
                  let* _ :=
                    let* α0 := M.read (mk_str "`count`: ") in
                    let* α1 := M.read (mk_str "
") in
                    let* α2 := M.alloc [ α0; α1 ] in
                    let* α3 :=
                      M.call
                        (Ty.path "core::fmt::rt::Argument")::["new_display"]
                        [ borrow count ] in
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
                let* α0 := M.alloc tt in
                M.read α0) :
                Ty.tuple []
            ]) :
          Ty.tuple []) in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::ops::function::FnMut"
          "call_mut"
          [
            (* Self *) Ty.function [ Ty.tuple [] ] (Ty.tuple []);
            (* Args *) Ty.tuple []
          ] in
      let* α1 := M.call α0 [ borrow_mut inc; tt ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::ops::function::FnMut"
          "call_mut"
          [
            (* Self *) Ty.function [ Ty.tuple [] ] (Ty.tuple []);
            (* Args *) Ty.tuple []
          ] in
      let* α1 := M.call α0 [ borrow_mut inc; tt ] in
      M.alloc α1 in
    let* _count_reborrowed := M.alloc (borrow_mut count) in
    let* movable :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "alloc::boxed::Box")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])::["new"]
          [ (Integer.of_Z 3) : Ty.path "i32" ] in
      M.alloc α0 in
    let* consume :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* _ :=
                    let* α0 := M.read (mk_str "`movable`: ") in
                    let* α1 := M.read (mk_str "
") in
                    let* α2 := M.alloc [ α0; α1 ] in
                    let* α3 :=
                      M.call
                        (Ty.path "core::fmt::rt::Argument")::["new_debug"]
                        [ borrow movable ] in
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
                let* _ :=
                  let* α0 := M.read movable in
                  let* α1 := M.call (M.var "core::mem::drop") [ α0 ] in
                  M.alloc α1 in
                let* α0 := M.alloc tt in
                M.read α0) :
                Ty.tuple []
            ]) :
          Ty.tuple []) in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::ops::function::FnOnce"
          "call_once"
          [
            (* Self *) Ty.function [ Ty.tuple [] ] (Ty.tuple []);
            (* Args *) Ty.tuple []
          ] in
      let* α1 := M.read consume in
      let* α2 := M.call α0 [ α1; tt ] in
      M.alloc α2 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
