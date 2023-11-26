(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Point.
Section Point.
  Record t : Set := {
    x : i32.t;
    y : i32.t;
  }.
  
  Global Instance Get_x : Notations.Dot "x" := {
    Notations.dot := Ref.map (fun x' => x'.(x)) (fun v x' => x' <| x := v |>);
  }.
  Global Instance Get_AF_x : Notations.DoubleColon t "x" := {
    Notations.double_colon (x' : M.Val t) := x'.["x"];
  }.
  Global Instance Get_y : Notations.Dot "y" := {
    Notations.dot := Ref.map (fun x => x.(y)) (fun v x => x <| y := v |>);
  }.
  Global Instance Get_AF_y : Notations.DoubleColon t "y" := {
    Notations.double_colon (x : M.Val t) := x.["y"];
  }.
End Point.
End Point.

Module  Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
Section Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
  Ltac Self := exact scoping_rules_borrowing_the_ref_pattern.Point.t.
  
  (*
  Clone
  *)
  Definition clone
      (self : ref ltac:(Self))
      : M scoping_rules_borrowing_the_ref_pattern.Point.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    M.function_body
      (let* _ : M.Val unit := M.alloc tt in
      let* α0 : ref scoping_rules_borrowing_the_ref_pattern.Point.t :=
        M.read self in
      let* α0 : M.Val scoping_rules_borrowing_the_ref_pattern.Point.t :=
        deref α0 in
      M.read α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.

Module  Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
Section Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
  Ltac Self := exact scoping_rules_borrowing_the_ref_pattern.Point.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
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
  M.function_body
    (let* c : M.Val char.t :=
      let* α0 : M.Val char.t := M.alloc "Q"%char in
      M.copy α0 in
    let* ref_c1 : M.Val char.t := M.copy c in
    let* ref_c2 : M.Val (ref char.t) :=
      let* α0 : ref char.t := borrow c in
      M.alloc α0 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "ref_c1 equals ref_c2: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref char.t := M.read ref_c1 in
        let* α8 : M.Val char.t := deref α7 in
        let* α9 : ref char.t := M.read ref_c2 in
        let* α10 : M.Val char.t := deref α9 in
        let* α11 : M.Val bool.t := BinOp.eq α8 α10 in
        let* α12 : ref bool.t := borrow α11 in
        let* α13 : M.Val bool.t := deref α12 in
        let* α14 : ref bool.t := borrow α13 in
        let* α15 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α14 in
        let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α16 ] in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (array core.fmt.rt.Argument.t) := deref α18 in
        let* α20 : ref (array core.fmt.rt.Argument.t) := borrow α19 in
        let* α21 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α20 in
        let* α22 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α21 in
        let* α23 : ref (slice core.fmt.rt.Argument.t) := M.read α22 in
        let* α24 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α23 in
        let* α25 : unit := std.io.stdio._print α24 in
        M.alloc α25 in
      M.alloc tt in
    let* point : M.Val scoping_rules_borrowing_the_ref_pattern.Point.t :=
      let* α0 : M.Val i32.t := M.alloc 0 in
      let* α1 : i32.t := M.read α0 in
      let* α2 : M.Val i32.t := M.alloc 0 in
      let* α3 : i32.t := M.read α2 in
      M.alloc
        {|
          scoping_rules_borrowing_the_ref_pattern.Point.x := α1;
          scoping_rules_borrowing_the_ref_pattern.Point.y := α3;
        |} in
    let* _copy_of_x : M.Val i32.t :=
      let* '{|
            scoping_rules_borrowing_the_ref_pattern.Point.x := ref_to_x;
            scoping_rules_borrowing_the_ref_pattern.Point.y := _;
          |} :
          M.Val scoping_rules_borrowing_the_ref_pattern.Point.t :=
        M.copy point in
      let* α0 : ref i32.t := M.read ref_to_x in
      let* α0 : M.Val i32.t := deref α0 in
      M.copy α0 in
    let* mutable_point :
        M.Val scoping_rules_borrowing_the_ref_pattern.Point.t :=
      M.copy point in
    let* _ : M.Val unit :=
      let* '{|
            scoping_rules_borrowing_the_ref_pattern.Point.x := _;
            scoping_rules_borrowing_the_ref_pattern.Point.y := mut_ref_to_y;
          |} :
          M.Val scoping_rules_borrowing_the_ref_pattern.Point.t :=
        M.copy mutable_point in
      let* _ : M.Val unit :=
        let* α0 : mut_ref i32.t := M.read mut_ref_to_y in
        let* α1 : M.Val i32.t := deref α0 in
        let* α2 : M.Val i32.t := M.alloc 1 in
        let* α3 : i32.t := M.read α2 in
        assign α1 α3 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "point is ("; mk_str ", "; mk_str ")
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref i32.t := borrow point.["x"] in
        let* α8 : M.Val i32.t := deref α7 in
        let* α9 : ref i32.t := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : ref i32.t := borrow point.["y"] in
        let* α13 : M.Val i32.t := deref α12 in
        let* α14 : ref i32.t := borrow α13 in
        let* α15 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α14 in
        let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α11; α16 ] in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (array core.fmt.rt.Argument.t) := deref α18 in
        let* α20 : ref (array core.fmt.rt.Argument.t) := borrow α19 in
        let* α21 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α20 in
        let* α22 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α21 in
        let* α23 : ref (slice core.fmt.rt.Argument.t) := M.read α22 in
        let* α24 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α23 in
        let* α25 : unit := std.io.stdio._print α24 in
        M.alloc α25 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "mutable_point is ("; mk_str ", "; mk_str ")
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref i32.t := borrow mutable_point.["x"] in
        let* α8 : M.Val i32.t := deref α7 in
        let* α9 : ref i32.t := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : ref i32.t := borrow mutable_point.["y"] in
        let* α13 : M.Val i32.t := deref α12 in
        let* α14 : ref i32.t := borrow α13 in
        let* α15 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α14 in
        let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α11; α16 ] in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (array core.fmt.rt.Argument.t) := deref α18 in
        let* α20 : ref (array core.fmt.rt.Argument.t) := borrow α19 in
        let* α21 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α20 in
        let* α22 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α21 in
        let* α23 : ref (slice core.fmt.rt.Argument.t) := M.read α22 in
        let* α24 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α23 in
        let* α25 : unit := std.io.stdio._print α24 in
        M.alloc α25 in
      M.alloc tt in
    let* mutable_tuple :
        M.Val ((alloc.boxed.Box.t u32.t alloc.alloc.Global.t) * u32.t) :=
      let* α0 : M.Val u32.t := M.alloc 5 in
      let* α1 : u32.t := M.read α0 in
      let* α2 : alloc.boxed.Box.t u32.t alloc.alloc.Global.t :=
        (alloc.boxed.Box.t u32.t alloc.alloc.Global.t)::["new"] α1 in
      let* α3 : M.Val u32.t := M.alloc 3 in
      let* α4 : u32.t := M.read α3 in
      M.alloc (α2, α4) in
    let* _ : M.Val unit :=
      let* '(_, last) :
          M.Val ((alloc.boxed.Box.t u32.t alloc.alloc.Global.t) * u32.t) :=
        M.copy mutable_tuple in
      let* _ : M.Val unit :=
        let* α0 : mut_ref u32.t := M.read last in
        let* α1 : M.Val u32.t := deref α0 in
        let* α2 : M.Val u32.t := M.alloc 2 in
        let* α3 : u32.t := M.read α2 in
        assign α1 α3 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "tuple is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 :
            ref ((alloc.boxed.Box.t u32.t alloc.alloc.Global.t) * u32.t) :=
          borrow mutable_tuple in
        let* α8 :
            M.Val ((alloc.boxed.Box.t u32.t alloc.alloc.Global.t) * u32.t) :=
          deref α7 in
        let* α9 :
            ref ((alloc.boxed.Box.t u32.t alloc.alloc.Global.t) * u32.t) :=
          borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
        let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
