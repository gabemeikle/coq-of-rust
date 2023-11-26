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
  M.function_body
    (let* names : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
      let* α0 : ref str.t := M.read (mk_str "Frank") in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : M.Val (ref str.t) := M.alloc α2 in
      let* α4 : ref str.t := M.read (mk_str "Ferris") in
      let* α5 : M.Val str.t := deref α4 in
      let* α6 : ref str.t := borrow α5 in
      let* α7 : M.Val (ref str.t) := M.alloc α6 in
      let* α8 : M.Val (array (ref str.t)) := M.alloc [ mk_str "Bob"; α3; α7 ] in
      let* α9 :
          M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α8 in
      let* α10 :
          M.Val (alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t) :=
        pointer_coercion "Unsize" α9 in
      let* α11 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
        M.read α10 in
      let* α12 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
        (slice (ref str.t))::["into_vec"] α11 in
      M.alloc α12 in
    let* _ : M.Val unit :=
      let* α0 : ref (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
        borrow names in
      let* α1 : ref (slice (ref str.t)) :=
        (core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : M.Val (slice (ref str.t)) := deref α1 in
      let* α3 : ref (slice (ref str.t)) := borrow α2 in
      let* α4 : core.slice.iter.Iter.t (ref str.t) :=
        (slice (ref str.t))::["iter"] α3 in
      let* α5 : core.slice.iter.Iter.t (ref str.t) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.slice.iter.Iter.t (ref str.t))
            (Trait := ltac:(refine _)))
          α4 in
      let* α6 : M.Val (core.slice.iter.Iter.t (ref str.t)) := M.alloc α5 in
      let* α7 := M.read α6 in
      let* α8 : M.Val unit :=
        match α7 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : M.Val unit :=
              let* α0 : mut_ref (core.slice.iter.Iter.t (ref str.t)) :=
                borrow_mut iter in
              let* α1 : core.option.Option.t (ref (ref str.t)) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := core.slice.iter.Iter.t (ref str.t))
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 : M.Val (core.option.Option.t (ref (ref str.t))) :=
                M.alloc α1 in
              let* α3 := M.read α2 in
              match α3 with
              | core.option.Option.None  =>
                let* α0 : M.Val never.t := Break in
                never_to_any α0
              | core.option.Option.Some name =>
                let* name := M.alloc name in
                let* α0 := M.read name in
                match α0 with
                | _ =>
                  let* _ : M.Val unit :=
                    let* α0 : M.Val (array (ref str.t)) :=
                      M.alloc [ mk_str "There is a rustacean among us!
" ] in
                    let* α1 : ref (array (ref str.t)) := borrow α0 in
                    let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
                    let* α3 : M.Val (ref (slice (ref str.t))) :=
                      pointer_coercion "Unsize" α2 in
                    let* α4 : ref (slice (ref str.t)) := M.read α3 in
                    let* α5 : core.fmt.Arguments.t :=
                      core.fmt.Arguments.t::["new_const"] α4 in
                    let* α6 : unit := std.io.stdio._print α5 in
                    M.alloc α6 in
                  M.alloc tt
                | _ =>
                  let* _ : M.Val unit :=
                    let* α0 : M.Val (array (ref str.t)) :=
                      M.alloc [ mk_str "Hello "; mk_str "
" ] in
                    let* α1 : ref (array (ref str.t)) := borrow α0 in
                    let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
                    let* α3 : M.Val (ref (slice (ref str.t))) :=
                      pointer_coercion "Unsize" α2 in
                    let* α4 : ref (slice (ref str.t)) := M.read α3 in
                    let* α5 : ref (ref (ref str.t)) := borrow name in
                    let* α6 : core.fmt.rt.Argument.t :=
                      core.fmt.rt.Argument.t::["new_display"] α5 in
                    let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
                    let* α8 : M.Val (array core.fmt.rt.Argument.t) :=
                      M.alloc [ α7 ] in
                    let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
                    let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                      M.alloc α9 in
                    let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
                      pointer_coercion "Unsize" α10 in
                    let* α12 : ref (slice core.fmt.rt.Argument.t) :=
                      M.read α11 in
                    let* α13 : core.fmt.Arguments.t :=
                      core.fmt.Arguments.t::["new_v1"] α4 α12 in
                    let* α14 : unit := std.io.stdio._print α13 in
                    M.alloc α14 in
                  M.alloc tt
                end
              end in
            M.alloc tt)
        end in
      use α8 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "names: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
          borrow names in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
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
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
