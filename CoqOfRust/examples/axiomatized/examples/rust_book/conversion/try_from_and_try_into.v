(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "EvenNumber";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

Module Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.
  Definition Self : Ty.t := Ty.path "try_from_and_try_into::EvenNumber".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.

Module Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.
  Definition Self : Ty.t := Ty.path "try_from_and_try_into::EvenNumber".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.
  Definition Self : Ty.t := Ty.path "try_from_and_try_into::EvenNumber".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_convert_TryFrom_i32_for_try_from_and_try_into_EvenNumber.
  Definition Self : Ty.t := Ty.path "try_from_and_try_into::EvenNumber".
  
  Definition Error : Ty.t := Ty.tuple [].
  
  Parameter try_from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::TryFrom"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      (* Trait polymorphic types *) [ (* T *) Ty.path "i32" ]
      (* Instance *)
        [
          ("Error", InstanceField.Ty Error);
          ("try_from", InstanceField.Method try_from)
        ].
End Impl_core_convert_TryFrom_i32_for_try_from_and_try_into_EvenNumber.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
