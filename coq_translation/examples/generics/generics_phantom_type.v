(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module PhantomTuple.
  Record t : Set := { _ : A; _ : std.marker.PhantomData B;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_1 : Notation.Dot 1 := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End PhantomTuple.
Definition PhantomTuple := PhantomTuple.t.

Module Impl__crate_marker_StructuralPartialEq_for_PhantomTuple_A_B.
  Definition Self := PhantomTuple A B.
  
  Global Instance I A B : _crate.marker.StructuralPartialEq.Trait Self :=
    _crate.marker.StructuralPartialEq.Build_Class _.
End Impl__crate_marker_StructuralPartialEq_for_PhantomTuple_A_B.

Module Impl__crate_cmp_PartialEq_for_PhantomTuple_A_B.
  Definition Self := PhantomTuple A B.
  
  Definition eq (self : ref Self) (other : ref (PhantomTuple A B)) : M bool :=
    let* α0 := (self.[0]).["eq"] (other.[0]) in
    let* α1 := (self.[1]).["eq"] (other.[1]) in
    α0.["andb"] α1.
  
  Global Instance Method_eq : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  
  Global Instance I A B : _crate.cmp.PartialEq.Trait Self := {
    _crate.cmp.PartialEq.eq := eq;
  }.
End Impl__crate_cmp_PartialEq_for_PhantomTuple_A_B.

Module PhantomStruct.
  Record t : Set := {
    first : A;
    phantom : std.marker.PhantomData B;
  }.
  
  Global Instance Get_first : Notation.Dot "first" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_phantom : Notation.Dot "phantom" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End PhantomStruct.
Definition PhantomStruct : Set := PhantomStruct.t.

Module Impl__crate_marker_StructuralPartialEq_for_PhantomStruct_A_B.
  Definition Self := PhantomStruct A B.
  
  Global Instance I A B : _crate.marker.StructuralPartialEq.Trait Self :=
    _crate.marker.StructuralPartialEq.Build_Class _.
End Impl__crate_marker_StructuralPartialEq_for_PhantomStruct_A_B.

Module Impl__crate_cmp_PartialEq_for_PhantomStruct_A_B.
  Definition Self := PhantomStruct A B.
  
  Definition eq (self : ref Self) (other : ref (PhantomStruct A B)) : M bool :=
    let* α0 := self.["first"].["eq"] other.["first"] in
    let* α1 := self.["phantom"].["eq"] other.["phantom"] in
    α0.["andb"] α1.
  
  Global Instance Method_eq : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  
  Global Instance I A B : _crate.cmp.PartialEq.Trait Self := {
    _crate.cmp.PartialEq.eq := eq;
  }.
End Impl__crate_cmp_PartialEq_for_PhantomStruct_A_B.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let _tuple1 := PhantomTuple.Build_t "Q"%char std.marker.PhantomData.Build in
  let _tuple2 := PhantomTuple.Build_t "Q"%char std.marker.PhantomData.Build in
  let _struct1 :=
    {|
      PhantomStruct.first := "Q"%char;
      PhantomStruct.phantom := std.marker.PhantomData.Build;
    |} in
  let _struct2 :=
    {|
      PhantomStruct.first := "Q"%char;
      PhantomStruct.phantom := std.marker.PhantomData.Build;
    |} in
  Pure tt.
