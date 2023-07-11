(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Food.
  Inductive t : Set :=
  | CordonBleu
  | Steak
  | Sushi.
End Food.
Definition Food := Food.t.

Module Impl_core_fmt_Debug_for_combinators_and_then_Food.
  Definition Self := combinators_and_then.Food.
  
  Parameter fmt : ref Self-> mut_ref core.fmt.Formatter -> M core.fmt.Result.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_and_then_Food.

Module Day.
  Inductive t : Set :=
  | Monday
  | Tuesday
  | Wednesday.
End Day.
Definition Day := Day.t.

Module Impl_core_fmt_Debug_for_combinators_and_then_Day.
  Definition Self := combinators_and_then.Day.
  
  Parameter fmt : ref Self-> mut_ref core.fmt.Formatter -> M core.fmt.Result.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_and_then_Day.

Parameter have_ingredients : combinators_and_then.Food
    -> M (core.option.Option combinators_and_then.Food).

Parameter have_recipe : combinators_and_then.Food
    -> M (core.option.Option combinators_and_then.Food).

Parameter cookable_v1 : combinators_and_then.Food
    -> M (core.option.Option combinators_and_then.Food).

Parameter cookable_v2 : combinators_and_then.Food
    -> M (core.option.Option combinators_and_then.Food).

Parameter eat : combinators_and_then.Food-> combinators_and_then.Day -> M unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
