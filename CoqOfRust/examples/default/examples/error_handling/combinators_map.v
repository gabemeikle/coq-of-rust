(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Food.
  Inductive t : Set :=
  | Apple
  | Carrot
  | Potato.
End Food.

Module  Impl_core_fmt_Debug_for_combinators_map_Food_t.
Section Impl_core_fmt_Debug_for_combinators_map_Food_t.
  Ltac Self := exact combinators_map.Food.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : ref combinators_map.Food.t := M.read self in
      let* α2 : M.Val (ref str.t) :=
        match α1 with
        | combinators_map.Food.Apple  =>
          let* α0 : ref str.t := M.read (mk_str "Apple") in
          M.alloc α0
        | combinators_map.Food.Carrot  =>
          let* α0 : ref str.t := M.read (mk_str "Carrot") in
          M.alloc α0
        | combinators_map.Food.Potato  =>
          let* α0 : ref str.t := M.read (mk_str "Potato") in
          M.alloc α0
        end in
      let* α3 : ref str.t := M.read α2 in
      core.fmt.Formatter.t::["write_str"] α0 α3).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_map_Food_t.
End Impl_core_fmt_Debug_for_combinators_map_Food_t.

Module  Peeled.
Section Peeled.
  Record t : Set := {
    x0 : combinators_map.Food.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Peeled.
End Peeled.

Module  Impl_core_fmt_Debug_for_combinators_map_Peeled_t.
Section Impl_core_fmt_Debug_for_combinators_map_Peeled_t.
  Ltac Self := exact combinators_map.Peeled.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : ref str.t := M.read (mk_str "Peeled") in
      let* α2 : ref combinators_map.Peeled.t := M.read self in
      let* α3 : M.Val combinators_map.Peeled.t := deref α2 in
      let* α4 : ref combinators_map.Food.t := borrow α3.["0"] in
      let* α5 : M.Val (ref combinators_map.Food.t) := M.alloc α4 in
      let* α6 : ref (ref combinators_map.Food.t) := borrow α5 in
      let* α7 : M.Val (ref (ref combinators_map.Food.t)) := M.alloc α6 in
      let* α8 : M.Val (ref type not implemented) :=
        pointer_coercion "Unsize" α7 in
      let* α9 : ref type not implemented := M.read α8 in
      core.fmt.Formatter.t::["debug_tuple_field1_finish"] α0 α1 α9).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_map_Peeled_t.
End Impl_core_fmt_Debug_for_combinators_map_Peeled_t.

Module  Chopped.
Section Chopped.
  Record t : Set := {
    x0 : combinators_map.Food.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Chopped.
End Chopped.

Module  Impl_core_fmt_Debug_for_combinators_map_Chopped_t.
Section Impl_core_fmt_Debug_for_combinators_map_Chopped_t.
  Ltac Self := exact combinators_map.Chopped.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : ref str.t := M.read (mk_str "Chopped") in
      let* α2 : ref combinators_map.Chopped.t := M.read self in
      let* α3 : M.Val combinators_map.Chopped.t := deref α2 in
      let* α4 : ref combinators_map.Food.t := borrow α3.["0"] in
      let* α5 : M.Val (ref combinators_map.Food.t) := M.alloc α4 in
      let* α6 : ref (ref combinators_map.Food.t) := borrow α5 in
      let* α7 : M.Val (ref (ref combinators_map.Food.t)) := M.alloc α6 in
      let* α8 : M.Val (ref type not implemented) :=
        pointer_coercion "Unsize" α7 in
      let* α9 : ref type not implemented := M.read α8 in
      core.fmt.Formatter.t::["debug_tuple_field1_finish"] α0 α1 α9).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_map_Chopped_t.
End Impl_core_fmt_Debug_for_combinators_map_Chopped_t.

Module  Cooked.
Section Cooked.
  Record t : Set := {
    x0 : combinators_map.Food.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Cooked.
End Cooked.

Module  Impl_core_fmt_Debug_for_combinators_map_Cooked_t.
Section Impl_core_fmt_Debug_for_combinators_map_Cooked_t.
  Ltac Self := exact combinators_map.Cooked.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : ref str.t := M.read (mk_str "Cooked") in
      let* α2 : ref combinators_map.Cooked.t := M.read self in
      let* α3 : M.Val combinators_map.Cooked.t := deref α2 in
      let* α4 : ref combinators_map.Food.t := borrow α3.["0"] in
      let* α5 : M.Val (ref combinators_map.Food.t) := M.alloc α4 in
      let* α6 : ref (ref combinators_map.Food.t) := borrow α5 in
      let* α7 : M.Val (ref (ref combinators_map.Food.t)) := M.alloc α6 in
      let* α8 : M.Val (ref type not implemented) :=
        pointer_coercion "Unsize" α7 in
      let* α9 : ref type not implemented := M.read α8 in
      core.fmt.Formatter.t::["debug_tuple_field1_finish"] α0 α1 α9).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_map_Cooked_t.
End Impl_core_fmt_Debug_for_combinators_map_Cooked_t.

(*
fn peel(food: Option<Food>) -> Option<Peeled> {
    match food {
        Some(food) => Some(Peeled(food)),
        None => None,
    }
}
*)
Definition peel
    (food : core.option.Option.t combinators_map.Food.t)
    : M (core.option.Option.t combinators_map.Peeled.t) :=
  let* food : M.Val (core.option.Option.t combinators_map.Food.t) :=
    M.alloc food in
  M.function_body
    (let* α0 : core.option.Option.t combinators_map.Food.t := M.read food in
    let* α1 : M.Val (core.option.Option.t combinators_map.Peeled.t) :=
      match α0 with
      | core.option.Option.Some food =>
        let* food := M.alloc food in
        let* α0 : combinators_map.Food.t := M.read food in
        M.alloc (core.option.Option.Some (combinators_map.Peeled.Build_t α0))
      | core.option.Option.None  => M.alloc core.option.Option.None
      end in
    M.read α1).

(*
fn chop(peeled: Option<Peeled>) -> Option<Chopped> {
    match peeled {
        Some(Peeled(food)) => Some(Chopped(food)),
        None => None,
    }
}
*)
Definition chop
    (peeled : core.option.Option.t combinators_map.Peeled.t)
    : M (core.option.Option.t combinators_map.Chopped.t) :=
  let* peeled : M.Val (core.option.Option.t combinators_map.Peeled.t) :=
    M.alloc peeled in
  M.function_body
    (let* α0 : core.option.Option.t combinators_map.Peeled.t := M.read peeled in
    let* α1 : M.Val (core.option.Option.t combinators_map.Chopped.t) :=
      match α0 with
      | core.option.Option.Some combinators_map.Peeled.Build_t food =>
        let* food := M.alloc food in
        let* α0 : combinators_map.Food.t := M.read food in
        M.alloc (core.option.Option.Some (combinators_map.Chopped.Build_t α0))
      | core.option.Option.None  => M.alloc core.option.Option.None
      end in
    M.read α1).

(*
fn cook(chopped: Option<Chopped>) -> Option<Cooked> {
    chopped.map(|Chopped(food)| Cooked(food))
}
*)
Definition cook
    (chopped : core.option.Option.t combinators_map.Chopped.t)
    : M (core.option.Option.t combinators_map.Cooked.t) :=
  let* chopped : M.Val (core.option.Option.t combinators_map.Chopped.t) :=
    M.alloc chopped in
  M.function_body
    (let* α0 : core.option.Option.t combinators_map.Chopped.t :=
      M.read chopped in
    let* α1 : type not implemented :=
      M.read
        (let* α0 : combinators_map.Food.t := M.read food in
        M.alloc (combinators_map.Cooked.Build_t α0)) in
    (core.option.Option.t combinators_map.Chopped.t)::["map"] α0 α1).

(*
fn process(food: Option<Food>) -> Option<Cooked> {
    food.map(|f| Peeled(f))
        .map(|Peeled(f)| Chopped(f))
        .map(|Chopped(f)| Cooked(f))
}
*)
Definition process
    (food : core.option.Option.t combinators_map.Food.t)
    : M (core.option.Option.t combinators_map.Cooked.t) :=
  let* food : M.Val (core.option.Option.t combinators_map.Food.t) :=
    M.alloc food in
  M.function_body
    (let* α0 : core.option.Option.t combinators_map.Food.t := M.read food in
    let* α1 : type not implemented :=
      M.read
        (let* α0 : combinators_map.Food.t := M.read f in
        M.alloc (combinators_map.Peeled.Build_t α0)) in
    let* α2 : core.option.Option.t combinators_map.Peeled.t :=
      (core.option.Option.t combinators_map.Food.t)::["map"] α0 α1 in
    let* α3 : type not implemented :=
      M.read
        (let* α0 : combinators_map.Food.t := M.read f in
        M.alloc (combinators_map.Chopped.Build_t α0)) in
    let* α4 : core.option.Option.t combinators_map.Chopped.t :=
      (core.option.Option.t combinators_map.Peeled.t)::["map"] α2 α3 in
    let* α5 : type not implemented :=
      M.read
        (let* α0 : combinators_map.Food.t := M.read f in
        M.alloc (combinators_map.Cooked.Build_t α0)) in
    (core.option.Option.t combinators_map.Chopped.t)::["map"] α4 α5).

(*
fn eat(food: Option<Cooked>) {
    match food {
        Some(food) => println!("Mmm. I love {:?}", food),
        None => println!("Oh no! It wasn't edible."),
    }
}
*)
Definition eat
    (food : core.option.Option.t combinators_map.Cooked.t)
    : M unit :=
  let* food : M.Val (core.option.Option.t combinators_map.Cooked.t) :=
    M.alloc food in
  M.function_body
    (let* α0 : core.option.Option.t combinators_map.Cooked.t := M.read food in
    let* α1 : M.Val unit :=
      match α0 with
      | core.option.Option.Some food =>
        let* food := M.alloc food in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "Mmm. I love "; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref combinators_map.Cooked.t := borrow food in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_debug"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
          let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
          let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
          let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α10 in
          let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
          let* α13 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α12 in
          let* α14 : unit := std.io.stdio._print α13 in
          M.alloc α14 in
        M.alloc tt
      | core.option.Option.None  =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "Oh no! It wasn't edible.
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_const"] α4 in
          let* α6 : unit := std.io.stdio._print α5 in
          M.alloc α6 in
        M.alloc tt
      end in
    M.read α1).

(*
fn main() {
    let apple = Some(Food::Apple);
    let carrot = Some(Food::Carrot);
    let potato = None;

    let cooked_apple = cook(chop(peel(apple)));
    let cooked_carrot = cook(chop(peel(carrot)));
    // Let's try the simpler looking `process()` now.
    let cooked_potato = process(potato);

    eat(cooked_apple);
    eat(cooked_carrot);
    eat(cooked_potato);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* apple : M.Val (core.option.Option.t combinators_map.Food.t) :=
      M.alloc (core.option.Option.Some combinators_map.Food.Apple) in
    let* carrot : M.Val (core.option.Option.t combinators_map.Food.t) :=
      M.alloc (core.option.Option.Some combinators_map.Food.Carrot) in
    let* potato : M.Val (core.option.Option.t combinators_map.Food.t) :=
      M.alloc core.option.Option.None in
    let* cooked_apple : M.Val (core.option.Option.t combinators_map.Cooked.t) :=
      let* α0 : core.option.Option.t combinators_map.Food.t := M.read apple in
      let* α1 : core.option.Option.t combinators_map.Peeled.t :=
        combinators_map.peel α0 in
      let* α2 : core.option.Option.t combinators_map.Chopped.t :=
        combinators_map.chop α1 in
      let* α3 : core.option.Option.t combinators_map.Cooked.t :=
        combinators_map.cook α2 in
      M.alloc α3 in
    let* cooked_carrot :
        M.Val (core.option.Option.t combinators_map.Cooked.t) :=
      let* α0 : core.option.Option.t combinators_map.Food.t := M.read carrot in
      let* α1 : core.option.Option.t combinators_map.Peeled.t :=
        combinators_map.peel α0 in
      let* α2 : core.option.Option.t combinators_map.Chopped.t :=
        combinators_map.chop α1 in
      let* α3 : core.option.Option.t combinators_map.Cooked.t :=
        combinators_map.cook α2 in
      M.alloc α3 in
    let* cooked_potato :
        M.Val (core.option.Option.t combinators_map.Cooked.t) :=
      let* α0 : core.option.Option.t combinators_map.Food.t := M.read potato in
      let* α1 : core.option.Option.t combinators_map.Cooked.t :=
        combinators_map.process α0 in
      M.alloc α1 in
    let* _ : M.Val unit :=
      let* α0 : core.option.Option.t combinators_map.Cooked.t :=
        M.read cooked_apple in
      let* α1 : unit := combinators_map.eat α0 in
      M.alloc α1 in
    let* _ : M.Val unit :=
      let* α0 : core.option.Option.t combinators_map.Cooked.t :=
        M.read cooked_carrot in
      let* α1 : unit := combinators_map.eat α0 in
      M.alloc α1 in
    let* _ : M.Val unit :=
      let* α0 : core.option.Option.t combinators_map.Cooked.t :=
        M.read cooked_potato in
      let* α1 : unit := combinators_map.eat α0 in
      M.alloc α1 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
