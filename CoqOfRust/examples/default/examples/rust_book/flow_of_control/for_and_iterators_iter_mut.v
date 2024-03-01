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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* names :
        Ty.apply
          (Ty.path "alloc::vec::Vec")
          [Ty.apply (Ty.path "ref") [Ty.path "str"];
            Ty.apply (Ty.path "alloc::alloc::Global") []] :=
      let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "Bob") in
      let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "Frank") in
      let* α2 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "Ferris") in
      let* α3 :
          Ty.apply
            (Ty.path "array")
            [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
        M.alloc [ α0; α1; α2 ] in
      let* α4 :
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.call ((alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"] α3) in
      let* α5 :
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.read α4 in
      let* α6 :
          Ty.apply
            (Ty.path "alloc::vec::Vec")
            [Ty.apply (Ty.path "ref") [Ty.path "str"];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.call
          ((Ty.apply
                (Ty.path "slice")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]])::["into_vec"]
            (pointer_coercion "Unsize" α5)) in
      M.alloc α6 in
    let* _ : Ty.tuple :=
      let* α0 :
          Ty.function
            [Ty.apply
                (Ty.path "core::slice::iter::IterMut")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]]]
            _ :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              Ty.apply
                (Ty.path "core::slice::iter::IterMut")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]])
            (Trait := ℐ))) in
      let* α1 :
          Ty.function
            [Ty.apply
                (Ty.path "mut_ref")
                [Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [Ty.apply (Ty.path "ref") [Ty.path "str"];
                      Ty.apply (Ty.path "alloc::alloc::Global") []]]]
            (Ty.apply (Ty.path "mut_ref") [_]) :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.deref.DerefMut.deref_mut
            (Self :=
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [Ty.apply (Ty.path "ref") [Ty.path "str"];
                  Ty.apply (Ty.path "alloc::alloc::Global") []])
            (Trait := ℐ))) in
      let* α2 :
          Ty.apply
            (Ty.path "mut_ref")
            [Ty.apply
                (Ty.path "slice")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]]] :=
        M.call (α1 (borrow_mut names)) in
      let* α3 :
          Ty.apply
            (Ty.path "core::slice::iter::IterMut")
            [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
        M.call
          ((Ty.apply
                (Ty.path "slice")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]])::["iter_mut"]
            α2) in
      let* α4 :
          Ty.apply
            (Ty.path "core::slice::iter::IterMut")
            [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
        M.call (α0 α3) in
      let* α5 :
          Ty.apply
            (Ty.path "core::slice::iter::IterMut")
            [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
        M.alloc α4 in
      let* α6 : Ty.tuple :=
        match_operator
          α5
          [
            fun γ =>
              (let* iter := M.copy γ in
              M.loop
                (let* _ : Ty.tuple :=
                  let* α0 :
                      Ty.function
                        [Ty.apply
                            (Ty.path "mut_ref")
                            [Ty.apply
                                (Ty.path "core::slice::iter::IterMut")
                                [Ty.apply (Ty.path "ref") [Ty.path "str"]]]]
                        (Ty.apply (Ty.path "core::option::Option") [_]) :=
                    ltac:(M.get_method (fun ℐ =>
                      core.iter.traits.iterator.Iterator.next
                        (Self :=
                          Ty.apply
                            (Ty.path "core::slice::iter::IterMut")
                            [Ty.apply (Ty.path "ref") [Ty.path "str"]])
                        (Trait := ℐ))) in
                  let* α1 :
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [Ty.apply
                            (Ty.path "mut_ref")
                            [Ty.apply (Ty.path "ref") [Ty.path "str"]]] :=
                    M.call (α0 (borrow_mut iter)) in
                  let* α2 :
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [Ty.apply
                            (Ty.path "mut_ref")
                            [Ty.apply (Ty.path "ref") [Ty.path "str"]]] :=
                    M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.None =>
                          let* α0 : Ty.path "never" := M.break in
                          let* α1 : Ty.path "never" := M.read α0 in
                          let* α2 : Ty.tuple := never_to_any α1 in
                          M.alloc α2
                        | _ => M.break_match
                        end) :
                        Ty.tuple;
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.Some _ =>
                          let γ0_0 := core.option.Option.Get_Some_0 γ in
                          let* name := M.copy γ0_0 in
                          let* α0 :
                              Ty.apply
                                (Ty.path "mut_ref")
                                [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
                            M.read name in
                          let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
                            match_operator
                              name
                              [
                                fun γ =>
                                  (let* γ :=
                                    let* α0 := M.read γ in
                                    M.pure (deref α0) in
                                  let* α0 :
                                      Ty.apply
                                        (Ty.path "ref")
                                        [Ty.path "str"] :=
                                    M.read
                                      (mk_str
                                        "There is a rustacean among us!") in
                                  M.alloc α0) :
                                  Ty.apply (Ty.path "ref") [Ty.path "str"];
                                fun γ =>
                                  (let* α0 :
                                      Ty.apply
                                        (Ty.path "ref")
                                        [Ty.path "str"] :=
                                    M.read (mk_str "Hello") in
                                  M.alloc α0) :
                                  Ty.apply (Ty.path "ref") [Ty.path "str"]
                              ] in
                          let* α2 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
                            M.read α1 in
                          assign (deref α0) α2
                        | _ => M.break_match
                        end) :
                        Ty.tuple
                    ] in
                M.alloc tt)) :
              Ty.tuple
          ] in
      M.pure (use α6) in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "names: ") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow names)) in
        let* α4 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α3 ] in
        let* α5 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 : Ty.tuple := M.call (std.io.stdio._print α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
