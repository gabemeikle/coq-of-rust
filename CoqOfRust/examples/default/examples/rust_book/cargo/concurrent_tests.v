(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn foo<A>(o: Option<A>) {
    match o {
        Some(_a) => println!("some"),
        None => println!("nothing"),
    }
}
*)
Definition foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [A], [o] =>
    let* o := M.alloc o in
    let* α0 : Ty.tuple :=
      match_operator
        o
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let γ0_0 := core.option.Option.Get_Some_0 γ in
              let* _a := M.copy γ0_0 in
              let* _ : Ty.tuple :=
                let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
                  M.read (mk_str "some
") in
                let* α1 :
                    Ty.apply
                      (Ty.path "array")
                      [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
                  M.alloc [ α0 ] in
                let* α2 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
                  M.call
                    ((Ty.apply
                          (Ty.path "core::fmt::Arguments")
                          [])::["new_const"]
                      (pointer_coercion "Unsize" (borrow α1))) in
                let* α3 : Ty.tuple := M.call (std.io.stdio._print α2) in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple;
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.None =>
              let* _ : Ty.tuple :=
                let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
                  M.read (mk_str "nothing
") in
                let* α1 :
                    Ty.apply
                      (Ty.path "array")
                      [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
                  M.alloc [ α0 ] in
                let* α2 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
                  M.call
                    ((Ty.apply
                          (Ty.path "core::fmt::Arguments")
                          [])::["new_const"]
                      (pointer_coercion "Unsize" (borrow α1))) in
                let* α3 : Ty.tuple := M.call (std.io.stdio._print α2) in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

Module tests.
  (*
      fn test_file() {
          // Opens the file ferris.txt or creates one if it doesn't exist.
          let mut file = OpenOptions::new()
              .append(true)
              .create(true)
              .open("ferris.txt")
              .expect("Failed to open ferris.txt");
  
          // Print "Ferris" 5 times.
          for _ in 0..5 {
              file.write_all("Ferris\n".as_bytes())
                  .expect("Could not write to ferris.txt");
          }
      }
  *)
  Definition test_file (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* file : Ty.apply (Ty.path "std::fs::File") [] :=
        let* α0 : Ty.apply (Ty.path "std::fs::OpenOptions") [] :=
          M.call (Ty.apply (Ty.path "std::fs::OpenOptions") [])::["new"] in
        let* α1 : Ty.apply (Ty.path "std::fs::OpenOptions") [] := M.alloc α0 in
        let* α2 :
            Ty.apply
              (Ty.path "mut_ref")
              [Ty.apply (Ty.path "std::fs::OpenOptions") []] :=
          M.call
            ((Ty.apply (Ty.path "std::fs::OpenOptions") [])::["append"]
              (borrow_mut α1)
              true) in
        let* α3 :
            Ty.apply
              (Ty.path "mut_ref")
              [Ty.apply (Ty.path "std::fs::OpenOptions") []] :=
          M.call
            ((Ty.apply (Ty.path "std::fs::OpenOptions") [])::["create"]
              α2
              true) in
        let* α4 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "ferris.txt") in
        let* α5 :
            Ty.apply
              (Ty.path "core::result::Result")
              [Ty.apply (Ty.path "std::fs::File") [];
                Ty.apply (Ty.path "std::io::error::Error") []] :=
          M.call
            ((Ty.apply (Ty.path "std::fs::OpenOptions") [])::["open"]
              (borrow (deref α3))
              α4) in
        let* α6 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "Failed to open ferris.txt") in
        let* α7 : Ty.apply (Ty.path "std::fs::File") [] :=
          M.call
            ((Ty.apply
                  (Ty.path "core::result::Result")
                  [Ty.apply (Ty.path "std::fs::File") [];
                    Ty.apply (Ty.path "std::io::error::Error") []])::["expect"]
              α5
              α6) in
        M.alloc α7 in
      let* α0 :
          Ty.function
            [Ty.apply (Ty.path "core::ops::range::Range") [Ty.path "i32"]]
            _ :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              Ty.apply (Ty.path "core::ops::range::Range") [Ty.path "i32"])
            (Trait := ℐ))) in
      let* α1 : Ty.apply (Ty.path "core::ops::range::Range") [Ty.path "i32"] :=
        M.call
          (α0
            {|
              core.ops.range.Range.start := (Integer.of_Z 0) : Ty.path "i32";
              core.ops.range.Range.end_ := (Integer.of_Z 5) : Ty.path "i32";
            |}) in
      let* α2 : Ty.apply (Ty.path "core::ops::range::Range") [Ty.path "i32"] :=
        M.alloc α1 in
      let* α3 : Ty.tuple :=
        match_operator
          α2
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
                                (Ty.path "core::ops::range::Range")
                                [Ty.path "i32"]]]
                        (Ty.apply (Ty.path "core::option::Option") [_]) :=
                    ltac:(M.get_method (fun ℐ =>
                      core.iter.traits.iterator.Iterator.next
                        (Self :=
                          Ty.apply
                            (Ty.path "core::ops::range::Range")
                            [Ty.path "i32"])
                        (Trait := ℐ))) in
                  let* α1 :
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [Ty.path "i32"] :=
                    M.call (α0 (borrow_mut iter)) in
                  let* α2 :
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [Ty.path "i32"] :=
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
                          let* _ : Ty.tuple :=
                            let* α0 :
                                Ty.function
                                  [Ty.apply
                                      (Ty.path "mut_ref")
                                      [Ty.apply (Ty.path "std::fs::File") []];
                                    Ty.apply
                                      (Ty.path "ref")
                                      [Ty.apply
                                          (Ty.path "slice")
                                          [Ty.path "u8"]]]
                                  (Ty.apply
                                    (Ty.path "core::result::Result")
                                    [Ty.tuple;
                                      Ty.apply
                                        (Ty.path "std::io::error::Error")
                                        []]) :=
                              ltac:(M.get_method (fun ℐ =>
                                std.io.Write.write_all
                                  (Self :=
                                    Ty.apply (Ty.path "std::fs::File") [])
                                  (Trait := ℐ))) in
                            let* α1 :
                                Ty.apply (Ty.path "ref") [Ty.path "str"] :=
                              M.read (mk_str "Ferris
") in
                            let* α2 :
                                Ty.apply
                                  (Ty.path "ref")
                                  [Ty.apply (Ty.path "slice") [Ty.path "u8"]] :=
                              M.call ((Ty.path "str")::["as_bytes"] α1) in
                            let* α3 :
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  [Ty.tuple;
                                    Ty.apply
                                      (Ty.path "std::io::error::Error")
                                      []] :=
                              M.call (α0 (borrow_mut file) α2) in
                            let* α4 :
                                Ty.apply (Ty.path "ref") [Ty.path "str"] :=
                              M.read (mk_str "Could not write to ferris.txt") in
                            let* α5 : Ty.tuple :=
                              M.call
                                ((Ty.apply
                                      (Ty.path "core::result::Result")
                                      [Ty.tuple;
                                        Ty.apply
                                          (Ty.path "std::io::error::Error")
                                          []])::["expect"]
                                  α3
                                  α4) in
                            M.alloc α5 in
                          M.alloc tt
                        | _ => M.break_match
                        end) :
                        Ty.tuple
                    ] in
                M.alloc tt)) :
              Ty.tuple
          ] in
      M.read (use α3)
    | _, _ => M.impossible
    end.
  
  (*
      fn test_file_also() {
          // Opens the file ferris.txt or creates one if it doesn't exist.
          let mut file = OpenOptions::new()
              .append(true)
              .create(true)
              .open("ferris.txt")
              .expect("Failed to open ferris.txt");
  
          // Print "Corro" 5 times.
          for _ in 0..5 {
              file.write_all("Corro\n".as_bytes())
                  .expect("Could not write to ferris.txt");
          }
      }
  *)
  Definition test_file_also (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* file : Ty.apply (Ty.path "std::fs::File") [] :=
        let* α0 : Ty.apply (Ty.path "std::fs::OpenOptions") [] :=
          M.call (Ty.apply (Ty.path "std::fs::OpenOptions") [])::["new"] in
        let* α1 : Ty.apply (Ty.path "std::fs::OpenOptions") [] := M.alloc α0 in
        let* α2 :
            Ty.apply
              (Ty.path "mut_ref")
              [Ty.apply (Ty.path "std::fs::OpenOptions") []] :=
          M.call
            ((Ty.apply (Ty.path "std::fs::OpenOptions") [])::["append"]
              (borrow_mut α1)
              true) in
        let* α3 :
            Ty.apply
              (Ty.path "mut_ref")
              [Ty.apply (Ty.path "std::fs::OpenOptions") []] :=
          M.call
            ((Ty.apply (Ty.path "std::fs::OpenOptions") [])::["create"]
              α2
              true) in
        let* α4 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "ferris.txt") in
        let* α5 :
            Ty.apply
              (Ty.path "core::result::Result")
              [Ty.apply (Ty.path "std::fs::File") [];
                Ty.apply (Ty.path "std::io::error::Error") []] :=
          M.call
            ((Ty.apply (Ty.path "std::fs::OpenOptions") [])::["open"]
              (borrow (deref α3))
              α4) in
        let* α6 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "Failed to open ferris.txt") in
        let* α7 : Ty.apply (Ty.path "std::fs::File") [] :=
          M.call
            ((Ty.apply
                  (Ty.path "core::result::Result")
                  [Ty.apply (Ty.path "std::fs::File") [];
                    Ty.apply (Ty.path "std::io::error::Error") []])::["expect"]
              α5
              α6) in
        M.alloc α7 in
      let* α0 :
          Ty.function
            [Ty.apply (Ty.path "core::ops::range::Range") [Ty.path "i32"]]
            _ :=
        ltac:(M.get_method (fun ℐ =>
          core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              Ty.apply (Ty.path "core::ops::range::Range") [Ty.path "i32"])
            (Trait := ℐ))) in
      let* α1 : Ty.apply (Ty.path "core::ops::range::Range") [Ty.path "i32"] :=
        M.call
          (α0
            {|
              core.ops.range.Range.start := (Integer.of_Z 0) : Ty.path "i32";
              core.ops.range.Range.end_ := (Integer.of_Z 5) : Ty.path "i32";
            |}) in
      let* α2 : Ty.apply (Ty.path "core::ops::range::Range") [Ty.path "i32"] :=
        M.alloc α1 in
      let* α3 : Ty.tuple :=
        match_operator
          α2
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
                                (Ty.path "core::ops::range::Range")
                                [Ty.path "i32"]]]
                        (Ty.apply (Ty.path "core::option::Option") [_]) :=
                    ltac:(M.get_method (fun ℐ =>
                      core.iter.traits.iterator.Iterator.next
                        (Self :=
                          Ty.apply
                            (Ty.path "core::ops::range::Range")
                            [Ty.path "i32"])
                        (Trait := ℐ))) in
                  let* α1 :
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [Ty.path "i32"] :=
                    M.call (α0 (borrow_mut iter)) in
                  let* α2 :
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [Ty.path "i32"] :=
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
                          let* _ : Ty.tuple :=
                            let* α0 :
                                Ty.function
                                  [Ty.apply
                                      (Ty.path "mut_ref")
                                      [Ty.apply (Ty.path "std::fs::File") []];
                                    Ty.apply
                                      (Ty.path "ref")
                                      [Ty.apply
                                          (Ty.path "slice")
                                          [Ty.path "u8"]]]
                                  (Ty.apply
                                    (Ty.path "core::result::Result")
                                    [Ty.tuple;
                                      Ty.apply
                                        (Ty.path "std::io::error::Error")
                                        []]) :=
                              ltac:(M.get_method (fun ℐ =>
                                std.io.Write.write_all
                                  (Self :=
                                    Ty.apply (Ty.path "std::fs::File") [])
                                  (Trait := ℐ))) in
                            let* α1 :
                                Ty.apply (Ty.path "ref") [Ty.path "str"] :=
                              M.read (mk_str "Corro
") in
                            let* α2 :
                                Ty.apply
                                  (Ty.path "ref")
                                  [Ty.apply (Ty.path "slice") [Ty.path "u8"]] :=
                              M.call ((Ty.path "str")::["as_bytes"] α1) in
                            let* α3 :
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  [Ty.tuple;
                                    Ty.apply
                                      (Ty.path "std::io::error::Error")
                                      []] :=
                              M.call (α0 (borrow_mut file) α2) in
                            let* α4 :
                                Ty.apply (Ty.path "ref") [Ty.path "str"] :=
                              M.read (mk_str "Could not write to ferris.txt") in
                            let* α5 : Ty.tuple :=
                              M.call
                                ((Ty.apply
                                      (Ty.path "core::result::Result")
                                      [Ty.tuple;
                                        Ty.apply
                                          (Ty.path "std::io::error::Error")
                                          []])::["expect"]
                                  α3
                                  α4) in
                            M.alloc α5 in
                          M.alloc tt
                        | _ => M.break_match
                        end) :
                        Ty.tuple
                    ] in
                M.alloc tt)) :
              Ty.tuple
          ] in
      M.read (use α3)
    | _, _ => M.impossible
    end.
End tests.
