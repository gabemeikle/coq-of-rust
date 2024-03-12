(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "Point";
    ty_params := [];
    fields := [ ("x", Ty.path "f64"); ("y", Ty.path "f64") ];
  } *)

Module Impl_core_fmt_Debug_for_box_stack_heap_Point.
  Definition Self : Ty.t := Ty.path "box_stack_heap::Point".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_struct_field2_finish" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Point") in
      let* α3 := M.read (mk_str "x") in
      let* α4 := M.read self in
      let* α5 := M.read (mk_str "y") in
      let* α6 := M.read self in
      let* α7 := M.alloc (M.get_struct_record α6 "y") in
      M.call
        α0
        [
          α1;
          α2;
          α3;
          M.pointer_coercion (* Unsize *) (M.get_struct_record α4 "x");
          α5;
          M.pointer_coercion (* Unsize *) α7
        ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "box_stack_heap::Point")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_box_stack_heap_Point.

Module Impl_core_clone_Clone_for_box_stack_heap_Point.
  Definition Self : Ty.t := Ty.path "box_stack_heap::Point".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator Value.DeclaredButUndefined [ fun γ => M.read self ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "box_stack_heap::Point")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_box_stack_heap_Point.

Module Impl_core_marker_Copy_for_box_stack_heap_Point.
  Definition Self : Ty.t := Ty.path "box_stack_heap::Point".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "box_stack_heap::Point")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_box_stack_heap_Point.

(* Struct
  {
    name := "Rectangle";
    ty_params := [];
    fields :=
      [
        ("top_left", Ty.path "box_stack_heap::Point");
        ("bottom_right", Ty.path "box_stack_heap::Point")
      ];
  } *)

(*
fn origin() -> Point {
    Point { x: 0.0, y: 0.0 }
}
*)
Definition origin (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 := M.read UnsupportedLiteral in
    let* α1 := M.read UnsupportedLiteral in
    M.pure (Value.StructRecord "box_stack_heap::Point" [ ("x", α0); ("y", α1) ])
  | _, _ => M.impossible
  end.

(*
fn boxed_origin() -> Box<Point> {
    // Allocate this point on the heap, and return a pointer to it
    Box::new(Point { x: 0.0, y: 0.0 })
}
*)
Definition boxed_origin (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "alloc::boxed::Box")
          [ Ty.path "box_stack_heap::Point"; Ty.path "alloc::alloc::Global" ])
        "new" in
    let* α1 := M.read UnsupportedLiteral in
    let* α2 := M.read UnsupportedLiteral in
    M.call
      α0
      [ Value.StructRecord "box_stack_heap::Point" [ ("x", α1); ("y", α2) ] ]
  | _, _ => M.impossible
  end.

(*
fn main() {
    // (all the type annotations are superfluous)
    // Stack allocated variables
    let point: Point = origin();
    let rectangle: Rectangle = Rectangle {
        top_left: origin(),
        bottom_right: Point { x: 3.0, y: -4.0 },
    };

    // Heap allocated rectangle
    let boxed_rectangle: Box<Rectangle> = Box::new(Rectangle {
        top_left: origin(),
        bottom_right: Point { x: 3.0, y: -4.0 },
    });

    // The output of functions can be boxed
    let boxed_point: Box<Point> = Box::new(origin());

    // Double indirection
    let box_in_a_box: Box<Box<Point>> = Box::new(boxed_origin());

    println!(
        "Point occupies {} bytes on the stack",
        mem::size_of_val(&point)
    );
    println!(
        "Rectangle occupies {} bytes on the stack",
        mem::size_of_val(&rectangle)
    );

    // box size == pointer size
    println!(
        "Boxed point occupies {} bytes on the stack",
        mem::size_of_val(&boxed_point)
    );
    println!(
        "Boxed rectangle occupies {} bytes on the stack",
        mem::size_of_val(&boxed_rectangle)
    );
    println!(
        "Boxed box occupies {} bytes on the stack",
        mem::size_of_val(&box_in_a_box)
    );

    // Copy the data contained in `boxed_point` into `unboxed_point`
    let unboxed_point: Point = *boxed_point;
    println!(
        "Unboxed point occupies {} bytes on the stack",
        mem::size_of_val(&unboxed_point)
    );
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* point :=
      let* α0 := M.get_function "box_stack_heap::origin" [] in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* rectangle :=
      let* α0 := M.get_function "box_stack_heap::origin" [] in
      let* α1 := M.call α0 [] in
      let* α2 := M.read UnsupportedLiteral in
      let* α3 := M.read UnsupportedLiteral in
      M.alloc
        (Value.StructRecord
          "box_stack_heap::Rectangle"
          [
            ("top_left", α1);
            ("bottom_right",
              Value.StructRecord
                "box_stack_heap::Point"
                [ ("x", α2); ("y", α3) ])
          ]) in
    let* boxed_rectangle :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.path "box_stack_heap::Rectangle";
              Ty.path "alloc::alloc::Global"
            ])
          "new" in
      let* α1 := M.get_function "box_stack_heap::origin" [] in
      let* α2 := M.call α1 [] in
      let* α3 := M.read UnsupportedLiteral in
      let* α4 := M.read UnsupportedLiteral in
      let* α5 :=
        M.call
          α0
          [
            Value.StructRecord
              "box_stack_heap::Rectangle"
              [
                ("top_left", α2);
                ("bottom_right",
                  Value.StructRecord
                    "box_stack_heap::Point"
                    [ ("x", α3); ("y", α4) ])
              ]
          ] in
      M.alloc α5 in
    let* boxed_point :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [ Ty.path "box_stack_heap::Point"; Ty.path "alloc::alloc::Global" ])
          "new" in
      let* α1 := M.get_function "box_stack_heap::origin" [] in
      let* α2 := M.call α1 [] in
      let* α3 := M.call α0 [ α2 ] in
      M.alloc α3 in
    let* box_in_a_box :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply
                (Ty.path "alloc::boxed::Box")
                [
                  Ty.path "box_stack_heap::Point";
                  Ty.path "alloc::alloc::Global"
                ];
              Ty.path "alloc::alloc::Global"
            ])
          "new" in
      let* α1 := M.get_function "box_stack_heap::boxed_origin" [] in
      let* α2 := M.call α1 [] in
      let* α3 := M.call α0 [ α2 ] in
      M.alloc α3 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Point occupies ") in
        let* α3 := M.read (mk_str " bytes on the stack
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_function
            "core::mem::size_of_val"
            [ Ty.path "box_stack_heap::Point" ] in
        let* α7 := M.call α6 [ point ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Rectangle occupies ") in
        let* α3 := M.read (mk_str " bytes on the stack
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_function
            "core::mem::size_of_val"
            [ Ty.path "box_stack_heap::Rectangle" ] in
        let* α7 := M.call α6 [ rectangle ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Boxed point occupies ") in
        let* α3 := M.read (mk_str " bytes on the stack
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_function
            "core::mem::size_of_val"
            [
              Ty.apply
                (Ty.path "alloc::boxed::Box")
                [
                  Ty.path "box_stack_heap::Point";
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α7 := M.call α6 [ boxed_point ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Boxed rectangle occupies ") in
        let* α3 := M.read (mk_str " bytes on the stack
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_function
            "core::mem::size_of_val"
            [
              Ty.apply
                (Ty.path "alloc::boxed::Box")
                [
                  Ty.path "box_stack_heap::Rectangle";
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α7 := M.call α6 [ boxed_rectangle ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Boxed box occupies ") in
        let* α3 := M.read (mk_str " bytes on the stack
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_function
            "core::mem::size_of_val"
            [
              Ty.apply
                (Ty.path "alloc::boxed::Box")
                [
                  Ty.apply
                    (Ty.path "alloc::boxed::Box")
                    [
                      Ty.path "box_stack_heap::Point";
                      Ty.path "alloc::alloc::Global"
                    ];
                  Ty.path "alloc::alloc::Global"
                ]
            ] in
        let* α7 := M.call α6 [ box_in_a_box ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* unboxed_point :=
      let* α0 := M.read boxed_point in
      M.copy α0 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Unboxed point occupies ") in
        let* α3 := M.read (mk_str " bytes on the stack
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_function
            "core::mem::size_of_val"
            [ Ty.path "box_stack_heap::Point" ] in
        let* α7 := M.call α6 [ unboxed_point ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
