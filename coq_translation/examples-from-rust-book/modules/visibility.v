(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Module my_mod :=
  Definition private_function (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::private_function()`\n"]
        []) ;;
    tt ;;
    tt.
  
  Definition function (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::function()`\n"]
        []) ;;
    tt ;;
    tt.
  
  Definition indirect_access (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::indirect_access()`, that\n> "]
        []) ;;
    tt ;;
    private_function tt ;;
    tt.
  
  Module nested :=
    Definition function (_ : unit) :=
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["called `my_mod::nested::function()`\n"]
          []) ;;
      tt ;;
      tt.
    
    Definition private_function (_ : unit) :=
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["called `my_mod::nested::private_function()`\n"]
          []) ;;
      tt ;;
      tt.
    
    Definition public_function_in_my_mod (_ : unit) :=
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["called `my_mod::nested::public_function_in_my_mod()`, that\n> "]
          []) ;;
      tt ;;
      public_function_in_nested tt ;;
      tt.
    
    Definition public_function_in_nested (_ : unit) :=
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["called `my_mod::nested::public_function_in_nested()`\n"]
          []) ;;
      tt ;;
      tt.
    
    Definition public_function_in_super_mod (_ : unit) :=
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["called `my_mod::nested::public_function_in_super_mod()`\n"]
          []) ;;
      tt ;;
      tt..
  
  Definition call_public_function_in_my_mod (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::call_public_function_in_my_mod()`, that\n> "]
        []) ;;
    tt ;;
    nested.public_function_in_my_mod tt ;;
    _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["> "] []) ;;
    tt ;;
    nested.public_function_in_super_mod tt ;;
    tt.
  
  Definition public_function_in_crate (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::public_function_in_crate()`\n"]
        []) ;;
    tt ;;
    tt.
  
  Module private_nested :=
    Definition function (_ : unit) :=
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["called `my_mod::private_nested::function()`\n"]
          []) ;;
      tt ;;
      tt.
    
    Definition restricted_function (_ : unit) :=
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["called `my_mod::private_nested::restricted_function()`\n"]
          []) ;;
      tt ;;
      tt...

Definition private_function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::private_function()`\n"]
      []) ;;
  tt ;;
  tt.

Definition function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["called `my_mod::function()`\n"] []) ;;
  tt ;;
  tt.

Definition indirect_access (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::indirect_access()`, that\n> "]
      []) ;;
  tt ;;
  private_function tt ;;
  tt.

Module nested :=
  Definition function (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::nested::function()`\n"]
        []) ;;
    tt ;;
    tt.
  
  Definition private_function (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::nested::private_function()`\n"]
        []) ;;
    tt ;;
    tt.
  
  Definition public_function_in_my_mod (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::nested::public_function_in_my_mod()`, that\n> "]
        []) ;;
    tt ;;
    public_function_in_nested tt ;;
    tt.
  
  Definition public_function_in_nested (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::nested::public_function_in_nested()`\n"]
        []) ;;
    tt ;;
    tt.
  
  Definition public_function_in_super_mod (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::nested::public_function_in_super_mod()`\n"]
        []) ;;
    tt ;;
    tt..

Definition function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::nested::function()`\n"]
      []) ;;
  tt ;;
  tt.

Definition private_function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::nested::private_function()`\n"]
      []) ;;
  tt ;;
  tt.

Definition public_function_in_my_mod (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::nested::public_function_in_my_mod()`, that\n> "]
      []) ;;
  tt ;;
  public_function_in_nested tt ;;
  tt.

Definition public_function_in_nested (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::nested::public_function_in_nested()`\n"]
      []) ;;
  tt ;;
  tt.

Definition public_function_in_super_mod (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::nested::public_function_in_super_mod()`\n"]
      []) ;;
  tt ;;
  tt.

Definition call_public_function_in_my_mod (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::call_public_function_in_my_mod()`, that\n> "]
      []) ;;
  tt ;;
  nested.public_function_in_my_mod tt ;;
  _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["> "] []) ;;
  tt ;;
  nested.public_function_in_super_mod tt ;;
  tt.

Definition public_function_in_crate (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::public_function_in_crate()`\n"]
      []) ;;
  tt ;;
  tt.

Module private_nested :=
  Definition function (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::private_nested::function()`\n"]
        []) ;;
    tt ;;
    tt.
  
  Definition restricted_function (_ : unit) :=
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["called `my_mod::private_nested::restricted_function()`\n"]
        []) ;;
    tt ;;
    tt..

Definition function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::private_nested::function()`\n"]
      []) ;;
  tt ;;
  tt.

Definition restricted_function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["called `my_mod::private_nested::restricted_function()`\n"]
      []) ;;
  tt ;;
  tt.

Definition function (_ : unit) :=
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["called `function()`\n"] []) ;;
  tt ;;
  tt.

Definition main (_ : unit) :=
  function tt ;;
  my_mod.function tt ;;
  my_mod.indirect_access tt ;;
  my_mod.nested.function tt ;;
  my_mod.call_public_function_in_my_mod tt ;;
  my_mod.public_function_in_crate tt ;;
  tt.