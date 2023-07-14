(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Food.
  Inductive t : Set :=
  | Apple
  | Carrot
  | Potato.
End Food.
Definition Food := Food.t.

Module Impl_core_fmt_Debug_for_combinators_map_Food.
  Definition Self := combinators_map.Food.
  
  Parameter fmt : forall `{H : State.Trait}, ref Self->
      mut_ref core.fmt.Formatter
      -> M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_map_Food.

Module Peeled.
  Record t : Set := { _ : combinators_map.Food;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Peeled.
Definition Peeled := Peeled.t.

Module Impl_core_fmt_Debug_for_combinators_map_Peeled.
  Definition Self := combinators_map.Peeled.
  
  Parameter fmt : forall `{H : State.Trait}, ref Self->
      mut_ref core.fmt.Formatter
      -> M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_map_Peeled.

Module Chopped.
  Record t : Set := { _ : combinators_map.Food;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Chopped.
Definition Chopped := Chopped.t.

Module Impl_core_fmt_Debug_for_combinators_map_Chopped.
  Definition Self := combinators_map.Chopped.
  
  Parameter fmt : forall `{H : State.Trait}, ref Self->
      mut_ref core.fmt.Formatter
      -> M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_map_Chopped.

Module Cooked.
  Record t : Set := { _ : combinators_map.Food;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Cooked.
Definition Cooked := Cooked.t.

Module Impl_core_fmt_Debug_for_combinators_map_Cooked.
  Definition Self := combinators_map.Cooked.
  
  Parameter fmt : forall `{H : State.Trait}, ref Self->
      mut_ref core.fmt.Formatter
      -> M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_map_Cooked.

Parameter peel : forall `{H : State.Trait}, core.option.Option
        combinators_map.Food
    -> M (H := H) (core.option.Option combinators_map.Peeled).

Parameter chop : forall `{H : State.Trait}, core.option.Option
        combinators_map.Peeled
    -> M (H := H) (core.option.Option combinators_map.Chopped).

Parameter cook : forall `{H : State.Trait}, core.option.Option
        combinators_map.Chopped
    -> M (H := H) (core.option.Option combinators_map.Cooked).

Parameter process : forall `{H : State.Trait}, core.option.Option
        combinators_map.Food
    -> M (H := H) (core.option.Option combinators_map.Cooked).

Parameter eat : forall `{H : State.Trait}, core.option.Option
        combinators_map.Cooked
    -> M (H := H) unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, unit -> M (H := H) unit.
