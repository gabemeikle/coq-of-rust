(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.







Module  Impl_core_fmt_Debug_for_operator_overloading_FooBar.
Section Impl_core_fmt_Debug_for_operator_overloading_FooBar.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "operator_overloading::FooBar") [].
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "FooBar") in
      M.call
        ((Ty.apply (Ty.path "core::fmt::Formatter") [])::["write_str"] α0 α1)
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_fmt : Instance.t := {
    Notations.double_colon := fmt;
  }.
  
  Definition ℐ : Instance.t := [("fmt", fmt)].
End Impl_core_fmt_Debug_for_operator_overloading_FooBar.
End Impl_core_fmt_Debug_for_operator_overloading_FooBar.



Module  Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
Section Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "operator_overloading::BarFoo") [].
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "BarFoo") in
      M.call
        ((Ty.apply (Ty.path "core::fmt::Formatter") [])::["write_str"] α0 α1)
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_fmt : Instance.t := {
    Notations.double_colon := fmt;
  }.
  
  Definition ℐ : Instance.t := [("fmt", fmt)].
End Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
End Impl_core_fmt_Debug_for_operator_overloading_BarFoo.

Module  Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.
Section Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.
  Definition Self : Ty.t := Ty.apply (Ty.path "operator_overloading::Foo") [].
  
  (*
      type Output = FooBar;
  *)
  Definition Output : Set :=
    Ty.apply (Ty.path "operator_overloading::FooBar") [].
  
  (*
      fn add(self, _rhs: Bar) -> FooBar {
          println!("> Foo.add(Bar) was called");
  
          FooBar
      }
  *)
  Definition add (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _rhs] =>
      let* self := M.alloc self in
      let* _rhs := M.alloc _rhs in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "> Foo.add(Bar) was called
") in
          let* α1 := M.alloc [ α0 ] in
          let* α2 :=
            M.call
              ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
                (pointer_coercion "Unsize" (borrow α1))) in
          let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
          M.alloc α3 in
        M.alloc tt in
      let* α0 := M.alloc operator_overloading.FooBar.Build in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_add : Instance.t := {
    Notations.double_colon := add;
  }.
  
  Definition ℐ : Instance.t := [("Output", Output); ("add", add)].
End Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.
End Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.

Module  Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.
Section Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.
  Definition Self : Ty.t := Ty.apply (Ty.path "operator_overloading::Bar") [].
  
  (*
      type Output = BarFoo;
  *)
  Definition Output : Set :=
    Ty.apply (Ty.path "operator_overloading::BarFoo") [].
  
  (*
      fn add(self, _rhs: Foo) -> BarFoo {
          println!("> Bar.add(Foo) was called");
  
          BarFoo
      }
  *)
  Definition add (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _rhs] =>
      let* self := M.alloc self in
      let* _rhs := M.alloc _rhs in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "> Bar.add(Foo) was called
") in
          let* α1 := M.alloc [ α0 ] in
          let* α2 :=
            M.call
              ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
                (pointer_coercion "Unsize" (borrow α1))) in
          let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
          M.alloc α3 in
        M.alloc tt in
      let* α0 := M.alloc operator_overloading.BarFoo.Build in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_add : Instance.t := {
    Notations.double_colon := add;
  }.
  
  Definition ℐ : Instance.t := [("Output", Output); ("add", add)].
End Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.
End Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.

(*
fn main() {
    println!("Foo + Bar = {:?}", Foo + Bar);
    println!("Bar + Foo = {:?}", Bar + Foo);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "Foo + Bar = ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          ltac:(M.get_method (fun ℐ =>
            core.ops.arith.Add.add
              (Self := Ty.apply (Ty.path "operator_overloading::Foo") [])
              (Rhs := Ty.apply (Ty.path "operator_overloading::Bar") [])
              (Trait := ℐ))) in
        let* α4 :=
          M.call
            (α3
              operator_overloading.Foo.Build
              operator_overloading.Bar.Build) in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow α5)) in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α7))) in
        let* α9 := M.call ((M.var "std::io::stdio::_print") α8) in
        M.alloc α9 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "Bar + Foo = ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          ltac:(M.get_method (fun ℐ =>
            core.ops.arith.Add.add
              (Self := Ty.apply (Ty.path "operator_overloading::Bar") [])
              (Rhs := Ty.apply (Ty.path "operator_overloading::Foo") [])
              (Trait := ℐ))) in
        let* α4 :=
          M.call
            (α3
              operator_overloading.Bar.Build
              operator_overloading.Foo.Build) in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow α5)) in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α7))) in
        let* α9 := M.call ((M.var "std::io::stdio::_print") α8) in
        M.alloc α9 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
