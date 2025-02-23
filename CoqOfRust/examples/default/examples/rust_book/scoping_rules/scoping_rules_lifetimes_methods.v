(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Owner";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

Module Impl_scoping_rules_lifetimes_methods_Owner.
  Definition Self : Ty.t := Ty.path "scoping_rules_lifetimes_methods::Owner".
  
  (*
      fn add_one<'a>(&'a mut self) {
          self.0 += 1;
      }
  *)
  Definition add_one (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* β :=
          let* α0 := M.read self in
          M.pure
            (M.get_struct_tuple_field
              α0
              "scoping_rules_lifetimes_methods::Owner"
              0) in
        let* α0 := M.read β in
        let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.I32 1) in
        M.assign β α1 in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_add_one :
    M.IsAssociatedFunction Self "add_one" add_one.
  
  (*
      fn print<'a>(&'a self) {
          println!("`print`: {}", self.0);
      }
  *)
  Definition print (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1"
              [] in
          let* α2 := M.read (mk_str "`print`: ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display"
              [ Ty.path "i32" ] in
          let* α6 := M.read self in
          let* α7 :=
            M.call_closure
              α5
              [
                M.get_struct_tuple_field
                  α6
                  "scoping_rules_lifetimes_methods::Owner"
                  0
              ] in
          let* α8 := M.alloc (Value.Array [ α7 ]) in
          let* α9 :=
            M.call_closure
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α8
              ] in
          let* α10 := M.call_closure α0 [ α9 ] in
          M.alloc α10 in
        M.alloc (Value.Tuple []) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_print : M.IsAssociatedFunction Self "print" print.
End Impl_scoping_rules_lifetimes_methods_Owner.

(*
fn main() {
    let mut owner = Owner(18);

    owner.add_one();
    owner.print();
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* owner :=
      M.alloc
        (Value.StructTuple
          "scoping_rules_lifetimes_methods::Owner"
          [ Value.Integer Integer.I32 18 ]) in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "scoping_rules_lifetimes_methods::Owner")
          "add_one"
          [] in
      let* α1 := M.call_closure α0 [ owner ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "scoping_rules_lifetimes_methods::Owner")
          "print"
          [] in
      let* α1 := M.call_closure α0 [ owner ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
