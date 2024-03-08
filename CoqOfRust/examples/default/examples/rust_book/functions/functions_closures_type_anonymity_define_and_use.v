(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn apply<F>(f: F)
where
    F: Fn(),
{
    f();
}
*)
Definition apply (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ F ], [ f ] =>
    let* f := M.alloc f in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::ops::function::Fn"
          "call"
          [ (* Self *) F; (* Args *) Ty.tuple [] ] in
      let* α1 := M.call α0 [ f; tt ] in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let x = 7;

    // Capture `x` into an anonymous type and implement
    // `Fn` for it. Store it in `print`.
    let print = || println!("{}", x);

    apply(print);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x := M.alloc ((Integer.of_Z 7) : Ty.path "i32") in
    let* print :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "") in
                  let* α2 := M.read (mk_str "
") in
                  let* α3 := M.alloc [ α1; α2 ] in
                  let* α4 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_display"]
                      [ x ] in
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
                let* α0 := M.alloc tt in
                M.read α0) :
                _
            ]) :
          _) in
    let* _ :=
      let* α0 :=
        M.var "functions_closures_type_anonymity_define_and_use::apply" in
      let* α1 := M.read print in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
