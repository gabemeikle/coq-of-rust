(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let n = 5;

    if n < 0 {
        print!("{} is negative", n);
    } else if n > 0 {
        print!("{} is positive", n);
    } else {
        print!("{} is zero", n);
    }

    let big_n = if n < 10 && n > -10 {
        println!(", and is a small number, increase ten-fold");

        // This expression returns an `i32`.
        10 * n
    } else {
        println!(", and is a big number, halve the number");

        // This expression must return an `i32` as well.
        n / 2
        // TODO ^ Try suppressing this expression with a semicolon.
    };
    //   ^ Don't forget to put a semicolon here! All `let` bindings need it.

    println!("{} -> {}", n, big_n);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* n := M.alloc ((Integer.of_Z 5) : Ty.path "i32") in
    let* _ :=
      let* α0 := M.read n in
      let* α1 :=
        M.alloc
          ((M.var "BinOp::Pure::lt") α0 ((Integer.of_Z 0) : Ty.path "i32")) in
      let* α2 := M.read (use α1) in
      if α2 then
        let* _ :=
          let* _ :=
            let* α0 := M.read (mk_str "") in
            let* α1 := M.read (mk_str " is negative") in
            let* α2 := M.alloc [ α0; α1 ] in
            let* α3 :=
              M.call
                ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                  (borrow n)) in
            let* α4 := M.alloc [ α3 ] in
            let* α5 :=
              M.call
                ((Ty.path "core::fmt::Arguments")::["new_v1"]
                  (pointer_coercion "Unsize" (borrow α2))
                  (pointer_coercion "Unsize" (borrow α4))) in
            let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
            M.alloc α6 in
          M.alloc tt in
        M.alloc tt
      else
        let* α0 := M.read n in
        let* α1 :=
          M.alloc
            ((M.var "BinOp::Pure::gt") α0 ((Integer.of_Z 0) : Ty.path "i32")) in
        let* α2 := M.read (use α1) in
        if α2 then
          let* _ :=
            let* _ :=
              let* α0 := M.read (mk_str "") in
              let* α1 := M.read (mk_str " is positive") in
              let* α2 := M.alloc [ α0; α1 ] in
              let* α3 :=
                M.call
                  ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                    (borrow n)) in
              let* α4 := M.alloc [ α3 ] in
              let* α5 :=
                M.call
                  ((Ty.path "core::fmt::Arguments")::["new_v1"]
                    (pointer_coercion "Unsize" (borrow α2))
                    (pointer_coercion "Unsize" (borrow α4))) in
              let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
              M.alloc α6 in
            M.alloc tt in
          M.alloc tt
        else
          let* _ :=
            let* _ :=
              let* α0 := M.read (mk_str "") in
              let* α1 := M.read (mk_str " is zero") in
              let* α2 := M.alloc [ α0; α1 ] in
              let* α3 :=
                M.call
                  ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                    (borrow n)) in
              let* α4 := M.alloc [ α3 ] in
              let* α5 :=
                M.call
                  ((Ty.path "core::fmt::Arguments")::["new_v1"]
                    (pointer_coercion "Unsize" (borrow α2))
                    (pointer_coercion "Unsize" (borrow α4))) in
              let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
              M.alloc α6 in
            M.alloc tt in
          M.alloc tt in
    let* big_n :=
      let* α0 := M.read n in
      let* α1 := M.read n in
      let* α2 :=
        M.alloc
          ((M.var "BinOp::Pure::and")
            ((M.var "BinOp::Pure::lt") α0 ((Integer.of_Z 10) : Ty.path "i32"))
            ((M.var "BinOp::Pure::gt")
              α1
              ((Integer.of_Z (-10)) : Ty.path "i32"))) in
      let* α3 := M.read (use α2) in
      let* α4 :=
        if α3 then
          let* _ :=
            let* _ :=
              let* α0 :=
                M.read (mk_str ", and is a small number, increase ten-fold
") in
              let* α1 := M.alloc [ α0 ] in
              let* α2 :=
                M.call
                  ((Ty.path "core::fmt::Arguments")::["new_const"]
                    (pointer_coercion "Unsize" (borrow α1))) in
              let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
              M.alloc α3 in
            M.alloc tt in
          let* α0 := M.read n in
          let* α1 :=
            (M.var "BinOp::Panic::mul")
              ((Integer.of_Z 10) : Ty.path "i32")
              α0 in
          M.alloc α1
        else
          let* _ :=
            let* _ :=
              let* α0 :=
                M.read (mk_str ", and is a big number, halve the number
") in
              let* α1 := M.alloc [ α0 ] in
              let* α2 :=
                M.call
                  ((Ty.path "core::fmt::Arguments")::["new_const"]
                    (pointer_coercion "Unsize" (borrow α1))) in
              let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
              M.alloc α3 in
            M.alloc tt in
          let* α0 := M.read n in
          let* α1 :=
            (M.var "BinOp::Panic::div") α0 ((Integer.of_Z 2) : Ty.path "i32") in
          M.alloc α1 in
      M.copy α4 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "") in
        let* α1 := M.read (mk_str " -> ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α0; α1; α2 ] in
        let* α4 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_display"] (borrow n)) in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_display"]
              (borrow big_n)) in
        let* α6 := M.alloc [ α4; α5 ] in
        let* α7 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α3))
              (pointer_coercion "Unsize" (borrow α6))) in
        let* α8 := M.call ((M.var "std::io::stdio::_print") α7) in
        M.alloc α8 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
