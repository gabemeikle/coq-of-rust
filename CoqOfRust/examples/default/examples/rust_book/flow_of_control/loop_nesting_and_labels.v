(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    'outer: loop {
        println!("Entered the outer loop");

        'inner: loop {
            println!("Entered the inner loop");

            // This would break only the inner loop
            //break;

            // This breaks the outer loop
            break 'outer;
        }

        println!("This point will never be reached");
    }

    println!("Exited the outer loop");
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      M.loop
        (let* _ :=
          let* _ :=
            let* α0 := M.get_function "std::io::stdio::_print" [] in
            let* α1 :=
              M.get_associated_function
                (Ty.path "core::fmt::Arguments")
                "new_const"
                [] in
            let* α2 := M.read (mk_str "Entered the outer loop
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in
            let* α4 :=
              M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
            let* α5 := M.call_closure α0 [ α4 ] in
            M.alloc α5 in
          M.alloc (Value.Tuple []) in
        let* _ :=
          let* α0 :=
            M.loop
              (let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" [] in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_const"
                      [] in
                  let* α2 := M.read (mk_str "Entered the inner loop
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  let* α4 :=
                    M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                  let* α5 := M.call_closure α0 [ α4 ] in
                  M.alloc α5 in
                M.alloc (Value.Tuple []) in
              M.break) in
          let* α1 := M.read α0 in
          let* α2 := M.never_to_any α1 in
          M.alloc α2 in
        let* _ :=
          let* _ :=
            let* α0 := M.get_function "std::io::stdio::_print" [] in
            let* α1 :=
              M.get_associated_function
                (Ty.path "core::fmt::Arguments")
                "new_const"
                [] in
            let* α2 := M.read (mk_str "This point will never be reached
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in
            let* α4 :=
              M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
            let* α5 := M.call_closure α0 [ α4 ] in
            M.alloc α5 in
          M.alloc (Value.Tuple []) in
        M.alloc (Value.Tuple [])) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const"
            [] in
        let* α2 := M.read (mk_str "Exited the outer loop
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call_closure α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
