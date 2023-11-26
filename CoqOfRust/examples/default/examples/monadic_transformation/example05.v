(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Foo.
Section Foo.
  Record t : Set := {
    x0 : u32.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Foo.
End Foo.

Module  Impl_example05_Foo_t.
Section Impl_example05_Foo_t.
  Ltac Self := exact example05.Foo.t.
  
  (*
      fn plus1(self) -> u32 {
          self.0 + 1
      }
  *)
  Definition plus1 (self : ltac:(Self)) : M u32.t :=
    let* self : M.Val ltac:(Self) := M.alloc self in
    M.function_body
      (let* α0 : M.Val u32.t := M.alloc 1 in
      let* α0 : M.Val u32.t := BinOp.add self.["0"] α0 in
      M.read α0).
  
  Global Instance AssociatedFunction_plus1 :
    Notations.DoubleColon ltac:(Self) "plus1" := {
    Notations.double_colon := plus1;
  }.
End Impl_example05_Foo_t.
End Impl_example05_Foo_t.

(*
fn main() {
    let foo = Foo(0);
    foo.plus1();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* foo : M.Val example05.Foo.t :=
      let* α0 : M.Val u32.t := M.alloc 0 in
      let* α1 : u32.t := M.read α0 in
      M.alloc (example05.Foo.Build_t α1) in
    let* _ : M.Val u32.t :=
      let* α0 : example05.Foo.t := M.read foo in
      let* α1 : u32.t := example05.Foo.t::["plus1"] α0 in
      M.alloc α1 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
