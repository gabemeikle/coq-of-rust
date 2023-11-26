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
      Ref.map (fun x => x.(author)) (fun v x => x <| author := v |>);
  }.
  Global Instance Get_AF_author : Notations.DoubleColon t "author" := {
    Notations.double_colon (x : M.Val t) := x.["author"];
  }.
  Global Instance Get_title : Notations.Dot "title" := {
    Notations.dot :=
      Ref.map (fun x => x.(title)) (fun v x => x <| title := v |>);
  }.
  Global Instance Get_AF_title : Notations.DoubleColon t "title" := {
    Notations.double_colon (x : M.Val t) := x.["title"];
  }.
  Global Instance Get_year : Notations.Dot "year" := {
    Notations.dot := Ref.map (fun x => x.(year)) (fun v x => x <| year := v |>);
  }.
  Global Instance Get_AF_year : Notations.DoubleColon t "year" := {
    Notations.double_colon (x : M.Val t) := x.["year"];
  }.
End Book.
End Book.

Module  Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
Section Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
  Ltac Self := exact scoping_rules_borrowing_mutablity.Book.t.
  
  (*
  Clone
  *)
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition clone
      (self : ref ltac:(Self))
      : M scoping_rules_borrowing_mutablity.Book.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    M.function_body
      (let* _ : M.Val unit := M.alloc tt in
      let* _ : M.Val unit := M.alloc tt in
      let* _ : M.Val unit := M.alloc tt in
      let* α0 : ref scoping_rules_borrowing_mutablity.Book.t := M.read self in
      let* α0 : M.Val scoping_rules_borrowing_mutablity.Book.t := deref α0 in
      M.read α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.

Module  Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
Section Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
  Ltac Self := exact scoping_rules_borrowing_mutablity.Book.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
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
  let* book : M.Val (ref scoping_rules_borrowing_mutablity.Book.t) :=
    M.alloc book in
  M.function_body
    (let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc
            [ mk_str "I immutably borrowed "; mk_str " - "; mk_str " edition
"
            ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref scoping_rules_borrowing_mutablity.Book.t := M.read book in
        let* α8 : M.Val scoping_rules_borrowing_mutablity.Book.t := deref α7 in
        let* α9 : ref (ref str.t) := borrow α8.["title"] in
        let* α10 : M.Val (ref str.t) := deref α9 in
        let* α11 : ref (ref str.t) := borrow α10 in
        let* α12 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α11 in
        let* α13 : M.Val core.fmt.rt.Argument.t := M.alloc α12 in
        let* α14 : ref scoping_rules_borrowing_mutablity.Book.t :=
          M.read book in
        let* α15 : M.Val scoping_rules_borrowing_mutablity.Book.t :=
          deref α14 in
        let* α16 : ref u32.t := borrow α15.["year"] in
        let* α17 : M.Val u32.t := deref α16 in
        let* α18 : ref u32.t := borrow α17 in
        let* α19 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α18 in
        let* α20 : M.Val core.fmt.rt.Argument.t := M.alloc α19 in
        let* α21 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α13; α20 ] in
        let* α22 : ref (array core.fmt.rt.Argument.t) := borrow α21 in
        let* α23 : M.Val (array core.fmt.rt.Argument.t) := deref α22 in
        let* α24 : ref (array core.fmt.rt.Argument.t) := borrow α23 in
        let* α25 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α24 in
        let* α26 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α25 in
        let* α27 : ref (slice core.fmt.rt.Argument.t) := M.read α26 in
        let* α28 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α27 in
        let* α29 : unit := std.io.stdio._print α28 in
        M.alloc α29 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).

(*
fn new_edition(book: &mut Book) {
    book.year = 2014;
    println!("I mutably borrowed {} - {} edition", book.title, book.year);
}
*)
Definition new_edition
    (book : mut_ref scoping_rules_borrowing_mutablity.Book.t)
    : M unit :=
  let* book : M.Val (mut_ref scoping_rules_borrowing_mutablity.Book.t) :=
    M.alloc book in
  M.function_body
    (let* _ : M.Val unit :=
      let* α0 : mut_ref scoping_rules_borrowing_mutablity.Book.t :=
        M.read book in
      let* α1 : M.Val scoping_rules_borrowing_mutablity.Book.t := deref α0 in
      let* α2 : M.Val u32.t := M.alloc 2014 in
      let* α3 : u32.t := M.read α2 in
      assign α1.["year"] α3 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc
            [ mk_str "I mutably borrowed "; mk_str " - "; mk_str " edition
"
            ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : mut_ref scoping_rules_borrowing_mutablity.Book.t :=
          M.read book in
        let* α8 : M.Val scoping_rules_borrowing_mutablity.Book.t := deref α7 in
        let* α9 : ref (ref str.t) := borrow α8.["title"] in
        let* α10 : M.Val (ref str.t) := deref α9 in
        let* α11 : ref (ref str.t) := borrow α10 in
        let* α12 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α11 in
        let* α13 : M.Val core.fmt.rt.Argument.t := M.alloc α12 in
        let* α14 : mut_ref scoping_rules_borrowing_mutablity.Book.t :=
          M.read book in
        let* α15 : M.Val scoping_rules_borrowing_mutablity.Book.t :=
          deref α14 in
        let* α16 : ref u32.t := borrow α15.["year"] in
        let* α17 : M.Val u32.t := deref α16 in
        let* α18 : ref u32.t := borrow α17 in
        let* α19 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α18 in
        let* α20 : M.Val core.fmt.rt.Argument.t := M.alloc α19 in
        let* α21 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α13; α20 ] in
        let* α22 : ref (array core.fmt.rt.Argument.t) := borrow α21 in
        let* α23 : M.Val (array core.fmt.rt.Argument.t) := deref α22 in
        let* α24 : ref (array core.fmt.rt.Argument.t) := borrow α23 in
        let* α25 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α24 in
        let* α26 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α25 in
        let* α27 : ref (slice core.fmt.rt.Argument.t) := M.read α26 in
        let* α28 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α27 in
        let* α29 : unit := std.io.stdio._print α28 in
        M.alloc α29 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).

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
  M.function_body
    (let* immutabook : M.Val scoping_rules_borrowing_mutablity.Book.t :=
      let* α0 : ref str.t := M.read (mk_str "Douglas Hofstadter") in
      let* α1 : ref str.t :=
        M.read (mk_str ("G" ++ String.String "246" "del, Escher, Bach")) in
      let* α2 : M.Val u32.t := M.alloc 1979 in
      let* α3 : u32.t := M.read α2 in
      M.alloc
        {|
          scoping_rules_borrowing_mutablity.Book.author := α0;
          scoping_rules_borrowing_mutablity.Book.title := α1;
          scoping_rules_borrowing_mutablity.Book.year := α3;
        |} in
    let* mutabook : M.Val scoping_rules_borrowing_mutablity.Book.t :=
      M.copy immutabook in
    let* _ : M.Val unit :=
      let* α0 : ref scoping_rules_borrowing_mutablity.Book.t :=
        borrow immutabook in
      let* α1 : M.Val scoping_rules_borrowing_mutablity.Book.t := deref α0 in
      let* α2 : ref scoping_rules_borrowing_mutablity.Book.t := borrow α1 in
      let* α3 : unit := scoping_rules_borrowing_mutablity.borrow_book α2 in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* α0 : ref scoping_rules_borrowing_mutablity.Book.t :=
        borrow mutabook in
      let* α1 : M.Val scoping_rules_borrowing_mutablity.Book.t := deref α0 in
      let* α2 : ref scoping_rules_borrowing_mutablity.Book.t := borrow α1 in
      let* α3 : unit := scoping_rules_borrowing_mutablity.borrow_book α2 in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* α0 : mut_ref scoping_rules_borrowing_mutablity.Book.t :=
        borrow_mut mutabook in
      let* α1 : M.Val scoping_rules_borrowing_mutablity.Book.t := deref α0 in
      let* α2 : mut_ref scoping_rules_borrowing_mutablity.Book.t :=
        borrow_mut α1 in
      let* α3 : unit := scoping_rules_borrowing_mutablity.new_edition α2 in
      M.alloc α3 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
