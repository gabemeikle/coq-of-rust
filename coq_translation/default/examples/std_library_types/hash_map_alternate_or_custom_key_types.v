(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Account.
Section Account.
  Context `{ℋ : State.Trait}.
  
  Record t : Set := {
    username : ref str;
    password : ref str;
  }.
  
  Global Instance Get_username : Notation.Dot "username" := {
    Notation.dot x := let* x := M.read x in M.pure x.(username) : M _;
  }.
  Global Instance Get_AF_username : Notation.DoubleColon t "username" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(username) : M _;
  }.
  Global Instance Get_password : Notation.Dot "password" := {
    Notation.dot x := let* x := M.read x in M.pure x.(password) : M _;
  }.
  Global Instance Get_AF_password : Notation.DoubleColon t "password" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(password) : M _;
  }.
End Account.
End Account.
Definition Account `{ℋ : State.Trait} : Set := M.Val Account.t.

Module  Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.
Section Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.
End Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module  Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.
Section Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.
  
  Definition eq
      (self : ref Self)
      (other : ref hash_map_alternate_or_custom_key_types.Account)
      : M bool :=
    M.function_body
      (let* α0 : ltac:(refine hash_map_alternate_or_custom_key_types.Account) :=
        deref self in
      let* α1 : ltac:(refine (ref str)) := α0.["username"] in
      let* α2 : ltac:(refine (ref (ref str))) := borrow α1 in
      let* α3 : ltac:(refine hash_map_alternate_or_custom_key_types.Account) :=
        deref other in
      let* α4 : ltac:(refine (ref str)) := α3.["username"] in
      let* α5 : ltac:(refine (ref (ref str))) := borrow α4 in
      let* α6 : ltac:(refine bool) :=
        (core.cmp.PartialEq.eq (Self := ref str) (Trait := ltac:(refine _)))
          α2
          α5 in
      let* α7 : ltac:(refine hash_map_alternate_or_custom_key_types.Account) :=
        deref self in
      let* α8 : ltac:(refine (ref str)) := α7.["password"] in
      let* α9 : ltac:(refine (ref (ref str))) := borrow α8 in
      let* α10 : ltac:(refine hash_map_alternate_or_custom_key_types.Account) :=
        deref other in
      let* α11 : ltac:(refine (ref str)) := α10.["password"] in
      let* α12 : ltac:(refine (ref (ref str))) := borrow α11 in
      let* α13 : ltac:(refine bool) :=
        (core.cmp.PartialEq.eq (Self := ref str) (Trait := ltac:(refine _)))
          α9
          α12 in
      BinOp.and α6 α13).
  
  Global Instance AssociatedFunction_eq : Notation.DoubleColon Self "eq" := {
    Notation.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module  Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.
Section Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.
End Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.

Module  Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.
Section Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.
  
  Definition assert_receiver_is_total_eq (self : ref Self) : M unit :=
    M.function_body
      (let* _ : ltac:(refine unit) := M.alloc tt in
      let* _ : ltac:(refine unit) := M.alloc tt in
      M.alloc tt).
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notation.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notation.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.

Module  Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.
Section Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.
  
  Definition hash
      {__H : Set}
      {ℋ_0 : core.hash.Hasher.Trait __H}
      (self : ref Self)
      (state : mut_ref __H)
      : M unit :=
    M.function_body
      (let* _ : ltac:(refine unit) :=
        let* α0 :
            ltac:(refine hash_map_alternate_or_custom_key_types.Account) :=
          deref self in
        let* α1 : ltac:(refine (ref str)) := α0.["username"] in
        let* α2 : ltac:(refine (ref (ref str))) := borrow α1 in
        let* α3 : ltac:(refine (ref str)) := deref α2 in
        let* α4 : ltac:(refine (ref (ref str))) := borrow α3 in
        let* α5 : ltac:(refine __H) := deref state in
        let* α6 : ltac:(refine (mut_ref __H)) := borrow_mut α5 in
        (core.hash.Hash.hash (Self := ref str) (Trait := ltac:(refine _)))
          α4
          α6 in
      let* α0 : ltac:(refine hash_map_alternate_or_custom_key_types.Account) :=
        deref self in
      let* α1 : ltac:(refine (ref str)) := α0.["password"] in
      let* α2 : ltac:(refine (ref (ref str))) := borrow α1 in
      let* α3 : ltac:(refine (ref str)) := deref α2 in
      let* α4 : ltac:(refine (ref (ref str))) := borrow α3 in
      let* α5 : ltac:(refine __H) := deref state in
      let* α6 : ltac:(refine (mut_ref __H)) := borrow_mut α5 in
      (core.hash.Hash.hash (Self := ref str) (Trait := ltac:(refine _))) α4 α6).
  
  Global Instance AssociatedFunction_hash
      {__H : Set}
      {ℋ_0 : core.hash.Hasher.Trait __H} :
    Notation.DoubleColon Self "hash" := {
    Notation.double_colon := hash (__H := __H);
  }.
  
  Global Instance ℐ : core.hash.Hash.Required.Trait Self := {
    core.hash.Hash.hash {__H : Set} {ℋ_0 : core.hash.Hasher.Trait __H} :=
      hash (__H := __H);
    core.hash.Hash.hash_slice := Datatypes.None;
  }.
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.

Module  AccountInfo.
Section AccountInfo.
  Context `{ℋ : State.Trait}.
  
  Record t : Set := {
    name : ref str;
    email : ref str;
  }.
  
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot x := let* x := M.read x in M.pure x.(name) : M _;
  }.
  Global Instance Get_AF_name : Notation.DoubleColon t "name" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(name) : M _;
  }.
  Global Instance Get_email : Notation.Dot "email" := {
    Notation.dot x := let* x := M.read x in M.pure x.(email) : M _;
  }.
  Global Instance Get_AF_email : Notation.DoubleColon t "email" := {
    Notation.double_colon x := let* x := M.read x in M.pure x.(email) : M _;
  }.
End AccountInfo.
End AccountInfo.
Definition AccountInfo `{ℋ : State.Trait} : Set := M.Val AccountInfo.t.

Ltac Accounts :=
  refine
    (std.collections.hash.map.HashMap
      hash_map_alternate_or_custom_key_types.Account
      hash_map_alternate_or_custom_key_types.AccountInfo
      std.collections.hash.map.HashMap.Default.S).

Definition try_logon
    `{ℋ : State.Trait}
    (accounts : ref ltac:(hash_map_alternate_or_custom_key_types.Accounts))
    (username : ref str)
    (password : ref str)
    : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "Username: "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (ref str))) := borrow username in
        let* α6 : ltac:(refine (ref str)) := deref α5 in
        let* α7 : ltac:(refine (ref (ref str))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "Password: "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (ref str))) := borrow password in
        let* α6 : ltac:(refine (ref str)) := deref α5 in
        let* α7 : ltac:(refine (ref (ref str))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "Attempting logon...
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_const"] α4 in
        std.io.stdio._print α5 in
      M.alloc tt in
    let* logon : ltac:(refine hash_map_alternate_or_custom_key_types.Account) :=
      let* α0 : ltac:(refine str) := deref username in
      let* α1 : ltac:(refine (ref str)) := borrow α0 in
      let* α2 : ltac:(refine str) := deref password in
      let* α3 : ltac:(refine (ref str)) := borrow α2 in
      M.alloc
        {|
          hash_map_alternate_or_custom_key_types.Account.username := α1;
          hash_map_alternate_or_custom_key_types.Account.password := α3;
        |} in
    let* α0 :
        ltac:(refine
          (std.collections.hash.map.HashMap
            hash_map_alternate_or_custom_key_types.Account
            hash_map_alternate_or_custom_key_types.AccountInfo
            std.collections.hash.map.RandomState)) :=
      deref accounts in
    let* α1 :
        ltac:(refine
          (ref
            (std.collections.hash.map.HashMap
              hash_map_alternate_or_custom_key_types.Account
              hash_map_alternate_or_custom_key_types.AccountInfo
              std.collections.hash.map.RandomState))) :=
      borrow α0 in
    let* α2 :
        ltac:(refine (ref hash_map_alternate_or_custom_key_types.Account)) :=
      borrow logon in
    let* α3 : ltac:(refine hash_map_alternate_or_custom_key_types.Account) :=
      deref α2 in
    let* α4 :
        ltac:(refine (ref hash_map_alternate_or_custom_key_types.Account)) :=
      borrow α3 in
    let* α5 :
        ltac:(refine
          (core.option.Option
            (ref hash_map_alternate_or_custom_key_types.AccountInfo))) :=
      (std.collections.hash.map.HashMap
            hash_map_alternate_or_custom_key_types.Account
            hash_map_alternate_or_custom_key_types.AccountInfo
            std.collections.hash.map.RandomState)::["get"]
        α1
        α4 in
    let* α6 := M.read α5 in
    match α6 with
    | core.option.Option.Some account_info =>
      let* _ : ltac:(refine unit) :=
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine (array (ref str))) :=
            M.alloc [ mk_str "Successful logon!
" ] in
          let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
          let* α2 : ltac:(refine (array (ref str))) := deref α1 in
          let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
          let* α4 : ltac:(refine (ref (slice (ref str)))) :=
            pointer_coercion "Unsize" α3 in
          let* α5 : ltac:(refine core.fmt.Arguments) :=
            core.fmt.Arguments::["new_const"] α4 in
          std.io.stdio._print α5 in
        M.alloc tt in
      let* _ : ltac:(refine unit) :=
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine (array (ref str))) :=
            M.alloc [ mk_str "Name: "; mk_str "
" ] in
          let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
          let* α2 : ltac:(refine (array (ref str))) := deref α1 in
          let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
          let* α4 : ltac:(refine (ref (slice (ref str)))) :=
            pointer_coercion "Unsize" α3 in
          let* α5 :
              ltac:(refine
                hash_map_alternate_or_custom_key_types.AccountInfo) :=
            deref account_info in
          let* α6 : ltac:(refine (ref str)) := α5.["name"] in
          let* α7 : ltac:(refine (ref (ref str))) := borrow α6 in
          let* α8 : ltac:(refine (ref str)) := deref α7 in
          let* α9 : ltac:(refine (ref (ref str))) := borrow α8 in
          let* α10 : ltac:(refine core.fmt.rt.Argument) :=
            core.fmt.rt.Argument::["new_display"] α9 in
          let* α11 : ltac:(refine (array core.fmt.rt.Argument)) :=
            M.alloc [ α10 ] in
          let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
            borrow α11 in
          let* α13 : ltac:(refine (array core.fmt.rt.Argument)) := deref α12 in
          let* α14 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
            borrow α13 in
          let* α15 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
            pointer_coercion "Unsize" α14 in
          let* α16 : ltac:(refine core.fmt.Arguments) :=
            core.fmt.Arguments::["new_v1"] α4 α15 in
          std.io.stdio._print α16 in
        M.alloc tt in
      let* _ : ltac:(refine unit) :=
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine (array (ref str))) :=
            M.alloc [ mk_str "Email: "; mk_str "
" ] in
          let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
          let* α2 : ltac:(refine (array (ref str))) := deref α1 in
          let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
          let* α4 : ltac:(refine (ref (slice (ref str)))) :=
            pointer_coercion "Unsize" α3 in
          let* α5 :
              ltac:(refine
                hash_map_alternate_or_custom_key_types.AccountInfo) :=
            deref account_info in
          let* α6 : ltac:(refine (ref str)) := α5.["email"] in
          let* α7 : ltac:(refine (ref (ref str))) := borrow α6 in
          let* α8 : ltac:(refine (ref str)) := deref α7 in
          let* α9 : ltac:(refine (ref (ref str))) := borrow α8 in
          let* α10 : ltac:(refine core.fmt.rt.Argument) :=
            core.fmt.rt.Argument::["new_display"] α9 in
          let* α11 : ltac:(refine (array core.fmt.rt.Argument)) :=
            M.alloc [ α10 ] in
          let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
            borrow α11 in
          let* α13 : ltac:(refine (array core.fmt.rt.Argument)) := deref α12 in
          let* α14 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
            borrow α13 in
          let* α15 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
            pointer_coercion "Unsize" α14 in
          let* α16 : ltac:(refine core.fmt.Arguments) :=
            core.fmt.Arguments::["new_v1"] α4 α15 in
          std.io.stdio._print α16 in
        M.alloc tt in
      M.alloc tt
    | _ =>
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "Login failed!
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_const"] α4 in
        std.io.stdio._print α5 in
      M.alloc tt
    end).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* accounts :
        ltac:(refine
          (std.collections.hash.map.HashMap
            hash_map_alternate_or_custom_key_types.Account
            hash_map_alternate_or_custom_key_types.AccountInfo
            std.collections.hash.map.RandomState)) :=
      (std.collections.hash.map.HashMap
          hash_map_alternate_or_custom_key_types.Account
          hash_map_alternate_or_custom_key_types.AccountInfo
          std.collections.hash.map.RandomState)::["new"] in
    let* account :
        ltac:(refine hash_map_alternate_or_custom_key_types.Account) :=
      let* α0 : ltac:(refine str) := deref (mk_str "j.everyman") in
      let* α1 : ltac:(refine (ref str)) := borrow α0 in
      let* α2 : ltac:(refine str) := deref (mk_str "password123") in
      let* α3 : ltac:(refine (ref str)) := borrow α2 in
      M.alloc
        {|
          hash_map_alternate_or_custom_key_types.Account.username := α1;
          hash_map_alternate_or_custom_key_types.Account.password := α3;
        |} in
    let* account_info :
        ltac:(refine hash_map_alternate_or_custom_key_types.AccountInfo) :=
      let* α0 : ltac:(refine str) := deref (mk_str "John Everyman") in
      let* α1 : ltac:(refine (ref str)) := borrow α0 in
      let* α2 : ltac:(refine str) := deref (mk_str "j.everyman@email.com") in
      let* α3 : ltac:(refine (ref str)) := borrow α2 in
      M.alloc
        {|
          hash_map_alternate_or_custom_key_types.AccountInfo.name := α1;
          hash_map_alternate_or_custom_key_types.AccountInfo.email := α3;
        |} in
    let* _ :
        ltac:(refine
          (core.option.Option
            hash_map_alternate_or_custom_key_types.AccountInfo)) :=
      let* α0 :
          ltac:(refine
            (mut_ref
              (std.collections.hash.map.HashMap
                hash_map_alternate_or_custom_key_types.Account
                hash_map_alternate_or_custom_key_types.AccountInfo
                std.collections.hash.map.RandomState))) :=
        borrow_mut accounts in
      (std.collections.hash.map.HashMap
            hash_map_alternate_or_custom_key_types.Account
            hash_map_alternate_or_custom_key_types.AccountInfo
            std.collections.hash.map.RandomState)::["insert"]
        α0
        account
        account_info in
    let* _ : ltac:(refine unit) :=
      let* α0 :
          ltac:(refine
            (ref
              (std.collections.hash.map.HashMap
                hash_map_alternate_or_custom_key_types.Account
                hash_map_alternate_or_custom_key_types.AccountInfo
                std.collections.hash.map.RandomState))) :=
        borrow accounts in
      let* α1 :
          ltac:(refine
            (std.collections.hash.map.HashMap
              hash_map_alternate_or_custom_key_types.Account
              hash_map_alternate_or_custom_key_types.AccountInfo
              std.collections.hash.map.RandomState)) :=
        deref α0 in
      let* α2 :
          ltac:(refine
            (ref
              (std.collections.hash.map.HashMap
                hash_map_alternate_or_custom_key_types.Account
                hash_map_alternate_or_custom_key_types.AccountInfo
                std.collections.hash.map.RandomState))) :=
        borrow α1 in
      let* α3 : ltac:(refine str) := deref (mk_str "j.everyman") in
      let* α4 : ltac:(refine (ref str)) := borrow α3 in
      let* α5 : ltac:(refine str) := deref (mk_str "psasword123") in
      let* α6 : ltac:(refine (ref str)) := borrow α5 in
      hash_map_alternate_or_custom_key_types.try_logon α2 α4 α6 in
    let* _ : ltac:(refine unit) :=
      let* α0 :
          ltac:(refine
            (ref
              (std.collections.hash.map.HashMap
                hash_map_alternate_or_custom_key_types.Account
                hash_map_alternate_or_custom_key_types.AccountInfo
                std.collections.hash.map.RandomState))) :=
        borrow accounts in
      let* α1 :
          ltac:(refine
            (std.collections.hash.map.HashMap
              hash_map_alternate_or_custom_key_types.Account
              hash_map_alternate_or_custom_key_types.AccountInfo
              std.collections.hash.map.RandomState)) :=
        deref α0 in
      let* α2 :
          ltac:(refine
            (ref
              (std.collections.hash.map.HashMap
                hash_map_alternate_or_custom_key_types.Account
                hash_map_alternate_or_custom_key_types.AccountInfo
                std.collections.hash.map.RandomState))) :=
        borrow α1 in
      let* α3 : ltac:(refine str) := deref (mk_str "j.everyman") in
      let* α4 : ltac:(refine (ref str)) := borrow α3 in
      let* α5 : ltac:(refine str) := deref (mk_str "password123") in
      let* α6 : ltac:(refine (ref str)) := borrow α5 in
      hash_map_alternate_or_custom_key_types.try_logon α2 α4 α6 in
    M.alloc tt).
