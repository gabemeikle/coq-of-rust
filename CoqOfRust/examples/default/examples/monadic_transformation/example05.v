(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_example05_Foo.
Section Impl_example05_Foo.
  Definition Self : Set := Ty.apply (Ty.path "example05::Foo") [].
  
  (*
      fn plus1(self) -> u32 {
          self.0 + 1
      }
  *)
  Definition plus1 (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read ((M.var "example05::Foo::Get_0") self) in
      (M.var "BinOp::Panic::add") α0 ((Integer.of_Z 1) : Ty.path "u32")
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_plus1 : Instance.t := {
    Notations.double_colon := plus1;
  }.
End Impl_example05_Foo.
End Impl_example05_Foo.

(*
fn main() {
    let foo = Foo(0);
    foo.plus1();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* foo :=
      M.alloc (example05.Foo.Build_t ((Integer.of_Z 0) : Ty.path "u32")) in
    let* _ :=
      let* α0 := M.read foo in
      let* α1 :=
        M.call ((Ty.apply (Ty.path "example05::Foo") [])::["plus1"] α0) in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
