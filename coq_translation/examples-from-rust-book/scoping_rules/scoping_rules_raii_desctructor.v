(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module ToDrop.
  Inductive t : Set := Build.
End ToDrop.
Definition ToDrop := ToDrop.t.

Module Impl_Drop_for_ToDrop.
  Definition Self := ToDrop.
  
  Definition drop (self : mut_ref Self) :=
    _crate.io._print
      (format_arguments::["new_const"] [ "ToDrop is being dropped
" ]) ;;
    tt ;;
    tt.
  
  Global Instance Method_drop : Notation.Dot "drop" := {
    Notation.dot := drop;
  }.
  
  Global Instance I : Drop.Trait Self := {
    Drop.drop := drop;
  }.
End Impl_Drop_for_ToDrop.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : unit :=
  let x := ToDrop.Build in
  _crate.io._print (format_arguments::["new_const"] [ "Made a ToDrop!
" ]) ;;
  tt ;;
  tt.
