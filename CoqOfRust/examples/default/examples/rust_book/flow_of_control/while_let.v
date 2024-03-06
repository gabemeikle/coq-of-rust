(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Make `optional` of type `Option<i32>`
    let mut optional = Some(0);

    // This reads: "while `let` destructures `optional` into
    // `Some(i)`, evaluate the block (`{}`). Else `break`".
    while let Some(i) = optional {
        if i > 9 {
            println!("Greater than 9, quit!");
            optional = None;
        } else {
            println!("`i` is `{:?}`. Try again.", i);
            optional = Some(i + 1);
        }
        // ^ Less rightward drift and doesn't require
        // explicitly handling the failing case.
    }
    // ^ `if let` had additional optional `else`/`else if`
    // clauses. `while let` does not have these.
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* optional :=
      M.alloc (core.option.Option.Some ((Integer.of_Z 0) : Ty.path "i32")) in
    let* α0 :=
      M.loop
        (match_operator
          optional
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.option.Option.Some _ =>
                let γ0_0 := (M.var "core::option::Option::Get_Some_0") γ in
                let* i := M.copy γ0_0 in
                let* α0 := M.read i in
                let* α1 :=
                  M.alloc
                    ((M.var "BinOp::Pure::gt")
                      α0
                      ((Integer.of_Z 9) : Ty.path "i32")) in
                let* α2 := M.read (use α1) in
                if α2 then
                  let* _ :=
                    let* _ :=
                      let* α0 := M.read (mk_str "Greater than 9, quit!
") in
                      let* α1 := M.alloc [ α0 ] in
                      let* α2 :=
                        M.call
                          ((Ty.path "core::fmt::Arguments")::["new_const"]
                            (pointer_coercion "Unsize" (borrow α1))) in
                      let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                      M.alloc α3 in
                    M.alloc tt in
                  let* _ := assign optional core.option.Option.None in
                  M.alloc tt
                else
                  let* _ :=
                    let* _ :=
                      let* α0 := M.read (mk_str "`i` is `") in
                      let* α1 := M.read (mk_str "`. Try again.
") in
                      let* α2 := M.alloc [ α0; α1 ] in
                      let* α3 :=
                        M.call
                          ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
                            (borrow i)) in
                      let* α4 := M.alloc [ α3 ] in
                      let* α5 :=
                        M.call
                          ((Ty.path "core::fmt::Arguments")::["new_v1"]
                            (pointer_coercion "Unsize" (borrow α2))
                            (pointer_coercion "Unsize" (borrow α4))) in
                      let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
                      M.alloc α6 in
                    M.alloc tt in
                  let* _ :=
                    let* α0 := M.read i in
                    let* α1 :=
                      (M.var "BinOp::Panic::add")
                        α0
                        ((Integer.of_Z 1) : Ty.path "i32") in
                    assign optional (core.option.Option.Some α1) in
                  M.alloc tt
              | _ => M.break_match
              end) :
              Ty.tuple [];
            fun γ =>
              (let* _ :=
                let* α0 := M.break in
                let* α1 := M.read α0 in
                let* α2 := never_to_any α1 in
                M.alloc α2 in
              let* α0 := M.alloc tt in
              let* α1 := M.read α0 in
              let* α2 := never_to_any α1 in
              M.alloc α2) :
              Ty.tuple []
          ]) in
    M.read α0
  | _, _ => M.impossible
  end.
