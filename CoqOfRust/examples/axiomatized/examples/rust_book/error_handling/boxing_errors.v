(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom Result :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "boxing_errors::Result") [ T ]) =
    (Ty.apply
      (Ty.path "core::result::Result")
      [
        T;
        Ty.apply
          (Ty.path "alloc::boxed::Box")
          [
            Ty.dyn [ ("core::error::Error::Trait", []) ];
            Ty.path "alloc::alloc::Global"
          ]
      ]).

(* Struct
  {
    name := "EmptyVec";
    ty_params := [];
  } *)

Module Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "boxing_errors::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.

Module Impl_core_clone_Clone_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "boxing_errors::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_boxing_errors_EmptyVec.

Module Impl_core_fmt_Display_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      (* Self *) (Ty.path "boxing_errors::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Display_for_boxing_errors_EmptyVec.

Module Impl_core_error_Error_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::error::Error"
      (* Self *) (Ty.path "boxing_errors::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_error_Error_for_boxing_errors_EmptyVec.

Parameter double_first : (list Ty.t) -> (list Value.t) -> M.

Parameter print : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
