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
Definition call (number : ref str.t) : M (ref str.t) :=
  let* number := M.alloc number in
  let* α0 : M.Val (ref str.t) :=
    match_operator
      number
      [
        fun γ =>
          (let* α0 : ref str.t :=
            M.read
              (mk_str
                "We're sorry, the call cannot be completed as dialed. 
            Please hang up and try again.") in
          M.alloc α0) :
          M (M.Val (ref str.t));
        fun γ =>
          (let* α0 : ref str.t :=
            M.read
              (mk_str
                "Hello, this is Mr. Awesome's Pizza. My name is Fred.
            What can I get for you today?") in
          M.alloc α0) :
          M (M.Val (ref str.t));
        fun γ =>
          (let* α0 : ref str.t := M.read (mk_str "Hi! Who is this again?") in
          M.alloc α0) :
          M (M.Val (ref str.t))
      ] in
  M.read α0.

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
Definition main : M unit :=
  let* contacts :
      M.Val
        (std.collections.hash.map.HashMap.t
          (ref str.t)
          (ref str.t)
          std.hash.random.RandomState.t) :=
    let* α0 :
        std.collections.hash.map.HashMap.t
          (ref str.t)
          (ref str.t)
          std.hash.random.RandomState.t :=
      M.call
        (std.collections.hash.map.HashMap.t
            (ref str.t)
            (ref str.t)
            std.hash.random.RandomState.t)::["new"] in
    M.alloc α0 in
  let* _ : M.Val (core.option.Option.t (ref str.t)) :=
    let* α0 : ref str.t := M.read (mk_str "Daniel") in
    let* α1 : ref str.t := M.read (mk_str "798-1364") in
    let* α2 : core.option.Option.t (ref str.t) :=
      M.call
        ((std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.hash.random.RandomState.t)::["insert"]
          (borrow_mut contacts)
          α0
          α1) in
    M.alloc α2 in
  let* _ : M.Val (core.option.Option.t (ref str.t)) :=
    let* α0 : ref str.t := M.read (mk_str "Ashley") in
    let* α1 : ref str.t := M.read (mk_str "645-7689") in
    let* α2 : core.option.Option.t (ref str.t) :=
      M.call
        ((std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.hash.random.RandomState.t)::["insert"]
          (borrow_mut contacts)
          α0
          α1) in
    M.alloc α2 in
  let* _ : M.Val (core.option.Option.t (ref str.t)) :=
    let* α0 : ref str.t := M.read (mk_str "Katie") in
    let* α1 : ref str.t := M.read (mk_str "435-8291") in
    let* α2 : core.option.Option.t (ref str.t) :=
      M.call
        ((std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.hash.random.RandomState.t)::["insert"]
          (borrow_mut contacts)
          α0
          α1) in
    M.alloc α2 in
  let* _ : M.Val (core.option.Option.t (ref str.t)) :=
    let* α0 : ref str.t := M.read (mk_str "Robert") in
    let* α1 : ref str.t := M.read (mk_str "956-1745") in
    let* α2 : core.option.Option.t (ref str.t) :=
      M.call
        ((std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.hash.random.RandomState.t)::["insert"]
          (borrow_mut contacts)
          α0
          α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* α0 : core.option.Option.t (ref (ref str.t)) :=
      M.call
        ((std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.hash.random.RandomState.t)::["get"]
          (borrow contacts)
          (borrow (mk_str "Daniel"))) in
    let* α1 : M.Val (core.option.Option.t (ref (ref str.t))) := M.alloc α0 in
    match_operator
      α1
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.option.Option.Some _ =>
            let γ0_0 := core.option.Option.Get_Some_0 γ in
            let* γ0_0 :=
              let* α0 := M.read γ0_0 in
              M.pure (deref α0) in
            let* number := M.copy γ0_0 in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "Calling Daniel: ") in
              let* α1 : ref str.t := M.read (mk_str "
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α2) in
              let* α4 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α3) in
              let* α5 : ref str.t := M.read number in
              let* α6 : ref str.t := M.call (hash_map.call α5) in
              let* α7 : M.Val (ref str.t) := M.alloc α6 in
              let* α8 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
              let* α9 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α8 ] in
              let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α9) in
              let* α11 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α10) in
              let* α12 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
              let* α13 : unit := M.call (std.io.stdio._print α12) in
              M.alloc α13 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* _ : M.Val unit :=
            let* α0 : ref str.t :=
              M.read (mk_str "Don't have Daniel's number.
") in
            let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
            let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
            let* α3 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α2) in
            let* α4 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_const"] α3) in
            let* α5 : unit := M.call (std.io.stdio._print α4) in
            M.alloc α5 in
          M.alloc tt) :
          M (M.Val unit)
      ] in
  let* _ : M.Val (core.option.Option.t (ref str.t)) :=
    let* α0 : ref str.t := M.read (mk_str "Daniel") in
    let* α1 : ref str.t := M.read (mk_str "164-6743") in
    let* α2 : core.option.Option.t (ref str.t) :=
      M.call
        ((std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.hash.random.RandomState.t)::["insert"]
          (borrow_mut contacts)
          α0
          α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* α0 : core.option.Option.t (ref (ref str.t)) :=
      M.call
        ((std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.hash.random.RandomState.t)::["get"]
          (borrow contacts)
          (borrow (mk_str "Ashley"))) in
    let* α1 : M.Val (core.option.Option.t (ref (ref str.t))) := M.alloc α0 in
    match_operator
      α1
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.option.Option.Some _ =>
            let γ0_0 := core.option.Option.Get_Some_0 γ in
            let* γ0_0 :=
              let* α0 := M.read γ0_0 in
              M.pure (deref α0) in
            let* number := M.copy γ0_0 in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "Calling Ashley: ") in
              let* α1 : ref str.t := M.read (mk_str "
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α2) in
              let* α4 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α3) in
              let* α5 : ref str.t := M.read number in
              let* α6 : ref str.t := M.call (hash_map.call α5) in
              let* α7 : M.Val (ref str.t) := M.alloc α6 in
              let* α8 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
              let* α9 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α8 ] in
              let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α9) in
              let* α11 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α10) in
              let* α12 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
              let* α13 : unit := M.call (std.io.stdio._print α12) in
              M.alloc α13 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* _ : M.Val unit :=
            let* α0 : ref str.t :=
              M.read (mk_str "Don't have Ashley's number.
") in
            let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
            let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
            let* α3 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α2) in
            let* α4 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_const"] α3) in
            let* α5 : unit := M.call (std.io.stdio._print α4) in
            M.alloc α5 in
          M.alloc tt) :
          M (M.Val unit)
      ] in
  let* _ : M.Val (core.option.Option.t (ref str.t)) :=
    let* α0 : core.option.Option.t (ref str.t) :=
      M.call
        ((std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.hash.random.RandomState.t)::["remove"]
          (borrow_mut contacts)
          (borrow (mk_str "Ashley"))) in
    M.alloc α0 in
  let* α0 : _ :=
    ltac:(M.get_method (fun ℐ =>
      core.iter.traits.collect.IntoIterator.into_iter
        (Self := std.collections.hash.map.Iter.t (ref str.t) (ref str.t))
        (Trait := ℐ))) in
  let* α1 : std.collections.hash.map.Iter.t (ref str.t) (ref str.t) :=
    M.call
      ((std.collections.hash.map.HashMap.t
            (ref str.t)
            (ref str.t)
            std.hash.random.RandomState.t)::["iter"]
        (borrow contacts)) in
  let* α2 : std.collections.hash.map.Iter.t (ref str.t) (ref str.t) :=
    M.call (α0 α1) in
  let* α3 : M.Val (std.collections.hash.map.Iter.t (ref str.t) (ref str.t)) :=
    M.alloc α2 in
  let* α4 : M.Val unit :=
    match_operator
      α3
      [
        fun γ =>
          (let* iter := M.copy γ in
          M.loop
            (let* _ : M.Val unit :=
              let* α0 : _ :=
                ltac:(M.get_method (fun ℐ =>
                  core.iter.traits.iterator.Iterator.next
                    (Self :=
                      std.collections.hash.map.Iter.t (ref str.t) (ref str.t))
                    (Trait := ℐ))) in
              let* α1 :
                  core.option.Option.t
                    ((ref (ref str.t)) * (ref (ref str.t))) :=
                M.call (α0 (borrow_mut iter)) in
              let* α2 :
                  M.Val
                    (core.option.Option.t
                      ((ref (ref str.t)) * (ref (ref str.t)))) :=
                M.alloc α1 in
              match_operator
                α2
                [
                  fun γ =>
                    (let* α0 := M.read γ in
                    match α0 with
                    | core.option.Option.None =>
                      let* α0 : M.Val never.t := M.break in
                      let* α1 := M.read α0 in
                      let* α2 : unit := never_to_any α1 in
                      M.alloc α2
                    | _ => M.break_match
                    end) :
                    M (M.Val unit);
                  fun γ =>
                    (let* α0 := M.read γ in
                    match α0 with
                    | core.option.Option.Some _ =>
                      let γ0_0 := core.option.Option.Get_Some_0 γ in
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
                        let* _ : M.Val unit :=
                          let* _ : M.Val unit :=
                            let* α0 : ref str.t := M.read (mk_str "Calling ") in
                            let* α1 : ref str.t := M.read (mk_str ": ") in
                            let* α2 : ref str.t := M.read (mk_str "
") in
                            let* α3 : M.Val (array (ref str.t)) :=
                              M.alloc [ α0; α1; α2 ] in
                            let* α4 : M.Val (ref (array (ref str.t))) :=
                              M.alloc (borrow α3) in
                            let* α5 : ref (slice (ref str.t)) :=
                              M.read (pointer_coercion "Unsize" α4) in
                            let* α6 : core.fmt.rt.Argument.t :=
                              M.call
                                (core.fmt.rt.Argument.t::["new_display"]
                                  (borrow contact)) in
                            let* α7 : ref str.t := M.read number in
                            let* α8 : ref str.t := M.call (hash_map.call α7) in
                            let* α9 : M.Val (ref str.t) := M.alloc α8 in
                            let* α10 : core.fmt.rt.Argument.t :=
                              M.call
                                (core.fmt.rt.Argument.t::["new_display"]
                                  (borrow α9)) in
                            let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
                              M.alloc [ α6; α10 ] in
                            let* α12 :
                                M.Val (ref (array core.fmt.rt.Argument.t)) :=
                              M.alloc (borrow α11) in
                            let* α13 : ref (slice core.fmt.rt.Argument.t) :=
                              M.read (pointer_coercion "Unsize" α12) in
                            let* α14 : core.fmt.Arguments.t :=
                              M.call
                                (core.fmt.Arguments.t::["new_v1"] α5 α13) in
                            let* α15 : unit :=
                              M.call (std.io.stdio._print α14) in
                            M.alloc α15 in
                          M.alloc tt in
                        M.alloc tt
                      end
                    | _ => M.break_match
                    end) :
                    M (M.Val unit)
                ] in
            M.alloc tt)) :
          M (M.Val unit)
      ] in
  M.read (use α4).
