(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let rc_examples = "Rc examples".to_string();
    {
        println!("--- rc_a is created ---");

        let rc_a: Rc<String> = Rc::new(rc_examples);
        println!("Reference Count of rc_a: {}", Rc::strong_count(&rc_a));

        {
            println!("--- rc_a is cloned to rc_b ---");

            let rc_b: Rc<String> = Rc::clone(&rc_a);
            println!("Reference Count of rc_b: {}", Rc::strong_count(&rc_b));
            println!("Reference Count of rc_a: {}", Rc::strong_count(&rc_a));

            // Two `Rc`s are equal if their inner values are equal
            println!("rc_a and rc_b are equal: {}", rc_a.eq(&rc_b));

            // We can use methods of a value directly
            println!("Length of the value inside rc_a: {}", rc_a.len());
            println!("Value of rc_b: {}", rc_b);

            println!("--- rc_b is dropped out of scope ---");
        }

        println!("Reference Count of rc_a: {}", Rc::strong_count(&rc_a));

        println!("--- rc_a is dropped out of scope ---");
    }

    // Error! `rc_examples` already moved into `rc_a`
    // And when `rc_a` is dropped, `rc_examples` is dropped together
    // println!("rc_examples: {}", rc_examples);
    // TODO ^ Try uncommenting this line
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* rc_examples :=
      let* α0 :=
        M.get_trait_method
          "alloc::string::ToString"
          "to_string"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "Rc examples") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const" in
        let* α2 := M.read (mk_str "--- rc_a is created ---
") in
        let* α3 := M.alloc [ α2 ] in
        let* α4 := M.call α1 [ M.pointer_coercion "Unsize" α3 ] in
        let* α5 := M.call α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* rc_a :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::rc::Rc")
            [ Ty.path "alloc::string::String"; Ty.path "alloc::alloc::Global" ])
          "new" in
      let* α1 := M.read rc_examples in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Reference Count of rc_a: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc [ α2; α3 ] in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "alloc::rc::Rc")
              [ Ty.path "alloc::string::String"; Ty.path "alloc::alloc::Global"
              ])
            "strong_count" in
        let* α7 := M.call α6 [ rc_a ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc [ α9 ] in
        let* α11 :=
          M.call
            α1
            [ M.pointer_coercion "Unsize" α4; M.pointer_coercion "Unsize" α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_const" in
          let* α2 := M.read (mk_str "--- rc_a is cloned to rc_b ---
") in
          let* α3 := M.alloc [ α2 ] in
          let* α4 := M.call α1 [ M.pointer_coercion "Unsize" α3 ] in
          let* α5 := M.call α0 [ α4 ] in
          M.alloc α5 in
        M.alloc (Value.Tuple []) in
      let* rc_b :=
        let* α0 :=
          M.get_trait_method
            "core::clone::Clone"
            "clone"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "alloc::rc::Rc")
                  [
                    Ty.path "alloc::string::String";
                    Ty.path "alloc::alloc::Global"
                  ]
            ] in
        let* α1 := M.call α0 [ rc_a ] in
        M.alloc α1 in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "Reference Count of rc_b: ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc [ α2; α3 ] in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "alloc::rc::Rc")
                [
                  Ty.path "alloc::string::String";
                  Ty.path "alloc::alloc::Global"
                ])
              "strong_count" in
          let* α7 := M.call α6 [ rc_b ] in
          let* α8 := M.alloc α7 in
          let* α9 := M.call α5 [ α8 ] in
          let* α10 := M.alloc [ α9 ] in
          let* α11 :=
            M.call
              α1
              [ M.pointer_coercion "Unsize" α4; M.pointer_coercion "Unsize" α10
              ] in
          let* α12 := M.call α0 [ α11 ] in
          M.alloc α12 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "Reference Count of rc_a: ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc [ α2; α3 ] in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "alloc::rc::Rc")
                [
                  Ty.path "alloc::string::String";
                  Ty.path "alloc::alloc::Global"
                ])
              "strong_count" in
          let* α7 := M.call α6 [ rc_a ] in
          let* α8 := M.alloc α7 in
          let* α9 := M.call α5 [ α8 ] in
          let* α10 := M.alloc [ α9 ] in
          let* α11 :=
            M.call
              α1
              [ M.pointer_coercion "Unsize" α4; M.pointer_coercion "Unsize" α10
              ] in
          let* α12 := M.call α0 [ α11 ] in
          M.alloc α12 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "rc_a and rc_b are equal: ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc [ α2; α3 ] in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 :=
            M.get_trait_method
              "core::cmp::PartialEq"
              "eq"
              [
                (* Self *)
                  Ty.apply
                    (Ty.path "alloc::rc::Rc")
                    [
                      Ty.path "alloc::string::String";
                      Ty.path "alloc::alloc::Global"
                    ];
                (* Rhs *)
                  Ty.apply
                    (Ty.path "alloc::rc::Rc")
                    [
                      Ty.path "alloc::string::String";
                      Ty.path "alloc::alloc::Global"
                    ]
              ] in
          let* α7 := M.call α6 [ rc_a; rc_b ] in
          let* α8 := M.alloc α7 in
          let* α9 := M.call α5 [ α8 ] in
          let* α10 := M.alloc [ α9 ] in
          let* α11 :=
            M.call
              α1
              [ M.pointer_coercion "Unsize" α4; M.pointer_coercion "Unsize" α10
              ] in
          let* α12 := M.call α0 [ α11 ] in
          M.alloc α12 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "Length of the value inside rc_a: ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc [ α2; α3 ] in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 :=
            M.get_associated_function (Ty.path "alloc::string::String") "len" in
          let* α7 :=
            M.get_trait_method
              "core::ops::deref::Deref"
              "deref"
              [
                (* Self *)
                  Ty.apply
                    (Ty.path "alloc::rc::Rc")
                    [
                      Ty.path "alloc::string::String";
                      Ty.path "alloc::alloc::Global"
                    ]
              ] in
          let* α8 := M.call α7 [ rc_a ] in
          let* α9 := M.call α6 [ α8 ] in
          let* α10 := M.alloc α9 in
          let* α11 := M.call α5 [ α10 ] in
          let* α12 := M.alloc [ α11 ] in
          let* α13 :=
            M.call
              α1
              [ M.pointer_coercion "Unsize" α4; M.pointer_coercion "Unsize" α12
              ] in
          let* α14 := M.call α0 [ α13 ] in
          M.alloc α14 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "Value of rc_b: ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc [ α2; α3 ] in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 := M.call α5 [ rc_b ] in
          let* α7 := M.alloc [ α6 ] in
          let* α8 :=
            M.call
              α1
              [ M.pointer_coercion "Unsize" α4; M.pointer_coercion "Unsize" α7
              ] in
          let* α9 := M.call α0 [ α8 ] in
          M.alloc α9 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_const" in
          let* α2 := M.read (mk_str "--- rc_b is dropped out of scope ---
") in
          let* α3 := M.alloc [ α2 ] in
          let* α4 := M.call α1 [ M.pointer_coercion "Unsize" α3 ] in
          let* α5 := M.call α0 [ α4 ] in
          M.alloc α5 in
        M.alloc (Value.Tuple []) in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Reference Count of rc_a: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc [ α2; α3 ] in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "alloc::rc::Rc")
              [ Ty.path "alloc::string::String"; Ty.path "alloc::alloc::Global"
              ])
            "strong_count" in
        let* α7 := M.call α6 [ rc_a ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc [ α9 ] in
        let* α11 :=
          M.call
            α1
            [ M.pointer_coercion "Unsize" α4; M.pointer_coercion "Unsize" α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const" in
        let* α2 := M.read (mk_str "--- rc_a is dropped out of scope ---
") in
        let* α3 := M.alloc [ α2 ] in
        let* α4 := M.call α1 [ M.pointer_coercion "Unsize" α3 ] in
        let* α5 := M.call α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
