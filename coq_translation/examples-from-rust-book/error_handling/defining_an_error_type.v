(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error TyAlias.

Error Struct.

Module Impl__crate_fmt_Debug_for_DoubleError.
  Definition Self := DoubleError.
  
  #[global] Instance I : _crate.fmt.Debug.Class Self := {|
    fmt
      (self : static_ref DoubleError)
      (f : mut_ref _crate.fmt.Formatter)
      :=
      _crate::fmt::ImplFormatter.write_str f "DoubleError";
  |}.
Module ImplDoubleError.

Module Impl__crate_clone_Clone_for_DoubleError.
  Definition Self := DoubleError.
  
  #[global] Instance I : _crate.clone.Clone.Class Self := {|
    clone (self : static_ref DoubleError) := DoubleError;
  |}.
Module ImplDoubleError.

Module Impl_fmt_Display_for_DoubleError.
  Definition Self := DoubleError.
  
  #[global] Instance I : fmt.Display.Class Self := {|
    fmt
      (self : static_ref DoubleError)
      (f : mut_ref fmt.Formatter)
      :=
      write_fmt
        f
        (_crate::fmt::ImplArguments.new_v1 ["invalid first item to double"] []);
  |}.
Module ImplDoubleError.

Definition double_first (_ : unit) :=
  and_then
    (ok_or (first vec) DoubleError)
    (fun s => map
      (map_err (parse s) (fun _ => DoubleError))
      (fun i => mul 2 i)).

Definition print (_ : unit) :=
  match result with
  | Ok (n) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["The first doubled is ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_display n]) ;;
    tt
  | Err (e) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["Error: ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_display e]) ;;
    tt
  end.

Definition main (_ : unit) :=
  let numbers := ComplexTypePath.into_vec ["42";"93";"18"] in
  let empty := _crate::vec::ImplVec.new tt in
  let strings := ComplexTypePath.into_vec ["tofu";"93";"18"] in
  print (double_first numbers) ;;
  print (double_first empty) ;;
  print (double_first strings) ;;
  tt.
