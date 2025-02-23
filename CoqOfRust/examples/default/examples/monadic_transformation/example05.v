(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Foo";
    ty_params := [];
    fields := [ Ty.path "u32" ];
  } *)

Module Impl_example05_Foo.
  Definition Self : Ty.t := Ty.path "example05::Foo".
  
  (*
      fn plus1(self) -> u32 {
          self.0 + 1
      }
  *)
  Definition plus1 (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read (M.get_struct_tuple_field self "example05::Foo" 0) in
      BinOp.Panic.add α0 (Value.Integer Integer.U32 1)
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_plus1 : M.IsAssociatedFunction Self "plus1" plus1.
End Impl_example05_Foo.

(*
fn main() {
    let foo = Foo(0);
    foo.plus1();
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* foo :=
      M.alloc
        (Value.StructTuple "example05::Foo" [ Value.Integer Integer.U32 0 ]) in
    let* _ :=
      let* α0 :=
        M.get_associated_function (Ty.path "example05::Foo") "plus1" [] in
      let* α1 := M.read foo in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
