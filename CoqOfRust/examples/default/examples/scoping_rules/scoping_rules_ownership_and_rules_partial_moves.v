(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    #[derive(Debug)]
    struct Person {
        name: String,
        age: Box<u8>,
    }

    let person = Person {
        name: String::from("Alice"),
        age: Box::new(20),
    };

    // `name` is moved out of person, but `age` is referenced
    let Person { name, ref age } = person;

    println!("The person's age is {}", age);

    println!("The person's name is {}", name);

    // Error! borrow of partially moved value: `person` partial move occurs
    //println!("The person struct is {:?}", person);

    // `person` cannot be used but `person.age` can be used as it is not moved
    println!("The person's age from person struct is {}", person.age);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* person :
      M.Val scoping_rules_ownership_and_rules_partial_moves.main.Person.t :=
    let* α0 : ref str.t := M.read (mk_str "Alice") in
    let* α1 : alloc.string.String.t :=
      M.call
        ((core.convert.From.from
            (Self := alloc.string.String.t)
            (Trait := ltac:(refine _)))
          α0) in
    let* α2 : alloc.boxed.Box.t u8.t alloc.alloc.Global.t :=
      M.call
        ((alloc.boxed.Box.t u8.t alloc.alloc.Global.t)::["new"]
          (Integer.of_Z 20)) in
    M.alloc
      {|
        scoping_rules_ownership_and_rules_partial_moves.main.Person.name := α1;
        scoping_rules_ownership_and_rules_partial_moves.main.Person.age := α2;
      |} in
  let* '{|
        scoping_rules_ownership_and_rules_partial_moves.main.Person.name
          :=
          name;
        scoping_rules_ownership_and_rules_partial_moves.main.Person.age := age;
      |} :
      M.Val scoping_rules_ownership_and_rules_partial_moves.main.Person.t :=
    M.copy person in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "The person's age is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow age)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "The person's name is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow name)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t :=
        M.read (mk_str "The person's age from person struct is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"] (borrow person.["age"])) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

Module  Person.
Section Person.
  Record t : Set := {
    name : alloc.string.String.t;
    age : alloc.boxed.Box.t u8.t alloc.boxed.Box.Default.A;
  }.
  
  Global Instance Get_name : Notations.Dot "name" := {
    Notations.dot := Ref.map (fun x => x.(name)) (fun v x => x <| name := v |>);
  }.
  Global Instance Get_AF_name : Notations.DoubleColon t "name" := {
    Notations.double_colon (x : M.Val t) := x.["name"];
  }.
  Global Instance Get_age : Notations.Dot "age" := {
    Notations.dot := Ref.map (fun x => x.(age)) (fun v x => x <| age := v |>);
  }.
  Global Instance Get_AF_age : Notations.DoubleColon t "age" := {
    Notations.double_colon (x : M.Val t) := x.["age"];
  }.
End Person.
End Person.

Module  Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person_t.
Section Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person_t.
  Definition Self : Set :=
    scoping_rules_ownership_and_rules_partial_moves.main.Person.t.
  
  (*
      Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "Person") in
    let* α2 : ref str.t := M.read (mk_str "name") in
    let* α3 :
        ref scoping_rules_ownership_and_rules_partial_moves.main.Person.t :=
      M.read self in
    let* α4 : M.Val (ref alloc.string.String.t) :=
      M.alloc (borrow (deref α3).["name"]) in
    let* α5 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α4) in
    let* α6 : ref str.t := M.read (mk_str "age") in
    let* α7 :
        ref scoping_rules_ownership_and_rules_partial_moves.main.Person.t :=
      M.read self in
    let* α8 : M.Val (ref (alloc.boxed.Box.t u8.t alloc.alloc.Global.t)) :=
      M.alloc (borrow (deref α7).["age"]) in
    let* α9 : M.Val (ref (ref (alloc.boxed.Box.t u8.t alloc.alloc.Global.t))) :=
      M.alloc (borrow α8) in
    let* α10 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α9) in
    M.call
      (core.fmt.Formatter.t::["debug_struct_field2_finish"] α0 α1 α2 α5 α6 α10).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person_t.
End Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person_t.
