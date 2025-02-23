(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Fruit *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Apple";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Orange";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Banana";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Kiwi";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Lemon";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit.
  Definition Self : Ty.t :=
    Ty.path "unpacking_options_and_defaults_via_or::Fruit".
  
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
      let* α2 :=
        match_operator
          self
          [
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Apple") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Orange") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Banana") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Kiwi") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Lemon") in
              M.alloc α0
          ] in
      let* α3 := M.read α2 in
      M.call_closure α0 [ α1; α3 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "unpacking_options_and_defaults_via_or::Fruit")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* apple :=
      M.alloc
        (Value.StructTuple
          "core::option::Option::Some"
          [
            Value.StructTuple
              "unpacking_options_and_defaults_via_or::Fruit::Apple"
              []
          ]) in
    let* orange :=
      M.alloc
        (Value.StructTuple
          "core::option::Option::Some"
          [
            Value.StructTuple
              "unpacking_options_and_defaults_via_or::Fruit::Orange"
              []
          ]) in
    let* no_fruit :=
      M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* first_available_fruit :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_and_defaults_via_or::Fruit" ])
          "or"
          [] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_and_defaults_via_or::Fruit" ])
          "or"
          [] in
      let* α2 := M.read no_fruit in
      let* α3 := M.read orange in
      let* α4 := M.call_closure α1 [ α2; α3 ] in
      let* α5 := M.read apple in
      let* α6 := M.call_closure α0 [ α4; α5 ] in
      M.alloc α6 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "first_available_fruit: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [
              Ty.apply
                (Ty.path "core::option::Option")
                [ Ty.path "unpacking_options_and_defaults_via_or::Fruit" ]
            ] in
        let* α6 := M.call_closure α5 [ first_available_fruit ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
