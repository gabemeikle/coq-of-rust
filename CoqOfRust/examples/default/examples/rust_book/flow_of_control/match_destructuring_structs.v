(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Foo *)

(*
fn main() {
    // Try changing the values in the struct to see what happens
    let foo = Foo { x: (1, 2), y: 3 };

    match foo {
        Foo { x: (1, b), y } => println!("First of x is 1, b = {},  y = {} ", b, y),

        // you can destructure structs and rename the variables,
        // the order is not important
        Foo { y: 2, x: i } => println!("y is 2, i = {:?}", i),

        // and you can also ignore some variables:
        Foo { y, .. } => println!("y = {}, we don't care about x", y),
        // this will give an error: pattern does not mention field `x`
        //Foo { y } => println!("y = {}", y),
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* foo :=
      M.alloc
        (Value.StructRecord
          "match_destructuring_structs::Foo"
          [
            ("x",
              Value.Tuple
                [ Value.Integer Integer.U32 1; Value.Integer Integer.U32 2 ]);
            ("y", Value.Integer Integer.U32 3)
          ]) in
    let* α0 :=
      match_operator
        foo
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            |
                {|
                  match_destructuring_structs.Foo.x := _;
                  match_destructuring_structs.Foo.y := _;
                |}
                =>
              let* γ0_0 :=
                let* α0 := M.var "match_destructuring_structs::Foo::Get_x" in
                M.pure (α0 γ) in
              let* γ0_1 :=
                let* α0 := M.var "match_destructuring_structs::Foo::Get_y" in
                M.pure (α0 γ) in
              let* α0 := M.read γ0_0 in
              match α0 with
              | (_, _) =>
                let γ1_0 := Tuple.Access.left γ0_0 in
                let γ1_1 := Tuple.Access.right γ0_0 in
                let* α0 := M.read γ1_0 in
                match α0 with
                | u32.Make 1 =>
                  let* b := M.copy γ1_1 in
                  let* y := M.copy γ0_1 in
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_v1" in
                    let* α2 := M.read (mk_str "First of x is 1, b = ") in
                    let* α3 := M.read (mk_str ",  y = ") in
                    let* α4 := M.read (mk_str " 
") in
                    let* α5 := M.alloc [ α2; α3; α4 ] in
                    let* α6 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_display" in
                    let* α7 := M.call α6 [ b ] in
                    let* α8 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_display" in
                    let* α9 := M.call α8 [ y ] in
                    let* α10 := M.alloc [ α7; α9 ] in
                    let* α11 :=
                      M.call
                        α1
                        [
                          M.pointer_coercion "Unsize" α5;
                          M.pointer_coercion "Unsize" α10
                        ] in
                    let* α12 := M.call α0 [ α11 ] in
                    M.alloc α12 in
                  M.alloc (Value.Tuple [])
                | _ => M.break_match 
                end
              end
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            |
                {|
                  match_destructuring_structs.Foo.y := _;
                  match_destructuring_structs.Foo.x := _;
                |}
                =>
              let* γ0_0 :=
                let* α0 := M.var "match_destructuring_structs::Foo::Get_y" in
                M.pure (α0 γ) in
              let* γ0_1 :=
                let* α0 := M.var "match_destructuring_structs::Foo::Get_x" in
                M.pure (α0 γ) in
              let* α0 := M.read γ0_0 in
              match α0 with
              | u32.Make 2 =>
                let* i := M.copy γ0_1 in
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_v1" in
                  let* α2 := M.read (mk_str "y is 2, i = ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc [ α2; α3 ] in
                  let* α5 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug" in
                  let* α6 := M.call α5 [ i ] in
                  let* α7 := M.alloc [ α6 ] in
                  let* α8 :=
                    M.call
                      α1
                      [
                        M.pointer_coercion "Unsize" α4;
                        M.pointer_coercion "Unsize" α7
                      ] in
                  let* α9 := M.call α0 [ α8 ] in
                  M.alloc α9 in
                M.alloc (Value.Tuple [])
              | _ => M.break_match 
              end
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | {| match_destructuring_structs.Foo.y := _; |} =>
              let* γ0_0 :=
                let* α0 := M.var "match_destructuring_structs::Foo::Get_y" in
                M.pure (α0 γ) in
              let* y := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1" in
                let* α2 := M.read (mk_str "y = ") in
                let* α3 := M.read (mk_str ", we don't care about x
") in
                let* α4 := M.alloc [ α2; α3 ] in
                let* α5 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display" in
                let* α6 := M.call α5 [ y ] in
                let* α7 := M.alloc [ α6 ] in
                let* α8 :=
                  M.call
                    α1
                    [
                      M.pointer_coercion "Unsize" α4;
                      M.pointer_coercion "Unsize" α7
                    ] in
                let* α9 := M.call α0 [ α8 ] in
                M.alloc α9 in
              M.alloc (Value.Tuple [])
            end)
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
