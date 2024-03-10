(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Food *)

Module Impl_core_fmt_Debug_for_combinators_and_then_Food.
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
          "write_str" in
      let* α1 := M.read f in
      let* α2 :=
        match_operator
          self
          (Value.Array
            [
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                | combinators_and_then.Food.CordonBleu =>
                  let* α0 := M.read (mk_str "CordonBleu") in
                  M.alloc α0
                | _ => M.break_match
                end);
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                | combinators_and_then.Food.Steak =>
                  let* α0 := M.read (mk_str "Steak") in
                  M.alloc α0
                | _ => M.break_match
                end);
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                | combinators_and_then.Food.Sushi =>
                  let* α0 := M.read (mk_str "Sushi") in
                  M.alloc α0
                | _ => M.break_match
                end)
            ]) in
      let* α3 := M.read α2 in
      M.call α0 [ α1; α3 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_and_then::Food")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_combinators_and_then_Food.

(* Enum Day *)

Module Impl_core_fmt_Debug_for_combinators_and_then_Day.
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
          "write_str" in
      let* α1 := M.read f in
      let* α2 :=
        match_operator
          self
          (Value.Array
            [
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                | combinators_and_then.Day.Monday =>
                  let* α0 := M.read (mk_str "Monday") in
                  M.alloc α0
                | _ => M.break_match
                end);
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                | combinators_and_then.Day.Tuesday =>
                  let* α0 := M.read (mk_str "Tuesday") in
                  M.alloc α0
                | _ => M.break_match
                end);
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                | combinators_and_then.Day.Wednesday =>
                  let* α0 := M.read (mk_str "Wednesday") in
                  M.alloc α0
                | _ => M.break_match
                end)
            ]) in
      let* α3 := M.read α2 in
      M.call α0 [ α1; α3 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_and_then::Day")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
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
        (Value.Array
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | combinators_and_then.Food.Sushi =>
                M.alloc (Value.StructTuple "core::option::Option::None" [])
              | _ => M.break_match
              end);
            fun γ =>
              (let* α0 := M.read food in
              M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ]))
          ]) in
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
        (Value.Array
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | combinators_and_then.Food.CordonBleu =>
                M.alloc (Value.StructTuple "core::option::Option::None" [])
              | _ => M.break_match
              end);
            fun γ =>
              (let* α0 := M.read food in
              M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ]))
          ]) in
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
    let* α2 := M.call α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      match_operator
        α3
        (Value.Array
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.option.Option.None =>
                M.alloc (Value.StructTuple "core::option::Option::None" [])
              | _ => M.break_match
              end);
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.option.Option.Some _ =>
                let* γ0_0 :=
                  let* α0 := M.var "core::option::Option::Get_Some_0" in
                  M.pure (α0 γ) in
                let* food := M.copy γ0_0 in
                let* α0 :=
                  M.get_function "combinators_and_then::have_ingredients" [] in
                let* α1 := M.read food in
                let* α2 := M.call α0 [ α1 ] in
                let* α3 := M.alloc α2 in
                match_operator
                  α3
                  (Value.Array
                    [
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.None =>
                          M.alloc
                            (Value.StructTuple "core::option::Option::None" [])
                        | _ => M.break_match
                        end);
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.Some _ =>
                          let* γ0_0 :=
                            let* α0 :=
                              M.var "core::option::Option::Get_Some_0" in
                            M.pure (α0 γ) in
                          let* food := M.copy γ0_0 in
                          let* α0 := M.read food in
                          M.alloc
                            (Value.StructTuple
                              "core::option::Option::Some"
                              [ α0 ])
                        | _ => M.break_match
                        end)
                    ])
              | _ => M.break_match
              end)
          ]) in
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
        "and_then" in
    let* α1 := M.get_function "combinators_and_then::have_recipe" [] in
    let* α2 := M.read food in
    let* α3 := M.call α1 [ α2 ] in
    let* α4 := M.get_function "combinators_and_then::have_ingredients" [] in
    M.call α0 [ α3; α4 ]
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
    let* α2 := M.call α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      match_operator
        α3
        (Value.Array
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.option.Option.Some _ =>
                let* γ0_0 :=
                  let* α0 := M.var "core::option::Option::Get_Some_0" in
                  M.pure (α0 γ) in
                let* food := M.copy γ0_0 in
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" [] in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_v1" in
                  let* α2 := M.read (mk_str "Yay! On ") in
                  let* α3 := M.read (mk_str " we get to eat ") in
                  let* α4 := M.read (mk_str ".
") in
                  let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug" in
                  let* α7 := M.call α6 [ day ] in
                  let* α8 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug" in
                  let* α9 := M.call α8 [ food ] in
                  let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
                  let* α11 :=
                    M.call
                      α1
                      [
                        M.pointer_coercion (* Unsize *) α5;
                        M.pointer_coercion (* Unsize *) α10
                      ] in
                  let* α12 := M.call α0 [ α11 ] in
                  M.alloc α12 in
                M.alloc (Value.Tuple [])
              | _ => M.break_match
              end);
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.option.Option.None =>
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" [] in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_v1" in
                  let* α2 := M.read (mk_str "Oh no. We don't get to eat on ") in
                  let* α3 := M.read (mk_str "?
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                  let* α5 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug" in
                  let* α6 := M.call α5 [ day ] in
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
                M.alloc (Value.Tuple [])
              | _ => M.break_match
              end)
          ]) in
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
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
        (Value.Array
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | (_, _, _) =>
                let γ0_0 := Tuple.Access.left (Tuple.Access.left γ) in
                let γ0_1 := Tuple.Access.right (Tuple.Access.left γ) in
                let γ0_2 := Tuple.Access.right γ in
                let* cordon_bleu := M.copy γ0_0 in
                let* steak := M.copy γ0_1 in
                let* sushi := M.copy γ0_2 in
                let* _ :=
                  let* α0 := M.get_function "combinators_and_then::eat" [] in
                  let* α1 := M.read cordon_bleu in
                  let* α2 :=
                    M.call
                      α0
                      [
                        α1;
                        Value.StructTuple "combinators_and_then::Day::Monday" []
                      ] in
                  M.alloc α2 in
                let* _ :=
                  let* α0 := M.get_function "combinators_and_then::eat" [] in
                  let* α1 := M.read steak in
                  let* α2 :=
                    M.call
                      α0
                      [
                        α1;
                        Value.StructTuple
                          "combinators_and_then::Day::Tuesday"
                          []
                      ] in
                  M.alloc α2 in
                let* _ :=
                  let* α0 := M.get_function "combinators_and_then::eat" [] in
                  let* α1 := M.read sushi in
                  let* α2 :=
                    M.call
                      α0
                      [
                        α1;
                        Value.StructTuple
                          "combinators_and_then::Day::Wednesday"
                          []
                      ] in
                  M.alloc α2 in
                M.alloc (Value.Tuple [])
              end)
          ]) in
    M.read α1
  | _, _ => M.impossible
  end.
