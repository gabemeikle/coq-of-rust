(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let i = 3; // Lifetime for `i` starts. ────────────────┐
               //                                                     │
    {
        //                                                   │
        let borrow1 = &i; // `borrow1` lifetime starts. ──┐│
                          //                                                ││
        println!("borrow1: {}", borrow1); //              ││
    } // `borrow1` ends. ─────────────────────────────────┘│
      //                                                     │
      //                                                     │
    {
        //                                                   │
        let borrow2 = &i; // `borrow2` lifetime starts. ──┐│
                          //                                                ││
        println!("borrow2: {}", borrow2); //              ││
    } // `borrow2` ends. ─────────────────────────────────┘│
      //                                                     │
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* i := M.alloc ((Integer.of_Z 3) : Ty.path "i32") in
    let* _ :=
      let* borrow1 := M.alloc (borrow i) in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "borrow1: ") in
          let* α1 := M.read (mk_str "
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow borrow1 ] in
          let* α4 := M.alloc [ α3 ] in
          let* α5 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α2);
                pointer_coercion "Unsize" (borrow α4)
              ] in
          let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
          M.alloc α6 in
        M.alloc tt in
      M.alloc tt in
    let* borrow2 := M.alloc (borrow i) in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "borrow2: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow borrow2 ] in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α4)
            ] in
        let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
