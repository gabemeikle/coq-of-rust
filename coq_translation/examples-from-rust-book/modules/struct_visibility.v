(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module my.
  Module OpenBox.
    Record t : Set := {
      contents : T;
    }.
    
    Global Instance Get_contents : NamedField.Class t "contents" _ := {|
      NamedField.get '(Build_t x0) := x0;
    |}.
    Class AssociatedFunction (name : string) (T : Set) : Set := {
      associated_function : T;
    }.
  End OpenBox.
  Definition OpenBox : Set := OpenBox.t.
  
  Module ClosedBox.
    Record t : Set := {
      contents : T;
    }.
    
    Global Instance Get_contents : NamedField.Class t "contents" _ := {|
      NamedField.get '(Build_t x0) := x0;
    |}.
    Class AssociatedFunction (name : string) (T : Set) : Set := {
      associated_function : T;
    }.
  End ClosedBox.
  Definition ClosedBox : Set := ClosedBox.t.
  
  Module ImplClosedBox.
    Definition Self := ClosedBox.
    
    Definition new (contents : T) : ClosedBox :=
      {| ClosedBox.contents := contents; |}.
    
    Global Instance AF_new : ClosedBox.AssociatedFunction "new" _ := {|
      ClosedBox.associated_function := new;
    |}.
  End ImplClosedBox.
End my.

Module OpenBox.
  Record t : Set := {
    contents : T;
  }.
  
  Global Instance Get_contents : NamedField.Class t "contents" _ := {|
    NamedField.get '(Build_t x0) := x0;
  |}.
  Class AssociatedFunction (name : string) (T : Set) : Set := {
    associated_function : T;
  }.
End OpenBox.
Definition OpenBox : Set := OpenBox.t.

Module ClosedBox.
  Record t : Set := {
    contents : T;
  }.
  
  Global Instance Get_contents : NamedField.Class t "contents" _ := {|
    NamedField.get '(Build_t x0) := x0;
  |}.
  Class AssociatedFunction (name : string) (T : Set) : Set := {
    associated_function : T;
  }.
End ClosedBox.
Definition ClosedBox : Set := ClosedBox.t.

Module ImplClosedBox.
  Definition Self := ClosedBox.
  
  Definition new (contents : T) : ClosedBox :=
    {| ClosedBox.contents := contents; |}.
  
  Global Instance AF_new : ClosedBox.AssociatedFunction "new" _ := {|
    ClosedBox.associated_function := new;
  |}.
End ImplClosedBox.

Definition main (_ : unit) : unit :=
  let open_box := {| my.OpenBox.contents := "public information"; |} in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "The open box contains: "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_display
          (NamedField.get (name := "contents") open_box)
      ]) ;;
  tt ;;
  let _closed_box := my.ImplClosedBox.new "classified information" in
  tt.
