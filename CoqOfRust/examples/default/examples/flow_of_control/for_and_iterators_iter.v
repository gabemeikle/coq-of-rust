(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let names = vec!["Bob", "Frank", "Ferris"];

    for name in names.iter() {
        match name {
            &"Ferris" => println!("There is a rustacean among us!"),
            // TODO ^ Try deleting the & and matching just "Ferris"
            _ => println!("Hello {}", name),
        }
    }

    println!("names: {:?}", names);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* names : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
    let* α0 : ref str.t := M.read (mk_str "Bob") in
    let* α1 : ref str.t := M.read (mk_str "Frank") in
    let* α2 : ref str.t := M.read (mk_str "Ferris") in
    let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
    let* α4 :
        M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3) in
    let* α5 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
      M.read (pointer_coercion "Unsize" α4) in
    let* α6 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call ((slice (ref str.t))::["into_vec"] α5) in
    M.alloc α6 in
  let* _ : M.Val unit :=
    let* α0 : ref (slice (ref str.t)) :=
      M.call
        ((core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          (borrow names)) in
    let* α1 : core.slice.iter.Iter.t (ref str.t) :=
      M.call ((slice (ref str.t))::["iter"] α0) in
    let* α2 : core.slice.iter.Iter.t (ref str.t) :=
      M.call
        ((core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.slice.iter.Iter.t (ref str.t))
            (Trait := ltac:(refine _)))
          α1) in
    let* α3 : M.Val unit :=
      match α2 with
      | iter =>
        let* iter := M.alloc iter in
        M.loop
          (let* _ : M.Val unit :=
            let* α0 : core.option.Option.t (ref (ref str.t)) :=
              M.call
                ((core.iter.traits.iterator.Iterator.next
                    (Self := core.slice.iter.Iter.t (ref str.t))
                    (Trait := ltac:(refine _)))
                  (borrow_mut iter)) in
            match α0 with
            | core.option.Option.None =>
              let* α0 : M.Val never.t := M.break in
              let* α1 := M.read α0 in
              let* α2 : unit := never_to_any α1 in
              M.alloc α2
            | core.option.Option.Some name =>
              let* name := M.alloc name in
              let* α0 : ref (ref str.t) := M.read name in
              match α0 with
              | _ =>
                let* _ : M.Val unit :=
                  let* α0 : ref str.t :=
                    M.read (mk_str "There is a rustacean among us!
") in
                  let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
                  let* α2 : M.Val (ref (array (ref str.t))) :=
                    M.alloc (borrow α1) in
                  let* α3 : ref (slice (ref str.t)) :=
                    M.read (pointer_coercion "Unsize" α2) in
                  let* α4 : core.fmt.Arguments.t :=
                    M.call (core.fmt.Arguments.t::["new_const"] α3) in
                  let* α5 : unit := M.call (std.io.stdio._print α4) in
                  M.alloc α5 in
                M.alloc tt
              | _ =>
                let* _ : M.Val unit :=
                  let* α0 : ref str.t := M.read (mk_str "Hello ") in
                  let* α1 : ref str.t := M.read (mk_str "
") in
                  let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
                  let* α3 : M.Val (ref (array (ref str.t))) :=
                    M.alloc (borrow α2) in
                  let* α4 : ref (slice (ref str.t)) :=
                    M.read (pointer_coercion "Unsize" α3) in
                  let* α5 : core.fmt.rt.Argument.t :=
                    M.call
                      (core.fmt.rt.Argument.t::["new_display"] (borrow name)) in
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
              end
            end in
          M.alloc tt)
      end in
    M.pure (use α3) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "names: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow names)) in
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
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
