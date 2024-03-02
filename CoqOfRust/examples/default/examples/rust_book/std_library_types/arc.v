(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // This variable declaration is where its value is specified.
    let apple = Arc::new("the same apple");

    for _ in 0..10 {
        // Here there is no value specification as it is a pointer to a
        // reference in the memory heap.
        let apple = Arc::clone(&apple);

        thread::spawn(move || {
            // As Arc was used, threads can be spawned using the value allocated
            // in the Arc variable pointer's location.
            println!("{:?}", apple);
        });
    }

    // Make sure all Arc instances are printed from spawned threads.
    thread::sleep(Duration::from_secs(1));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* apple :=
      let* α0 := M.read (mk_str "the same apple") in
      let* α1 :=
        M.call
          ((Ty.apply
                (Ty.path "alloc::sync::Arc")
                [Ty.apply (Ty.path "ref") [Ty.path "str"];
                  Ty.apply (Ty.path "alloc::alloc::Global") []])::["new"]
            α0) in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              Ty.apply (Ty.path "core::ops::range::Range") [Ty.path "i32"])
            (Trait := ℐ))) in
      let* α1 :=
        M.call
          (α0
            {|
              core.ops.range.Range.start := (Integer.of_Z 0) : Ty.path "i32";
              core.ops.range.Range.end_ := (Integer.of_Z 10) : Ty.path "i32";
            |}) in
      let* α2 := M.alloc α1 in
      let* α3 :=
        match_operator
          α2
          [
            fun γ =>
              (let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    ltac:(M.get_method (fun ℐ =>
                      core.iter.traits.iterator.Iterator.next
                        (Self :=
                          Ty.apply
                            (Ty.path "core::ops::range::Range")
                            [Ty.path "i32"])
                        (Trait := ℐ))) in
                  let* α1 := M.call (α0 (borrow_mut iter)) in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.None =>
                          let* α0 := M.break in
                          let* α1 := M.read α0 in
                          let* α2 := never_to_any α1 in
                          M.alloc α2
                        | _ => M.break_match
                        end) :
                        Ty.tuple;
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.Some _ =>
                          let γ0_0 :=
                            (M.var "core::option::Option::Get_Some_0") γ in
                          let* apple :=
                            let* α0 :=
                              ltac:(M.get_method (fun ℐ =>
                                core.clone.Clone.clone
                                  (Self :=
                                    Ty.apply
                                      (Ty.path "alloc::sync::Arc")
                                      [Ty.apply (Ty.path "ref") [Ty.path "str"];
                                        Ty.apply
                                          (Ty.path "alloc::alloc::Global")
                                          []])
                                  (Trait := ℐ))) in
                            let* α1 := M.call (α0 (borrow apple)) in
                            M.alloc α1 in
                          let* _ :=
                            let* α0 :=
                              M.call
                                ((M.var "std::thread::spawn")
                                  (fun (α0 : Ty.path "unit") =>
                                    (let* α0 := M.alloc α0 in
                                    match_operator
                                      α0
                                      [
                                        fun γ =>
                                          (let* _ :=
                                            let* _ :=
                                              let* α0 := M.read (mk_str "") in
                                              let* α1 := M.read (mk_str "
") in
                                              let* α2 := M.alloc [ α0; α1 ] in
                                              let* α3 :=
                                                M.call
                                                  ((Ty.apply
                                                        (Ty.path
                                                          "core::fmt::rt::Argument")
                                                        [])::["new_debug"]
                                                    (borrow apple)) in
                                              let* α4 := M.alloc [ α3 ] in
                                              let* α5 :=
                                                M.call
                                                  ((Ty.apply
                                                        (Ty.path
                                                          "core::fmt::Arguments")
                                                        [])::["new_v1"]
                                                    (pointer_coercion
                                                      "Unsize"
                                                      (borrow α2))
                                                    (pointer_coercion
                                                      "Unsize"
                                                      (borrow α4))) in
                                              let* α6 :=
                                                M.call
                                                  ((M.var
                                                      "std::io::stdio::_print")
                                                    α5) in
                                              M.alloc α6 in
                                            M.alloc tt in
                                          let* α0 := M.alloc tt in
                                          M.read α0) :
                                          Ty.tuple
                                      ]) :
                                    Ty.tuple)) in
                            M.alloc α0 in
                          M.alloc tt
                        | _ => M.break_match
                        end) :
                        Ty.tuple
                    ] in
                M.alloc tt)) :
              Ty.tuple
          ] in
      M.pure (use α3) in
    let* _ :=
      let* α0 :=
        M.call
          ((Ty.apply (Ty.path "core::time::Duration") [])::["from_secs"]
            ((Integer.of_Z 1) : Ty.path "u64")) in
      let* α1 := M.call ((M.var "std::thread::sleep") α0) in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
