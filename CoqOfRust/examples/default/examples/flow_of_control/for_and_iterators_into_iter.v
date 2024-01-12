(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let names = vec!["Bob", "Frank", "Ferris"];

    for name in names.into_iter() {
        match name {
            "Ferris" => println!("There is a rustacean among us!"),
            _ => println!("Hello {}", name),
        }
    }

    // println!("names: {:?}", names);
    // FIXME ^ Comment out this line
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
  let* α0 : _ :=
    ltac:(M.get_method (fun ℐ =>
      core.iter.traits.collect.IntoIterator.into_iter
        (Self :=
          alloc.vec.into_iter.IntoIter.t (ref str.t) alloc.alloc.Global.t)
        (Trait := ℐ))) in
  let* α1 : _ :=
    ltac:(M.get_method (fun ℐ =>
      core.iter.traits.collect.IntoIterator.into_iter
        (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
        (Trait := ℐ))) in
  let* α2 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t := M.read names in
  let* α3 : alloc.vec.into_iter.IntoIter.t (ref str.t) alloc.alloc.Global.t :=
    M.call (α1 α2) in
  let* α4 : alloc.vec.into_iter.IntoIter.t (ref str.t) alloc.alloc.Global.t :=
    M.call (α0 α3) in
  let* α5 :
      M.Val (alloc.vec.into_iter.IntoIter.t (ref str.t) alloc.alloc.Global.t) :=
    M.alloc α4 in
  let* α6 : M.Val unit :=
    match_operator
      α5
      [
        fun γ =>
          (let* iter := M.copy γ in
          M.loop
            (let* _ : M.Val unit :=
              let* α0 : _ :=
                ltac:(M.get_method (fun ℐ =>
                  core.iter.traits.iterator.Iterator.next
                    (Self :=
                      alloc.vec.into_iter.IntoIter.t
                        (ref str.t)
                        alloc.alloc.Global.t)
                    (Trait := ℐ))) in
              let* α1 : core.option.Option.t (ref str.t) :=
                M.call (α0 (borrow_mut iter)) in
              let* α2 : M.Val (core.option.Option.t (ref str.t)) :=
                M.alloc α1 in
              match_operator
                α2
                [
                  fun γ =>
                    (let* α0 := M.read γ in
                    match α0 with
                    | core.option.Option.None =>
                      let* α0 : M.Val never.t := M.break in
                      let* α1 := M.read α0 in
                      let* α2 : unit := never_to_any α1 in
                      M.alloc α2
                    | _ => M.break_match
                    end) :
                    M (M.Val unit);
                  fun γ =>
                    (let* α0 := M.read γ in
                    match α0 with
                    | core.option.Option.Some _ =>
                      let γ0_0 := core.option.Option.Get_Some_0 γ in
                      let* name := M.copy γ0_0 in
                      match_operator
                        name
                        [
                          fun γ =>
                            (let* _ : M.Val unit :=
                              let* α0 : ref str.t :=
                                M.read
                                  (mk_str "There is a rustacean among us!
") in
                              let* α1 : M.Val (array (ref str.t)) :=
                                M.alloc [ α0 ] in
                              let* α2 : M.Val (ref (array (ref str.t))) :=
                                M.alloc (borrow α1) in
                              let* α3 : ref (slice (ref str.t)) :=
                                M.read (pointer_coercion "Unsize" α2) in
                              let* α4 : core.fmt.Arguments.t :=
                                M.call
                                  (core.fmt.Arguments.t::["new_const"] α3) in
                              let* α5 : unit :=
                                M.call (std.io.stdio._print α4) in
                              M.alloc α5 in
                            M.alloc tt) :
                            M (M.Val unit);
                          fun γ =>
                            (let* _ : M.Val unit :=
                              let* α0 : ref str.t := M.read (mk_str "Hello ") in
                              let* α1 : ref str.t := M.read (mk_str "
") in
                              let* α2 : M.Val (array (ref str.t)) :=
                                M.alloc [ α0; α1 ] in
                              let* α3 : M.Val (ref (array (ref str.t))) :=
                                M.alloc (borrow α2) in
                              let* α4 : ref (slice (ref str.t)) :=
                                M.read (pointer_coercion "Unsize" α3) in
                              let* α5 : core.fmt.rt.Argument.t :=
                                M.call
                                  (core.fmt.rt.Argument.t::["new_display"]
                                    (borrow name)) in
                              let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                                M.alloc [ α5 ] in
                              let* α7 :
                                  M.Val (ref (array core.fmt.rt.Argument.t)) :=
                                M.alloc (borrow α6) in
                              let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                                M.read (pointer_coercion "Unsize" α7) in
                              let* α9 : core.fmt.Arguments.t :=
                                M.call
                                  (core.fmt.Arguments.t::["new_v1"] α4 α8) in
                              let* α10 : unit :=
                                M.call (std.io.stdio._print α9) in
                              M.alloc α10 in
                            M.alloc tt) :
                            M (M.Val unit)
                        ]
                    | _ => M.break_match
                    end) :
                    M (M.Val unit)
                ] in
            M.alloc tt)) :
          M (M.Val unit)
      ] in
  M.read (use α6).
