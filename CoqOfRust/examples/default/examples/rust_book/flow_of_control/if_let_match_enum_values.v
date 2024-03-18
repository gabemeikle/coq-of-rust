(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Foo *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Bar";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Baz";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Qux";
        item := StructTuple [ Ty.path "u32" ];
        discriminant := None;
      }
    ];
} *)

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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* a :=
      M.alloc (Value.StructTuple "if_let_match_enum_values::Foo::Bar" []) in
    let* b :=
      M.alloc (Value.StructTuple "if_let_match_enum_values::Foo::Baz" []) in
    let* c :=
      M.alloc
        (Value.StructTuple
          "if_let_match_enum_values::Foo::Qux"
          [ Value.Integer Integer.U32 100 ]) in
    let* _ :=
      match_operator
        a
        [
          fun γ =>
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_const"
                    [] in
                let* α2 := M.read (mk_str "a is foobar
") in
                let* α3 := M.alloc (Value.Array [ α2 ]) in
                let* α4 :=
                  M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                let* α5 := M.call_closure α0 [ α4 ] in
                M.alloc α5 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ => M.alloc (Value.Tuple [])
        ] in
    let* _ :=
      match_operator
        b
        [
          fun γ =>
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_const"
                    [] in
                let* α2 := M.read (mk_str "b is foobar
") in
                let* α3 := M.alloc (Value.Array [ α2 ]) in
                let* α4 :=
                  M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                let* α5 := M.call_closure α0 [ α4 ] in
                M.alloc α5 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ => M.alloc (Value.Tuple [])
        ] in
    let* _ :=
      match_operator
        c
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "if_let_match_enum_values::Foo::Qux"
                0 in
            let* value := M.copy γ0_0 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1"
                    [] in
                let* α2 := M.read (mk_str "c is ") in
                let* α3 := M.read (mk_str "
") in
                let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                let* α5 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display"
                    [ Ty.path "u32" ] in
                let* α6 := M.call_closure α5 [ value ] in
                let* α7 := M.alloc (Value.Array [ α6 ]) in
                let* α8 :=
                  M.call_closure
                    α1
                    [
                      M.pointer_coercion (* Unsize *) α4;
                      M.pointer_coercion (* Unsize *) α7
                    ] in
                let* α9 := M.call_closure α0 [ α8 ] in
                M.alloc α9 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ => M.alloc (Value.Tuple [])
        ] in
    let* α0 :=
      match_operator
        c
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "if_let_match_enum_values::Foo::Qux"
                0 in
            let* value := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.U32 100) in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_const"
                    [] in
                let* α2 := M.read (mk_str "c is one hundred
") in
                let* α3 := M.alloc (Value.Array [ α2 ]) in
                let* α4 :=
                  M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                let* α5 := M.call_closure α0 [ α4 ] in
                M.alloc α5 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ => M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
