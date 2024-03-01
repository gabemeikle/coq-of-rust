(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn drink(beverage: &str) {
    // You shouldn't drink too much sugary beverages.
    if beverage == "lemonade" {
        panic!("AAAaaaaa!!!!");
    }

    println!("Some refreshing {} is all I need.", beverage);
}
*)
Definition drink (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [beverage] =>
    let* beverage := M.alloc beverage in
    let* _ : Ty.tuple :=
      let* α0 :
          Ty.function
            [Ty.apply
                (Ty.path "ref")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]];
              Ty.apply
                (Ty.path "ref")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]]]
            (Ty.path "bool") :=
        ltac:(M.get_method (fun ℐ =>
          core.cmp.PartialEq.eq
            (Self := Ty.apply (Ty.path "ref") [Ty.path "str"])
            (Rhs := Ty.apply (Ty.path "ref") [Ty.path "str"])
            (Trait := ℐ))) in
      let* α1 : Ty.path "bool" :=
        M.call (α0 (borrow beverage) (borrow (mk_str "lemonade"))) in
      let* α2 : Ty.path "bool" := M.alloc α1 in
      let* α3 : Ty.path "bool" := M.read (use α2) in
      if α3 then
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "AAAaaaaa!!!!") in
        let* α1 : Ty.path "never" := M.call (std.panicking.begin_panic α0) in
        let* α2 : Ty.tuple := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "Some refreshing ") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str " is all I need.
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow beverage)) in
        let* α4 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α3 ] in
        let* α5 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 : Ty.tuple := M.call (std.io.stdio._print α5) in
        M.alloc α6 in
      M.alloc tt in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    drink("water");
    drink("lemonade");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ : Ty.tuple :=
      let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "water") in
      let* α1 : Ty.tuple := M.call (panic.drink α0) in
      M.alloc α1 in
    let* _ : Ty.tuple :=
      let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "lemonade") in
      let* α1 : Ty.tuple := M.call (panic.drink α0) in
      M.alloc α1 in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
