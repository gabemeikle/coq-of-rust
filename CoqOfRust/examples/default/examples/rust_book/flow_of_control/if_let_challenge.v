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
      }
    ];
} *)

(*
fn main() {
    let a = Foo::Bar;

    // Variable a matches Foo::Bar
    if let Foo::Bar = a {
        // ^-- this causes a compile-time error. Use `if let` instead.
        println!("a is foobar");
    }
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* a := M.alloc (Value.StructTuple "if_let_challenge::Foo::Bar" []) in
    let* α0 :=
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
    M.read α0
  | _, _ => M.impossible
  end.
