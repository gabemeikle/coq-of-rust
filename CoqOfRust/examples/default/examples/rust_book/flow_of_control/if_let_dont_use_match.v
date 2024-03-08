(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Make `optional` of type `Option<i32>`
    let optional = Some(7);

    match optional {
        Some(i) => {
            println!("This is a really long string and `{:?}`", i);
            // ^ Needed 2 indentations just so we could destructure
            // `i` from the option.
        }
        _ => {}
        // ^ Required because `match` is exhaustive. Doesn't it seem
        // like wasted space?
    };
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* optional :=
      M.alloc
        (Value.StructTuple
          "core::option::Option::Some"
          [ (Integer.of_Z 7) : Ty.path "i32" ]) in
    let* _ :=
      match_operator
        optional
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::option::Option::Get_Some_0" in
                M.pure (α0 γ) in
              let* i := M.copy γ0_0 in
              let* _ :=
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 :=
                    M.read (mk_str "This is a really long string and `") in
                  let* α2 := M.read (mk_str "`
") in
                  let* α3 := M.alloc [ α1; α2 ] in
                  let* α4 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_debug"]
                      [ i ] in
                  let* α5 := M.alloc [ α4 ] in
                  let* α6 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" α3;
                        pointer_coercion "Unsize" α5
                      ] in
                  let* α7 := M.call α0 [ α6 ] in
                  M.alloc α7 in
                M.alloc tt in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ => (M.alloc tt) : Ty.tuple []
        ] in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
