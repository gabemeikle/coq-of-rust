(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Foo";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "Bar";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "FooBar";
    ty_params := [];
  } *)

Module Impl_core_fmt_Debug_for_operator_overloading_FooBar.
  Definition Self : Ty.t := Ty.path "operator_overloading::FooBar".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "write_str"
          [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "FooBar") in
      M.call_closure α0 [ α1; α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "operator_overloading::FooBar")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_operator_overloading_FooBar.

(* StructTuple
  {
    name := "BarFoo";
    ty_params := [];
  } *)

Module Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
  Definition Self : Ty.t := Ty.path "operator_overloading::BarFoo".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "write_str"
          [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "BarFoo") in
      M.call_closure α0 [ α1; α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "operator_overloading::BarFoo")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_operator_overloading_BarFoo.

Module Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.
  Definition Self : Ty.t := Ty.path "operator_overloading::Foo".
  
  (*
      type Output = FooBar;
  *)
  Definition Output : Ty.t := Ty.path "operator_overloading::FooBar".
  
  (*
      fn add(self, _rhs: Bar) -> FooBar {
          println!("> Foo.add(Bar) was called");
  
          FooBar
      }
  *)
  Definition add (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; _rhs ] =>
      let* self := M.alloc self in
      let* _rhs := M.alloc _rhs in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_const"
              [] in
          let* α2 := M.read (mk_str "> Foo.add(Bar) was called
") in
          let* α3 := M.alloc (Value.Array [ α2 ]) in
          let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
          let* α5 := M.call_closure α0 [ α4 ] in
          M.alloc α5 in
        M.alloc (Value.Tuple []) in
      let* α0 :=
        M.alloc (Value.StructTuple "operator_overloading::FooBar" []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::arith::Add"
      (* Self *) (Ty.path "operator_overloading::Foo")
      (* Trait polymorphic types *)
        [ (* Rhs *) Ty.path "operator_overloading::Bar" ]
      (* Instance *)
        [ ("Output", InstanceField.Ty Output); ("add", InstanceField.Method add)
        ].
End Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.

Module Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.
  Definition Self : Ty.t := Ty.path "operator_overloading::Bar".
  
  (*
      type Output = BarFoo;
  *)
  Definition Output : Ty.t := Ty.path "operator_overloading::BarFoo".
  
  (*
      fn add(self, _rhs: Foo) -> BarFoo {
          println!("> Bar.add(Foo) was called");
  
          BarFoo
      }
  *)
  Definition add (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; _rhs ] =>
      let* self := M.alloc self in
      let* _rhs := M.alloc _rhs in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_const"
              [] in
          let* α2 := M.read (mk_str "> Bar.add(Foo) was called
") in
          let* α3 := M.alloc (Value.Array [ α2 ]) in
          let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
          let* α5 := M.call_closure α0 [ α4 ] in
          M.alloc α5 in
        M.alloc (Value.Tuple []) in
      let* α0 :=
        M.alloc (Value.StructTuple "operator_overloading::BarFoo" []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::arith::Add"
      (* Self *) (Ty.path "operator_overloading::Bar")
      (* Trait polymorphic types *)
        [ (* Rhs *) Ty.path "operator_overloading::Foo" ]
      (* Instance *)
        [ ("Output", InstanceField.Ty Output); ("add", InstanceField.Method add)
        ].
End Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.

(*
fn main() {
    println!("Foo + Bar = {:?}", Foo + Bar);
    println!("Bar + Foo = {:?}", Bar + Foo);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Foo + Bar = ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "operator_overloading::FooBar" ] in
        let* α6 :=
          M.get_trait_method
            "core::ops::arith::Add"
            (Ty.path "operator_overloading::Foo")
            [ Ty.path "operator_overloading::Bar" ]
            "add"
            [] in
        let* α7 :=
          M.call_closure
            α6
            [
              Value.StructTuple "operator_overloading::Foo" [];
              Value.StructTuple "operator_overloading::Bar" []
            ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call_closure α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Bar + Foo = ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "operator_overloading::BarFoo" ] in
        let* α6 :=
          M.get_trait_method
            "core::ops::arith::Add"
            (Ty.path "operator_overloading::Bar")
            [ Ty.path "operator_overloading::Foo" ]
            "add"
            [] in
        let* α7 :=
          M.call_closure
            α6
            [
              Value.StructTuple "operator_overloading::Bar" [];
              Value.StructTuple "operator_overloading::Foo" []
            ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call_closure α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
