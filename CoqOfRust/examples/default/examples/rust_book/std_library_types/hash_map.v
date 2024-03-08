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
            (let* α0 :=
              M.read
                (mk_str
                  "We're sorry, the call cannot be completed as dialed. 
            Please hang up and try again.") in
            M.alloc α0) :
            Ty.apply (Ty.path "ref") [ Ty.path "str" ];
          fun γ =>
            (let* α0 :=
              M.read
                (mk_str
                  "Hello, this is Mr. Awesome's Pizza. My name is Fred.
            What can I get for you today?") in
            M.alloc α0) :
            Ty.apply (Ty.path "ref") [ Ty.path "str" ];
          fun γ =>
            (let* α0 := M.read (mk_str "Hi! Who is this again?") in
            M.alloc α0) :
            Ty.apply (Ty.path "ref") [ Ty.path "str" ]
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* contacts :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "std::collections::hash::map::HashMap")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "std::hash::random::RandomState"
              ])::["new"]
          [] in
      M.alloc α0 in
    let* _ :=
      let* α0 := M.read (mk_str "Daniel") in
      let* α1 := M.read (mk_str "798-1364") in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "std::collections::hash::map::HashMap")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "std::hash::random::RandomState"
              ])::["insert"]
          [ contacts; α0; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.read (mk_str "Ashley") in
      let* α1 := M.read (mk_str "645-7689") in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "std::collections::hash::map::HashMap")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "std::hash::random::RandomState"
              ])::["insert"]
          [ contacts; α0; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.read (mk_str "Katie") in
      let* α1 := M.read (mk_str "435-8291") in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "std::collections::hash::map::HashMap")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "std::hash::random::RandomState"
              ])::["insert"]
          [ contacts; α0; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.read (mk_str "Robert") in
      let* α1 := M.read (mk_str "956-1745") in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "std::collections::hash::map::HashMap")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "std::hash::random::RandomState"
              ])::["insert"]
          [ contacts; α0; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "std::collections::hash::map::HashMap")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "std::hash::random::RandomState"
              ])::["get"]
          [ contacts; mk_str "Daniel" ] in
      let* α1 := M.alloc α0 in
      match_operator
        α1
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::option::Option::Get_Some_0" in
                M.pure (α0 γ) in
              let* γ0_0 :=
                let* α0 := M.read γ0_0 in
                M.pure (deref α0) in
              let* number := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Calling Daniel: ") in
                let* α2 := M.read (mk_str "
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 := M.var "hash_map::call" in
                let* α5 := M.read number in
                let* α6 := M.call α4 [ α5 ] in
                let* α7 := M.alloc α6 in
                let* α8 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ α7 ] in
                let* α9 := M.alloc [ α8 ] in
                let* α10 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α9
                    ] in
                let* α11 := M.call α0 [ α10 ] in
                M.alloc α11 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* _ :=
              let* α0 := M.var "std::io::stdio::_print" in
              let* α1 := M.read (mk_str "Don't have Daniel's number.
") in
              let* α2 := M.alloc [ α1 ] in
              let* α3 :=
                M.call
                  (Ty.path "core::fmt::Arguments")::["new_const"]
                  [ pointer_coercion "Unsize" α2 ] in
              let* α4 := M.call α0 [ α3 ] in
              M.alloc α4 in
            M.alloc tt) :
            Ty.tuple []
        ] in
    let* _ :=
      let* α0 := M.read (mk_str "Daniel") in
      let* α1 := M.read (mk_str "164-6743") in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "std::collections::hash::map::HashMap")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "std::hash::random::RandomState"
              ])::["insert"]
          [ contacts; α0; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "std::collections::hash::map::HashMap")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "std::hash::random::RandomState"
              ])::["get"]
          [ contacts; mk_str "Ashley" ] in
      let* α1 := M.alloc α0 in
      match_operator
        α1
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::option::Option::Get_Some_0" in
                M.pure (α0 γ) in
              let* γ0_0 :=
                let* α0 := M.read γ0_0 in
                M.pure (deref α0) in
              let* number := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Calling Ashley: ") in
                let* α2 := M.read (mk_str "
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 := M.var "hash_map::call" in
                let* α5 := M.read number in
                let* α6 := M.call α4 [ α5 ] in
                let* α7 := M.alloc α6 in
                let* α8 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ α7 ] in
                let* α9 := M.alloc [ α8 ] in
                let* α10 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α9
                    ] in
                let* α11 := M.call α0 [ α10 ] in
                M.alloc α11 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* _ :=
              let* α0 := M.var "std::io::stdio::_print" in
              let* α1 := M.read (mk_str "Don't have Ashley's number.
") in
              let* α2 := M.alloc [ α1 ] in
              let* α3 :=
                M.call
                  (Ty.path "core::fmt::Arguments")::["new_const"]
                  [ pointer_coercion "Unsize" α2 ] in
              let* α4 := M.call α0 [ α3 ] in
              M.alloc α4 in
            M.alloc tt) :
            Ty.tuple []
        ] in
    let* _ :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "std::collections::hash::map::HashMap")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "std::hash::random::RandomState"
              ])::["remove"]
          [ contacts; mk_str "Ashley" ] in
      M.alloc α0 in
    let* α0 :=
      M.get_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply
              (Ty.path "std::collections::hash::map::Iter")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.apply (Ty.path "ref") [ Ty.path "str" ]
              ]
        ] in
    let* α1 :=
      M.call
        (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.apply (Ty.path "ref") [ Ty.path "str" ];
              Ty.apply (Ty.path "ref") [ Ty.path "str" ];
              Ty.path "std::hash::random::RandomState"
            ])::["iter"]
        [ contacts ] in
    let* α2 := M.call α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      match_operator
        α3
        [
          fun γ =>
            (let* iter := M.copy γ in
            M.loop
              (let* _ :=
                let* α0 :=
                  M.get_method
                    "core::iter::traits::iterator::Iterator"
                    "next"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "std::collections::hash::map::Iter")
                          [
                            Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                            Ty.apply (Ty.path "ref") [ Ty.path "str" ]
                          ]
                    ] in
                let* α1 := M.call α0 [ iter ] in
                let* α2 := M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.None =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := never_to_any α1 in
                        M.alloc α2
                      | _ => M.break_match 
                      end) :
                      Ty.tuple [];
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.Some _ =>
                        let* γ0_0 :=
                          let* α0 := M.var "core::option::Option::Get_Some_0" in
                          M.pure (α0 γ) in
                        let* α0 := M.read γ0_0 in
                        match α0 with
                        | (_, _) =>
                          let γ1_0 := Tuple.Access.left γ0_0 in
                          let γ1_1 := Tuple.Access.right γ0_0 in
                          let* contact := M.copy γ1_0 in
                          let* γ1_1 :=
                            let* α0 := M.read γ1_1 in
                            M.pure (deref α0) in
                          let* number := M.copy γ1_1 in
                          let* _ :=
                            let* _ :=
                              let* α0 := M.var "std::io::stdio::_print" in
                              let* α1 := M.read (mk_str "Calling ") in
                              let* α2 := M.read (mk_str ": ") in
                              let* α3 := M.read (mk_str "
") in
                              let* α4 := M.alloc [ α1; α2; α3 ] in
                              let* α5 :=
                                M.call
                                  (Ty.path
                                      "core::fmt::rt::Argument")::["new_display"]
                                  [ contact ] in
                              let* α6 := M.var "hash_map::call" in
                              let* α7 := M.read number in
                              let* α8 := M.call α6 [ α7 ] in
                              let* α9 := M.alloc α8 in
                              let* α10 :=
                                M.call
                                  (Ty.path
                                      "core::fmt::rt::Argument")::["new_display"]
                                  [ α9 ] in
                              let* α11 := M.alloc [ α5; α10 ] in
                              let* α12 :=
                                M.call
                                  (Ty.path "core::fmt::Arguments")::["new_v1"]
                                  [
                                    pointer_coercion "Unsize" α4;
                                    pointer_coercion "Unsize" α11
                                  ] in
                              let* α13 := M.call α0 [ α12 ] in
                              M.alloc α13 in
                            M.alloc tt in
                          M.alloc tt
                        end
                      | _ => M.break_match 
                      end) :
                      Ty.tuple []
                  ] in
              M.alloc tt)) :
            Ty.tuple []
        ] in
    M.read (use α4)
  | _, _ => M.impossible
  end.
