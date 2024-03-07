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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* person :=
      let* α0 :=
        M.get_method
          "core::convert::From"
          "from"
          [
            (* Self *) Ty.path "alloc::string::String";
            (* T *) Ty.apply (Ty.path "ref") [ Ty.path "str" ]
          ] in
      let* α1 := M.read (mk_str "Alice") in
      let* α2 := M.call α0 [ α1 ] in
      let* α3 :=
        M.call
          (Ty.apply
              (Ty.path "alloc::boxed::Box")
              [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ])::["new"]
          [ (Integer.of_Z 20) : Ty.path "u8" ] in
      M.alloc
        (Value.StructRecord
          "scoping_rules_ownership_and_rules_partial_moves::main::Person"
          [ ("name", α2); ("age", α3) ]) in
    let* α0 :=
      match_operator
        person
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            |
                {|
                  scoping_rules_ownership_and_rules_partial_moves.main.Person.name
                    :=
                    _;
                  scoping_rules_ownership_and_rules_partial_moves.main.Person.age
                    :=
                    _;
                |}
                =>
              let γ0_0 :=
                (M.var
                    "scoping_rules_ownership_and_rules_partial_moves::main::Person::Get_name")
                  γ in
              let γ0_1 :=
                (M.var
                    "scoping_rules_ownership_and_rules_partial_moves::main::Person::Get_age")
                  γ in
              let* name := M.copy γ0_0 in
              let* age := M.alloc (borrow γ0_1) in
              let* _ :=
                let* _ :=
                  let* α0 := M.read (mk_str "The person's age is ") in
                  let* α1 := M.read (mk_str "
") in
                  let* α2 := M.alloc [ α0; α1 ] in
                  let* α3 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_display"]
                      [ borrow age ] in
                  let* α4 := M.alloc [ α3 ] in
                  let* α5 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" (borrow α2);
                        pointer_coercion "Unsize" (borrow α4)
                      ] in
                  let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
                  M.alloc α6 in
                M.alloc tt in
              let* _ :=
                let* _ :=
                  let* α0 := M.read (mk_str "The person's name is ") in
                  let* α1 := M.read (mk_str "
") in
                  let* α2 := M.alloc [ α0; α1 ] in
                  let* α3 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_display"]
                      [ borrow name ] in
                  let* α4 := M.alloc [ α3 ] in
                  let* α5 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" (borrow α2);
                        pointer_coercion "Unsize" (borrow α4)
                      ] in
                  let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
                  M.alloc α6 in
                M.alloc tt in
              let* _ :=
                let* _ :=
                  let* α0 :=
                    M.read (mk_str "The person's age from person struct is ") in
                  let* α1 := M.read (mk_str "
") in
                  let* α2 := M.alloc [ α0; α1 ] in
                  let* α3 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_display"]
                      [
                        borrow
                          ((M.var
                              "scoping_rules_ownership_and_rules_partial_moves::main::Person::Get_age")
                            person)
                      ] in
                  let* α4 := M.alloc [ α3 ] in
                  let* α5 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" (borrow α2);
                        pointer_coercion "Unsize" (borrow α4)
                      ] in
                  let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
                  M.alloc α6 in
                M.alloc tt in
              M.alloc tt
            end) :
            Ty.path "unit"
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(* Enum Person *)

Module Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
  Definition Self : Ty.t :=
    Ty.path "scoping_rules_ownership_and_rules_partial_moves::main::Person".
  
  (*
      Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "Person") in
      let* α2 := M.read (mk_str "name") in
      let* α3 := M.read self in
      let* α4 := M.read (mk_str "age") in
      let* α5 := M.read self in
      let* α6 :=
        M.alloc
          (borrow
            ((M.var
                "scoping_rules_ownership_and_rules_partial_moves::main::Person::Get_age")
              (deref α5))) in
      M.call
        (Ty.path "core::fmt::Formatter")::["debug_struct_field2_finish"]
        [
          α0;
          α1;
          α2;
          pointer_coercion
            "Unsize"
            (borrow
              ((M.var
                  "scoping_rules_ownership_and_rules_partial_moves::main::Person::Get_name")
                (deref α3)));
          α4;
          pointer_coercion "Unsize" (borrow α6)
        ]
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
