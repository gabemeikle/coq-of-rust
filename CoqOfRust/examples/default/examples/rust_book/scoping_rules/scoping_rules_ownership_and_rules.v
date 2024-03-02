(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn destroy_box(c: Box<i32>) {
    println!("Destroying a box that contains {}", c);

    // `c` is destroyed and the memory freed
}
*)
Definition destroy_box (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [c] =>
    let* c := M.alloc c in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "Destroying a box that contains ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow c)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    // _Stack_ allocated integer
    let x = 5u32;

    // *Copy* `x` into `y` - no resources are moved
    let y = x;

    // Both values can be independently used
    println!("x is {}, and y is {}", x, y);

    // `a` is a pointer to a _heap_ allocated integer
    let a = Box::new(5i32);

    println!("a contains: {}", a);

    // *Move* `a` into `b`
    let b = a;
    // The pointer address of `a` is copied (not the data) into `b`.
    // Both are now pointers to the same heap allocated data, but
    // `b` now owns it.

    // Error! `a` can no longer access the data, because it no longer owns the
    // heap memory
    //println!("a contains: {}", a);
    // TODO ^ Try uncommenting this line

    // This function takes ownership of the heap allocated memory from `b`
    destroy_box(b);

    // Since the heap memory has been freed at this point, this action would
    // result in dereferencing freed memory, but it's forbidden by the compiler
    // Error! Same reason as the previous Error
    //println!("b contains: {}", b);
    // TODO ^ Try uncommenting this line
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x := M.alloc ((Integer.of_Z 5) : Ty.path "u32") in
    let* y := M.copy x in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "x is ") in
        let* α1 := M.read (mk_str ", and y is ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α0; α1; α2 ] in
        let* α4 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow x)) in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow y)) in
        let* α6 := M.alloc [ α4; α5 ] in
        let* α7 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α3))
              (pointer_coercion "Unsize" (borrow α6))) in
        let* α8 := M.call ((M.var "std::io::stdio::_print") α7) in
        M.alloc α8 in
      M.alloc tt in
    let* a :=
      let* α0 :=
        M.call
          ((Ty.apply
                (Ty.path "alloc::boxed::Box")
                [Ty.path "i32";
                  Ty.apply (Ty.path "alloc::alloc::Global") []])::["new"]
            ((Integer.of_Z 5) : Ty.path "i32")) in
      M.alloc α0 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "a contains: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow a)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* b := M.copy a in
    let* _ :=
      let* α0 := M.read b in
      let* α1 :=
        M.call ((M.var "scoping_rules_ownership_and_rules::destroy_box") α0) in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
