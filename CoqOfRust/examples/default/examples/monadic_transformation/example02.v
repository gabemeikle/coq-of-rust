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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.alloc ((Integer.of_Z 1) : Ty.path "i32") in
      match_operator
        α0
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | i32.Make 0 => M.alloc false
            | _ => M.break_match 
            end) :
            Ty.path "bool";
          fun γ => (M.alloc true) : Ty.path "bool"
        ] in
    let* _ :=
      let* α0 := M.alloc true in
      let* α1 := M.read (use α0) in
      if α1 then
        M.alloc ((Integer.of_Z 0) : Ty.path "i32")
      else
        M.alloc ((Integer.of_Z 1) : Ty.path "i32") in
    let* _ :=
      let* α0 := M.alloc false in
      let* α1 := M.read (use α0) in
      if α1 then
        M.alloc ((Integer.of_Z 2) : Ty.path "i32")
      else
        let* α0 := M.alloc false in
        let* α1 := M.read (use α0) in
        if α1 then
          M.alloc ((Integer.of_Z 3) : Ty.path "i32")
        else
          let* α0 := M.alloc false in
          let* α1 := M.read (use α0) in
          if α1 then
            M.alloc ((Integer.of_Z 4) : Ty.path "i32")
          else
            M.alloc ((Integer.of_Z 5) : Ty.path "i32") in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
