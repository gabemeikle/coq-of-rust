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
Parameter reg_fn : (M.Val generics_functions.S.t) -> M (M.Val unit).

(*
fn gen_spec_t(_s: SGen<A>) {}
*)
Parameter gen_spec_t :
    (M.Val (generics_functions.SGen.t generics_functions.A.t)) ->
      M (M.Val unit).

(*
fn gen_spec_i32(_s: SGen<i32>) {}
*)
Parameter gen_spec_i32 :
    (M.Val (generics_functions.SGen.t i32.t)) -> M (M.Val unit).

(*
fn generic<T>(_s: SGen<T>) {}
*)
Parameter generic :
    forall {T : Set},
    (M.Val (generics_functions.SGen.t T)) -> M (M.Val unit).

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
Parameter main : M (M.Val unit).
