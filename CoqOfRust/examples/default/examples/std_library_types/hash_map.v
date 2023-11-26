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
  let* number : M.Val (ref str.t) := M.alloc number in
  M.function_body
    (let* α0 := M.read number in
    let* α1 : M.Val (ref str.t) :=
      match α0 with
      | _ =>
        let* α0 : ref str.t :=
          M.read
            (mk_str
              "We're sorry, the call cannot be completed as dialed. 
            Please hang up and try again.") in
        let* α1 : M.Val str.t := deref α0 in
        let* α2 : ref str.t := borrow α1 in
        M.alloc α2
      | _ =>
        let* α0 : ref str.t :=
          M.read
            (mk_str
              "Hello, this is Mr. Awesome's Pizza. My name is Fred.
            What can I get for you today?") in
        let* α1 : M.Val str.t := deref α0 in
        let* α2 : ref str.t := borrow α1 in
        M.alloc α2
      | _ =>
        let* α0 : ref str.t := M.read (mk_str "Hi! Who is this again?") in
        let* α1 : M.Val str.t := deref α0 in
        let* α2 : ref str.t := borrow α1 in
        M.alloc α2
      end in
    M.read α1).

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
  M.function_body
    (let* contacts :
        M.Val
          (std.collections.hash.map.HashMap.t
            (ref str.t)
            (ref str.t)
            std.collections.hash.map.RandomState.t) :=
      let* α0 :
          std.collections.hash.map.HashMap.t
            (ref str.t)
            (ref str.t)
            std.collections.hash.map.RandomState.t :=
        (std.collections.hash.map.HashMap.t
            (ref str.t)
            (ref str.t)
            std.collections.hash.map.RandomState.t)::["new"] in
      M.alloc α0 in
    let* _ : M.Val (core.option.Option.t (ref str.t)) :=
      let* α0 :
          mut_ref
            (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t) :=
        borrow_mut contacts in
      let* α1 : ref str.t := M.read (mk_str "Daniel") in
      let* α2 : ref str.t := M.read (mk_str "798-1364") in
      let* α3 : core.option.Option.t (ref str.t) :=
        (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t)::["insert"]
          α0
          α1
          α2 in
      M.alloc α3 in
    let* _ : M.Val (core.option.Option.t (ref str.t)) :=
      let* α0 :
          mut_ref
            (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t) :=
        borrow_mut contacts in
      let* α1 : ref str.t := M.read (mk_str "Ashley") in
      let* α2 : M.Val str.t := deref α1 in
      let* α3 : ref str.t := borrow α2 in
      let* α4 : ref str.t := M.read (mk_str "645-7689") in
      let* α5 : M.Val str.t := deref α4 in
      let* α6 : ref str.t := borrow α5 in
      let* α7 : core.option.Option.t (ref str.t) :=
        (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t)::["insert"]
          α0
          α3
          α6 in
      M.alloc α7 in
    let* _ : M.Val (core.option.Option.t (ref str.t)) :=
      let* α0 :
          mut_ref
            (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t) :=
        borrow_mut contacts in
      let* α1 : ref str.t := M.read (mk_str "Katie") in
      let* α2 : M.Val str.t := deref α1 in
      let* α3 : ref str.t := borrow α2 in
      let* α4 : ref str.t := M.read (mk_str "435-8291") in
      let* α5 : M.Val str.t := deref α4 in
      let* α6 : ref str.t := borrow α5 in
      let* α7 : core.option.Option.t (ref str.t) :=
        (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t)::["insert"]
          α0
          α3
          α6 in
      M.alloc α7 in
    let* _ : M.Val (core.option.Option.t (ref str.t)) :=
      let* α0 :
          mut_ref
            (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t) :=
        borrow_mut contacts in
      let* α1 : ref str.t := M.read (mk_str "Robert") in
      let* α2 : M.Val str.t := deref α1 in
      let* α3 : ref str.t := borrow α2 in
      let* α4 : ref str.t := M.read (mk_str "956-1745") in
      let* α5 : M.Val str.t := deref α4 in
      let* α6 : ref str.t := borrow α5 in
      let* α7 : core.option.Option.t (ref str.t) :=
        (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t)::["insert"]
          α0
          α3
          α6 in
      M.alloc α7 in
    let* _ : M.Val unit :=
      let* α0 :
          ref
            (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t) :=
        borrow contacts in
      let* α1 : ref (ref str.t) := borrow (mk_str "Daniel") in
      let* α2 : core.option.Option.t (ref (ref str.t)) :=
        (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t)::["get"]
          α0
          α1 in
      let* α3 : M.Val (core.option.Option.t (ref (ref str.t))) := M.alloc α2 in
      let* α4 := M.read α3 in
      match α4 with
      | core.option.Option.Some number =>
        let* number := M.alloc number in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "Calling Daniel: "; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref str.t := M.read number in
          let* α6 : M.Val str.t := deref α5 in
          let* α7 : ref str.t := borrow α6 in
          let* α8 : ref str.t := hash_map.call α7 in
          let* α9 : M.Val (ref str.t) := M.alloc α8 in
          let* α10 : ref (ref str.t) := borrow α9 in
          let* α11 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α10 in
          let* α12 : M.Val core.fmt.rt.Argument.t := M.alloc α11 in
          let* α13 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α12 ] in
          let* α14 : ref (array core.fmt.rt.Argument.t) := borrow α13 in
          let* α15 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α14 in
          let* α16 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α15 in
          let* α17 : ref (slice core.fmt.rt.Argument.t) := M.read α16 in
          let* α18 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α17 in
          let* α19 : unit := std.io.stdio._print α18 in
          M.alloc α19 in
        M.alloc tt
      | _ =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "Don't have Daniel's number.
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_const"] α4 in
          let* α6 : unit := std.io.stdio._print α5 in
          M.alloc α6 in
        M.alloc tt
      end in
    let* _ : M.Val (core.option.Option.t (ref str.t)) :=
      let* α0 :
          mut_ref
            (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t) :=
        borrow_mut contacts in
      let* α1 : ref str.t := M.read (mk_str "Daniel") in
      let* α2 : M.Val str.t := deref α1 in
      let* α3 : ref str.t := borrow α2 in
      let* α4 : ref str.t := M.read (mk_str "164-6743") in
      let* α5 : M.Val str.t := deref α4 in
      let* α6 : ref str.t := borrow α5 in
      let* α7 : core.option.Option.t (ref str.t) :=
        (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t)::["insert"]
          α0
          α3
          α6 in
      M.alloc α7 in
    let* _ : M.Val unit :=
      let* α0 :
          ref
            (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t) :=
        borrow contacts in
      let* α1 : ref (ref str.t) := borrow (mk_str "Ashley") in
      let* α2 : core.option.Option.t (ref (ref str.t)) :=
        (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t)::["get"]
          α0
          α1 in
      let* α3 : M.Val (core.option.Option.t (ref (ref str.t))) := M.alloc α2 in
      let* α4 := M.read α3 in
      match α4 with
      | core.option.Option.Some number =>
        let* number := M.alloc number in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "Calling Ashley: "; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref str.t := M.read number in
          let* α6 : M.Val str.t := deref α5 in
          let* α7 : ref str.t := borrow α6 in
          let* α8 : ref str.t := hash_map.call α7 in
          let* α9 : M.Val (ref str.t) := M.alloc α8 in
          let* α10 : ref (ref str.t) := borrow α9 in
          let* α11 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α10 in
          let* α12 : M.Val core.fmt.rt.Argument.t := M.alloc α11 in
          let* α13 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α12 ] in
          let* α14 : ref (array core.fmt.rt.Argument.t) := borrow α13 in
          let* α15 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α14 in
          let* α16 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α15 in
          let* α17 : ref (slice core.fmt.rt.Argument.t) := M.read α16 in
          let* α18 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α17 in
          let* α19 : unit := std.io.stdio._print α18 in
          M.alloc α19 in
        M.alloc tt
      | _ =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "Don't have Ashley's number.
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_const"] α4 in
          let* α6 : unit := std.io.stdio._print α5 in
          M.alloc α6 in
        M.alloc tt
      end in
    let* _ : M.Val (core.option.Option.t (ref str.t)) :=
      let* α0 :
          mut_ref
            (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t) :=
        borrow_mut contacts in
      let* α1 : ref (ref str.t) := borrow (mk_str "Ashley") in
      let* α2 : core.option.Option.t (ref str.t) :=
        (std.collections.hash.map.HashMap.t
              (ref str.t)
              (ref str.t)
              std.collections.hash.map.RandomState.t)::["remove"]
          α0
          α1 in
      M.alloc α2 in
    let* α0 :
        ref
          (std.collections.hash.map.HashMap.t
            (ref str.t)
            (ref str.t)
            std.collections.hash.map.RandomState.t) :=
      borrow contacts in
    let* α1 : std.collections.hash.map.Iter.t (ref str.t) (ref str.t) :=
      (std.collections.hash.map.HashMap.t
            (ref str.t)
            (ref str.t)
            std.collections.hash.map.RandomState.t)::["iter"]
        α0 in
    let* α2 : std.collections.hash.map.Iter.t (ref str.t) (ref str.t) :=
      (core.iter.traits.collect.IntoIterator.into_iter
          (Self := std.collections.hash.map.Iter.t (ref str.t) (ref str.t))
          (Trait := ltac:(refine _)))
        α1 in
    let* α3 : M.Val (std.collections.hash.map.Iter.t (ref str.t) (ref str.t)) :=
      M.alloc α2 in
    let* α4 := M.read α3 in
    let* α5 : M.Val unit :=
      match α4 with
      | iter =>
        let* iter := M.alloc iter in
        loop
          (let* _ : M.Val unit :=
            let* α0 :
                mut_ref
                  (std.collections.hash.map.Iter.t (ref str.t) (ref str.t)) :=
              borrow_mut iter in
            let* α1 :
                core.option.Option.t ((ref (ref str.t)) * (ref (ref str.t))) :=
              (core.iter.traits.iterator.Iterator.next
                  (Self :=
                    std.collections.hash.map.Iter.t (ref str.t) (ref str.t))
                  (Trait := ltac:(refine _)))
                α0 in
            let* α2 :
                M.Val
                  (core.option.Option.t
                    ((ref (ref str.t)) * (ref (ref str.t)))) :=
              M.alloc α1 in
            let* α3 := M.read α2 in
            match α3 with
            | core.option.Option.None  =>
              let* α0 : M.Val never.t := Break in
              never_to_any α0
            | core.option.Option.Some (contact, number) =>
              let* number := M.alloc number in
              let* contact := M.alloc contact in
              let* _ : M.Val unit :=
                let* _ : M.Val unit :=
                  let* α0 : M.Val (array (ref str.t)) :=
                    M.alloc [ mk_str "Calling "; mk_str ": "; mk_str "
" ] in
                  let* α1 : ref (array (ref str.t)) := borrow α0 in
                  let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
                  let* α3 : M.Val (ref (slice (ref str.t))) :=
                    pointer_coercion "Unsize" α2 in
                  let* α4 : ref (slice (ref str.t)) := M.read α3 in
                  let* α5 : ref (ref (ref str.t)) := borrow contact in
                  let* α6 : core.fmt.rt.Argument.t :=
                    core.fmt.rt.Argument.t::["new_display"] α5 in
                  let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
                  let* α8 : ref str.t := M.read number in
                  let* α9 : M.Val str.t := deref α8 in
                  let* α10 : ref str.t := borrow α9 in
                  let* α11 : ref str.t := hash_map.call α10 in
                  let* α12 : M.Val (ref str.t) := M.alloc α11 in
                  let* α13 : ref (ref str.t) := borrow α12 in
                  let* α14 : core.fmt.rt.Argument.t :=
                    core.fmt.rt.Argument.t::["new_display"] α13 in
                  let* α15 : M.Val core.fmt.rt.Argument.t := M.alloc α14 in
                  let* α16 : M.Val (array core.fmt.rt.Argument.t) :=
                    M.alloc [ α7; α15 ] in
                  let* α17 : ref (array core.fmt.rt.Argument.t) := borrow α16 in
                  let* α18 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                    M.alloc α17 in
                  let* α19 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
                    pointer_coercion "Unsize" α18 in
                  let* α20 : ref (slice core.fmt.rt.Argument.t) := M.read α19 in
                  let* α21 : core.fmt.Arguments.t :=
                    core.fmt.Arguments.t::["new_v1"] α4 α20 in
                  let* α22 : unit := std.io.stdio._print α21 in
                  M.alloc α22 in
                M.alloc tt in
              M.alloc tt
            end in
          M.alloc tt)
      end in
    let* α0 : M.Val unit := use α5 in
    M.read α0).
