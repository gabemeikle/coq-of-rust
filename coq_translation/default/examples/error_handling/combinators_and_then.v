(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Food.
  Inductive t `{ℋ : State.Trait} : Set :=
  | CordonBleu
  | Steak
  | Sushi.
End Food.
Definition Food `{ℋ : State.Trait} : Set := Food.t.

Module Impl_core_fmt_Debug_for_combinators_and_then_Food.
  Section Impl_core_fmt_Debug_for_combinators_and_then_Food.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := combinators_and_then.Food.
    
    Definition fmt
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M ltac:(core.fmt.Result) :=
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 :=
        match self with
        | combinators_and_then.Food  =>
          let* α0 := deref (mk_str "CordonBleu") str in
          borrow α0 str
        | combinators_and_then.Food  =>
          let* α0 := deref (mk_str "Steak") str in
          borrow α0 str
        | combinators_and_then.Food  =>
          let* α0 := deref (mk_str "Sushi") str in
          borrow α0 str
        end in
      core.fmt.Formatter::["write_str"] α1 α2.
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    Global Instance ℐ : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_combinators_and_then_Food.
End Impl_core_fmt_Debug_for_combinators_and_then_Food.

Module Day.
  Inductive t `{ℋ : State.Trait} : Set :=
  | Monday
  | Tuesday
  | Wednesday.
End Day.
Definition Day `{ℋ : State.Trait} : Set := Day.t.

Module Impl_core_fmt_Debug_for_combinators_and_then_Day.
  Section Impl_core_fmt_Debug_for_combinators_and_then_Day.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := combinators_and_then.Day.
    
    Definition fmt
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M ltac:(core.fmt.Result) :=
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 :=
        match self with
        | combinators_and_then.Day  =>
          let* α0 := deref (mk_str "Monday") str in
          borrow α0 str
        | combinators_and_then.Day  =>
          let* α0 := deref (mk_str "Tuesday") str in
          borrow α0 str
        | combinators_and_then.Day  =>
          let* α0 := deref (mk_str "Wednesday") str in
          borrow α0 str
        end in
      core.fmt.Formatter::["write_str"] α1 α2.
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    Global Instance ℐ : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_combinators_and_then_Day.
End Impl_core_fmt_Debug_for_combinators_and_then_Day.

Definition have_ingredients
    `{ℋ : State.Trait}
    (food : combinators_and_then.Food)
    : M (core.option.Option combinators_and_then.Food) :=
  match food with
  | combinators_and_then.Food  => M.alloc core.option.Option.None
  | _ => M.alloc (core.option.Option.Some food)
  end.

Definition have_recipe
    `{ℋ : State.Trait}
    (food : combinators_and_then.Food)
    : M (core.option.Option combinators_and_then.Food) :=
  match food with
  | combinators_and_then.Food  => M.alloc core.option.Option.None
  | _ => M.alloc (core.option.Option.Some food)
  end.

Definition cookable_v1
    `{ℋ : State.Trait}
    (food : combinators_and_then.Food)
    : M (core.option.Option combinators_and_then.Food) :=
  let* α0 := combinators_and_then.have_recipe food in
  match α0 with
  | core.option.Option  => M.alloc core.option.Option.None
  | core.option.Option food =>
    let* α0 := combinators_and_then.have_ingredients food in
    match α0 with
    | core.option.Option  => M.alloc core.option.Option.None
    | core.option.Option food => M.alloc (core.option.Option.Some food)
    end
  end.

Definition cookable_v2
    `{ℋ : State.Trait}
    (food : combinators_and_then.Food)
    : M (core.option.Option combinators_and_then.Food) :=
  let* α0 := combinators_and_then.have_recipe food in
  (core.option.Option combinators_and_then.Food)::["and_then"]
    α0
    combinators_and_then.have_ingredients.

Definition eat
    `{ℋ : State.Trait}
    (food : combinators_and_then.Food)
    (day : combinators_and_then.Day)
    : M unit :=
  let* α0 := combinators_and_then.cookable_v2 food in
  match α0 with
  | core.option.Option food =>
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Yay! On "; mk_str " we get to eat "; mk_str ".
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow day combinators_and_then.Day in
      let* α5 := deref α4 combinators_and_then.Day in
      let* α6 := borrow α5 combinators_and_then.Day in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow food combinators_and_then.Food in
      let* α9 := deref α8 combinators_and_then.Food in
      let* α10 := borrow α9 combinators_and_then.Food in
      let* α11 := core.fmt.rt.Argument::["new_debug"] α10 in
      let* α12 := borrow [ α7; α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    M.alloc tt
  | core.option.Option  =>
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Oh no. We don't get to eat on "; mk_str "?
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow day combinators_and_then.Day in
      let* α5 := deref α4 combinators_and_then.Day in
      let* α6 := borrow α5 combinators_and_then.Day in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    M.alloc tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* '(cordon_bleu, steak, sushi) :=
    let* α0 := M.alloc combinators_and_then.Food.CordonBleu in
    let* α1 := M.alloc combinators_and_then.Food.Steak in
    let* α2 := M.alloc combinators_and_then.Food.Sushi in
    Pure (α0, α1, α2) in
  let* _ :=
    let* α0 := M.alloc combinators_and_then.Day.Monday in
    combinators_and_then.eat cordon_bleu α0 in
  let* _ :=
    let* α0 := M.alloc combinators_and_then.Day.Tuesday in
    combinators_and_then.eat steak α0 in
  let* _ :=
    let* α0 := M.alloc combinators_and_then.Day.Wednesday in
    combinators_and_then.eat sushi α0 in
  M.alloc tt.
