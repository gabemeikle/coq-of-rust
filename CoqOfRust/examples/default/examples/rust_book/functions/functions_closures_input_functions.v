(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn call_me<F: Fn()>(f: F) {
    f();
}
*)
Definition call_me (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [F], [f] =>
    let* f := M.alloc f in
    let* _ :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.function.Fn.call
            (Self := F)
            (Args := Ty.tuple [])
            (Trait := ℐ))) in
      let* α1 := M.call (α0 (borrow f) tt) in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn function() {
    println!("I'm a function!");
}
*)
Definition function (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "I'm a function!
") in
        let* α1 := M.alloc [ α0 ] in
        let* α2 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_const"]
              (pointer_coercion "Unsize" (borrow α1))) in
        let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
        M.alloc α3 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Define a closure satisfying the `Fn` bound
    let closure = || println!("I'm a closure!");

    call_me(closure);
    call_me(function);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* closure :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* α0 := M.read (mk_str "I'm a closure!
") in
                  let* α1 := M.alloc [ α0 ] in
                  let* α2 :=
                    M.call
                      ((Ty.path "core::fmt::Arguments")::["new_const"]
                        (pointer_coercion "Unsize" (borrow α1))) in
                  let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                  M.alloc α3 in
                let* α0 := M.alloc tt in
                M.read α0) :
                Ty.tuple []
            ]) :
          Ty.tuple []) in
    let* _ :=
      let* α0 := M.read closure in
      let* α1 :=
        M.call ((M.var "functions_closures_input_functions::call_me") α0) in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.call
          ((M.var "functions_closures_input_functions::call_me")
            (M.var "functions_closures_input_functions::function")) in
      M.alloc α0 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
