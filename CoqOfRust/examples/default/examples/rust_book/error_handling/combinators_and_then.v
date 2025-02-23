(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Food *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "CordonBleu";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Steak";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Sushi";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_combinators_and_then_Food.
  Definition Self : Ty.t := Ty.path "combinators_and_then::Food".
  
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
              let* α0 := M.read (mk_str "CordonBleu") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Steak") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Sushi") in
              M.alloc α0
          ] in
      let* α3 := M.read α2 in
      M.call_closure α0 [ α1; α3 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_and_then::Food")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_and_then_Food.

(* Enum Day *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Monday";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Tuesday";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Wednesday";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_combinators_and_then_Day.
  Definition Self : Ty.t := Ty.path "combinators_and_then::Day".
  
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
              let* α0 := M.read (mk_str "Monday") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Tuesday") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Wednesday") in
              M.alloc α0
          ] in
      let* α3 := M.read α2 in
      M.call_closure α0 [ α1; α3 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_and_then::Day")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_and_then_Day.

(*
fn have_ingredients(food: Food) -> Option<Food> {
    match food {
        Food::Sushi => None,
        _ => Some(food),
    }
}
*)
Definition have_ingredients (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ food ] =>
    let* food := M.alloc food in
    let* α0 :=
      match_operator
        food
        [
          fun γ => M.alloc (Value.StructTuple "core::option::Option::None" []);
          fun γ =>
            let* α0 := M.read food in
            M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn have_recipe(food: Food) -> Option<Food> {
    match food {
        Food::CordonBleu => None,
        _ => Some(food),
    }
}
*)
Definition have_recipe (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ food ] =>
    let* food := M.alloc food in
    let* α0 :=
      match_operator
        food
        [
          fun γ => M.alloc (Value.StructTuple "core::option::Option::None" []);
          fun γ =>
            let* α0 := M.read food in
            M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn cookable_v1(food: Food) -> Option<Food> {
    match have_recipe(food) {
        None => None,
        Some(food) => match have_ingredients(food) {
            None => None,
            Some(food) => Some(food),
        },
    }
}
*)
Definition cookable_v1 (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ food ] =>
    let* food := M.alloc food in
    let* α0 := M.get_function "combinators_and_then::have_recipe" [] in
    let* α1 := M.read food in
    let* α2 := M.call_closure α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      match_operator
        α3
        [
          fun γ => M.alloc (Value.StructTuple "core::option::Option::None" []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* food := M.copy γ0_0 in
            let* α0 :=
              M.get_function "combinators_and_then::have_ingredients" [] in
            let* α1 := M.read food in
            let* α2 := M.call_closure α0 [ α1 ] in
            let* α3 := M.alloc α2 in
            match_operator
              α3
              [
                fun γ =>
                  M.alloc (Value.StructTuple "core::option::Option::None" []);
                fun γ =>
                  let* γ0_0 :=
                    M.get_struct_tuple_field_or_break_match
                      γ
                      "core::option::Option::Some"
                      0 in
                  let* food := M.copy γ0_0 in
                  let* α0 := M.read food in
                  M.alloc
                    (Value.StructTuple "core::option::Option::Some" [ α0 ])
              ]
        ] in
    M.read α4
  | _, _ => M.impossible
  end.

(*
fn cookable_v2(food: Food) -> Option<Food> {
    have_recipe(food).and_then(have_ingredients)
}
*)
Definition cookable_v2 (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ food ] =>
    let* food := M.alloc food in
    let* α0 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::option::Option")
          [ Ty.path "combinators_and_then::Food" ])
        "and_then"
        [
          Ty.path "combinators_and_then::Food";
          Ty.function
            [ Ty.path "combinators_and_then::Food" ]
            (Ty.apply
              (Ty.path "core::option::Option")
              [ Ty.path "combinators_and_then::Food" ])
        ] in
    let* α1 := M.get_function "combinators_and_then::have_recipe" [] in
    let* α2 := M.read food in
    let* α3 := M.call_closure α1 [ α2 ] in
    let* α4 := M.get_function "combinators_and_then::have_ingredients" [] in
    M.call_closure α0 [ α3; α4 ]
  | _, _ => M.impossible
  end.

(*
fn eat(food: Food, day: Day) {
    match cookable_v2(food) {
        Some(food) => println!("Yay! On {:?} we get to eat {:?}.", day, food),
        None => println!("Oh no. We don't get to eat on {:?}?", day),
    }
}
*)
Definition eat (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ food; day ] =>
    let* food := M.alloc food in
    let* day := M.alloc day in
    let* α0 := M.get_function "combinators_and_then::cookable_v2" [] in
    let* α1 := M.read food in
    let* α2 := M.call_closure α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      match_operator
        α3
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* food := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "Yay! On ") in
              let* α3 := M.read (mk_str " we get to eat ") in
              let* α4 := M.read (mk_str ".
") in
              let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
              let* α6 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_debug"
                  [ Ty.path "combinators_and_then::Day" ] in
              let* α7 := M.call_closure α6 [ day ] in
              let* α8 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_debug"
                  [ Ty.path "combinators_and_then::Food" ] in
              let* α9 := M.call_closure α8 [ food ] in
              let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
              let* α11 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α5;
                    M.pointer_coercion (* Unsize *) α10
                  ] in
              let* α12 := M.call_closure α0 [ α11 ] in
              M.alloc α12 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "Oh no. We don't get to eat on ") in
              let* α3 := M.read (mk_str "?
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_debug"
                  [ Ty.path "combinators_and_then::Day" ] in
              let* α6 := M.call_closure α5 [ day ] in
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
            M.alloc (Value.Tuple [])
        ] in
    M.read α4
  | _, _ => M.impossible
  end.

(*
fn main() {
    let (cordon_bleu, steak, sushi) = (Food::CordonBleu, Food::Steak, Food::Sushi);

    eat(cordon_bleu, Day::Monday);
    eat(steak, Day::Tuesday);
    eat(sushi, Day::Wednesday);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 :=
      M.alloc
        (Value.Tuple
          [
            Value.StructTuple "combinators_and_then::Food::CordonBleu" [];
            Value.StructTuple "combinators_and_then::Food::Steak" [];
            Value.StructTuple "combinators_and_then::Food::Sushi" []
          ]) in
    let* α1 :=
      match_operator
        α0
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let γ0_2 := M.get_tuple_field γ 2 in
            let* cordon_bleu := M.copy γ0_0 in
            let* steak := M.copy γ0_1 in
            let* sushi := M.copy γ0_2 in
            let* _ :=
              let* α0 := M.get_function "combinators_and_then::eat" [] in
              let* α1 := M.read cordon_bleu in
              let* α2 :=
                M.call_closure
                  α0
                  [ α1; Value.StructTuple "combinators_and_then::Day::Monday" []
                  ] in
              M.alloc α2 in
            let* _ :=
              let* α0 := M.get_function "combinators_and_then::eat" [] in
              let* α1 := M.read steak in
              let* α2 :=
                M.call_closure
                  α0
                  [
                    α1;
                    Value.StructTuple "combinators_and_then::Day::Tuesday" []
                  ] in
              M.alloc α2 in
            let* _ :=
              let* α0 := M.get_function "combinators_and_then::eat" [] in
              let* α1 := M.read sushi in
              let* α2 :=
                M.call_closure
                  α0
                  [
                    α1;
                    Value.StructTuple "combinators_and_then::Day::Wednesday" []
                  ] in
              M.alloc α2 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α1
  | _, _ => M.impossible
  end.
