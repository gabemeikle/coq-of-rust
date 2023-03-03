(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module PhantomData := std.marker.PhantomData.
Definition PhantomData := PhantomData.t.

Module PhantomTuple.
  Inductive t : Set := Build (_ : A) (_ : PhantomData).
  
  Global Instance Get_0 : IndexedField.Class t 0 A := {|
    IndexedField.get '(Build x0 _) := x0;
  |}.
  Global Instance Get_1 : IndexedField.Class t 1 PhantomData := {|
    IndexedField.get '(Build _ x1) := x1;
  |}.
End PhantomTuple.
Definition PhantomTuple := PhantomTuple.t.

Module Impl__crate_marker_StructuralPartialEq_for_PhantomTuple.
  Definition Self := PhantomTuple.
  
  Global Instance I A B : _crate.marker.StructuralPartialEq.Class Self :=
      _crate.marker.StructuralPartialEq.Build_Class _.
End Impl__crate_marker_StructuralPartialEq_for_PhantomTuple.

Module Impl__crate_cmp_PartialEq_for_PhantomTuple.
  Definition Self := PhantomTuple.
  
  Global Instance I A B : _crate.cmp.PartialEq.Class Self := {|
    _crate.cmp.PartialEq.eq (self : ref Self) (other : ref PhantomTuple) :=
      andb
        (eqb
          (IndexedField.get (index := 0) self)
          (IndexedField.get (index := 0) other))
        (eqb
          (IndexedField.get (index := 1) self)
          (IndexedField.get (index := 1) other));
  |}.
End Impl__crate_cmp_PartialEq_for_PhantomTuple.

Module PhantomStruct.
  Record t : Set := {
    first : A;
    phantom : PhantomData;
  }.
End PhantomStruct.
Definition PhantomStruct : Set := PhantomStruct.t.

Module Impl__crate_marker_StructuralPartialEq_for_PhantomStruct.
  Definition Self := PhantomStruct.
  
  Global Instance I A B : _crate.marker.StructuralPartialEq.Class Self :=
      _crate.marker.StructuralPartialEq.Build_Class _.
End Impl__crate_marker_StructuralPartialEq_for_PhantomStruct.

Module Impl__crate_cmp_PartialEq_for_PhantomStruct.
  Definition Self := PhantomStruct.
  
  Global Instance I A B : _crate.cmp.PartialEq.Class Self := {|
    _crate.cmp.PartialEq.eq (self : ref Self) (other : ref PhantomStruct) :=
      andb (eqb self.first other.first) (eqb self.phantom other.phantom);
  |}.
End Impl__crate_cmp_PartialEq_for_PhantomStruct.

Definition main (_ : unit) : unit :=
  let _tuple1 := PhantomTuple.Build Q PhantomData in
  let _tuple2 := PhantomTuple.Build Q PhantomData in
  let _struct1 :=
    {| PhantomStruct.first := Q; PhantomStruct.phantom := PhantomData; |} in
  let _struct2 :=
    {| PhantomStruct.first := Q; PhantomStruct.phantom := PhantomData; |} in
  tt.
