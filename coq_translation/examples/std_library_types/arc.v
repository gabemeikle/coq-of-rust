(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} (_ : unit) : M (H := H) unit :=
  let* apple := alloc.sync.Arc::["new"] "the same apple" in
  let* _ :=
    let* α0 := LangItem Range {| Range.start := 0; Range.end := 10; |} in
    match α0 with
    | iter =>
      while
        (let* _ :=
          let* α0 := LangItem (addr_of iter) in
          match α0 with
          | None => Break
          | Some {| Some.0 := _; |} =>
            let* apple := alloc.sync.Arc::["clone"] (addr_of apple) in
            let* _ :=
              std.thread.spawn
                (fun  =>
                  let* _ :=
                    let* _ :=
                      let* α0 :=
                        format_argument::["new_debug"] (addr_of apple) in
                      let* α1 :=
                        format_arguments::["new_v1"]
                          (addr_of [ ""; "
" ])
                          (addr_of [ α0 ]) in
                      std.io.stdio._print α1 in
                    Pure tt in
                  Pure tt) in
            Pure tt
          end in
        Pure tt)
    end in
  let* _ :=
    let* α0 := core.time.Duration::["from_secs"] 1 in
    std.thread.sleep α0 in
  Pure tt.
