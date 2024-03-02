(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_with_Fruit.
Section Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_with_Fruit.
  Definition Self : Ty.t :=
    Ty.apply
      (Ty.path "unpacking_options_and_defaults_via_get_or_insert_with::Fruit")
      [].
  
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
              |
                  unpacking_options_and_defaults_via_get_or_insert_with.Fruit.Apple
                  =>
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
              |
                  unpacking_options_and_defaults_via_get_or_insert_with.Fruit.Orange
                  =>
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
              |
                  unpacking_options_and_defaults_via_get_or_insert_with.Fruit.Banana
                  =>
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
              |
                  unpacking_options_and_defaults_via_get_or_insert_with.Fruit.Kiwi
                  =>
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
              |
                  unpacking_options_and_defaults_via_get_or_insert_with.Fruit.Lemon
                  =>
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
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_with_Fruit.
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_with_Fruit.

(*
fn main() {
    let mut my_fruit: Option<Fruit> = None;
    let get_lemon_as_fallback = || {
        println!("Providing lemon as fallback");
        Fruit::Lemon
    };
    let first_available_fruit = my_fruit.get_or_insert_with(get_lemon_as_fallback);
    println!("my_fruit is: {:?}", first_available_fruit);
    println!("first_available_fruit is: {:?}", first_available_fruit);
    // Providing lemon as fallback
    // my_fruit is: Lemon
    // first_available_fruit is: Lemon

    // If the Option has a value, it is left unchanged, and the closure is not invoked
    let mut my_apple = Some(Fruit::Apple);
    let should_be_apple = my_apple.get_or_insert_with(get_lemon_as_fallback);
    println!("should_be_apple is: {:?}", should_be_apple);
    println!("my_apple is unchanged: {:?}", my_apple);
    // The output is a follows. Note that the closure `get_lemon_as_fallback` is not invoked
    // should_be_apple is: Apple
    // my_apple is unchanged: Some(Apple)
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* my_fruit := M.alloc core.option.Option.None in
    let* get_lemon_as_fallback :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* _ :=
                    let* α0 := M.read (mk_str "Providing lemon as fallback
") in
                    let* α1 := M.alloc [ α0 ] in
                    let* α2 :=
                      M.call
                        ((Ty.apply
                              (Ty.path "core::fmt::Arguments")
                              [])::["new_const"]
                          (pointer_coercion "Unsize" (borrow α1))) in
                    let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                    M.alloc α3 in
                  M.alloc tt in
                let* α0 :=
                  M.alloc
                    unpacking_options_and_defaults_via_get_or_insert_with.Fruit.Lemon in
                M.read α0) :
                Ty.apply
                  (Ty.path
                    "unpacking_options_and_defaults_via_get_or_insert_with::Fruit")
                  []
            ]) :
          Ty.apply
            (Ty.path
              "unpacking_options_and_defaults_via_get_or_insert_with::Fruit")
            []) in
    let* first_available_fruit :=
      let* α0 := M.read get_lemon_as_fallback in
      let* α1 :=
        M.call
          ((Ty.apply
                (Ty.path "core::option::Option")
                [Ty.apply
                    (Ty.path
                      "unpacking_options_and_defaults_via_get_or_insert_with::Fruit")
                    []])::["get_or_insert_with"]
            (borrow_mut my_fruit)
            α0) in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "my_fruit is: ") in
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
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "first_available_fruit is: ") in
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
    let* my_apple :=
      M.alloc
        (core.option.Option.Some
          unpacking_options_and_defaults_via_get_or_insert_with.Fruit.Apple) in
    let* should_be_apple :=
      let* α0 := M.read get_lemon_as_fallback in
      let* α1 :=
        M.call
          ((Ty.apply
                (Ty.path "core::option::Option")
                [Ty.apply
                    (Ty.path
                      "unpacking_options_and_defaults_via_get_or_insert_with::Fruit")
                    []])::["get_or_insert_with"]
            (borrow_mut my_apple)
            α0) in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "should_be_apple is: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow should_be_apple)) in
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
        let* α0 := M.read (mk_str "my_apple is unchanged: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_debug"]
              (borrow my_apple)) in
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
