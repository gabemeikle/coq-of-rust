(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "scoping_rules_lifetimes_structs::Borrowed") [].
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "Borrowed") in
      let* α2 := M.read self in
      let* α3 :=
        M.alloc
          (borrow
            ((M.var "scoping_rules_lifetimes_structs::Borrowed::Get_0")
              (deref α2))) in
      M.call
        ((Ty.apply
              (Ty.path "core::fmt::Formatter")
              [])::["debug_tuple_field1_finish"]
          α0
          α1
          (pointer_coercion "Unsize" (borrow α3)))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_fmt : Instance.t := {
    Notations.double_colon := fmt;
  }.
  
  Definition ℐ : Instance.t := [("fmt", fmt)].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.



Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "scoping_rules_lifetimes_structs::NamedBorrowed") [].
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "NamedBorrowed") in
      let* α2 := M.read (mk_str "x") in
      let* α3 := M.read self in
      let* α4 := M.read (mk_str "y") in
      let* α5 := M.read self in
      let* α6 :=
        M.alloc
          (borrow
            ((M.var "scoping_rules_lifetimes_structs::NamedBorrowed::Get_y")
              (deref α5))) in
      M.call
        ((Ty.apply
              (Ty.path "core::fmt::Formatter")
              [])::["debug_struct_field2_finish"]
          α0
          α1
          α2
          (pointer_coercion
            "Unsize"
            (borrow
              ((M.var "scoping_rules_lifetimes_structs::NamedBorrowed::Get_x")
                (deref α3))))
          α4
          (pointer_coercion "Unsize" (borrow α6)))
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_fmt : Instance.t := {
    Notations.double_colon := fmt;
  }.
  
  Definition ℐ : Instance.t := [("fmt", fmt)].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.



Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "scoping_rules_lifetimes_structs::Either") [].
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        match_operator
          self
          [
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | scoping_rules_lifetimes_structs.Either.Num _ =>
                let γ1_0 :=
                  (M.var "scoping_rules_lifetimes_structs::Either::Get_Num_0")
                    γ in
                let* __self_0 := M.alloc (borrow γ1_0) in
                let* α0 := M.read f in
                let* α1 := M.read (mk_str "Num") in
                let* α2 :=
                  M.call
                    ((Ty.apply
                          (Ty.path "core::fmt::Formatter")
                          [])::["debug_tuple_field1_finish"]
                      α0
                      α1
                      (pointer_coercion "Unsize" (borrow __self_0))) in
                M.alloc α2
              | _ => M.break_match
              end) :
              Ty.apply
                (Ty.path "core::result::Result")
                [Ty.tuple; Ty.apply (Ty.path "core::fmt::Error") []];
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | scoping_rules_lifetimes_structs.Either.Ref _ =>
                let γ1_0 :=
                  (M.var "scoping_rules_lifetimes_structs::Either::Get_Ref_0")
                    γ in
                let* __self_0 := M.alloc (borrow γ1_0) in
                let* α0 := M.read f in
                let* α1 := M.read (mk_str "Ref") in
                let* α2 :=
                  M.call
                    ((Ty.apply
                          (Ty.path "core::fmt::Formatter")
                          [])::["debug_tuple_field1_finish"]
                      α0
                      α1
                      (pointer_coercion "Unsize" (borrow __self_0))) in
                M.alloc α2
              | _ => M.break_match
              end) :
              Ty.apply
                (Ty.path "core::result::Result")
                [Ty.tuple; Ty.apply (Ty.path "core::fmt::Error") []]
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_fmt : Instance.t := {
    Notations.double_colon := fmt;
  }.
  
  Definition ℐ : Instance.t := [("fmt", fmt)].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.

(*
fn main() {
    let x = 18;
    let y = 15;

    let single = Borrowed(&x);
    let double = NamedBorrowed { x: &x, y: &y };
    let reference = Either::Ref(&x);
    let number = Either::Num(y);

    println!("x is borrowed in {:?}", single);
    println!("x and y are borrowed in {:?}", double);
    println!("x is borrowed in {:?}", reference);
    println!("y is *not* borrowed in {:?}", number);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x := M.alloc ((Integer.of_Z 18) : Ty.path "i32") in
    let* y := M.alloc ((Integer.of_Z 15) : Ty.path "i32") in
    let* single :=
      M.alloc (scoping_rules_lifetimes_structs.Borrowed.Build_t (borrow x)) in
    let* double :=
      M.alloc
        {|
          scoping_rules_lifetimes_structs.NamedBorrowed.x := borrow x;
          scoping_rules_lifetimes_structs.NamedBorrowed.y := borrow y;
        |} in
    let* reference :=
      M.alloc (scoping_rules_lifetimes_structs.Either.Ref (borrow x)) in
    let* number :=
      let* α0 := M.read y in
      M.alloc (scoping_rules_lifetimes_structs.Either.Num α0) in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "x is borrowed in ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow single)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "x and y are borrowed in ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow double)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "x is borrowed in ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow reference)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "y is *not* borrowed in ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow number)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
