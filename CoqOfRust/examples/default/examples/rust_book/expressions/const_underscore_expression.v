(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Foo";
    ty_params := [];
    fields := [ ("test", Ty.path "bool") ];
  } *)

(* StructRecord
  {
    name := "Bar";
    ty_params := [];
    fields := [ ("test", Ty.path "alloc::string::String") ];
  } *)

(* Trait *)
Module BarTrait.
  
End BarTrait.

Module Impl_const_underscore_expression_BarTrait_for_const_underscore_expression_Bar.
  Definition Self : Ty.t := Ty.path "const_underscore_expression::Bar".
  
  (*
          fn show(self: Self) -> String {
              self.test
          }
  *)
  Definition show (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      M.read
        (M.get_struct_record_field
          self
          "const_underscore_expression::Bar"
          "test")
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "const_underscore_expression::BarTrait"
      (* Self *) (Ty.path "const_underscore_expression::Bar")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("show", InstanceField.Method show) ].
End Impl_const_underscore_expression_BarTrait_for_const_underscore_expression_Bar.
