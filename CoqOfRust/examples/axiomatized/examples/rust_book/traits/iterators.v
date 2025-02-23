(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Fibonacci";
    ty_params := [];
    fields := [ ("curr", Ty.path "u32"); ("next", Ty.path "u32") ];
  } *)

Module Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci.
  Definition Self : Ty.t := Ty.path "iterators::Fibonacci".
  
  Definition Item : Ty.t := Ty.path "u32".
  
  Parameter next : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::iter::traits::iterator::Iterator"
      (* Self *) (Ty.path "iterators::Fibonacci")
      (* Trait polymorphic types *) []
      (* Instance *)
        [ ("Item", InstanceField.Ty Item); ("next", InstanceField.Method next)
        ].
End Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci.

Parameter fibonacci : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
