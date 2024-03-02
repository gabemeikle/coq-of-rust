(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Axiom Operations :
    Ty.apply
      (Ty.path "enums_type_aliases_v1::VeryVerboseEnumOfThingsToDoWithNumbers")
      [].

(*
fn main() {
    // We can refer to each variant via its alias, not its long and inconvenient
    // name.
    let x = Operations::Add;
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x :=
      M.alloc
        enums_type_aliases_v1.VeryVerboseEnumOfThingsToDoWithNumbers.Add in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
