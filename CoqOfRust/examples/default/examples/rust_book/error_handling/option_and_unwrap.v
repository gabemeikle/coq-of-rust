(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn give_adult(drink: Option<&str>) {
    // Specify a course of action for each case.
    match drink {
        Some("lemonade") => println!("Yuck! Too sugary."),
        Some(inner) => println!("{}? How nice.", inner),
        None => println!("No drink? Oh well."),
    }
}
*)
Definition give_adult (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [drink] =>
    let* drink := M.alloc drink in
    let* α0 :=
      match_operator
        drink
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let γ0_0 := (M.var "core::option::Option::Get_Some_0") γ in
              let* _ :=
                let* α0 := M.read (mk_str "Yuck! Too sugary.
") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    ((Ty.path "core::fmt::Arguments")::["new_const"]
                      (pointer_coercion "Unsize" (borrow α1))) in
                let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let γ0_0 := (M.var "core::option::Option::Get_Some_0") γ in
              let* inner := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.read (mk_str "") in
                let* α1 := M.read (mk_str "? How nice.
") in
                let* α2 := M.alloc [ α0; α1 ] in
                let* α3 :=
                  M.call
                    ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                      (borrow inner)) in
                let* α4 := M.alloc [ α3 ] in
                let* α5 :=
                  M.call
                    ((Ty.path "core::fmt::Arguments")::["new_v1"]
                      (pointer_coercion "Unsize" (borrow α2))
                      (pointer_coercion "Unsize" (borrow α4))) in
                let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
                M.alloc α6 in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.None =>
              let* _ :=
                let* α0 := M.read (mk_str "No drink? Oh well.
") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    ((Ty.path "core::fmt::Arguments")::["new_const"]
                      (pointer_coercion "Unsize" (borrow α1))) in
                let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple []
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn drink(drink: Option<&str>) {
    // `unwrap` returns a `panic` when it receives a `None`.
    let inside = drink.unwrap();
    if inside == "lemonade" {
        panic!("AAAaaaaa!!!!");
    }

    println!("I love {}s!!!!!", inside);
}
*)
Definition drink (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [drink] =>
    let* drink := M.alloc drink in
    let* inside :=
      let* α0 := M.read drink in
      let* α1 :=
        M.call
          ((Ty.apply
                (Ty.path "core::option::Option")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]])::["unwrap"]
            α0) in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.cmp.PartialEq.eq
            (Self := Ty.apply (Ty.path "ref") [Ty.path "str"])
            (Rhs := Ty.apply (Ty.path "ref") [Ty.path "str"])
            (Trait := ℐ))) in
      let* α1 := M.call (α0 (borrow inside) (borrow (mk_str "lemonade"))) in
      let* α2 := M.alloc α1 in
      let* α3 := M.read (use α2) in
      if α3 then
        let* α0 := M.read (mk_str "AAAaaaaa!!!!") in
        let* α1 := M.call ((M.var "std::panicking::begin_panic") α0) in
        let* α2 := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "I love ") in
        let* α1 := M.read (mk_str "s!!!!!
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_display"]
              (borrow inside)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let water = Some("water");
    let lemonade = Some("lemonade");
    let void = None;

    give_adult(water);
    give_adult(lemonade);
    give_adult(void);

    let coffee = Some("coffee");
    let nothing = None;

    drink(coffee);
    drink(nothing);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* water :=
      let* α0 := M.read (mk_str "water") in
      M.alloc (core.option.Option.Some α0) in
    let* lemonade :=
      let* α0 := M.read (mk_str "lemonade") in
      M.alloc (core.option.Option.Some α0) in
    let* void := M.alloc core.option.Option.None in
    let* _ :=
      let* α0 := M.read water in
      let* α1 := M.call ((M.var "option_and_unwrap::give_adult") α0) in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.read lemonade in
      let* α1 := M.call ((M.var "option_and_unwrap::give_adult") α0) in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.read void in
      let* α1 := M.call ((M.var "option_and_unwrap::give_adult") α0) in
      M.alloc α1 in
    let* coffee :=
      let* α0 := M.read (mk_str "coffee") in
      M.alloc (core.option.Option.Some α0) in
    let* nothing := M.alloc core.option.Option.None in
    let* _ :=
      let* α0 := M.read coffee in
      let* α1 := M.call ((M.var "option_and_unwrap::drink") α0) in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.read nothing in
      let* α1 := M.call ((M.var "option_and_unwrap::drink") α0) in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
