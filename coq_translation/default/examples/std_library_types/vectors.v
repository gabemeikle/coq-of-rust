(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} (_ : unit) : M (H := H) unit :=
  let* collected_iterator :=
    {| std.ops.Range.start := 0; std.ops.Range.end := 10; |}.["collect"] in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of collected_iterator) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Collected (0..10) into: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* xs :=
    let* α0 := alloc.boxed.Box::["new"] [ 1; 2; 3 ] in
    Slice::["into_vec"] α0 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of xs) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Initial vector: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "Push 4 into the vector
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* _ := xs.["push"] 4 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of xs) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Vector: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := xs.["len"] in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Vector length: "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of xs[1]) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Second element: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := xs.["pop"] in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Pop last element: "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "Contents of xs:
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* _ :=
    let* α0 := xs.["iter"] in
    let* α1 := α0.["into_iter"] in
    match α1 with
    | iter =>
      loop
        (let* _ :=
          let* α0 := (addr_of iter).["next"] in
          match α0 with
          | std.option.Option.None  => Break
          | std.option.Option.Some x =>
            let* _ :=
              let* _ :=
                let* α0 := format_argument::["new_display"] (addr_of x) in
                let* α1 :=
                  format_arguments::["new_v1"]
                    (addr_of [ "> "; "
" ])
                    (addr_of [ α0 ]) in
                std.io.stdio._print α1 in
              Pure tt in
            Pure tt
          end in
        Pure tt)
    end in
  let* _ :=
    let* α0 := xs.["iter"] in
    let* α1 := α0.["enumerate"] in
    let* α2 := α1.["into_iter"] in
    match α2 with
    | iter =>
      loop
        (let* _ :=
          let* α0 := (addr_of iter).["next"] in
          match α0 with
          | std.option.Option.None  => Break
          | std.option.Option.Some (i, x) =>
            let* _ :=
              let* _ :=
                let* α0 := format_argument::["new_display"] (addr_of i) in
                let* α1 := format_argument::["new_display"] (addr_of x) in
                let* α2 :=
                  format_arguments::["new_v1"]
                    (addr_of [ "In position "; " we have value "; "
" ])
                    (addr_of [ α0; α1 ]) in
                std.io.stdio._print α2 in
              Pure tt in
            Pure tt
          end in
        Pure tt)
    end in
  let* _ :=
    let* α0 := xs.["iter_mut"] in
    let* α1 := α0.["into_iter"] in
    match α1 with
    | iter =>
      loop
        (let* _ :=
          let* α0 := (addr_of iter).["next"] in
          match α0 with
          | std.option.Option.None  => Break
          | std.option.Option.Some x =>
            let* _ :=
              let* α0 := x.["deref"] in
              α0.["mul_assign"] 3 in
            Pure tt
          end in
        Pure tt)
    end in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of xs) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Updated vector: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
