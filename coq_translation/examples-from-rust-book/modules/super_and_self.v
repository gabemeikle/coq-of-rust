(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["called `function()`\n"] []) ;;
  tt ;;
  tt.

Module cool :=
  Definition function (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1 ["called `cool::function()`\n"] []) ;;
    tt ;;
    tt..

Definition function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["called `cool::function()`\n"] []) ;;
  tt ;;
  tt.

Module my :=
  Definition function (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1 ["called `my::function()`\n"] []) ;;
    tt ;;
    tt.
  
  Module cool :=
    Definition function (_ : unit) :=
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["called `my::cool::function()`\n"]
          []) ;;
      tt ;;
      tt..
  
  Definition indirect_call (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my::indirect_call()`, that\n> "]
        []) ;;
    tt ;;
    self.function tt ;;
    function tt ;;
    self.cool.function tt ;;
    super.function tt ;;
    Stmt_item..

Definition function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["called `my::function()`\n"] []) ;;
  tt ;;
  tt.

Module cool :=
  Definition function (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my::cool::function()`\n"]
        []) ;;
    tt ;;
    tt..

Definition function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my::cool::function()`\n"]
      []) ;;
  tt ;;
  tt.

Definition indirect_call (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my::indirect_call()`, that\n> "]
      []) ;;
  tt ;;
  self.function tt ;;
  function tt ;;
  self.cool.function tt ;;
  super.function tt ;;
  Stmt_item.

Definition main (_ : unit) :=
  my.indirect_call tt ;;
  tt.