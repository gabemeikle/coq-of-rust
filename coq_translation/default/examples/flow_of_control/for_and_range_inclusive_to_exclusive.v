(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} (_ : unit) : M (H := H) unit :=
  let* α0 :=
    (Impl_IntoIterator_for_Range.Method_into_iter).(@Notation.dot _ "into_iter" _) {| std.ops.Range.start := 1; std.ops.Range._end := 101; |} in
  match α0 with
  | iter =>
    loop
      (let* _ :=
        let* α0 := (Impl_Iterator_for_Range.Method_next).(@Notation.dot _ "next" _) (addr_of iter) in
        match α0 with
        | std.option.Option.None  => Break
        | std.option.Option.Some n =>
          let* α0 := n.["rem"] 15 in
          let* α1 := α0.["eq"] 0 in
          if (α1 : bool) then
            let* _ :=
              let* _ :=
                let* α0 :=
                  format_arguments::["new_const"] (addr_of [ "fizzbuzz
" ]) in
                std.io.stdio._print α0 in
              Pure tt in
            Pure tt
          else
            let* α0 := n.["rem"] 3 in
            let* α1 := α0.["eq"] 0 in
            if (α1 : bool) then
              let* _ :=
                let* _ :=
                  let* α0 :=
                    format_arguments::["new_const"] (addr_of [ "fizz
" ]) in
                  std.io.stdio._print α0 in
                Pure tt in
              Pure tt
            else
              let* α0 := n.["rem"] 5 in
              let* α1 := α0.["eq"] 0 in
              if (α1 : bool) then
                let* _ :=
                  let* _ :=
                    let* α0 :=
                      format_arguments::["new_const"] (addr_of [ "buzz
" ]) in
                    std.io.stdio._print α0 in
                  Pure tt in
                Pure tt
              else
                let* _ :=
                  let* _ :=
                    let* α0 := format_argument::["new_display"] (addr_of n) in
                    let* α1 :=
                      format_arguments::["new_v1"]
                        (addr_of [ ""; "
" ])
                        (addr_of [ α0 ]) in
                    std.io.stdio._print α1 in
                  Pure tt in
                Pure tt
        end in
      Pure tt)
  end.
