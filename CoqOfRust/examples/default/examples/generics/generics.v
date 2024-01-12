(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  A.
Section A.
  Inductive t : Set := Build.
End A.
End A.

Module  Single.
Section Single.
  Record t : Set := {
    x0 : generics.A.t;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
End Single.
End Single.

Module  SingleGen.
Section SingleGen.
  Context {T : Set}.
  
  Record t : Set := {
    x0 : T;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
End SingleGen.
End SingleGen.

(*
fn main() {
    // `Single` is concrete and explicitly takes `A`.
    let _s = Single(A);

    // Create a variable `_char` of type `SingleGen<char>`
    // and give it the value `SingleGen('a')`.
    // Here, `SingleGen` has a type parameter explicitly specified.
    let _char: SingleGen<char> = SingleGen('a');

    // `SingleGen` can also have a type parameter implicitly specified:
    let _t = SingleGen(A); // Uses `A` defined at the top.
    let _i32 = SingleGen(6); // Uses `i32`.
    let _char = SingleGen('a'); // Uses `char`.
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _s : M.Val generics.Single.t :=
    M.alloc (generics.Single.Build_t generics.A.Build) in
  let* _char : M.Val (generics.SingleGen.t char.t) :=
    M.alloc (generics.SingleGen.Build_t "a"%char) in
  let* _t : M.Val (generics.SingleGen.t generics.A.t) :=
    M.alloc (generics.SingleGen.Build_t generics.A.Build) in
  let* _i32 : M.Val (generics.SingleGen.t i32.t) :=
    M.alloc (generics.SingleGen.Build_t (Integer.of_Z 6)) in
  let* _char : M.Val (generics.SingleGen.t char.t) :=
    M.alloc (generics.SingleGen.Build_t "a"%char) in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
