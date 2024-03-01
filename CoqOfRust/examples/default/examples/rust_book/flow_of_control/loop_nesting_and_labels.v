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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ : Ty.tuple :=
      M.loop
        (let* _ : Ty.tuple :=
          let* _ : Ty.tuple :=
            let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
              M.read (mk_str "Entered the outer loop
") in
            let* α1 :
                Ty.apply
                  (Ty.path "array")
                  [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
              M.alloc [ α0 ] in
            let* α2 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
              M.call
                ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
                  (pointer_coercion "Unsize" (borrow α1))) in
            let* α3 : Ty.tuple := M.call (std.io.stdio._print α2) in
            M.alloc α3 in
          M.alloc tt in
        let* _ : Ty.tuple :=
          let* α0 : Ty.path "never" :=
            M.loop
              (let* _ : Ty.tuple :=
                let* _ : Ty.tuple :=
                  let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
                    M.read (mk_str "Entered the inner loop
") in
                  let* α1 :
                      Ty.apply
                        (Ty.path "array")
                        [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
                    M.alloc [ α0 ] in
                  let* α2 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
                    M.call
                      ((Ty.apply
                            (Ty.path "core::fmt::Arguments")
                            [])::["new_const"]
                        (pointer_coercion "Unsize" (borrow α1))) in
                  let* α3 : Ty.tuple := M.call (std.io.stdio._print α2) in
                  M.alloc α3 in
                M.alloc tt in
              M.break) in
          let* α1 : Ty.path "never" := M.read α0 in
          let* α2 : Ty.tuple := never_to_any α1 in
          M.alloc α2 in
        let* _ : Ty.tuple :=
          let* _ : Ty.tuple :=
            let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
              M.read (mk_str "This point will never be reached
") in
            let* α1 :
                Ty.apply
                  (Ty.path "array")
                  [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
              M.alloc [ α0 ] in
            let* α2 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
              M.call
                ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
                  (pointer_coercion "Unsize" (borrow α1))) in
            let* α3 : Ty.tuple := M.call (std.io.stdio._print α2) in
            M.alloc α3 in
          M.alloc tt in
        M.alloc tt) in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "Exited the outer loop
") in
        let* α1 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0 ] in
        let* α2 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
              (pointer_coercion "Unsize" (borrow α1))) in
        let* α3 : Ty.tuple := M.call (std.io.stdio._print α2) in
        M.alloc α3 in
      M.alloc tt in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
