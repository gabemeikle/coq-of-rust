(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Person.
Section Person.
  Record t : Set := {
    id : u32.t;
    name : alloc.string.String.t;
    phone : u64.t;
  }.
  
  Global Instance Get_id : Notations.Dot "id" := {
    Notations.dot := Ref.map (fun x => x.(id)) (fun v x => x <| id := v |>);
  }.
  Global Instance Get_AF_id : Notations.DoubleColon t "id" := {
    Notations.double_colon (x : M.Val t) := x.["id"];
  }.
  Global Instance Get_name : Notations.Dot "name" := {
    Notations.dot := Ref.map (fun x => x.(name)) (fun v x => x <| name := v |>);
  }.
  Global Instance Get_AF_name : Notations.DoubleColon t "name" := {
    Notations.double_colon (x : M.Val t) := x.["name"];
  }.
  Global Instance Get_phone : Notations.Dot "phone" := {
    Notations.dot :=
      Ref.map (fun x => x.(phone)) (fun v x => x <| phone := v |>);
  }.
  Global Instance Get_AF_phone : Notations.DoubleColon t "phone" := {
    Notations.double_colon (x : M.Val t) := x.["phone"];
  }.
End Person.
End Person.

Module  Impl_core_hash_Hash_for_hash_Person_t.
Section Impl_core_hash_Hash_for_hash_Person_t.
  Definition Self : Set := hash.Person.t.
  
  (*
  Hash
  *)
  Definition hash
      {__H : Set}
      {ℋ_0 : core.hash.Hasher.Trait __H}
      (self : ref Self)
      (state : mut_ref __H)
      : M unit :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* state : M.Val (mut_ref __H) := M.alloc state in
    let* _ : M.Val unit :=
      let* α0 : ref hash.Person.t := M.read self in
      let* α1 : mut_ref __H := M.read state in
      let* α2 : unit :=
        M.call
          ((core.hash.Hash.hash (Self := u32.t) (Trait := ltac:(refine _)))
            (borrow (deref α0).["id"])
            α1) in
      M.alloc α2 in
    let* _ : M.Val unit :=
      let* α0 : ref hash.Person.t := M.read self in
      let* α1 : mut_ref __H := M.read state in
      let* α2 : unit :=
        M.call
          ((core.hash.Hash.hash
              (Self := alloc.string.String.t)
              (Trait := ltac:(refine _)))
            (borrow (deref α0).["name"])
            α1) in
      M.alloc α2 in
    let* α0 : ref hash.Person.t := M.read self in
    let* α1 : mut_ref __H := M.read state in
    let* α2 : unit :=
      M.call
        ((core.hash.Hash.hash (Self := u64.t) (Trait := ltac:(refine _)))
          (borrow (deref α0).["phone"])
          α1) in
    let* α0 : M.Val unit := M.alloc α2 in
    M.read α0.
  
  Global Instance AssociatedFunction_hash
      {__H : Set}
      {ℋ_0 : core.hash.Hasher.Trait __H} :
    Notations.DoubleColon Self "hash" := {
    Notations.double_colon := hash (__H := __H);
  }.
  
  Global Instance ℐ : core.hash.Hash.Required.Trait Self := {
    core.hash.Hash.hash {__H : Set} {ℋ_0 : core.hash.Hasher.Trait __H} :=
      hash (__H := __H);
    core.hash.Hash.hash_slice := Datatypes.None;
  }.
End Impl_core_hash_Hash_for_hash_Person_t.
End Impl_core_hash_Hash_for_hash_Person_t.

(*
fn calculate_hash<T: Hash>(t: &T) -> u64 {
    let mut s = DefaultHasher::new();
    t.hash(&mut s);
    s.finish()
}
*)
Definition calculate_hash
    {T : Set}
    {ℋ_0 : core.hash.Hash.Trait T}
    (t : ref T)
    : M u64.t :=
  let* t : M.Val (ref T) := M.alloc t in
  let* s : M.Val std.collections.hash.map.DefaultHasher.t :=
    let* α0 : std.collections.hash.map.DefaultHasher.t :=
      M.call std.collections.hash.map.DefaultHasher.t::["new"] in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : ref T := M.read t in
    let* α1 : unit :=
      M.call
        ((core.hash.Hash.hash (Self := T) (Trait := ltac:(refine _)))
          α0
          (borrow_mut s)) in
    M.alloc α1 in
  let* α0 : u64.t :=
    M.call
      ((core.hash.Hasher.finish
          (Self := std.collections.hash.map.DefaultHasher.t)
          (Trait := ltac:(refine _)))
        (borrow s)) in
  let* α0 : M.Val u64.t := M.alloc α0 in
  M.read α0.

(*
fn main() {
    let person1 = Person {
        id: 5,
        name: "Janet".to_string(),
        phone: 555_666_7777,
    };
    let person2 = Person {
        id: 5,
        name: "Bob".to_string(),
        phone: 555_666_7777,
    };

    assert!(calculate_hash(&person1) != calculate_hash(&person2));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* person1 : M.Val hash.Person.t :=
    let* α0 : ref str.t := M.read (mk_str "Janet") in
    let* α1 : alloc.string.String.t :=
      M.call
        ((alloc.string.ToString.to_string
            (Self := str.t)
            (Trait := ltac:(refine _)))
          α0) in
    M.alloc
      {|
        hash.Person.id := Integer.of_Z 5;
        hash.Person.name := α1;
        hash.Person.phone := Integer.of_Z 5556667777;
      |} in
  let* person2 : M.Val hash.Person.t :=
    let* α0 : ref str.t := M.read (mk_str "Bob") in
    let* α1 : alloc.string.String.t :=
      M.call
        ((alloc.string.ToString.to_string
            (Self := str.t)
            (Trait := ltac:(refine _)))
          α0) in
    M.alloc
      {|
        hash.Person.id := Integer.of_Z 5;
        hash.Person.name := α1;
        hash.Person.phone := Integer.of_Z 5556667777;
      |} in
  let* _ : M.Val unit :=
    let* α0 : u64.t := M.call (hash.calculate_hash (borrow person1)) in
    let* α1 : u64.t := M.call (hash.calculate_hash (borrow person2)) in
    if (use (UnOp.not (BinOp.Pure.ne α0 α1)) : bool) then
      let* α0 : ref str.t :=
        M.read
          (mk_str
            "assertion failed: calculate_hash(&person1) != calculate_hash(&person2)") in
      let* α1 : never.t := M.call (core.panicking.panic α0) in
      let* α2 : unit := never_to_any α1 in
      M.alloc α2
    else
      M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
