(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Account.
Section Account.
  Record t : Set := {
    username : ref str.t;
    password : ref str.t;
  }.
  
  Global Instance Get_username : Notations.Dot "username" := {
    Notations.dot :=
      Ref.map (fun x => x.(username)) (fun v x => x <| username := v |>);
  }.
  Global Instance Get_AF_username : Notations.DoubleColon t "username" := {
    Notations.double_colon (x : M.Val t) := x.["username"];
  }.
  Global Instance Get_password : Notations.Dot "password" := {
    Notations.dot :=
      Ref.map (fun x => x.(password)) (fun v x => x <| password := v |>);
  }.
  Global Instance Get_AF_password : Notations.DoubleColon t "password" := {
    Notations.double_colon (x : M.Val t) := x.["password"];
  }.
End Account.
End Account.

Module  Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
Section Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
  Ltac Self := exact hash_map_alternate_or_custom_key_types.Account.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait ltac:(Self) := {
  }.
End Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
End Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.

Module  Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
Section Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
  Ltac Self := exact hash_map_alternate_or_custom_key_types.Account.t.
  
  (*
  PartialEq
  *)
  Definition eq
      (self : ref ltac:(Self))
      (other : ref hash_map_alternate_or_custom_key_types.Account.t)
      : M bool.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* other : M.Val (ref hash_map_alternate_or_custom_key_types.Account.t) :=
      M.alloc other in
    M.function_body
      (let* α0 : ref hash_map_alternate_or_custom_key_types.Account.t :=
        M.read self in
      let* α1 : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
        deref α0 in
      let* α2 : ref (ref str.t) := borrow α1.["username"] in
      let* α3 : ref hash_map_alternate_or_custom_key_types.Account.t :=
        M.read other in
      let* α4 : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
        deref α3 in
      let* α5 : ref (ref str.t) := borrow α4.["username"] in
      let* α6 : bool.t :=
        (core.cmp.PartialEq.eq (Self := ref str.t) (Trait := ltac:(refine _)))
          α2
          α5 in
      let* α7 : M.Val bool.t := M.alloc α6 in
      let* α8 : ref hash_map_alternate_or_custom_key_types.Account.t :=
        M.read self in
      let* α9 : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
        deref α8 in
      let* α10 : ref (ref str.t) := borrow α9.["password"] in
      let* α11 : ref hash_map_alternate_or_custom_key_types.Account.t :=
        M.read other in
      let* α12 : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
        deref α11 in
      let* α13 : ref (ref str.t) := borrow α12.["password"] in
      let* α14 : bool.t :=
        (core.cmp.PartialEq.eq (Self := ref str.t) (Trait := ltac:(refine _)))
          α10
          α13 in
      let* α15 : M.Val bool.t := M.alloc α14 in
      let* α0 : M.Val bool.t := BinOp.and α7 α15 in
      M.read α0).
  
  Global Instance AssociatedFunction_eq :
    Notations.DoubleColon ltac:(Self) "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait ltac:(Self)
      (Rhs := core.cmp.PartialEq.Default.Rhs ltac:(Self)) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.

Module  Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account_t.
Section Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account_t.
  Ltac Self := exact hash_map_alternate_or_custom_key_types.Account.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait ltac:(Self) := {
  }.
End Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account_t.
End Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account_t.

Module  Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account_t.
Section Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account_t.
  Ltac Self := exact hash_map_alternate_or_custom_key_types.Account.t.
  
  (*
  Eq
  *)
  Definition assert_receiver_is_total_eq (self : ref ltac:(Self)) : M unit :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    M.function_body
      (let* _ : M.Val unit := M.alloc tt in
      let* _ : M.Val unit := M.alloc tt in
      let* α0 : M.Val unit := M.alloc tt in
      M.read α0).
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon ltac:(Self) "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait ltac:(Self) := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account_t.
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account_t.

Module  Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account_t.
Section Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account_t.
  Ltac Self := exact hash_map_alternate_or_custom_key_types.Account.t.
  
  (*
  Hash
  *)
  Definition hash
      {__H : Set}
      {ℋ_0 : core.hash.Hasher.Trait __H}
      (self : ref ltac:(Self))
      (state : mut_ref __H)
      : M unit :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* state : M.Val (mut_ref __H) := M.alloc state in
    M.function_body
      (let* _ : M.Val unit :=
        let* α0 : ref hash_map_alternate_or_custom_key_types.Account.t :=
          M.read self in
        let* α1 : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
          deref α0 in
        let* α2 : ref (ref str.t) := borrow α1.["username"] in
        let* α3 : M.Val (ref str.t) := deref α2 in
        let* α4 : ref (ref str.t) := borrow α3 in
        let* α5 : mut_ref __H := M.read state in
        let* α6 : M.Val __H := deref α5 in
        let* α7 : mut_ref __H := borrow_mut α6 in
        let* α8 : unit :=
          (core.hash.Hash.hash (Self := ref str.t) (Trait := ltac:(refine _)))
            α4
            α7 in
        M.alloc α8 in
      let* α0 : ref hash_map_alternate_or_custom_key_types.Account.t :=
        M.read self in
      let* α1 : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
        deref α0 in
      let* α2 : ref (ref str.t) := borrow α1.["password"] in
      let* α3 : M.Val (ref str.t) := deref α2 in
      let* α4 : ref (ref str.t) := borrow α3 in
      let* α5 : mut_ref __H := M.read state in
      let* α6 : M.Val __H := deref α5 in
      let* α7 : mut_ref __H := borrow_mut α6 in
      let* α8 : unit :=
        (core.hash.Hash.hash (Self := ref str.t) (Trait := ltac:(refine _)))
          α4
          α7 in
      let* α0 : M.Val unit := M.alloc α8 in
      M.read α0).
  
  Global Instance AssociatedFunction_hash
      {__H : Set}
      {ℋ_0 : core.hash.Hasher.Trait __H} :
    Notations.DoubleColon ltac:(Self) "hash" := {
    Notations.double_colon := hash (__H := __H);
  }.
  
  Global Instance ℐ : core.hash.Hash.Required.Trait ltac:(Self) := {
    core.hash.Hash.hash {__H : Set} {ℋ_0 : core.hash.Hasher.Trait __H} :=
      hash (__H := __H);
    core.hash.Hash.hash_slice := Datatypes.None;
  }.
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account_t.
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account_t.

Module  AccountInfo.
Section AccountInfo.
  Record t : Set := {
    name : ref str.t;
    email : ref str.t;
  }.
  
  Global Instance Get_name : Notations.Dot "name" := {
    Notations.dot := Ref.map (fun x => x.(name)) (fun v x => x <| name := v |>);
  }.
  Global Instance Get_AF_name : Notations.DoubleColon t "name" := {
    Notations.double_colon (x : M.Val t) := x.["name"];
  }.
  Global Instance Get_email : Notations.Dot "email" := {
    Notations.dot :=
      Ref.map (fun x => x.(email)) (fun v x => x <| email := v |>);
  }.
  Global Instance Get_AF_email : Notations.DoubleColon t "email" := {
    Notations.double_colon (x : M.Val t) := x.["email"];
  }.
End AccountInfo.
End AccountInfo.

Ltac Accounts :=
  exact
    (std.collections.hash.map.HashMap.t
      hash_map_alternate_or_custom_key_types.Account.t
      hash_map_alternate_or_custom_key_types.AccountInfo.t
      std.collections.hash.map.HashMap.Default.S).

(*
fn try_logon<'a>(accounts: &Accounts<'a>, username: &'a str, password: &'a str) {
    println!("Username: {}", username);
    println!("Password: {}", password);
    println!("Attempting logon...");

    let logon = Account { username, password };

    match accounts.get(&logon) {
        Some(account_info) => {
            println!("Successful logon!");
            println!("Name: {}", account_info.name);
            println!("Email: {}", account_info.email);
        }
        _ => println!("Login failed!"),
    }
}
*)
Definition try_logon
    (accounts : ref ltac:(hash_map_alternate_or_custom_key_types.Accounts))
    (username : ref str.t)
    (password : ref str.t)
    : M unit :=
  let* accounts :
      M.Val (ref ltac:(hash_map_alternate_or_custom_key_types.Accounts)) :=
    M.alloc accounts in
  let* username : M.Val (ref str.t) := M.alloc username in
  let* password : M.Val (ref str.t) := M.alloc password in
  M.function_body
    (let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Username: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (ref str.t) := borrow username in
        let* α8 : M.Val (ref str.t) := deref α7 in
        let* α9 : ref (ref str.t) := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
        let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Password: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref (ref str.t) := borrow password in
        let* α8 : M.Val (ref str.t) := deref α7 in
        let* α9 : ref (ref str.t) := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
        let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Attempting logon...
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_const"] α6 in
        let* α8 : unit := std.io.stdio._print α7 in
        M.alloc α8 in
      M.alloc tt in
    let* logon : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
      let* α0 : ref str.t := M.read username in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : ref str.t := M.read password in
      let* α4 : M.Val str.t := deref α3 in
      let* α5 : ref str.t := borrow α4 in
      M.alloc
        {|
          hash_map_alternate_or_custom_key_types.Account.username := α2;
          hash_map_alternate_or_custom_key_types.Account.password := α5;
        |} in
    let* α0 :
        ref
          (std.collections.hash.map.HashMap.t
            hash_map_alternate_or_custom_key_types.Account.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t
            std.collections.hash.map.RandomState.t) :=
      M.read accounts in
    let* α1 :
        M.Val
          (std.collections.hash.map.HashMap.t
            hash_map_alternate_or_custom_key_types.Account.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t
            std.collections.hash.map.RandomState.t) :=
      deref α0 in
    let* α2 :
        ref
          (std.collections.hash.map.HashMap.t
            hash_map_alternate_or_custom_key_types.Account.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t
            std.collections.hash.map.RandomState.t) :=
      borrow α1 in
    let* α3 : ref hash_map_alternate_or_custom_key_types.Account.t :=
      borrow logon in
    let* α4 : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
      deref α3 in
    let* α5 : ref hash_map_alternate_or_custom_key_types.Account.t :=
      borrow α4 in
    let* α6 :
        core.option.Option.t
          (ref hash_map_alternate_or_custom_key_types.AccountInfo.t) :=
      (std.collections.hash.map.HashMap.t
            hash_map_alternate_or_custom_key_types.Account.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t
            std.collections.hash.map.RandomState.t)::["get"]
        α2
        α5 in
    let* α7 :
        M.Val
          (core.option.Option.t
            (ref hash_map_alternate_or_custom_key_types.AccountInfo.t)) :=
      M.alloc α6 in
    let* α8 := M.read α7 in
    let* α0 : M.Val unit :=
      match α8 with
      | core.option.Option.Some account_info =>
        let* account_info := M.alloc account_info in
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : M.Val (array (ref str.t)) :=
              M.alloc [ mk_str "Successful logon!
" ] in
            let* α1 : ref (array (ref str.t)) := borrow α0 in
            let* α2 : M.Val (array (ref str.t)) := deref α1 in
            let* α3 : ref (array (ref str.t)) := borrow α2 in
            let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
            let* α5 : M.Val (ref (slice (ref str.t))) :=
              pointer_coercion "Unsize" α4 in
            let* α6 : ref (slice (ref str.t)) := M.read α5 in
            let* α7 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_const"] α6 in
            let* α8 : unit := std.io.stdio._print α7 in
            M.alloc α8 in
          M.alloc tt in
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : M.Val (array (ref str.t)) :=
              M.alloc [ mk_str "Name: "; mk_str "
" ] in
            let* α1 : ref (array (ref str.t)) := borrow α0 in
            let* α2 : M.Val (array (ref str.t)) := deref α1 in
            let* α3 : ref (array (ref str.t)) := borrow α2 in
            let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
            let* α5 : M.Val (ref (slice (ref str.t))) :=
              pointer_coercion "Unsize" α4 in
            let* α6 : ref (slice (ref str.t)) := M.read α5 in
            let* α7 :
                ref hash_map_alternate_or_custom_key_types.AccountInfo.t :=
              M.read account_info in
            let* α8 :
                M.Val hash_map_alternate_or_custom_key_types.AccountInfo.t :=
              deref α7 in
            let* α9 : ref (ref str.t) := borrow α8.["name"] in
            let* α10 : M.Val (ref str.t) := deref α9 in
            let* α11 : ref (ref str.t) := borrow α10 in
            let* α12 : core.fmt.rt.Argument.t :=
              core.fmt.rt.Argument.t::["new_display"] α11 in
            let* α13 : M.Val core.fmt.rt.Argument.t := M.alloc α12 in
            let* α14 : M.Val (array core.fmt.rt.Argument.t) :=
              M.alloc [ α13 ] in
            let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
            let* α16 : M.Val (array core.fmt.rt.Argument.t) := deref α15 in
            let* α17 : ref (array core.fmt.rt.Argument.t) := borrow α16 in
            let* α18 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc α17 in
            let* α19 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
              pointer_coercion "Unsize" α18 in
            let* α20 : ref (slice core.fmt.rt.Argument.t) := M.read α19 in
            let* α21 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_v1"] α6 α20 in
            let* α22 : unit := std.io.stdio._print α21 in
            M.alloc α22 in
          M.alloc tt in
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : M.Val (array (ref str.t)) :=
              M.alloc [ mk_str "Email: "; mk_str "
" ] in
            let* α1 : ref (array (ref str.t)) := borrow α0 in
            let* α2 : M.Val (array (ref str.t)) := deref α1 in
            let* α3 : ref (array (ref str.t)) := borrow α2 in
            let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
            let* α5 : M.Val (ref (slice (ref str.t))) :=
              pointer_coercion "Unsize" α4 in
            let* α6 : ref (slice (ref str.t)) := M.read α5 in
            let* α7 :
                ref hash_map_alternate_or_custom_key_types.AccountInfo.t :=
              M.read account_info in
            let* α8 :
                M.Val hash_map_alternate_or_custom_key_types.AccountInfo.t :=
              deref α7 in
            let* α9 : ref (ref str.t) := borrow α8.["email"] in
            let* α10 : M.Val (ref str.t) := deref α9 in
            let* α11 : ref (ref str.t) := borrow α10 in
            let* α12 : core.fmt.rt.Argument.t :=
              core.fmt.rt.Argument.t::["new_display"] α11 in
            let* α13 : M.Val core.fmt.rt.Argument.t := M.alloc α12 in
            let* α14 : M.Val (array core.fmt.rt.Argument.t) :=
              M.alloc [ α13 ] in
            let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
            let* α16 : M.Val (array core.fmt.rt.Argument.t) := deref α15 in
            let* α17 : ref (array core.fmt.rt.Argument.t) := borrow α16 in
            let* α18 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc α17 in
            let* α19 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
              pointer_coercion "Unsize" α18 in
            let* α20 : ref (slice core.fmt.rt.Argument.t) := M.read α19 in
            let* α21 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_v1"] α6 α20 in
            let* α22 : unit := std.io.stdio._print α21 in
            M.alloc α22 in
          M.alloc tt in
        M.alloc tt
      | _ =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "Login failed!
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (array (ref str.t)) := deref α1 in
          let* α3 : ref (array (ref str.t)) := borrow α2 in
          let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
          let* α5 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α4 in
          let* α6 : ref (slice (ref str.t)) := M.read α5 in
          let* α7 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_const"] α6 in
          let* α8 : unit := std.io.stdio._print α7 in
          M.alloc α8 in
        M.alloc tt
      end in
    M.read α0).

(*
fn main() {
    let mut accounts: Accounts = HashMap::new();

    let account = Account {
        username: "j.everyman",
        password: "password123",
    };

    let account_info = AccountInfo {
        name: "John Everyman",
        email: "j.everyman@email.com",
    };

    accounts.insert(account, account_info);

    try_logon(&accounts, "j.everyman", "psasword123");

    try_logon(&accounts, "j.everyman", "password123");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* accounts :
        M.Val
          (std.collections.hash.map.HashMap.t
            hash_map_alternate_or_custom_key_types.Account.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t
            std.collections.hash.map.RandomState.t) :=
      let* α0 :
          std.collections.hash.map.HashMap.t
            hash_map_alternate_or_custom_key_types.Account.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t
            std.collections.hash.map.RandomState.t :=
        (std.collections.hash.map.HashMap.t
            hash_map_alternate_or_custom_key_types.Account.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t
            std.collections.hash.map.RandomState.t)::["new"] in
      M.alloc α0 in
    let* account : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
      let* α0 : ref str.t := M.read (mk_str "j.everyman") in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : ref str.t := M.read (mk_str "password123") in
      let* α4 : M.Val str.t := deref α3 in
      let* α5 : ref str.t := borrow α4 in
      M.alloc
        {|
          hash_map_alternate_or_custom_key_types.Account.username := α2;
          hash_map_alternate_or_custom_key_types.Account.password := α5;
        |} in
    let* account_info :
        M.Val hash_map_alternate_or_custom_key_types.AccountInfo.t :=
      let* α0 : ref str.t := M.read (mk_str "John Everyman") in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : ref str.t := M.read (mk_str "j.everyman@email.com") in
      let* α4 : M.Val str.t := deref α3 in
      let* α5 : ref str.t := borrow α4 in
      M.alloc
        {|
          hash_map_alternate_or_custom_key_types.AccountInfo.name := α2;
          hash_map_alternate_or_custom_key_types.AccountInfo.email := α5;
        |} in
    let* _ :
        M.Val
          (core.option.Option.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t) :=
      let* α0 :
          mut_ref
            (std.collections.hash.map.HashMap.t
              hash_map_alternate_or_custom_key_types.Account.t
              hash_map_alternate_or_custom_key_types.AccountInfo.t
              std.collections.hash.map.RandomState.t) :=
        borrow_mut accounts in
      let* α1 : hash_map_alternate_or_custom_key_types.Account.t :=
        M.read account in
      let* α2 : hash_map_alternate_or_custom_key_types.AccountInfo.t :=
        M.read account_info in
      let* α3 :
          core.option.Option.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t :=
        (std.collections.hash.map.HashMap.t
              hash_map_alternate_or_custom_key_types.Account.t
              hash_map_alternate_or_custom_key_types.AccountInfo.t
              std.collections.hash.map.RandomState.t)::["insert"]
          α0
          α1
          α2 in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* α0 :
          ref
            (std.collections.hash.map.HashMap.t
              hash_map_alternate_or_custom_key_types.Account.t
              hash_map_alternate_or_custom_key_types.AccountInfo.t
              std.collections.hash.map.RandomState.t) :=
        borrow accounts in
      let* α1 :
          M.Val
            (std.collections.hash.map.HashMap.t
              hash_map_alternate_or_custom_key_types.Account.t
              hash_map_alternate_or_custom_key_types.AccountInfo.t
              std.collections.hash.map.RandomState.t) :=
        deref α0 in
      let* α2 :
          ref
            (std.collections.hash.map.HashMap.t
              hash_map_alternate_or_custom_key_types.Account.t
              hash_map_alternate_or_custom_key_types.AccountInfo.t
              std.collections.hash.map.RandomState.t) :=
        borrow α1 in
      let* α3 : ref str.t := M.read (mk_str "j.everyman") in
      let* α4 : M.Val str.t := deref α3 in
      let* α5 : ref str.t := borrow α4 in
      let* α6 : ref str.t := M.read (mk_str "psasword123") in
      let* α7 : M.Val str.t := deref α6 in
      let* α8 : ref str.t := borrow α7 in
      let* α9 : unit :=
        hash_map_alternate_or_custom_key_types.try_logon α2 α5 α8 in
      M.alloc α9 in
    let* _ : M.Val unit :=
      let* α0 :
          ref
            (std.collections.hash.map.HashMap.t
              hash_map_alternate_or_custom_key_types.Account.t
              hash_map_alternate_or_custom_key_types.AccountInfo.t
              std.collections.hash.map.RandomState.t) :=
        borrow accounts in
      let* α1 :
          M.Val
            (std.collections.hash.map.HashMap.t
              hash_map_alternate_or_custom_key_types.Account.t
              hash_map_alternate_or_custom_key_types.AccountInfo.t
              std.collections.hash.map.RandomState.t) :=
        deref α0 in
      let* α2 :
          ref
            (std.collections.hash.map.HashMap.t
              hash_map_alternate_or_custom_key_types.Account.t
              hash_map_alternate_or_custom_key_types.AccountInfo.t
              std.collections.hash.map.RandomState.t) :=
        borrow α1 in
      let* α3 : ref str.t := M.read (mk_str "j.everyman") in
      let* α4 : M.Val str.t := deref α3 in
      let* α5 : ref str.t := borrow α4 in
      let* α6 : ref str.t := M.read (mk_str "password123") in
      let* α7 : M.Val str.t := deref α6 in
      let* α8 : ref str.t := borrow α7 in
      let* α9 : unit :=
        hash_map_alternate_or_custom_key_types.try_logon α2 α5 α8 in
      M.alloc α9 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
