(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut names = vec!["Bob", "Frank", "Ferris"];

    for name in names.iter_mut() {
        *name = match name {
            &mut "Ferris" => "There is a rustacean among us!",
            _ => "Hello",
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
      let* α0 : mut_ref (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
        borrow_mut names in
      let* α1 : mut_ref (slice (ref str.t)) :=
        (core.ops.deref.DerefMut.deref_mut
            (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : M.Val (slice (ref str.t)) := deref α1 in
      let* α3 : mut_ref (slice (ref str.t)) := borrow_mut α2 in
      let* α4 : core.slice.iter.IterMut.t (ref str.t) :=
        (slice (ref str.t))::["iter_mut"] α3 in
      let* α5 : core.slice.iter.IterMut.t (ref str.t) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.slice.iter.IterMut.t (ref str.t))
            (Trait := ltac:(refine _)))
          α4 in
      let* α6 : M.Val (core.slice.iter.IterMut.t (ref str.t)) := M.alloc α5 in
      let* α7 := M.read α6 in
      let* α8 : M.Val unit :=
        match α7 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : M.Val unit :=
              let* α0 : mut_ref (core.slice.iter.IterMut.t (ref str.t)) :=
                borrow_mut iter in
              let* α1 : M.Val (core.slice.iter.IterMut.t (ref str.t)) :=
                deref α0 in
              let* α2 : mut_ref (core.slice.iter.IterMut.t (ref str.t)) :=
                borrow_mut α1 in
              let* α3 : core.option.Option.t (mut_ref (ref str.t)) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := core.slice.iter.IterMut.t (ref str.t))
                    (Trait := ltac:(refine _)))
                  α2 in
              let* α4 : M.Val (core.option.Option.t (mut_ref (ref str.t))) :=
                M.alloc α3 in
              let* α5 := M.read α4 in
              match α5 with
              | core.option.Option.None  =>
                let* α0 : M.Val never.t := Break in
                never_to_any α0
              | core.option.Option.Some name =>
                let* name := M.alloc name in
                let* α0 : mut_ref (ref str.t) := M.read name in
                let* α1 : M.Val (ref str.t) := deref α0 in
                let* α2 := M.read name in
                let* α3 : M.Val (ref str.t) :=
                  match α2 with
                  | _ =>
                    let* α0 : ref str.t :=
                      M.read (mk_str "There is a rustacean among us!") in
                    let* α1 : M.Val str.t := deref α0 in
                    let* α2 : ref str.t := borrow α1 in
                    M.alloc α2
                  | _ =>
                    let* α0 : ref str.t := M.read (mk_str "Hello") in
                    let* α1 : M.Val str.t := deref α0 in
                    let* α2 : ref str.t := borrow α1 in
                    M.alloc α2
                  end in
                let* α4 : ref str.t := M.read α3 in
                assign α1 α4
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
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
          borrow names in
        let* α8 : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
          deref α7 in
        let* α9 : ref (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
          borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
        let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
