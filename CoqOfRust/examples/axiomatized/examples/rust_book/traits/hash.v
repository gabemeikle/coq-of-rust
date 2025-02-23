(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Person";
    ty_params := [];
    fields :=
      [
        ("id", Ty.path "u32");
        ("name", Ty.path "alloc::string::String");
        ("phone", Ty.path "u64")
      ];
  } *)

Module Impl_core_hash_Hash_for_hash_Person.
  Definition Self : Ty.t := Ty.path "hash::Person".
  
  Parameter hash : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::hash::Hash"
      (* Self *) (Ty.path "hash::Person")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("hash", InstanceField.Method hash) ].
End Impl_core_hash_Hash_for_hash_Person.

Parameter calculate_hash : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
