(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module fmt := std.fmt.

Error TyAlias.

Error StructUnit.

Module Impl__crate_fmt_Debug_for_DoubleError.
  Definition Self := DoubleError.
  
  Global Instance I : _crate.fmt.Debug.Class Self := {|
    _crate.fmt.Debug.fmt (self : ref Self) (f : mut_ref _crate.fmt.Formatter) :=
      _crate.fmt.ImplFormatter.write_str f "DoubleError";
  |}.
End Impl__crate_fmt_Debug_for_DoubleError.

Module Impl__crate_clone_Clone_for_DoubleError.
  Definition Self := DoubleError.
  
  Global Instance I : _crate.clone.Clone.Class Self := {|
    _crate.clone.Clone.clone (self : ref Self) := DoubleError;
  |}.
End Impl__crate_clone_Clone_for_DoubleError.

Module Impl_fmt_Display_for_DoubleError.
  Definition Self := DoubleError.
  
  Global Instance I : fmt.Display.Class Self := {|
    fmt.Display.fmt (self : ref Self) (f : mut_ref fmt.Formatter) :=
      method
        "write_fmt"
        f
        (_crate.fmt.ImplArguments.new_v1
          [ "invalid first item to double" ]
          [  ]);
  |}.
End Impl_fmt_Display_for_DoubleError.

Definition double_first (vec : Vec) : Result :=
  method
    "and_then"
    (method "ok_or" (method "first" vec) DoubleError)
    (fun s =>
      method
        "map"
        (method "map_err" (method "parse" s) (fun _ => DoubleError))
        (fun i => mul 2 i)).

Definition print (result : Result) : unit :=
  match result with
  | Ok (n) =>
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "The first doubled is "; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_display n ]) ;;
    tt
  | Err (e) =>
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "Error: "; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_display e ]) ;;
    tt
  end.

Definition main (_ : unit) : unit :=
  let numbers := ComplexTypePath.into_vec [ "42"; "93"; "18" ] in
  let empty := _crate.vec.ImplVec.new tt in
  let strings := ComplexTypePath.into_vec [ "tofu"; "93"; "18" ] in
  print (double_first numbers) ;;
  print (double_first empty) ;;
  print (double_first strings) ;;
  tt.
