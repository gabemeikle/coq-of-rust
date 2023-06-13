(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.
Import std.hash.

Module DefaultHasher := std.collections.hash_map.DefaultHasher.
Definition DefaultHasher := DefaultHasher.t.

Module Person.
  Record t : Set := {
    id : u32;
    name : String;
    phone : u64;
  }.

  Global Instance Get_id : Notation.Dot "id" := {
    Notation.dot '(Build_t x0 _ _) := x0;
  }.
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot '(Build_t _ x1 _) := x1;
  }.
  Global Instance Get_phone : Notation.Dot "phone" := {
    Notation.dot '(Build_t _ _ x2) := x2;
  }.
End Person.
Definition Person : Set := Person.t.

Module Impl__crate_hash_Hash_for_Person.
  Definition Self := Person.

  Definition hash (__H : Set) `(_crate.hash.Hasher.Trait __H) (self : ref Self) (state : mut_ref __H) : M unit :=
    let* _ := _crate.hash.Hash.hash (addr_of self.["id"]) state in
    let* _ := _crate.hash.Hash.hash (addr_of self.["name"]) state in
    _crate.hash.Hash.hash (addr_of self.["phone"]) state.

  Global Instance Method_hash : Notation.Dot "hash" := {
    Notation.dot := hash;
  }.

  Global Instance I : _crate.hash.Hash.Trait Self := {
    _crate.hash.Hash.hash := hash;
  }.
End Impl__crate_hash_Hash_for_Person.

Definition calculate_hash {T : Set} `{Hash.Trait T} (t : ref T) : M u64 :=
  let* s := DefaultHasher::["new"] tt in
  let* _ := t.["hash"] (addr_of s) in
  s.["finish"].

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let* person1 :=
    let* α0 := "Janet".["to_string"] in
    Pure {| Person.id := 5; Person.name := α0; Person.phone := 5556667777; |} in
  let* person2 :=
    let* α0 := "Bob".["to_string"] in
    Pure {| Person.id := 5; Person.name := α0; Person.phone := 5556667777; |} in
  let* _ :=
    let* α0 := calculate_hash (addr_of person1) in
    let* α1 := calculate_hash (addr_of person2) in
    let* α2 := α0.["ne"] α1 in
    let* α3 := α2.["not"] in
    if (α3 : bool) then
      _crate.panicking.panic
        "assertion failed: calculate_hash(&person1) != calculate_hash(&person2)"
    else
      Pure tt in
  Pure tt.
