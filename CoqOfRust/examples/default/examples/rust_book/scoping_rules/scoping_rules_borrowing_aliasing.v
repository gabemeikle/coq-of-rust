(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Point";
    ty_params := [];
    fields :=
      [ ("x", Ty.path "i32"); ("y", Ty.path "i32"); ("z", Ty.path "i32") ];
  } *)

(*
fn main() {
    let mut point = Point { x: 0, y: 0, z: 0 };

    let borrowed_point = &point;
    let another_borrow = &point;

    // Data can be accessed via the references and the original owner
    println!(
        "Point has coordinates: ({}, {}, {})",
        borrowed_point.x, another_borrow.y, point.z
    );

    // Error! Can't borrow `point` as mutable because it's currently
    // borrowed as immutable.
    // let mutable_borrow = &mut point;
    // TODO ^ Try uncommenting this line

    // The borrowed values are used again here
    println!(
        "Point has coordinates: ({}, {}, {})",
        borrowed_point.x, another_borrow.y, point.z
    );

    // The immutable references are no longer used for the rest of the code so
    // it is possible to reborrow with a mutable reference.
    let mutable_borrow = &mut point;

    // Change data via mutable reference
    mutable_borrow.x = 5;
    mutable_borrow.y = 2;
    mutable_borrow.z = 1;

    // Error! Can't borrow `point` as immutable because it's currently
    // borrowed as mutable.
    // let y = &point.y;
    // TODO ^ Try uncommenting this line

    // Error! Can't print because `println!` takes an immutable reference.
    // println!("Point Z coordinate is {}", point.z);
    // TODO ^ Try uncommenting this line

    // Ok! Mutable references can be passed as immutable to `println!`
    println!(
        "Point has coordinates: ({}, {}, {})",
        mutable_borrow.x, mutable_borrow.y, mutable_borrow.z
    );

    // The mutable reference is no longer used for the rest of the code so it
    // is possible to reborrow
    let new_borrowed_point = &point;
    println!(
        "Point now has coordinates: ({}, {}, {})",
        new_borrowed_point.x, new_borrowed_point.y, new_borrowed_point.z
    );
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* point :=
      M.alloc
        (Value.StructRecord
          "scoping_rules_borrowing_aliasing::Point"
          [
            ("x", Value.Integer Integer.I32 0);
            ("y", Value.Integer Integer.I32 0);
            ("z", Value.Integer Integer.I32 0)
          ]) in
    let* borrowed_point := M.alloc point in
    let* another_borrow := M.alloc point in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Point has coordinates: (") in
        let* α3 := M.read (mk_str ", ") in
        let* α4 := M.read (mk_str ", ") in
        let* α5 := M.read (mk_str ")
") in
        let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
        let* α7 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α8 := M.read borrowed_point in
        let* α9 := M.call α7 [ M.get_struct_record α8 "x" ] in
        let* α10 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α11 := M.read another_borrow in
        let* α12 := M.call α10 [ M.get_struct_record α11 "y" ] in
        let* α13 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α14 := M.call α13 [ M.get_struct_record point "z" ] in
        let* α15 := M.alloc (Value.Array [ α9; α12; α14 ]) in
        let* α16 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α6;
              M.pointer_coercion (* Unsize *) α15
            ] in
        let* α17 := M.call α0 [ α16 ] in
        M.alloc α17 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Point has coordinates: (") in
        let* α3 := M.read (mk_str ", ") in
        let* α4 := M.read (mk_str ", ") in
        let* α5 := M.read (mk_str ")
") in
        let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
        let* α7 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α8 := M.read borrowed_point in
        let* α9 := M.call α7 [ M.get_struct_record α8 "x" ] in
        let* α10 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α11 := M.read another_borrow in
        let* α12 := M.call α10 [ M.get_struct_record α11 "y" ] in
        let* α13 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α14 := M.call α13 [ M.get_struct_record point "z" ] in
        let* α15 := M.alloc (Value.Array [ α9; α12; α14 ]) in
        let* α16 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α6;
              M.pointer_coercion (* Unsize *) α15
            ] in
        let* α17 := M.call α0 [ α16 ] in
        M.alloc α17 in
      M.alloc (Value.Tuple []) in
    let* mutable_borrow := M.alloc point in
    let* _ :=
      let* α0 := M.read mutable_borrow in
      M.assign (M.get_struct_record α0 "x") (Value.Integer Integer.I32 5) in
    let* _ :=
      let* α0 := M.read mutable_borrow in
      M.assign (M.get_struct_record α0 "y") (Value.Integer Integer.I32 2) in
    let* _ :=
      let* α0 := M.read mutable_borrow in
      M.assign (M.get_struct_record α0 "z") (Value.Integer Integer.I32 1) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Point has coordinates: (") in
        let* α3 := M.read (mk_str ", ") in
        let* α4 := M.read (mk_str ", ") in
        let* α5 := M.read (mk_str ")
") in
        let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
        let* α7 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α8 := M.read mutable_borrow in
        let* α9 := M.call α7 [ M.get_struct_record α8 "x" ] in
        let* α10 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α11 := M.read mutable_borrow in
        let* α12 := M.call α10 [ M.get_struct_record α11 "y" ] in
        let* α13 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α14 := M.read mutable_borrow in
        let* α15 := M.call α13 [ M.get_struct_record α14 "z" ] in
        let* α16 := M.alloc (Value.Array [ α9; α12; α15 ]) in
        let* α17 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α6;
              M.pointer_coercion (* Unsize *) α16
            ] in
        let* α18 := M.call α0 [ α17 ] in
        M.alloc α18 in
      M.alloc (Value.Tuple []) in
    let* new_borrowed_point := M.alloc point in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Point now has coordinates: (") in
        let* α3 := M.read (mk_str ", ") in
        let* α4 := M.read (mk_str ", ") in
        let* α5 := M.read (mk_str ")
") in
        let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
        let* α7 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α8 := M.read new_borrowed_point in
        let* α9 := M.call α7 [ M.get_struct_record α8 "x" ] in
        let* α10 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α11 := M.read new_borrowed_point in
        let* α12 := M.call α10 [ M.get_struct_record α11 "y" ] in
        let* α13 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α14 := M.read new_borrowed_point in
        let* α15 := M.call α13 [ M.get_struct_record α14 "z" ] in
        let* α16 := M.alloc (Value.Array [ α9; α12; α15 ]) in
        let* α17 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α6;
              M.pointer_coercion (* Unsize *) α16
            ] in
        let* α18 := M.call α0 [ α17 ] in
        M.alloc α18 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
