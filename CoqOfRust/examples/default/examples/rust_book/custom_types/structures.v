(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Person";
    ty_params := [];
    fields :=
      [ ("name", Ty.path "alloc::string::String"); ("age", Ty.path "u8") ];
  } *)

Module Impl_core_fmt_Debug_for_structures_Person.
  Definition Self : Ty.t := Ty.path "structures::Person".
  
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
      let* α2 := M.read (mk_str "Person") in
      let* α3 := M.read (mk_str "name") in
      let* α4 := M.read self in
      let* α5 := M.read (mk_str "age") in
      let* α6 := M.read self in
      let* α7 := M.alloc (M.get_struct_record α6 "age") in
      M.call
        α0
        [
          α1;
          α2;
          α3;
          M.pointer_coercion (* Unsize *) (M.get_struct_record α4 "name");
          α5;
          M.pointer_coercion (* Unsize *) α7
        ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "structures::Person")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_structures_Person.

(* StructTuple
  {
    name := "Unit";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "Pair";
    ty_params := [];
    fields := [ Ty.path "i32"; Ty.path "f32" ];
  } *)

(* StructRecord
  {
    name := "Point";
    ty_params := [];
    fields := [ ("x", Ty.path "f32"); ("y", Ty.path "f32") ];
  } *)

(* StructRecord
  {
    name := "Rectangle";
    ty_params := [];
    fields :=
      [
        ("top_left", Ty.path "structures::Point");
        ("bottom_right", Ty.path "structures::Point")
      ];
  } *)

(*
fn main() {
    // Create struct with field init shorthand
    let name = String::from("Peter");
    let age = 27;
    let peter = Person { name, age };

    // Print debug struct
    println!("{:?}", peter);

    // Instantiate a `Point`
    let point: Point = Point { x: 10.3, y: 0.4 };

    // Access the fields of the point
    println!("point coordinates: ({}, {})", point.x, point.y);

    // Make a new point by using struct update syntax to use the fields of our
    // other one
    let bottom_right = Point { x: 5.2, ..point };

    // `bottom_right.y` will be the same as `point.y` because we used that field
    // from `point`
    println!("second point: ({}, {})", bottom_right.x, bottom_right.y);

    // Destructure the point using a `let` binding
    let Point {
        x: left_edge,
        y: top_edge,
    } = point;

    let _rectangle = Rectangle {
        // struct instantiation is an expression too
        top_left: Point {
            x: left_edge,
            y: top_edge,
        },
        bottom_right: bottom_right,
    };

    // Instantiate a unit struct
    let _unit = Unit;

    // Instantiate a tuple struct
    let pair = Pair(1, 0.1);

    // Access the fields of a tuple struct
    println!("pair contains {:?} and {:?}", pair.0, pair.1);

    // Destructure a tuple struct
    let Pair(integer, decimal) = pair;

    println!("pair contains {:?} and {:?}", integer, decimal);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* name :=
      let* α0 :=
        M.get_trait_method
          "core::convert::From"
          "from"
          [
            (* Self *) Ty.path "alloc::string::String";
            (* T *) Ty.apply (Ty.path "&") [ Ty.path "str" ]
          ] in
      let* α1 := M.read (mk_str "Peter") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* age := M.alloc (Value.Integer Integer.U8 27) in
    let* peter :=
      let* α0 := M.read name in
      let* α1 := M.read age in
      M.alloc
        (Value.StructRecord
          "structures::Person"
          [ ("name", α0); ("age", α1) ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ peter ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* point :=
      let* α0 := M.read UnsupportedLiteral in
      let* α1 := M.read UnsupportedLiteral in
      M.alloc
        (Value.StructRecord "structures::Point" [ ("x", α0); ("y", α1) ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "point coordinates: (") in
        let* α3 := M.read (mk_str ", ") in
        let* α4 := M.read (mk_str ")
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α7 := M.call α6 [ M.get_struct_record point "x" ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α9 := M.call α8 [ M.get_struct_record point "y" ] in
        let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* bottom_right :=
      let* α0 := M.read UnsupportedLiteral in
      let* α1 := M.read point in
      M.alloc (M.struct_record_update (α1) [ ("x", α0) ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "second point: (") in
        let* α3 := M.read (mk_str ", ") in
        let* α4 := M.read (mk_str ")
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α7 := M.call α6 [ M.get_struct_record bottom_right "x" ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α9 := M.call α8 [ M.get_struct_record bottom_right "y" ] in
        let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* α0 :=
      match_operator
        point
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_record_field_or_break_match
                γ
                "structures::Point"
                "x" in
            let* γ0_1 :=
              M.get_struct_record_field_or_break_match
                γ
                "structures::Point"
                "y" in
            let* left_edge := M.copy γ0_0 in
            let* top_edge := M.copy γ0_1 in
            let* _rectangle :=
              let* α0 := M.read left_edge in
              let* α1 := M.read top_edge in
              let* α2 := M.read bottom_right in
              M.alloc
                (Value.StructRecord
                  "structures::Rectangle"
                  [
                    ("top_left",
                      Value.StructRecord
                        "structures::Point"
                        [ ("x", α0); ("y", α1) ]);
                    ("bottom_right", α2)
                  ]) in
            let* _unit := M.alloc (Value.StructTuple "structures::Unit" []) in
            let* pair :=
              let* α0 := M.read UnsupportedLiteral in
              M.alloc
                (Value.StructTuple
                  "structures::Pair"
                  [ Value.Integer Integer.I32 1; α0 ]) in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1" in
                let* α2 := M.read (mk_str "pair contains ") in
                let* α3 := M.read (mk_str " and ") in
                let* α4 := M.read (mk_str "
") in
                let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                let* α6 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_debug" in
                let* α7 := M.call α6 [ M.get_struct_tuple pair 0 ] in
                let* α8 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_debug" in
                let* α9 := M.call α8 [ M.get_struct_tuple pair 1 ] in
                let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
                let* α11 :=
                  M.call
                    α1
                    [
                      M.pointer_coercion (* Unsize *) α5;
                      M.pointer_coercion (* Unsize *) α10
                    ] in
                let* α12 := M.call α0 [ α11 ] in
                M.alloc α12 in
              M.alloc (Value.Tuple []) in
            match_operator
              pair
              [
                fun γ =>
                  let* γ0_0 :=
                    M.get_struct_tuple_field_or_break_match
                      γ
                      "structures::Pair"
                      0 in
                  let* γ0_1 :=
                    M.get_struct_tuple_field_or_break_match
                      γ
                      "structures::Pair"
                      1 in
                  let* integer := M.copy γ0_0 in
                  let* decimal := M.copy γ0_1 in
                  let* _ :=
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::Arguments")
                          "new_v1" in
                      let* α2 := M.read (mk_str "pair contains ") in
                      let* α3 := M.read (mk_str " and ") in
                      let* α4 := M.read (mk_str "
") in
                      let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                      let* α6 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::rt::Argument")
                          "new_debug" in
                      let* α7 := M.call α6 [ integer ] in
                      let* α8 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::rt::Argument")
                          "new_debug" in
                      let* α9 := M.call α8 [ decimal ] in
                      let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
                      let* α11 :=
                        M.call
                          α1
                          [
                            M.pointer_coercion (* Unsize *) α5;
                            M.pointer_coercion (* Unsize *) α10
                          ] in
                      let* α12 := M.call α0 [ α11 ] in
                      M.alloc α12 in
                    M.alloc (Value.Tuple []) in
                  M.alloc (Value.Tuple [])
              ]
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
