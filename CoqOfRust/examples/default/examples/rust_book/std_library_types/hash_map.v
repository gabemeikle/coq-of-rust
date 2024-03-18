(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn call(number: &str) -> &str {
    match number {
        "798-1364" => {
            "We're sorry, the call cannot be completed as dialed. 
            Please hang up and try again."
        }
        "645-7689" => {
            "Hello, this is Mr. Awesome's Pizza. My name is Fred.
            What can I get for you today?"
        }
        _ => "Hi! Who is this again?",
    }
}
*)
Definition call (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ number ] =>
    let* number := M.alloc number in
    let* α0 :=
      match_operator
        number
        [
          fun γ =>
            let* α0 :=
              M.read
                (mk_str
                  "We're sorry, the call cannot be completed as dialed. 
            Please hang up and try again.") in
            M.alloc α0;
          fun γ =>
            let* α0 :=
              M.read
                (mk_str
                  "Hello, this is Mr. Awesome's Pizza. My name is Fred.
            What can I get for you today?") in
            M.alloc α0;
          fun γ =>
            let* α0 := M.read (mk_str "Hi! Who is this again?") in
            M.alloc α0
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let mut contacts = HashMap::new();

    contacts.insert("Daniel", "798-1364");
    contacts.insert("Ashley", "645-7689");
    contacts.insert("Katie", "435-8291");
    contacts.insert("Robert", "956-1745");

    // Takes a reference and returns Option<&V>
    match contacts.get(&"Daniel") {
        Some(&number) => println!("Calling Daniel: {}", call(number)),
        _ => println!("Don't have Daniel's number."),
    }

    // `HashMap::insert()` returns `None`
    // if the inserted value is new, `Some(value)` otherwise
    contacts.insert("Daniel", "164-6743");

    match contacts.get(&"Ashley") {
        Some(&number) => println!("Calling Ashley: {}", call(number)),
        _ => println!("Don't have Ashley's number."),
    }

    contacts.remove(&"Ashley");

    // `HashMap::iter()` returns an iterator that yields
    // (&'a key, &'a value) pairs in arbitrary order.
    for (contact, &number) in contacts.iter() {
        println!("Calling {}: {}", contact, call(number));
    }
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* contacts :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "std::hash::random::RandomState"
            ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "std::hash::random::RandomState"
            ])
          "insert"
          [] in
      let* α1 := M.read (mk_str "Daniel") in
      let* α2 := M.read (mk_str "798-1364") in
      let* α3 := M.call_closure α0 [ contacts; α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "std::hash::random::RandomState"
            ])
          "insert"
          [] in
      let* α1 := M.read (mk_str "Ashley") in
      let* α2 := M.read (mk_str "645-7689") in
      let* α3 := M.call_closure α0 [ contacts; α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "std::hash::random::RandomState"
            ])
          "insert"
          [] in
      let* α1 := M.read (mk_str "Katie") in
      let* α2 := M.read (mk_str "435-8291") in
      let* α3 := M.call_closure α0 [ contacts; α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "std::hash::random::RandomState"
            ])
          "insert"
          [] in
      let* α1 := M.read (mk_str "Robert") in
      let* α2 := M.read (mk_str "956-1745") in
      let* α3 := M.call_closure α0 [ contacts; α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "std::hash::random::RandomState"
            ])
          "get"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α1 := M.call_closure α0 [ contacts; mk_str "Daniel" ] in
      let* α2 := M.alloc α1 in
      match_operator
        α2
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* γ0_0 := M.read γ0_0 in
            let* number := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "Calling Daniel: ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
              let* α6 := M.get_function "hash_map::call" [] in
              let* α7 := M.read number in
              let* α8 := M.call_closure α6 [ α7 ] in
              let* α9 := M.alloc α8 in
              let* α10 := M.call_closure α5 [ α9 ] in
              let* α11 := M.alloc (Value.Array [ α10 ]) in
              let* α12 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α4;
                    M.pointer_coercion (* Unsize *) α11
                  ] in
              let* α13 := M.call_closure α0 [ α12 ] in
              M.alloc α13 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const"
                  [] in
              let* α2 := M.read (mk_str "Don't have Daniel's number.
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 :=
                M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call_closure α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple [])
        ] in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "std::hash::random::RandomState"
            ])
          "insert"
          [] in
      let* α1 := M.read (mk_str "Daniel") in
      let* α2 := M.read (mk_str "164-6743") in
      let* α3 := M.call_closure α0 [ contacts; α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "std::hash::random::RandomState"
            ])
          "get"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α1 := M.call_closure α0 [ contacts; mk_str "Ashley" ] in
      let* α2 := M.alloc α1 in
      match_operator
        α2
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* γ0_0 := M.read γ0_0 in
            let* number := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "Calling Ashley: ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
              let* α6 := M.get_function "hash_map::call" [] in
              let* α7 := M.read number in
              let* α8 := M.call_closure α6 [ α7 ] in
              let* α9 := M.alloc α8 in
              let* α10 := M.call_closure α5 [ α9 ] in
              let* α11 := M.alloc (Value.Array [ α10 ]) in
              let* α12 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α4;
                    M.pointer_coercion (* Unsize *) α11
                  ] in
              let* α13 := M.call_closure α0 [ α12 ] in
              M.alloc α13 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const"
                  [] in
              let* α2 := M.read (mk_str "Don't have Ashley's number.
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 :=
                M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call_closure α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple [])
        ] in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "std::hash::random::RandomState"
            ])
          "remove"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α1 := M.call_closure α0 [ contacts; mk_str "Ashley" ] in
      M.alloc α1 in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        (Ty.apply
          (Ty.path "std::collections::hash::map::Iter")
          [
            Ty.apply (Ty.path "&") [ Ty.path "str" ];
            Ty.apply (Ty.path "&") [ Ty.path "str" ]
          ])
        []
        "into_iter"
        [] in
    let* α1 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "std::collections::hash::map::HashMap")
          [
            Ty.apply (Ty.path "&") [ Ty.path "str" ];
            Ty.apply (Ty.path "&") [ Ty.path "str" ];
            Ty.path "std::hash::random::RandomState"
          ])
        "iter"
        [] in
    let* α2 := M.call_closure α1 [ contacts ] in
    let* α3 := M.call_closure α0 [ α2 ] in
    let* α4 := M.alloc α3 in
    let* α5 :=
      match_operator
        α4
        [
          fun γ =>
            let* iter := M.copy γ in
            M.loop
              (let* _ :=
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::iterator::Iterator"
                    (Ty.apply
                      (Ty.path "std::collections::hash::map::Iter")
                      [
                        Ty.apply (Ty.path "&") [ Ty.path "str" ];
                        Ty.apply (Ty.path "&") [ Ty.path "str" ]
                      ])
                    []
                    "next"
                    [] in
                let* α1 := M.call_closure α0 [ iter ] in
                let* α2 := M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      let* α0 := M.break in
                      let* α1 := M.read α0 in
                      let* α2 := M.never_to_any α1 in
                      M.alloc α2;
                    fun γ =>
                      let* γ0_0 :=
                        M.get_struct_tuple_field_or_break_match
                          γ
                          "core::option::Option::Some"
                          0 in
                      let γ1_0 := M.get_tuple_field γ0_0 0 in
                      let γ1_1 := M.get_tuple_field γ0_0 1 in
                      let* contact := M.copy γ1_0 in
                      let* γ1_1 := M.read γ1_1 in
                      let* number := M.copy γ1_1 in
                      let* _ :=
                        let* _ :=
                          let* α0 :=
                            M.get_function "std::io::stdio::_print" [] in
                          let* α1 :=
                            M.get_associated_function
                              (Ty.path "core::fmt::Arguments")
                              "new_v1"
                              [] in
                          let* α2 := M.read (mk_str "Calling ") in
                          let* α3 := M.read (mk_str ": ") in
                          let* α4 := M.read (mk_str "
") in
                          let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                          let* α6 :=
                            M.get_associated_function
                              (Ty.path "core::fmt::rt::Argument")
                              "new_display"
                              [
                                Ty.apply
                                  (Ty.path "&")
                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                              ] in
                          let* α7 := M.call_closure α6 [ contact ] in
                          let* α8 :=
                            M.get_associated_function
                              (Ty.path "core::fmt::rt::Argument")
                              "new_display"
                              [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
                          let* α9 := M.get_function "hash_map::call" [] in
                          let* α10 := M.read number in
                          let* α11 := M.call_closure α9 [ α10 ] in
                          let* α12 := M.alloc α11 in
                          let* α13 := M.call_closure α8 [ α12 ] in
                          let* α14 := M.alloc (Value.Array [ α7; α13 ]) in
                          let* α15 :=
                            M.call_closure
                              α1
                              [
                                M.pointer_coercion (* Unsize *) α5;
                                M.pointer_coercion (* Unsize *) α14
                              ] in
                          let* α16 := M.call_closure α0 [ α15 ] in
                          M.alloc α16 in
                        M.alloc (Value.Tuple []) in
                      M.alloc (Value.Tuple [])
                  ] in
              M.alloc (Value.Tuple []))
        ] in
    M.read (M.use α5)
  | _, _ => M.impossible
  end.
