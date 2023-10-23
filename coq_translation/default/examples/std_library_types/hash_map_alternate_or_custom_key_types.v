(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Account.
  Section Account.
    Context `{State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      username : ref str;
      password : ref str;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_username : Notation.Dot "username" := {
      Notation.dot x := let* x := M.read x in Pure x.(username) : M _;
    }.
    Global Instance Get_AF_username : Notation.DoubleColon t "username" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(username) : M _;
    }.
    Global Instance Get_password : Notation.Dot "password" := {
      Notation.dot x := let* x := M.read x in Pure x.(password) : M _;
    }.
    Global Instance Get_AF_password : Notation.DoubleColon t "password" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(password) : M _;
    }.
  End Account.
End Account.
Definition Account `{State.Trait} : Set := M.val Account.t.

Module
  Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Section
    Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.
    Context `{State.Trait}.
    
    Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.
    
    Global Instance I : core.marker.StructuralPartialEq.Trait Self := {
    }.
  End
    Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Global Hint Resolve I : core.
End
  Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module
  Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Section
    Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.
    Context `{State.Trait}.
    
    Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.
    
    Definition eq
        (self : ref Self)
        (other : ref hash_map_alternate_or_custom_key_types.Account)
        : M bool :=
      let* α0 := deref self hash_map_alternate_or_custom_key_types.Account in
      let* α1 := α0.["username"] in
      let* α2 := borrow α1 (ref str) in
      let* α3 := deref other hash_map_alternate_or_custom_key_types.Account in
      let* α4 := α3.["username"] in
      let* α5 := borrow α4 (ref str) in
      let* α6 := core.cmp.PartialEq.eq α2 α5 in
      let* α7 := deref self hash_map_alternate_or_custom_key_types.Account in
      let* α8 := α7.["password"] in
      let* α9 := borrow α8 (ref str) in
      let* α10 := deref other hash_map_alternate_or_custom_key_types.Account in
      let* α11 := α10.["password"] in
      let* α12 := borrow α11 (ref str) in
      let* α13 := core.cmp.PartialEq.eq α9 α12 in
      and α6 α13.
    
    Global Instance AssociatedFunction_eq : Notation.DoubleColon Self "eq" := {
      Notation.double_colon := eq;
    }.
    
    Global Instance I
      : core.cmp.PartialEq.Trait Self
          (Rhs := core.cmp.PartialEq.Default.Rhs Self)
        := {
      core.cmp.PartialEq.eq := eq;
    }.
  End
    Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Global Hint Resolve I : core.
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module
  Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.
  Section
    Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.
    Context `{State.Trait}.
    
    Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.
    
    Global Instance I : core.marker.StructuralEq.Trait Self := {
    }.
  End
    Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.
  Global Hint Resolve I : core.
End
  Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.
  Section Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.
    Context `{State.Trait}.
    
    Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.
    
    Definition assert_receiver_is_total_eq (self : ref Self) : M unit :=
      let _ := tt in
      let _ := tt in
      Pure tt.
    
    Global Instance AssociatedFunction_assert_receiver_is_total_eq :
      Notation.DoubleColon Self "assert_receiver_is_total_eq" := {
      Notation.double_colon := assert_receiver_is_total_eq;
    }.
    
    Global Instance I : core.cmp.Eq.Trait Self := {
    }.
  End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.
  Global Hint Resolve I : core.
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.
  Section
    Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.
    Context `{State.Trait}.
    
    Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.
    
    Definition hash
        {__H : Set}
        {ℋ_0 : core.hash.Hasher.Trait __H}
        (self : ref Self)
        (state : mut_ref __H)
        : M unit :=
      let* _ :=
        let* α0 := deref self hash_map_alternate_or_custom_key_types.Account in
        let* α1 := α0.["username"] in
        let* α2 := borrow α1 (ref str) in
        let* α3 := deref α2 (ref str) in
        let* α4 := borrow α3 (ref str) in
        let* α5 := deref state _ in
        let* α6 := borrow_mut α5 _ in
        core.hash.Hash.hash α4 α6 in
      let* α0 := deref self hash_map_alternate_or_custom_key_types.Account in
      let* α1 := α0.["password"] in
      let* α2 := borrow α1 (ref str) in
      let* α3 := deref α2 (ref str) in
      let* α4 := borrow α3 (ref str) in
      let* α5 := deref state _ in
      let* α6 := borrow_mut α5 _ in
      core.hash.Hash.hash α4 α6.
    
    Global Instance AssociatedFunction_hash
        {__H : Set}
        {ℋ_0 : core.hash.Hasher.Trait __H} :
      Notation.DoubleColon Self "hash" := {
      Notation.double_colon := hash (__H := __H);
    }.
    
    Global Instance I : core.hash.Hash.Trait Self := {
      core.hash.Hash.hash {__H : Set} {ℋ_0 : core.hash.Hasher.Trait __H}
        :=
        hash (__H := __H);
    }.
  End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.
  Global Hint Resolve I : core.
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.

Module AccountInfo.
  Section AccountInfo.
    Context `{State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      name : ref str;
      email : ref str;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_name : Notation.Dot "name" := {
      Notation.dot x := let* x := M.read x in Pure x.(name) : M _;
    }.
    Global Instance Get_AF_name : Notation.DoubleColon t "name" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(name) : M _;
    }.
    Global Instance Get_email : Notation.Dot "email" := {
      Notation.dot x := let* x := M.read x in Pure x.(email) : M _;
    }.
    Global Instance Get_AF_email : Notation.DoubleColon t "email" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(email) : M _;
    }.
  End AccountInfo.
End AccountInfo.
Definition AccountInfo `{State.Trait} : Set := M.val AccountInfo.t.

Definition Accounts `{State.Trait} : Set :=
  std.collections.hash.map.HashMap
    hash_map_alternate_or_custom_key_types.Account
    hash_map_alternate_or_custom_key_types.AccountInfo
    std.collections.hash.map.HashMap.Default.S.

Definition try_logon
    (accounts : ref hash_map_alternate_or_custom_key_types.Accounts)
    (username : ref str)
    (password : ref str)
    : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "Username: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow username (ref str) in
      let* α5 := deref α4 (ref str) in
      let* α6 := borrow α5 (ref str) in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "Password: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow password (ref str) in
      let* α5 := deref α4 (ref str) in
      let* α6 := borrow α5 (ref str) in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "Attempting logon...
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt in
  let* logon :=
    let* α0 := deref username str in
    let* α1 := borrow α0 str in
    let* α2 := deref password str in
    let* α3 := borrow α2 str in
    M.alloc
      {|
        hash_map_alternate_or_custom_key_types.Account.username := α1;
        hash_map_alternate_or_custom_key_types.Account.password := α3;
      |} in
  let* α0 :=
    deref
      accounts
      (std.collections.hash.map.HashMap
        hash_map_alternate_or_custom_key_types.Account
        hash_map_alternate_or_custom_key_types.AccountInfo
        std.collections.hash.map.RandomState) in
  let* α1 :=
    borrow
      α0
      (std.collections.hash.map.HashMap
        hash_map_alternate_or_custom_key_types.Account
        hash_map_alternate_or_custom_key_types.AccountInfo
        std.collections.hash.map.RandomState) in
  let* α2 := borrow logon hash_map_alternate_or_custom_key_types.Account in
  let* α3 := deref α2 hash_map_alternate_or_custom_key_types.Account in
  let* α4 := borrow α3 hash_map_alternate_or_custom_key_types.Account in
  let* α5 := (std.collections.hash.map.HashMap _ _ _)::["get"] α1 α4 in
  match α5 with
  | core.option.Option account_info =>
    let* _ :=
      let* _ :=
        let* α0 := borrow [ mk_str "Successful logon!
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := core.fmt.Arguments::["new_const"] α3 in
        std.io.stdio._print α4 in
      Pure tt in
    let* _ :=
      let* _ :=
        let* α0 := borrow [ mk_str "Name: "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 :=
          deref
            account_info
            hash_map_alternate_or_custom_key_types.AccountInfo in
        let* α5 := α4.["name"] in
        let* α6 := borrow α5 (ref str) in
        let* α7 := deref α6 (ref str) in
        let* α8 := borrow α7 (ref str) in
        let* α9 := core.fmt.rt.Argument::["new_display"] α8 in
        let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
        let* α11 := deref α10 (list core.fmt.rt.Argument) in
        let* α12 := borrow α11 (list core.fmt.rt.Argument) in
        let* α13 := pointer_coercion "Unsize" α12 in
        let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
        std.io.stdio._print α14 in
      Pure tt in
    let* _ :=
      let* _ :=
        let* α0 := borrow [ mk_str "Email: "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 :=
          deref
            account_info
            hash_map_alternate_or_custom_key_types.AccountInfo in
        let* α5 := α4.["email"] in
        let* α6 := borrow α5 (ref str) in
        let* α7 := deref α6 (ref str) in
        let* α8 := borrow α7 (ref str) in
        let* α9 := core.fmt.rt.Argument::["new_display"] α8 in
        let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
        let* α11 := deref α10 (list core.fmt.rt.Argument) in
        let* α12 := borrow α11 (list core.fmt.rt.Argument) in
        let* α13 := pointer_coercion "Unsize" α12 in
        let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
        std.io.stdio._print α14 in
      Pure tt in
    Pure tt
  | _ =>
    let* _ :=
      let* α0 := borrow [ mk_str "Login failed!
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* accounts :=
    (std.collections.hash.map.HashMap
          _
          _
          std.collections.hash.map.RandomState)::["new"] in
  let* account :=
    let* α0 := deref (mk_str "j.everyman") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "password123") str in
    let* α3 := borrow α2 str in
    M.alloc
      {|
        hash_map_alternate_or_custom_key_types.Account.username := α1;
        hash_map_alternate_or_custom_key_types.Account.password := α3;
      |} in
  let* account_info :=
    let* α0 := deref (mk_str "John Everyman") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "j.everyman@email.com") str in
    let* α3 := borrow α2 str in
    M.alloc
      {|
        hash_map_alternate_or_custom_key_types.AccountInfo.name := α1;
        hash_map_alternate_or_custom_key_types.AccountInfo.email := α3;
      |} in
  let* _ :=
    let* α0 :=
      borrow_mut
        accounts
        (std.collections.hash.map.HashMap
          hash_map_alternate_or_custom_key_types.Account
          hash_map_alternate_or_custom_key_types.AccountInfo
          std.collections.hash.map.RandomState) in
    (std.collections.hash.map.HashMap _ _ _)::["insert"]
      α0
      account
      account_info in
  let* _ :=
    let* α0 :=
      borrow
        accounts
        (std.collections.hash.map.HashMap
          hash_map_alternate_or_custom_key_types.Account
          hash_map_alternate_or_custom_key_types.AccountInfo
          std.collections.hash.map.RandomState) in
    let* α1 :=
      deref
        α0
        (std.collections.hash.map.HashMap
          hash_map_alternate_or_custom_key_types.Account
          hash_map_alternate_or_custom_key_types.AccountInfo
          std.collections.hash.map.RandomState) in
    let* α2 :=
      borrow
        α1
        (std.collections.hash.map.HashMap
          hash_map_alternate_or_custom_key_types.Account
          hash_map_alternate_or_custom_key_types.AccountInfo
          std.collections.hash.map.RandomState) in
    let* α3 := deref (mk_str "j.everyman") str in
    let* α4 := borrow α3 str in
    let* α5 := deref (mk_str "psasword123") str in
    let* α6 := borrow α5 str in
    hash_map_alternate_or_custom_key_types.try_logon α2 α4 α6 in
  let* _ :=
    let* α0 :=
      borrow
        accounts
        (std.collections.hash.map.HashMap
          hash_map_alternate_or_custom_key_types.Account
          hash_map_alternate_or_custom_key_types.AccountInfo
          std.collections.hash.map.RandomState) in
    let* α1 :=
      deref
        α0
        (std.collections.hash.map.HashMap
          hash_map_alternate_or_custom_key_types.Account
          hash_map_alternate_or_custom_key_types.AccountInfo
          std.collections.hash.map.RandomState) in
    let* α2 :=
      borrow
        α1
        (std.collections.hash.map.HashMap
          hash_map_alternate_or_custom_key_types.Account
          hash_map_alternate_or_custom_key_types.AccountInfo
          std.collections.hash.map.RandomState) in
    let* α3 := deref (mk_str "j.everyman") str in
    let* α4 := borrow α3 str in
    let* α5 := deref (mk_str "password123") str in
    let* α6 := borrow α5 str in
    hash_map_alternate_or_custom_key_types.try_logon α2 α4 α6 in
  Pure tt.
