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
  Ltac Self := exact hash.Person.t.
  
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
        let* α0 : ref hash.Person.t := M.read self in
        let* α1 : M.Val hash.Person.t := deref α0 in
        let* α2 : ref u32.t := borrow α1.["id"] in
        let* α3 : M.Val u32.t := deref α2 in
        let* α4 : ref u32.t := borrow α3 in
        let* α5 : mut_ref __H := M.read state in
        let* α6 : M.Val __H := deref α5 in
        let* α7 : mut_ref __H := borrow_mut α6 in
        let* α8 : unit :=
          (core.hash.Hash.hash (Self := u32.t) (Trait := ltac:(refine _)))
            α4
            α7 in
        M.alloc α8 in
      let* _ : M.Val unit :=
        let* α0 : ref hash.Person.t := M.read self in
        let* α1 : M.Val hash.Person.t := deref α0 in
        let* α2 : ref alloc.string.String.t := borrow α1.["name"] in
        let* α3 : M.Val alloc.string.String.t := deref α2 in
        let* α4 : ref alloc.string.String.t := borrow α3 in
        let* α5 : mut_ref __H := M.read state in
        let* α6 : M.Val __H := deref α5 in
        let* α7 : mut_ref __H := borrow_mut α6 in
        let* α8 : unit :=
          (core.hash.Hash.hash
              (Self := alloc.string.String.t)
              (Trait := ltac:(refine _)))
            α4
            α7 in
        M.alloc α8 in
      let* α0 : ref hash.Person.t := M.read self in
      let* α1 : M.Val hash.Person.t := deref α0 in
      let* α2 : ref u64.t := borrow α1.["phone"] in
      let* α3 : M.Val u64.t := deref α2 in
      let* α4 : ref u64.t := borrow α3 in
      let* α5 : mut_ref __H := M.read state in
      let* α6 : M.Val __H := deref α5 in
      let* α7 : mut_ref __H := borrow_mut α6 in
      let* α8 : unit :=
        (core.hash.Hash.hash (Self := u64.t) (Trait := ltac:(refine _)))
          α4
          α7 in
      M.alloc α8).
  
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
  M.function_body
    (let* s : M.Val std.collections.hash.map.DefaultHasher.t :=
      let* α0 : std.collections.hash.map.DefaultHasher.t :=
        std.collections.hash.map.DefaultHasher.t::["new"] in
      M.alloc α0 in
    let* _ : M.Val unit :=
      let* α0 : ref T := M.read t in
      let* α1 : M.Val T := deref α0 in
      let* α2 : ref T := borrow α1 in
      let* α3 : mut_ref std.collections.hash.map.DefaultHasher.t :=
        borrow_mut s in
      let* α4 : M.Val std.collections.hash.map.DefaultHasher.t := deref α3 in
      let* α5 : mut_ref std.collections.hash.map.DefaultHasher.t :=
        borrow_mut α4 in
      let* α6 : unit :=
        (core.hash.Hash.hash (Self := T) (Trait := ltac:(refine _))) α2 α5 in
      M.alloc α6 in
    let* α0 : ref std.collections.hash.map.DefaultHasher.t := borrow s in
    let* α1 : u64.t :=
      (core.hash.Hasher.finish
          (Self := std.collections.hash.map.DefaultHasher.t)
          (Trait := ltac:(refine _)))
        α0 in
    M.alloc α1).

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
  M.function_body
    (let* person1 : M.Val hash.Person.t :=
      let* α0 : M.Val u32.t := M.alloc 5 in
      let* α1 : u32.t := M.read α0 in
      let* α2 : ref str.t := M.read (mk_str "Janet") in
      let* α3 : M.Val str.t := deref α2 in
      let* α4 : ref str.t := borrow α3 in
      let* α5 : alloc.string.String.t :=
        (alloc.string.ToString.to_string
            (Self := str.t)
            (Trait := ltac:(refine _)))
          α4 in
      let* α6 : M.Val u64.t := M.alloc 5556667777 in
      let* α7 : u64.t := M.read α6 in
      M.alloc
        {|
          hash.Person.id := α1;
          hash.Person.name := α5;
          hash.Person.phone := α7;
        |} in
    let* person2 : M.Val hash.Person.t :=
      let* α0 : M.Val u32.t := M.alloc 5 in
      let* α1 : u32.t := M.read α0 in
      let* α2 : ref str.t := M.read (mk_str "Bob") in
      let* α3 : M.Val str.t := deref α2 in
      let* α4 : ref str.t := borrow α3 in
      let* α5 : alloc.string.String.t :=
        (alloc.string.ToString.to_string
            (Self := str.t)
            (Trait := ltac:(refine _)))
          α4 in
      let* α6 : M.Val u64.t := M.alloc 5556667777 in
      let* α7 : u64.t := M.read α6 in
      M.alloc
        {|
          hash.Person.id := α1;
          hash.Person.name := α5;
          hash.Person.phone := α7;
        |} in
    let* _ : M.Val unit :=
      let* α0 : ref hash.Person.t := borrow person1 in
      let* α1 : M.Val hash.Person.t := deref α0 in
      let* α2 : ref hash.Person.t := borrow α1 in
      let* α3 : u64.t := hash.calculate_hash α2 in
      let* α4 : M.Val u64.t := M.alloc α3 in
      let* α5 : ref hash.Person.t := borrow person2 in
      let* α6 : M.Val hash.Person.t := deref α5 in
      let* α7 : ref hash.Person.t := borrow α6 in
      let* α8 : u64.t := hash.calculate_hash α7 in
      let* α9 : M.Val u64.t := M.alloc α8 in
      let* α10 : M.Val bool.t := BinOp.ne α4 α9 in
      let* α11 : M.Val bool.t := UnOp.not α10 in
      let* α12 : M.Val bool.t := use α11 in
      let* α13 : bool.t := M.read α12 in
      if (α13 : bool) then
        let* α0 : ref str.t :=
          M.read
            (mk_str
              "assertion failed: calculate_hash(&person1) != calculate_hash(&person2)") in
        let* α1 : never.t := core.panicking.panic α0 in
        let* α2 : M.Val never.t := M.alloc α1 in
        never_to_any α2
      else
        M.alloc tt in
    M.alloc tt).
