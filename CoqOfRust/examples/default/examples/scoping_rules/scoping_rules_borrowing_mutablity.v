(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module  Book.
Section Book.
  Record t : Set := {
    author : ref str.t;
    title : ref str.t;
    year : u32.t;
  }.
  
  Global Instance Get_author : Notations.Dot "author" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(author))
        (fun β α => Some (α <| author := β |>));
  }.
  Global Instance Get_AF_author : Notations.DoubleColon t "author" := {
    Notations.double_colon (α : M.Val t) := α.["author"];
  }.
  Global Instance Get_title : Notations.Dot "title" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(title)) (fun β α => Some (α <| title := β |>));
  }.
  Global Instance Get_AF_title : Notations.DoubleColon t "title" := {
    Notations.double_colon (α : M.Val t) := α.["title"];
  }.
  Global Instance Get_year : Notations.Dot "year" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(year)) (fun β α => Some (α <| year := β |>));
  }.
  Global Instance Get_AF_year : Notations.DoubleColon t "year" := {
    Notations.double_colon (α : M.Val t) := α.["year"];
  }.
End Book.
End Book.

Module  Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
Section Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
  Definition Self : Set := scoping_rules_borrowing_mutablity.Book.t.
  
  (*
  Clone
  *)
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition clone
      (self : ref Self)
      : M scoping_rules_borrowing_mutablity.Book.t :=
    let* self := M.alloc self in
    let* α0 : M.Val scoping_rules_borrowing_mutablity.Book.t :=
      match tt with
      | _ =>
        match tt with
        | _ =>
          match tt with
          | _ =>
            let* α0 : ref scoping_rules_borrowing_mutablity.Book.t :=
              M.read self in
            M.pure (deref α0)
          end
        end
      end in
    M.read α0.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.

Module  Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
Section Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
  Definition Self : Set := scoping_rules_borrowing_mutablity.Book.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.

(*
fn borrow_book(book: &Book) {
    println!(
        "I immutably borrowed {} - {} edition",
        book.title, book.year
    );
}
*)
Definition borrow_book
    (book : ref scoping_rules_borrowing_mutablity.Book.t)
    : M unit :=
  let* book := M.alloc book in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "I immutably borrowed ") in
      let* α1 : ref str.t := M.read (mk_str " - ") in
      let* α2 : ref str.t := M.read (mk_str " edition
") in
      let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
      let* α4 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α3) in
      let* α5 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α4) in
      let* α6 : ref scoping_rules_borrowing_mutablity.Book.t := M.read book in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow (deref α6).["title"])) in
      let* α8 : ref scoping_rules_borrowing_mutablity.Book.t := M.read book in
      let* α9 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow (deref α8).["year"])) in
      let* α10 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7; α9 ] in
      let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α10) in
      let* α12 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α11) in
      let* α13 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α5 α12) in
      let* α14 : unit := M.call (std.io.stdio._print α13) in
      M.alloc α14 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn new_edition(book: &mut Book) {
    book.year = 2014;
    println!("I mutably borrowed {} - {} edition", book.title, book.year);
}
*)
Definition new_edition
    (book : mut_ref scoping_rules_borrowing_mutablity.Book.t)
    : M unit :=
  let* book := M.alloc book in
  let* _ : M.Val unit :=
    let* α0 : mut_ref scoping_rules_borrowing_mutablity.Book.t := M.read book in
    assign (deref α0).["year"] (Integer.of_Z 2014) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "I mutably borrowed ") in
      let* α1 : ref str.t := M.read (mk_str " - ") in
      let* α2 : ref str.t := M.read (mk_str " edition
") in
      let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
      let* α4 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α3) in
      let* α5 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α4) in
      let* α6 : mut_ref scoping_rules_borrowing_mutablity.Book.t :=
        M.read book in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow (deref α6).["title"])) in
      let* α8 : mut_ref scoping_rules_borrowing_mutablity.Book.t :=
        M.read book in
      let* α9 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow (deref α8).["year"])) in
      let* α10 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7; α9 ] in
      let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α10) in
      let* α12 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α11) in
      let* α13 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α5 α12) in
      let* α14 : unit := M.call (std.io.stdio._print α13) in
      M.alloc α14 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

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
Definition main : M unit :=
  let* immutabook : M.Val scoping_rules_borrowing_mutablity.Book.t :=
    let* α0 : ref str.t := M.read (mk_str "Douglas Hofstadter") in
    let* α1 : ref str.t :=
      M.read (mk_str ("G" ++ String.String "246" "del, Escher, Bach")) in
    M.alloc
      {|
        scoping_rules_borrowing_mutablity.Book.author := α0;
        scoping_rules_borrowing_mutablity.Book.title := α1;
        scoping_rules_borrowing_mutablity.Book.year := Integer.of_Z 1979;
      |} in
  let* mutabook : M.Val scoping_rules_borrowing_mutablity.Book.t :=
    M.copy immutabook in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      M.call
        (scoping_rules_borrowing_mutablity.borrow_book (borrow immutabook)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      M.call
        (scoping_rules_borrowing_mutablity.borrow_book (borrow mutabook)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      M.call
        (scoping_rules_borrowing_mutablity.new_edition (borrow_mut mutabook)) in
    M.alloc α0 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
