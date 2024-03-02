(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit.
Section Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit.
  Definition Self : Ty.t :=
    Ty.apply (Ty.path "unpacking_options_and_defaults_via_or::Fruit") [].
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 :=
        match_operator
          self
          [
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | unpacking_options_and_defaults_via_or.Fruit.Apple =>
                let* α0 := M.read (mk_str "Apple") in
                M.alloc α0
              | _ => M.break_match
              end) :
              Ty.apply (Ty.path "ref") [Ty.path "str"];
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | unpacking_options_and_defaults_via_or.Fruit.Orange =>
                let* α0 := M.read (mk_str "Orange") in
                M.alloc α0
              | _ => M.break_match
              end) :
              Ty.apply (Ty.path "ref") [Ty.path "str"];
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | unpacking_options_and_defaults_via_or.Fruit.Banana =>
                let* α0 := M.read (mk_str "Banana") in
                M.alloc α0
              | _ => M.break_match
              end) :
              Ty.apply (Ty.path "ref") [Ty.path "str"];
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | unpacking_options_and_defaults_via_or.Fruit.Kiwi =>
                let* α0 := M.read (mk_str "Kiwi") in
                M.alloc α0
              | _ => M.break_match
              end) :
              Ty.apply (Ty.path "ref") [Ty.path "str"];
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | unpacking_options_and_defaults_via_or.Fruit.Lemon =>
                let* α0 := M.read (mk_str "Lemon") in
                M.alloc α0
              | _ => M.break_match
              end) :
              Ty.apply (Ty.path "ref") [Ty.path "str"]
          ] in
      let* α2 := M.read α1 in
      M.call
        ((Ty.apply (Ty.path "core::fmt::Formatter") [])::["write_str"] α0 α2)
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_fmt : Instance.t := {
    Notations.double_colon := fmt;
  }.
  
  Definition ℐ : Instance.t := [("fmt", fmt)].
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit.
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit.

(*
fn main() {
    let apple = Some(Fruit::Apple);
    let orange = Some(Fruit::Orange);
    let no_fruit: Option<Fruit> = None;

    let first_available_fruit = no_fruit.or(orange).or(apple);
    println!("first_available_fruit: {:?}", first_available_fruit);
    // first_available_fruit: Some(Orange)

    // `or` moves its argument.
    // In the example above, `or(orange)` returned a `Some`, so `or(apple)` was not invoked.
    // But the variable named `apple` has been moved regardless, and cannot be used anymore.
    // println!("Variable apple was moved, so this line won't compile: {:?}", apple);
    // TODO: uncomment the line above to see the compiler error
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* apple :=
      M.alloc
        (core.option.Option.Some
          unpacking_options_and_defaults_via_or.Fruit.Apple) in
    let* orange :=
      M.alloc
        (core.option.Option.Some
          unpacking_options_and_defaults_via_or.Fruit.Orange) in
    let* no_fruit := M.alloc core.option.Option.None in
    let* first_available_fruit :=
      let* α0 := M.read no_fruit in
      let* α1 := M.read orange in
      let* α2 :=
        M.call
          ((Ty.apply
                (Ty.path "core::option::Option")
                [Ty.apply
                    (Ty.path "unpacking_options_and_defaults_via_or::Fruit")
                    []])::["or"]
            α0
            α1) in
      let* α3 := M.read apple in
      let* α4 :=
        M.call
          ((Ty.apply
                (Ty.path "core::option::Option")
                [Ty.apply
                    (Ty.path "unpacking_options_and_defaults_via_or::Fruit")
                    []])::["or"]
            α2
            α3) in
      M.alloc α4 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "first_available_fruit: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow first_available_fruit)) in
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
