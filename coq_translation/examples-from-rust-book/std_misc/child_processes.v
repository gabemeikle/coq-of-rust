(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

(* Approximation *)

Definition u8 : Set := Z.
Definition u16 : Set := Z.
Definition u32 : Set := Z.
Definition u64 : Set := Z.
Definition u128 : Set := Z.

Definition i8 : Set := Z.
Definition i16 : Set := Z.
Definition i32 : Set := Z.
Definition i64 : Set := Z.
Definition i128 : Set := Z.

Definition f32 : Set := Z.
Definition f64 : Set := Z.

Definition main (_ : unit) :=
  let output := unwrap_or_else
    (output (arg (ImplCommand.new "rustc") "--version"))
    (fun e => _crate.rt.panic_fmt
      (_crate::fmt::ImplArguments.new_v1
        ["failed to execute process: "]
        [_crate::fmt::ImplArgumentV1.new_display e])) in
  if success output.status then
    let s := ImplString.from_utf8_lossy output.stdout in
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["rustc succeeded and stdout was:\n"]
        [_crate::fmt::ImplArgumentV1.new_display s]) ;;
    tt ;;
    tt
  else
    let s := ImplString.from_utf8_lossy output.stderr in
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["rustc failed and stderr was:\n"]
        [_crate::fmt::ImplArgumentV1.new_display s]) ;;
    tt ;;
    tt.