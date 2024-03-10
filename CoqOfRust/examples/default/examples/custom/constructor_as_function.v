(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Constructor *)

Module Impl_core_fmt_Debug_for_constructor_as_function_Constructor.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_tuple_field1_finish" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Constructor") in
      let* α3 := M.read self in
      let* α4 := M.alloc (M.get_struct_tuple α3 0) in
      M.call α0 [ α1; α2; M.pointer_coercion (* Unsize *) α4 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "constructor_as_function::Constructor")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_constructor_as_function_Constructor.

(*
fn main() {
    let v: Vec<_> = vec![1, 2, 3].into_iter().map(Constructor).collect();

    println!("{v:?}");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* v :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          "collect"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::iter::adapters::map::Map")
                [
                  Ty.apply
                    (Ty.path "alloc::vec::into_iter::IntoIter")
                    [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
                  Ty.function
                    [ Ty.path "i32" ]
                    (Ty.path "constructor_as_function::Constructor")
                ];
            (* B *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.path "constructor_as_function::Constructor";
                  Ty.path "alloc::alloc::Global"
                ]
          ] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          "map"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::into_iter::IntoIter")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
            (* B *) Ty.path "constructor_as_function::Constructor";
            (* F *)
              Ty.function
                [ Ty.path "i32" ]
                (Ty.path "constructor_as_function::Constructor")
          ] in
      let* α2 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α3 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec" in
      let* α4 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply (Ty.path "array") [ Ty.path "i32" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new" in
      let* α5 :=
        M.alloc
          (Value.Array
            [
              Value.Integer Integer.I32 1;
              Value.Integer Integer.I32 2;
              Value.Integer Integer.I32 3
            ]) in
      let* α6 := M.call α4 [ α5 ] in
      let* α7 := M.read α6 in
      let* α8 := M.call α3 [ M.pointer_coercion (* Unsize *) α7 ] in
      let* α9 := M.call α2 [ α8 ] in
      let* α10 :=
        M.call
          α1
          [ α9; fun α => M.pure (constructor_as_function.Constructor.Build_t α)
          ] in
      let* α11 := M.call α0 [ α10 ] in
      M.alloc α11 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ v ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
