(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_constructors_return_value_AccountId.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "constructors_return_value::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_constructors_return_value_AccountId.

Module Impl_core_clone_Clone_for_constructors_return_value_AccountId.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "constructors_return_value::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_constructors_return_value_AccountId.

Module Impl_core_marker_Copy_for_constructors_return_value_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "constructors_return_value::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_constructors_return_value_AccountId.

Module Impl_core_convert_From_array_u8_for_constructors_return_value_AccountId.
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      (* Self *) (Ty.path "constructors_return_value::AccountId")
      (* Trait polymorphic types *)
        [ (* T *) Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]
      (* Instance *) [ ("from", InstanceField.Method from) ]
      (* Instance polymorphic types *) [].
End Impl_core_convert_From_array_u8_for_constructors_return_value_AccountId.

Axiom Balance :
  (Ty.path "constructors_return_value::Balance") = (Ty.path "u128").

(* Struct ConstructorsReturnValue *)

(* Enum LangError *)

Axiom ConstructorResult :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "constructors_return_value::ConstructorResult") [ T ]) =
    (Ty.apply
      (Ty.path "core::result::Result")
      [ T; Ty.path "constructors_return_value::LangError" ]).

(* Struct ConstructorError *)

Module Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "constructors_return_value::ConstructorError")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError.

(* Struct ReturnFlags *)

Module Impl_constructors_return_value_ReturnFlags.
  Definition Self : Ty.t := Ty.path "constructors_return_value::ReturnFlags".
  
  Parameter new_with_reverted : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_with_reverted :
    M.IsAssociatedFunction Self "new_with_reverted" new_with_reverted [].
End Impl_constructors_return_value_ReturnFlags.

Parameter return_value : (list Ty.t) -> (list Value.t) -> M.

Module Impl_constructors_return_value_ConstructorsReturnValue.
  Definition Self : Ty.t :=
    Ty.path "constructors_return_value::ConstructorsReturnValue".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  Parameter try_new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_try_new :
    M.IsAssociatedFunction Self "try_new" try_new [].
  
  Parameter revert_new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_revert_new :
    M.IsAssociatedFunction Self "revert_new" revert_new [].
  
  Parameter try_revert_new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_try_revert_new :
    M.IsAssociatedFunction Self "try_revert_new" try_revert_new [].
  
  Parameter get_value : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get_value :
    M.IsAssociatedFunction Self "get_value" get_value [].
End Impl_constructors_return_value_ConstructorsReturnValue.
