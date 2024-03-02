(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



(*
fn main() {
    // Create example variables
    let a = Foo::Bar;
    let b = Foo::Baz;
    let c = Foo::Qux(100);

    // Variable a matches Foo::Bar
    if let Foo::Bar = a {
        println!("a is foobar");
    }

    // Variable b does not match Foo::Bar
    // So this will print nothing
    if let Foo::Bar = b {
        println!("b is foobar");
    }

    // Variable c matches Foo::Qux which has a value
    // Similar to Some() in the previous example
    if let Foo::Qux(value) = c {
        println!("c is {}", value);
    }

    // Binding also works with `if let`
    if let Foo::Qux(value @ 100) = c {
        println!("c is one hundred");
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* a := M.alloc if_let_match_enum_values.Foo.Bar in
    let* b := M.alloc if_let_match_enum_values.Foo.Baz in
    let* c :=
      M.alloc
        (if_let_match_enum_values.Foo.Qux
          ((Integer.of_Z 100) : Ty.path "u32")) in
    let* _ :=
      match_operator
        a
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | if_let_match_enum_values.Foo.Bar =>
              let* _ :=
                let* _ :=
                  let* α0 := M.read (mk_str "a is foobar
") in
                  let* α1 := M.alloc [ α0 ] in
                  let* α2 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::Arguments")
                            [])::["new_const"]
                        (pointer_coercion "Unsize" (borrow α1))) in
                  let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                  M.alloc α3 in
                M.alloc tt in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple;
          fun γ => (M.alloc tt) : Ty.path "unit"
        ] in
    let* _ :=
      match_operator
        b
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | if_let_match_enum_values.Foo.Bar =>
              let* _ :=
                let* _ :=
                  let* α0 := M.read (mk_str "b is foobar
") in
                  let* α1 := M.alloc [ α0 ] in
                  let* α2 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::Arguments")
                            [])::["new_const"]
                        (pointer_coercion "Unsize" (borrow α1))) in
                  let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                  M.alloc α3 in
                M.alloc tt in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple;
          fun γ => (M.alloc tt) : Ty.path "unit"
        ] in
    let* _ :=
      match_operator
        c
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | if_let_match_enum_values.Foo.Qux _ =>
              let γ0_0 :=
                (M.var "if_let_match_enum_values::Foo::Get_Qux_0") γ in
              let* value := M.copy γ0_0 in
              let* _ :=
                let* _ :=
                  let* α0 := M.read (mk_str "c is ") in
                  let* α1 := M.read (mk_str "
") in
                  let* α2 := M.alloc [ α0; α1 ] in
                  let* α3 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::rt::Argument")
                            [])::["new_display"]
                        (borrow value)) in
                  let* α4 := M.alloc [ α3 ] in
                  let* α5 :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::Arguments")
                            [])::["new_v1"]
                        (pointer_coercion "Unsize" (borrow α2))
                        (pointer_coercion "Unsize" (borrow α4))) in
                  let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
                  M.alloc α6 in
                M.alloc tt in
              M.alloc tt
            | _ => M.break_match
            end) :
            Ty.tuple;
          fun γ => (M.alloc tt) : Ty.path "unit"
        ] in
    let* α0 :=
      match_operator
        c
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | if_let_match_enum_values.Foo.Qux _ =>
              let γ0_0 :=
                (M.var "if_let_match_enum_values::Foo::Get_Qux_0") γ in
              let* value := M.copy γ0_0 in
              let* α0 := M.read γ0_0 in
              match α0 with
              | u32.Make 100 =>
                let* _ :=
                  let* _ :=
                    let* α0 := M.read (mk_str "c is one hundred
") in
                    let* α1 := M.alloc [ α0 ] in
                    let* α2 :=
                      M.call
                        ((Ty.apply
                              (Ty.path "core::fmt::Arguments")
                              [])::["new_const"]
                          (pointer_coercion "Unsize" (borrow α1))) in
                    let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
                    M.alloc α3 in
                  M.alloc tt in
                M.alloc tt
              | _ => M.break_match
              end
            | _ => M.break_match
            end) :
            Ty.tuple;
          fun γ => (M.alloc tt) : Ty.path "unit"
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
