(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    fn sum_odd_numbers(up_to: u32) -> u32 {
        let mut acc = 0;
        for i in 0..up_to {
            // Notice that the return type of this match expression must be u32
            // because of the type of the "addition" variable.
            let addition: u32 = match i % 2 == 1 {
                // The "i" variable is of type u32, which is perfectly fine.
                true => i,
                // On the other hand, the "continue" expression does not return
                // u32, but it is still fine, because it never returns and therefore
                // does not violate the type requirements of the match expression.
                false => continue,
            };
            acc += addition;
        }
        acc
    }
    println!(
        "Sum of odd numbers up to 9 (excluding): {}",
        sum_odd_numbers(9)
    );
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
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Sum of odd numbers up to 9 (excluding): ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u32" ] in
        let* α6 :=
          M.get_function
            "diverging_functions_example_sum_odd_numbers::main.sum_odd_numbers"
            [] in
        let* α7 := M.call_closure α6 [ Value.Integer Integer.U32 9 ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call_closure α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
    fn sum_odd_numbers(up_to: u32) -> u32 {
        let mut acc = 0;
        for i in 0..up_to {
            // Notice that the return type of this match expression must be u32
            // because of the type of the "addition" variable.
            let addition: u32 = match i % 2 == 1 {
                // The "i" variable is of type u32, which is perfectly fine.
                true => i,
                // On the other hand, the "continue" expression does not return
                // u32, but it is still fine, because it never returns and therefore
                // does not violate the type requirements of the match expression.
                false => continue,
            };
            acc += addition;
        }
        acc
    }
*)
Definition sum_odd_numbers (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ up_to ] =>
    let* up_to := M.alloc up_to in
    let* acc := M.alloc (Value.Integer Integer.U32 0) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "u32" ])
          []
          "into_iter"
          [] in
      let* α1 := M.read up_to in
      let* α2 :=
        M.call_closure
          α0
          [
            Value.StructRecord
              "core::ops::range::Range"
              [ ("start", Value.Integer Integer.U32 0); ("end_", α1) ]
          ] in
      let* α3 := M.alloc α2 in
      let* α4 :=
        match_operator
          α3
          [
            fun γ =>
              let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      (Ty.apply
                        (Ty.path "core::ops::range::Range")
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
                        let* i := M.copy γ0_0 in
                        let* addition :=
                          let* α0 := M.read i in
                          let* α1 :=
                            BinOp.Panic.rem α0 (Value.Integer Integer.U32 2) in
                          let* α2 :=
                            M.alloc
                              (BinOp.Pure.eq
                                α1
                                (Value.Integer Integer.U32 1)) in
                          let* α3 :=
                            match_operator
                              α2
                              [
                                fun γ =>
                                  let* _ :=
                                    let* α0 := M.read γ in
                                    M.is_constant_or_break_match
                                      α0
                                      (Value.Bool true) in
                                  M.pure i;
                                fun γ =>
                                  let* _ :=
                                    let* α0 := M.read γ in
                                    M.is_constant_or_break_match
                                      α0
                                      (Value.Bool false) in
                                  let* α0 := M.continue in
                                  let* α1 := M.read α0 in
                                  let* α2 := M.never_to_any α1 in
                                  M.alloc α2
                              ] in
                          M.copy α3 in
                        let* _ :=
                          let β := acc in
                          let* α0 := M.read β in
                          let* α1 := M.read addition in
                          let* α2 := BinOp.Panic.add α0 α1 in
                          M.assign β α2 in
                        M.alloc (Value.Tuple [])
                    ] in
                M.alloc (Value.Tuple []))
          ] in
      M.pure (M.use α4) in
    M.read acc
  | _, _ => M.impossible
  end.
