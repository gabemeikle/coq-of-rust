(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn is_odd(n: u32) -> bool {
    n % 2 == 1
}
*)
Definition is_odd (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ n ] =>
    let* n := M.alloc n in
    let* α0 := M.read n in
    let* α1 := BinOp.Panic.rem α0 (Value.Integer Integer.U32 2) in
    M.pure (BinOp.Pure.eq α1 (Value.Integer Integer.U32 1))
  | _, _ => M.impossible
  end.

(*
fn main() {
    println!("Find the sum of all the squared odd numbers under 1000");
    let upper = 1000;

    // Imperative approach
    // Declare accumulator variable
    let mut acc = 0;
    // Iterate: 0, 1, 2, ... to infinity
    for n in 0.. {
        // Square the number
        let n_squared = n * n;

        if n_squared >= upper {
            // Break loop if exceeded the upper limit
            break;
        } else if is_odd(n_squared) {
            // Accumulate value, if it's odd
            acc += n_squared;
        }
    }
    println!("imperative style: {}", acc);

    // Functional approach
    let sum_of_squared_odd_numbers: u32 = (0..)
        .map(|n| n * n) // All natural numbers squared
        .take_while(|&n_squared| n_squared < upper) // Below upper limit
        .filter(|&n_squared| is_odd(n_squared)) // That are odd
        .sum(); // Sum them
    println!("functional style: {}", sum_of_squared_odd_numbers);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const"
            [] in
        let* α2 :=
          M.read
            (mk_str
              "Find the sum of all the squared odd numbers under 1000
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call_closure α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* upper := M.alloc (Value.Integer Integer.U32 1000) in
    let* acc := M.alloc (Value.Integer Integer.U32 0) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply (Ty.path "core::ops::range::RangeFrom") [ Ty.path "u32" ])
          []
          "into_iter"
          [] in
      let* α1 :=
        M.call_closure
          α0
          [
            Value.StructRecord
              "core::ops::range::RangeFrom"
              [ ("start", Value.Integer Integer.U32 0) ]
          ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        match_operator
          α2
          [
            fun γ =>
              let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      (Ty.apply
                        (Ty.path "core::ops::range::RangeFrom")
                        [ Ty.path "u32" ])
                      []
                      "next"
                      [] in
                  let* α1 := M.call_closure α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := M.never_to_any α1 in
                        M.alloc α2;
                      fun γ =>
                        let* γ0_0 :=
                          M.get_struct_tuple_field_or_break_match
                            γ
                            "core::option::Option::Some"
                            0 in
                        let* n := M.copy γ0_0 in
                        let* n_squared :=
                          let* α0 := M.read n in
                          let* α1 := M.read n in
                          let* α2 := BinOp.Panic.mul α0 α1 in
                          M.alloc α2 in
                        let* α0 := M.read n_squared in
                        let* α1 := M.read upper in
                        let* α2 := M.alloc (BinOp.Pure.ge α0 α1) in
                        let* α3 := M.read (M.use α2) in
                        if Value.is_true α3 then
                          let* α0 := M.break in
                          let* α1 := M.read α0 in
                          let* α2 := M.never_to_any α1 in
                          M.alloc α2
                        else
                          let* α0 :=
                            M.get_function
                              "higher_order_functions::is_odd"
                              [] in
                          let* α1 := M.read n_squared in
                          let* α2 := M.call_closure α0 [ α1 ] in
                          let* α3 := M.alloc α2 in
                          let* α4 := M.read (M.use α3) in
                          if Value.is_true α4 then
                            let* _ :=
                              let β := acc in
                              let* α0 := M.read β in
                              let* α1 := M.read n_squared in
                              let* α2 := BinOp.Panic.add α0 α1 in
                              M.assign β α2 in
                            M.alloc (Value.Tuple [])
                          else
                            M.alloc (Value.Tuple [])
                    ] in
                M.alloc (Value.Tuple []))
          ] in
      M.pure (M.use α3) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "imperative style: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u32" ] in
        let* α6 := M.call_closure α5 [ acc ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* sum_of_squared_odd_numbers :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::filter::Filter")
            [
              Ty.apply
                (Ty.path "core::iter::adapters::take_while::TakeWhile")
                [
                  Ty.apply
                    (Ty.path "core::iter::adapters::map::Map")
                    [
                      Ty.apply
                        (Ty.path "core::ops::range::RangeFrom")
                        [ Ty.path "u32" ];
                      Ty.function [ Ty.tuple [ Ty.path "u32" ] ] (Ty.path "u32")
                    ];
                  Ty.function
                    [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "u32" ] ] ]
                    (Ty.path "bool")
                ];
              Ty.function
                [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "u32" ] ] ]
                (Ty.path "bool")
            ])
          []
          "sum"
          [ Ty.path "u32" ] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::take_while::TakeWhile")
            [
              Ty.apply
                (Ty.path "core::iter::adapters::map::Map")
                [
                  Ty.apply
                    (Ty.path "core::ops::range::RangeFrom")
                    [ Ty.path "u32" ];
                  Ty.function [ Ty.tuple [ Ty.path "u32" ] ] (Ty.path "u32")
                ];
              Ty.function
                [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "u32" ] ] ]
                (Ty.path "bool")
            ])
          []
          "filter"
          [
            Ty.function
              [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "u32" ] ] ]
              (Ty.path "bool")
          ] in
      let* α2 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::map::Map")
            [
              Ty.apply
                (Ty.path "core::ops::range::RangeFrom")
                [ Ty.path "u32" ];
              Ty.function [ Ty.tuple [ Ty.path "u32" ] ] (Ty.path "u32")
            ])
          []
          "take_while"
          [
            Ty.function
              [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "u32" ] ] ]
              (Ty.path "bool")
          ] in
      let* α3 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply (Ty.path "core::ops::range::RangeFrom") [ Ty.path "u32" ])
          []
          "map"
          [
            Ty.path "u32";
            Ty.function [ Ty.tuple [ Ty.path "u32" ] ] (Ty.path "u32")
          ] in
      let* α4 :=
        M.call_closure
          α3
          [
            Value.StructRecord
              "core::ops::range::RangeFrom"
              [ ("start", Value.Integer Integer.U32 0) ];
            M.closure
              (fun γ =>
                match γ with
                | [ α0 ] =>
                  let* α0 := M.alloc α0 in
                  match_operator
                    α0
                    [
                      fun γ =>
                        let* n := M.copy γ in
                        let* α0 := M.read n in
                        let* α1 := M.read n in
                        BinOp.Panic.mul α0 α1
                    ]
                | _ => M.impossible
                end)
          ] in
      let* α5 :=
        M.call_closure
          α2
          [
            α4;
            M.closure
              (fun γ =>
                match γ with
                | [ α0 ] =>
                  let* α0 := M.alloc α0 in
                  match_operator
                    α0
                    [
                      fun γ =>
                        let* γ := M.read γ in
                        let* n_squared := M.copy γ in
                        let* α0 := M.read n_squared in
                        let* α1 := M.read upper in
                        M.pure (BinOp.Pure.lt α0 α1)
                    ]
                | _ => M.impossible
                end)
          ] in
      let* α6 :=
        M.call_closure
          α1
          [
            α5;
            M.closure
              (fun γ =>
                match γ with
                | [ α0 ] =>
                  let* α0 := M.alloc α0 in
                  match_operator
                    α0
                    [
                      fun γ =>
                        let* γ := M.read γ in
                        let* n_squared := M.copy γ in
                        let* α0 :=
                          M.get_function "higher_order_functions::is_odd" [] in
                        let* α1 := M.read n_squared in
                        M.call_closure α0 [ α1 ]
                    ]
                | _ => M.impossible
                end)
          ] in
      let* α7 := M.call_closure α0 [ α6 ] in
      M.alloc α7 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "functional style: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u32" ] in
        let* α6 := M.call_closure α5 [ sum_of_squared_odd_numbers ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
