Require Import CoqOfRust.lib.lib.

Require CoqOfRust.core.option.
Require Import CoqOfRust.core.marker.

(* ********STRUCTS******** *)
(* [x] Reverse *)
(* pub struct Reverse<T>(pub T); *)
Module Reverse.
  Record t (T : Set) : Set := { _1 : T }.
End Reverse.
Definition Reverse := Reverse.t.

(* ********ENUMS******** *)
(* 
[x] Ordering
*)
Module Ordering.
  Inductive t : Set :=
  | Less : t
  | Greater : t
  | Equal : t.
End Ordering.
Definition Ordering := Ordering.t.

(* ********TRAITS******** *)
(* 
Traits
[x] Eq
[x] Ord
[x] PartialEq
[x] PartialOrd
*)
Module PartialEq.
  Class Trait (Self : Set) {Rhs : Set} : Set := {
    Rhs := Rhs;

    eq `{State.Trait} : ref Self -> ref Rhs -> M bool;
  }.

  Module Default.
    Definition Rhs (Self : Set) : Set := Self.
  End Default.

  Global Instance Method_eq `{State.Trait} `(Trait) : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  Global Instance Method_ne `{State.Trait} `(Trait) : Notation.Dot "ne" := {
    Notation.dot x y :=
      let* is_eq := eq x y in
      Pure (negb is_eq);
  }.

  Module Impl_PartialEq_for_str.
    Global Instance I : Trait str (Rhs := Default.Rhs str). Admitted.
  End Impl_PartialEq_for_str.
End PartialEq.

Module PartialOrd.
  Class Trait (Self : Set) {Rhs : Set} : Set := {
    Rhs := Rhs;
    partial_cmp `{State.Trait} :
      ref Self -> ref Self -> M (core.option.Option (Ordering.t));

    (* lt `{State.Trait} : ref Self -> ref Rhs -> M bool;
    le `{State.Trait} : ref Self -> ref Rhs -> M bool;
    gt `{State.Trait} : ref Self -> ref Rhs -> M bool;
    ge `{State.Trait} : ref Self -> ref Rhs -> M bool; *)
  }.

  Module Default.
    Definition Rhs (Self : Set) : Set := Self.
  End Default.

  Global Instance Method_partial_cmp `{State.Trait} `(Trait) :
    Notation.Dot "partial_cmp" := {
    Notation.dot := partial_cmp;
  }.
  (* Global Instance Method_lt `{State.Trait} `(Trait) : Notation.Dot "lt" := {
    Notation.dot := lt;
  }.
  Global Instance Method_le `{State.Trait} `(Trait) : Notation.Dot "le" := {
    Notation.dot := le;
  }.
  Global Instance Method_gt `{State.Trait} `(Trait) : Notation.Dot "gt" := {
    Notation.dot := gt;
  }.
  Global Instance Method_ge `{State.Trait} `(Trait) : Notation.Dot "ge" := {
    Notation.dot := ge;
  }. *)
  Module Impl_PartialOrd_for_str.
    Global Instance I : Trait str (Rhs := str). Admitted.
  End Impl_PartialOrd_for_str.
End PartialOrd.

(* 
pub trait Eq: PartialEq<Self> { }
 *)
Module Eq.
  Unset Primitive Projections.
  Class Trait (Self : Set)
    `{PartialEq.Trait Self (Rhs := PartialEq.Default.Rhs Self)} : Set := { }.
  Set Primitive Projections.

  Module Impl_Eq_for_str.
    Global Instance I : Trait str := {}.
  End Impl_Eq_for_str.
End Eq.

(* 
pub trait Ord: Eq + PartialOrd<Self> {
    // Required method
    fn cmp(&self, other: &Self) -> Ordering;

    // Provided methods
    fn max(self, other: Self) -> Self
       where Self: Sized { ... }
    fn min(self, other: Self) -> Self
       where Self: Sized { ... }
    fn clamp(self, min: Self, max: Self) -> Self
       where Self: Sized + PartialOrd<Self> { ... }
}
*)
Module Ord.
  Class Trait (Self : Set) 
    `{Eq.Trait Self}
    `{PartialOrd.Trait Self (Rhs := Self)} :={
    cmp : ref Self -> ref Self -> Ordering;
    max : Self -> Self -> Self;
    min : Self -> Self -> Self;
    clamp `{PartialOrd.Trait Self (Rhs := Self)} : Self -> Self -> Self;

    }.

  Module Impl_Ord_for_str.
    Global Instance I : Trait str. Admitted.
  End Impl_Ord_for_str.
End Ord.

(* ********FUNCTIONS******** *)
(* 
[ ] max
[ ] max_by
[ ] max_by_key
[ ] min
[ ] min_by
[ ] min_by_key
*)

(* **********IMPLS********** *)
(*
// Implementation of PartialEq, Eq, PartialOrd and Ord for primitive types
*)
Module Impls.
  (*
  impl PartialEq for () {
      #[inline]
      fn eq(&self, _other: &()) -> bool {
          true
      }
      #[inline]
      fn ne(&self, _other: &()) -> bool {
          false
      }
  }
  *)
  Module Impl_PartialEq_for_unit.
    Definition eq `{State.Trait} (x y : unit) : M bool := Pure true.

    Global Instance I :
      PartialEq.Trait unit (Rhs := PartialEq.Default.Rhs unit) := {
      eq `{State.Trait} := eq;
    }.
  End Impl_PartialEq_for_unit.
End Impls.
