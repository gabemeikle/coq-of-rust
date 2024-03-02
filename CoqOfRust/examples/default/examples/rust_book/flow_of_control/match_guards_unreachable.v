(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let number: u8 = 4;

    match number {
        i if i == 0 => println!("Zero"),
        i if i > 0 => println!("Greater than zero"),
        _ => unreachable!("Should never happen."),
        // TODO ^ uncomment to fix compilation
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* number := M.alloc ((Integer.of_Z 4) : Ty.path "u8") in
    let* α0 :=
      match_operator
        number
        [
          fun γ =>
            (let* i := M.copy γ in
            let* _ :=
              let* α0 := M.read (mk_str "Zero
") in
              let* α1 := M.alloc [ α0 ] in
              let* α2 :=
                M.call
                  ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
                    (pointer_coercion "Unsize" (borrow α1))) in
              let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
              M.alloc α3 in
            M.alloc tt) :
            Ty.tuple;
          fun γ =>
            (let* i := M.copy γ in
            let* _ :=
              let* α0 := M.read (mk_str "Greater than zero
") in
              let* α1 := M.alloc [ α0 ] in
              let* α2 :=
                M.call
                  ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
                    (pointer_coercion "Unsize" (borrow α1))) in
              let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
              M.alloc α3 in
            M.alloc tt) :
            Ty.tuple;
          fun γ =>
            (let* α0 :=
              M.call
                ((M.var "core::panicking::unreachable_display")
                  (borrow (mk_str "Should never happen."))) in
            let* α1 := never_to_any α0 in
            M.alloc α1) :
            Ty.tuple
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
