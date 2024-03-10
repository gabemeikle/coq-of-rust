(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Book *)

Module Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book.
  (*
  Clone
  *)
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          Value.DeclaredButUndefined
          (Value.Array
            [
              fun γ =>
                (match_operator
                  Value.DeclaredButUndefined
                  (Value.Array
                    [
                      fun γ =>
                        (match_operator
                          Value.DeclaredButUndefined
                          (Value.Array [ fun γ => (M.read self) ]))
                    ]))
            ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "scoping_rules_borrowing_mutablity::Book")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book.

Module Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "scoping_rules_borrowing_mutablity::Book")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book.

(*
fn borrow_book(book: &Book) {
    println!(
        "I immutably borrowed {} - {} edition",
        book.title, book.year
    );
}
*)
Definition borrow_book (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ book ] =>
    let* book := M.alloc book in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "I immutably borrowed ") in
        let* α3 := M.read (mk_str " - ") in
        let* α4 := M.read (mk_str " edition
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α7 := M.read book in
        let* α8 := M.call α6 [ M.get_struct_record α7 "title" ] in
        let* α9 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α10 := M.read book in
        let* α11 := M.call α9 [ M.get_struct_record α10 "year" ] in
        let* α12 := M.alloc (Value.Array [ α8; α11 ]) in
        let* α13 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α12
            ] in
        let* α14 := M.call α0 [ α13 ] in
        M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn new_edition(book: &mut Book) {
    book.year = 2014;
    println!("I mutably borrowed {} - {} edition", book.title, book.year);
}
*)
Definition new_edition (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ book ] =>
    let* book := M.alloc book in
    let* _ :=
      let* α0 := M.read book in
      M.assign
        (M.get_struct_record α0 "year")
        (Value.Integer Integer.U32 2014) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "I mutably borrowed ") in
        let* α3 := M.read (mk_str " - ") in
        let* α4 := M.read (mk_str " edition
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α7 := M.read book in
        let* α8 := M.call α6 [ M.get_struct_record α7 "title" ] in
        let* α9 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α10 := M.read book in
        let* α11 := M.call α9 [ M.get_struct_record α10 "year" ] in
        let* α12 := M.alloc (Value.Array [ α8; α11 ]) in
        let* α13 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α12
            ] in
        let* α14 := M.call α0 [ α13 ] in
        M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Create an immutable Book named `immutabook`
    let immutabook = Book {
        // string literals have type `&'static str`
        author: "Douglas Hofstadter",
        title: "Gödel, Escher, Bach",
        year: 1979,
    };

    // Create a mutable copy of `immutabook` and call it `mutabook`
    let mut mutabook = immutabook;

    // Immutably borrow an immutable object
    borrow_book(&immutabook);

    // Immutably borrow a mutable object
    borrow_book(&mutabook);

    // Borrow a mutable object as mutable
    new_edition(&mut mutabook);

    // Error! Cannot borrow an immutable object as mutable
    //new_edition(&mut immutabook);
    // FIXME ^ Comment out this line
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* immutabook :=
      let* α0 := M.read (mk_str "Douglas Hofstadter") in
      let* α1 :=
        M.read (mk_str ("G" ++ String.String "246" "del, Escher, Bach")) in
      M.alloc
        (Value.StructRecord
          "scoping_rules_borrowing_mutablity::Book"
          [
            ("author", α0);
            ("title", α1);
            ("year", Value.Integer Integer.U32 1979)
          ]) in
    let* mutabook := M.copy immutabook in
    let* _ :=
      let* α0 :=
        M.get_function "scoping_rules_borrowing_mutablity::borrow_book" [] in
      let* α1 := M.call α0 [ immutabook ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_function "scoping_rules_borrowing_mutablity::borrow_book" [] in
      let* α1 := M.call α0 [ mutabook ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_function "scoping_rules_borrowing_mutablity::new_edition" [] in
      let* α1 := M.call α0 [ mutabook ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
