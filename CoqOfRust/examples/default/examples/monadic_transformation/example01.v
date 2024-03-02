(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn id(x: u64) -> u64 {
    x
}
*)
Definition id (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [x] =>
    let* x := M.alloc x in
    M.read x
  | _, _ => M.impossible
  end.

(*
fn tri(a: u64, b: u64, c: u64) {}
*)
Definition tri (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [a; b; c] =>
    let* a := M.alloc a in
    let* b := M.alloc b in
    let* c := M.alloc c in
    M.pure tt
  | _, _ => M.impossible
  end.

(*
fn main() {
    id(0);
    id(id(0));
    id(id(id(0)));
    id(id(id(id(0))));
    tri(id(1), id(2), 3);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 :=
        M.call ((M.var "example01::id") ((Integer.of_Z 0) : Ty.path "u64")) in
      M.alloc α0 in
    let* _ :=
      let* α0 :=
        M.call ((M.var "example01::id") ((Integer.of_Z 0) : Ty.path "u64")) in
      let* α1 := M.call ((M.var "example01::id") α0) in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.call ((M.var "example01::id") ((Integer.of_Z 0) : Ty.path "u64")) in
      let* α1 := M.call ((M.var "example01::id") α0) in
      let* α2 := M.call ((M.var "example01::id") α1) in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.call ((M.var "example01::id") ((Integer.of_Z 0) : Ty.path "u64")) in
      let* α1 := M.call ((M.var "example01::id") α0) in
      let* α2 := M.call ((M.var "example01::id") α1) in
      let* α3 := M.call ((M.var "example01::id") α2) in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.call ((M.var "example01::id") ((Integer.of_Z 1) : Ty.path "u64")) in
      let* α1 :=
        M.call ((M.var "example01::id") ((Integer.of_Z 2) : Ty.path "u64")) in
      let* α2 :=
        M.call
          ((M.var "example01::tri") α0 α1 ((Integer.of_Z 3) : Ty.path "u64")) in
      M.alloc α2 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
