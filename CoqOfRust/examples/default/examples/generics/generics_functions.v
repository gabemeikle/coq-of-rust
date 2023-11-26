(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  A.
Section A.
  Inductive t : Set := Build.
End A.
End A.

Module  S.
Section S.
  Record t : Set := {
    x0 : generics_functions.A.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End S.
End S.

Module  SGen.
Section SGen.
  Context {T : Set}.
  
  Record t : Set := {
    x0 : T;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End SGen.
End SGen.

(*
fn reg_fn(_s: S) {}
*)
Definition reg_fn (_s : generics_functions.S.t) : M unit :=
  let* _s : M.Val generics_functions.S.t := M.alloc _s in
  M.function_body (M.alloc tt).

(*
fn gen_spec_t(_s: SGen<A>) {}
*)
Definition gen_spec_t
    (_s : generics_functions.SGen.t generics_functions.A.t)
    : M unit :=
  let* _s : M.Val (generics_functions.SGen.t generics_functions.A.t) :=
    M.alloc _s in
  M.function_body (M.alloc tt).

(*
fn gen_spec_i32(_s: SGen<i32>) {}
*)
Definition gen_spec_i32 (_s : generics_functions.SGen.t i32.t) : M unit :=
  let* _s : M.Val (generics_functions.SGen.t i32.t) := M.alloc _s in
  M.function_body (M.alloc tt).

(*
fn generic<T>(_s: SGen<T>) {}
*)
Definition generic {T : Set} (_s : generics_functions.SGen.t T) : M unit :=
  let* _s : M.Val (generics_functions.SGen.t T) := M.alloc _s in
  M.function_body (M.alloc tt).

(*
fn main() {
    // Using the non-generic functions
    reg_fn(S(A)); // Concrete type.
    gen_spec_t(SGen(A)); // Implicitly specified type parameter `A`.
    gen_spec_i32(SGen(6)); // Implicitly specified type parameter `i32`.

    // Explicitly specified type parameter `char` to `generic()`.
    generic::<char>(SGen('a'));

    // Implicitly specified type parameter `char` to `generic()`.
    generic(SGen('c'));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : unit :=
        generics_functions.reg_fn
          (generics_functions.S.Build_t generics_functions.A.Build_t) in
      M.alloc α0 in
    let* _ : M.Val unit :=
      let* α0 : unit :=
        generics_functions.gen_spec_t
          (generics_functions.SGen.Build_t generics_functions.A.Build_t) in
      M.alloc α0 in
    let* _ : M.Val unit :=
      let* α0 : M.Val i32.t := M.alloc 6 in
      let* α1 : i32.t := M.read α0 in
      let* α2 : unit :=
        generics_functions.gen_spec_i32 (generics_functions.SGen.Build_t α1) in
      M.alloc α2 in
    let* _ : M.Val unit :=
      let* α0 : M.Val char.t := M.alloc "a"%char in
      let* α1 : char.t := M.read α0 in
      let* α2 : unit :=
        generics_functions.generic (generics_functions.SGen.Build_t α1) in
      M.alloc α2 in
    let* _ : M.Val unit :=
      let* α0 : M.Val char.t := M.alloc "c"%char in
      let* α1 : char.t := M.read α0 in
      let* α2 : unit :=
        generics_functions.generic (generics_functions.SGen.Build_t α1) in
      M.alloc α2 in
    M.alloc tt).
