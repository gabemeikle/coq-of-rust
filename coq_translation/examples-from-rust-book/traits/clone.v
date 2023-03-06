(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Error StructUnit.

Module Impl__crate_fmt_Debug_for_Unit.
  Definition Self := Unit.
  
  Global Instance I : _crate.fmt.Debug.Class Self := {|
    Definition fmt
        (self : ref Self)
        (f : mut_ref _crate.fmt.Formatter)
        : _crate.fmt.Result :=
      _crate.fmt.ImplFormatter.write_str f "Unit".
    
    Global Instance AF_fmt : Unit.AssociatedFunction "fmt" _ := {|
      Unit.associated_function := fmt;
    |}.
    Global Instance M_fmt : Method "fmt" _ := {|
      method := fmt;
    |}.
  |}.
End Impl__crate_fmt_Debug_for_Unit.

Module Impl__crate_clone_Clone_for_Unit.
  Definition Self := Unit.
  
  Global Instance I : _crate.clone.Clone.Class Self := {|
    Definition clone (self : ref Self) : Unit := deref self.
    
    Global Instance AF_clone : Unit.AssociatedFunction "clone" _ := {|
      Unit.associated_function := clone;
    |}.
    Global Instance M_clone : Method "clone" _ := {|
      method := clone;
    |}.
  |}.
End Impl__crate_clone_Clone_for_Unit.

Module Impl__crate_marker_Copy_for_Unit.
  Definition Self := Unit.
  
  Global Instance I : _crate.marker.Copy.Class Self :=
      _crate.marker.Copy.Build_Class _.
End Impl__crate_marker_Copy_for_Unit.

Module Pair.
  Inductive t : Set := Build (_ : Box) (_ : Box).
  
  Global Instance Get_0 : IndexedField.Class t 0 _ := {|
    IndexedField.get '(Build x0 _) := x0;
  |}.
  Global Instance Get_1 : IndexedField.Class t 1 _ := {|
    IndexedField.get '(Build _ x1) := x1;
  |}.
End Pair.
Definition Pair := Pair.t.

Module Impl__crate_clone_Clone_for_Pair.
  Definition Self := Pair.
  
  Global Instance I : _crate.clone.Clone.Class Self := {|
    Definition clone (self : ref Self) : Pair :=
      Pair.Build
        ((_crate.clone.Clone.associated_function "clone")
          (IndexedField.get (index := 0) self))
        ((_crate.clone.Clone.associated_function "clone")
          (IndexedField.get (index := 1) self)).
    
    Global Instance AF_clone : Pair.AssociatedFunction "clone" _ := {|
      Pair.associated_function := clone;
    |}.
    Global Instance M_clone : Method "clone" _ := {|
      method := clone;
    |}.
  |}.
End Impl__crate_clone_Clone_for_Pair.

Module Impl__crate_fmt_Debug_for_Pair.
  Definition Self := Pair.
  
  Global Instance I : _crate.fmt.Debug.Class Self := {|
    Definition fmt
        (self : ref Self)
        (f : mut_ref _crate.fmt.Formatter)
        : _crate.fmt.Result :=
      _crate.fmt.ImplFormatter.debug_tuple_field2_finish
        f
        "Pair"
        (IndexedField.get (index := 0) self)
        (IndexedField.get (index := 1) self).
    
    Global Instance AF_fmt : Pair.AssociatedFunction "fmt" _ := {|
      Pair.associated_function := fmt;
    |}.
    Global Instance M_fmt : Method "fmt" _ := {|
      method := fmt;
    |}.
  |}.
End Impl__crate_fmt_Debug_for_Pair.

Definition main (_ : unit) : unit :=
  let unit := Unit in
  let copied_unit := unit in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "original: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug unit ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "copy: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug copied_unit ]) ;;
  tt ;;
  let pair := Pair.Build (ImplBox.new 1) (ImplBox.new 2) in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "original: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug pair ]) ;;
  tt ;;
  let moved_pair := pair in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "moved: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug moved_pair ]) ;;
  tt ;;
  let cloned_pair := method "clone" moved_pair in
  drop moved_pair ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "clone: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug cloned_pair ]) ;;
  tt ;;
  tt.
