(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Inductive t : Set :=
  | Bar
  | Baz
  | Qux (_ : u32.t).
End Foo.

(*
fn main() {
    // Create example variables
    let a = Foo::Bar;
    let b = Foo::Baz;
    let c = Foo::Qux(100);

    // Variable a matches Foo::Bar
    if let Foo::Bar = a {
        println!("a is foobar");
    }

    // Variable b does not match Foo::Bar
    // So this will print nothing
    if let Foo::Bar = b {
        println!("b is foobar");
    }

    // Variable c matches Foo::Qux which has a value
    // Similar to Some() in the previous example
    if let Foo::Qux(value) = c {
        println!("c is {}", value);
    }

    // Binding also works with `if let`
    if let Foo::Qux(value @ 100) = c {
        println!("c is one hundred");
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* a : M.Val if_let_match_enum_values.Foo.t :=
    M.alloc if_let_match_enum_values.Foo.Bar in
  let* b : M.Val if_let_match_enum_values.Foo.t :=
    M.alloc if_let_match_enum_values.Foo.Baz in
  let* c : M.Val if_let_match_enum_values.Foo.t :=
    M.alloc (if_let_match_enum_values.Foo.Qux (Integer.of_Z 100)) in
  let* _ : M.Val unit :=
    let* α0 : M.Val bool.t := let_if if_let_match_enum_values.Foo.Bar  := a in
    let* α1 : bool.t := M.read α0 in
    if α1 then
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "a is foobar
") in
          let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
          let* α3 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α2) in
          let* α4 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_const"] α3) in
          let* α5 : unit := M.call (std.io.stdio._print α4) in
          M.alloc α5 in
        M.alloc tt in
      M.alloc tt
    else
      M.alloc tt in
  let* _ : M.Val unit :=
    let* α0 : M.Val bool.t := let_if if_let_match_enum_values.Foo.Bar  := b in
    let* α1 : bool.t := M.read α0 in
    if α1 then
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "b is foobar
") in
          let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
          let* α3 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α2) in
          let* α4 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_const"] α3) in
          let* α5 : unit := M.call (std.io.stdio._print α4) in
          M.alloc α5 in
        M.alloc tt in
      M.alloc tt
    else
      M.alloc tt in
  let* _ : M.Val unit :=
    let* α0 : M.Val bool.t :=
      let_if if_let_match_enum_values.Foo.Qux value := c in
    let* α1 : bool.t := M.read α0 in
    if α1 then
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "c is ") in
          let* α1 : ref str.t := M.read (mk_str "
") in
          let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
          let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
          let* α4 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α3) in
          let* α5 : core.fmt.rt.Argument.t :=
            M.call (core.fmt.rt.Argument.t::["new_display"] (borrow value)) in
          let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
          let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc (borrow α6) in
          let* α8 : ref (slice core.fmt.rt.Argument.t) :=
            M.read (pointer_coercion "Unsize" α7) in
          let* α9 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
          let* α10 : unit := M.call (std.io.stdio._print α9) in
          M.alloc α10 in
        M.alloc tt in
      M.alloc tt
    else
      M.alloc tt in
  let* α0 : M.Val bool.t :=
    let_if if_let_match_enum_values.Foo.Qux (_ as value) := c in
  let* α1 : bool.t := M.read α0 in
  let* α0 : M.Val unit :=
    if α1 then
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "c is one hundred
") in
          let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
          let* α3 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α2) in
          let* α4 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_const"] α3) in
          let* α5 : unit := M.call (std.io.stdio._print α4) in
          M.alloc α5 in
        M.alloc tt in
      M.alloc tt
    else
      M.alloc tt in
  M.read α0.
