(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Point.
Section Point.
  Record t : Set := {
    x : i32.t;
    y : i32.t;
  }.
  
  Global Instance Get_x : Notations.Dot "x" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(x)) (fun β α => Some (α <| x := β |>));
  }.
  Global Instance Get_AF_x : Notations.DoubleColon t "x" := {
    Notations.double_colon (α : M.Val t) := α.["x"];
  }.
  Global Instance Get_y : Notations.Dot "y" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(y)) (fun β α => Some (α <| y := β |>));
  }.
  Global Instance Get_AF_y : Notations.DoubleColon t "y" := {
    Notations.double_colon (α : M.Val t) := α.["y"];
  }.
End Point.
End Point.

Module  Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
Section Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
  Definition Self : Set := scoping_rules_borrowing_the_ref_pattern.Point.t.
  
  (*
  Clone
  *)
  Definition clone
      (self : ref Self)
      : M scoping_rules_borrowing_the_ref_pattern.Point.t :=
    let* self := M.alloc self in
    let* α0 : M.Val scoping_rules_borrowing_the_ref_pattern.Point.t :=
      match tt with
      | _ =>
        let* α0 : ref scoping_rules_borrowing_the_ref_pattern.Point.t :=
          M.read self in
        M.pure (deref α0)
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
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.

Module  Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
Section Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
  Definition Self : Set := scoping_rules_borrowing_the_ref_pattern.Point.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point_t.

(*
fn main() {
    let c = 'Q';

    // A `ref` borrow on the left side of an assignment is equivalent to
    // an `&` borrow on the right side.
    let ref ref_c1 = c;
    let ref_c2 = &c;

    println!("ref_c1 equals ref_c2: {}", *ref_c1 == *ref_c2);

    let point = Point { x: 0, y: 0 };

    // `ref` is also valid when destructuring a struct.
    let _copy_of_x = {
        // `ref_to_x` is a reference to the `x` field of `point`.
        let Point {
            x: ref ref_to_x,
            y: _,
        } = point;

        // Return a copy of the `x` field of `point`.
        *ref_to_x
    };

    // A mutable copy of `point`
    let mut mutable_point = point;

    {
        // `ref` can be paired with `mut` to take mutable references.
        let Point {
            x: _,
            y: ref mut mut_ref_to_y,
        } = mutable_point;

        // Mutate the `y` field of `mutable_point` via a mutable reference.
        *mut_ref_to_y = 1;
    }

    println!("point is ({}, {})", point.x, point.y);
    println!(
        "mutable_point is ({}, {})",
        mutable_point.x, mutable_point.y
    );

    // A mutable tuple that includes a pointer
    let mut mutable_tuple = (Box::new(5u32), 3u32);

    {
        // Destructure `mutable_tuple` to change the value of `last`.
        let (_, ref mut last) = mutable_tuple;
        *last = 2u32;
    }

    println!("tuple is {:?}", mutable_tuple);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* c : M.Val char.t := M.alloc "Q"%char in
  let* ref_c1 : M.Val char.t := M.copy c in
  let* ref_c2 : M.Val (ref char.t) := M.alloc (borrow c) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "ref_c1 equals ref_c2: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : ref char.t := M.read ref_c1 in
      let* α6 : char.t := M.read (deref α5) in
      let* α7 : ref char.t := M.read ref_c2 in
      let* α8 : char.t := M.read (deref α7) in
      let* α9 : M.Val bool.t := M.alloc (BinOp.Pure.eq α6 α8) in
      let* α10 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α9)) in
      let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
      let* α12 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α11) in
      let* α13 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α12) in
      let* α14 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α13) in
      let* α15 : unit := M.call (std.io.stdio._print α14) in
      M.alloc α15 in
    M.alloc tt in
  let* point : M.Val scoping_rules_borrowing_the_ref_pattern.Point.t :=
    M.alloc
      {|
        scoping_rules_borrowing_the_ref_pattern.Point.x := Integer.of_Z 0;
        scoping_rules_borrowing_the_ref_pattern.Point.y := Integer.of_Z 0;
      |} in
  let* _copy_of_x : M.Val i32.t :=
    let* α0 : scoping_rules_borrowing_the_ref_pattern.Point.t := M.read point in
    let* α1 : M.Val i32.t :=
      match α0 with
      |
          {|
            scoping_rules_borrowing_the_ref_pattern.Point.x := ref_to_x;
            scoping_rules_borrowing_the_ref_pattern.Point.y := _;
          |}
          =>
        let* ref_to_x := M.alloc ref_to_x in
        let* α0 : ref i32.t := M.read ref_to_x in
        M.pure (deref α0)
      end in
    M.copy α1 in
  let* mutable_point : M.Val scoping_rules_borrowing_the_ref_pattern.Point.t :=
    M.copy point in
  let* _ : M.Val unit :=
    let* α0 : scoping_rules_borrowing_the_ref_pattern.Point.t :=
      M.read mutable_point in
    match α0 with
    |
        {|
          scoping_rules_borrowing_the_ref_pattern.Point.x := _;
          scoping_rules_borrowing_the_ref_pattern.Point.y := mut_ref_to_y;
        |}
        =>
      let* mut_ref_to_y := M.alloc mut_ref_to_y in
      let* _ : M.Val unit :=
        let* α0 : mut_ref i32.t := M.read mut_ref_to_y in
        assign (deref α0) (Integer.of_Z 1) in
      M.alloc tt
    end in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "point is (") in
      let* α1 : ref str.t := M.read (mk_str ", ") in
      let* α2 : ref str.t := M.read (mk_str ")
") in
      let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
      let* α4 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α3) in
      let* α5 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α4) in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow point.["x"])) in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow point.["y"])) in
      let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6; α7 ] in
      let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α8) in
      let* α10 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α9) in
      let* α11 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α5 α10) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "mutable_point is (") in
      let* α1 : ref str.t := M.read (mk_str ", ") in
      let* α2 : ref str.t := M.read (mk_str ")
") in
      let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
      let* α4 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α3) in
      let* α5 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α4) in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow mutable_point.["x"])) in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow mutable_point.["y"])) in
      let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6; α7 ] in
      let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α8) in
      let* α10 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α9) in
      let* α11 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α5 α10) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* mutable_tuple :
      M.Val ((alloc.boxed.Box.t u32.t alloc.alloc.Global.t) * u32.t) :=
    let* α0 : alloc.boxed.Box.t u32.t alloc.alloc.Global.t :=
      M.call
        ((alloc.boxed.Box.t u32.t alloc.alloc.Global.t)::["new"]
          (Integer.of_Z 5)) in
    M.alloc (α0, Integer.of_Z 3) in
  let* _ : M.Val unit :=
    let* α0 : (alloc.boxed.Box.t u32.t alloc.alloc.Global.t) * u32.t :=
      M.read mutable_tuple in
    match α0 with
    | (_, last) =>
      let* last := M.alloc last in
      let* _ : M.Val unit :=
        let* α0 : mut_ref u32.t := M.read last in
        assign (deref α0) (Integer.of_Z 2) in
      M.alloc tt
    end in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "tuple is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow mutable_tuple)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
