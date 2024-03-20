(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    match 1 {
        0 => false,
        _ => true,
    };
    if true {
        0
    } else {
        1
    };
    if false {
        2
    } else if false {
        3
    } else if false {
        4
    } else {
        5
    };
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.alloc (Value.Integer Integer.I32 1) in
      match_operator
        α0
        [
          fun γ =>
            let* _ :=
              let* α0 := M.read γ in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 0) in
            M.alloc (Value.Bool false);
          fun γ => M.alloc (Value.Bool true)
        ] in
    let* _ :=
      let* α0 := M.alloc (Value.Bool true) in
      let* α1 := M.read (M.use α0) in
      if Value.is_true α1 then
        M.alloc (Value.Integer Integer.I32 0)
      else
        M.alloc (Value.Integer Integer.I32 1) in
    let* _ :=
      let* α0 := M.alloc (Value.Bool false) in
      let* α1 := M.read (M.use α0) in
      if Value.is_true α1 then
        M.alloc (Value.Integer Integer.I32 2)
      else
        let* α0 := M.alloc (Value.Bool false) in
        let* α1 := M.read (M.use α0) in
        if Value.is_true α1 then
          M.alloc (Value.Integer Integer.I32 3)
        else
          let* α0 := M.alloc (Value.Bool false) in
          let* α1 := M.read (M.use α0) in
          if Value.is_true α1 then
            M.alloc (Value.Integer Integer.I32 4)
          else
            M.alloc (Value.Integer Integer.I32 5) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
