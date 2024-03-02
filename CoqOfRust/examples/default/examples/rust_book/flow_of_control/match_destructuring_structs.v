(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Foo.
Section Foo.
  Record t : Set := {
    x : u32.t * u32.t;
    y : u32.t;
  }.
  
  Definition Get_x :=
    Ref.map (fun α => Some α.(x)) (fun β α => Some (α <| x := β |>)).
  Definition Get_y :=
    Ref.map (fun α => Some α.(y)) (fun β α => Some (α <| y := β |>)).
End Foo.
End Foo.

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
Definition main : M unit :=
  let* foo : M.Val match_destructuring_structs.Foo.t :=
    M.alloc
      {|
        match_destructuring_structs.Foo.x :=
          ((Integer.of_Z 1) : u32.t, (Integer.of_Z 2) : u32.t);
        match_destructuring_structs.Foo.y := (Integer.of_Z 3) : u32.t;
      |} in
  let* α0 : M.Val unit :=
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
            let γ0_0 := match_destructuring_structs.Foo.Get_x γ in
            let γ0_1 := match_destructuring_structs.Foo.Get_y γ in
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
                let* _ : M.Val unit :=
                  let* α0 : ref str.t :=
                    M.read (mk_str "First of x is 1, b = ") in
                  let* α1 : ref str.t := M.read (mk_str ",  y = ") in
                  let* α2 : ref str.t := M.read (mk_str " 
") in
                  let* α3 : M.Val (array (ref str.t)) :=
                    M.alloc [ α0; α1; α2 ] in
                  let* α4 : core.fmt.rt.Argument.t :=
                    M.call
                      (core.fmt.rt.Argument.t::["new_display"] (borrow b)) in
                  let* α5 : core.fmt.rt.Argument.t :=
                    M.call
                      (core.fmt.rt.Argument.t::["new_display"] (borrow y)) in
                  let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                    M.alloc [ α4; α5 ] in
                  let* α7 : core.fmt.Arguments.t :=
                    M.call
                      (core.fmt.Arguments.t::["new_v1"]
                        (pointer_coercion "Unsize" (borrow α3))
                        (pointer_coercion "Unsize" (borrow α6))) in
                  let* α8 : unit := M.call (std.io.stdio._print α7) in
                  M.alloc α8 in
                M.alloc tt
              | _ => M.break_match
              end
            end
          end) :
          M (M.Val unit);
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          |
              {|
                match_destructuring_structs.Foo.y := _;
                match_destructuring_structs.Foo.x := _;
              |}
              =>
            let γ0_0 := match_destructuring_structs.Foo.Get_y γ in
            let γ0_1 := match_destructuring_structs.Foo.Get_x γ in
            let* α0 := M.read γ0_0 in
            match α0 with
            | u32.Make 2 =>
              let* i := M.copy γ0_1 in
              let* _ : M.Val unit :=
                let* α0 : ref str.t := M.read (mk_str "y is 2, i = ") in
                let* α1 : ref str.t := M.read (mk_str "
") in
                let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
                let* α3 : core.fmt.rt.Argument.t :=
                  M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow i)) in
                let* α4 : M.Val (array core.fmt.rt.Argument.t) :=
                  M.alloc [ α3 ] in
                let* α5 : core.fmt.Arguments.t :=
                  M.call
                    (core.fmt.Arguments.t::["new_v1"]
                      (pointer_coercion "Unsize" (borrow α2))
                      (pointer_coercion "Unsize" (borrow α4))) in
                let* α6 : unit := M.call (std.io.stdio._print α5) in
                M.alloc α6 in
              M.alloc tt
            | _ => M.break_match
            end
          end) :
          M (M.Val unit);
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | {| match_destructuring_structs.Foo.y := _; |} =>
            let γ0_0 := match_destructuring_structs.Foo.Get_y γ in
            let* y := M.copy γ0_0 in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "y = ") in
              let* α1 : ref str.t :=
                M.read (mk_str ", we don't care about x
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow y)) in
              let* α4 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α3 ] in
              let* α5 : core.fmt.Arguments.t :=
                M.call
                  (core.fmt.Arguments.t::["new_v1"]
                    (pointer_coercion "Unsize" (borrow α2))
                    (pointer_coercion "Unsize" (borrow α4))) in
              let* α6 : unit := M.call (std.io.stdio._print α5) in
              M.alloc α6 in
            M.alloc tt
          end) :
          M (M.Val unit)
      ] in
  M.read α0.
