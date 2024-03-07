(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // `Vec` has non-copy semantics.
    let haystack = vec![1, 2, 3];

    let contains = move |needle| haystack.contains(needle);

    println!("{}", contains(&1));
    println!("{}", contains(&4));

    // println!("There're {} elements in vec", haystack.len());
    // ^ Uncommenting above line will result in compile-time error
    // because borrow checker doesn't allow re-using variable after it
    // has been moved.

    // Removing `move` from closure's signature will cause closure
    // to borrow _haystack_ variable immutably, hence _haystack_ is still
    // available and uncommenting above line will not cause an error.
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* haystack :=
      let* α0 :=
        M.alloc
          [
            (Integer.of_Z 1) : Ty.path "i32";
            (Integer.of_Z 2) : Ty.path "i32";
            (Integer.of_Z 3) : Ty.path "i32"
          ] in
      let* α1 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α0 ] in
      let* α2 := M.read α1 in
      let* α3 :=
        M.call
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["into_vec"]
          [ pointer_coercion "Unsize" α2 ] in
      M.alloc α3 in
    let* contains :=
      M.alloc
        (fun (α0 : Ty.apply (Ty.path "ref") [ Ty.path "i32" ]) =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* needle := M.copy γ in
                let* α0 :=
                  M.get_method
                    "core::ops::deref::Deref"
                    "deref"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                    ] in
                let* α1 := M.call α0 [ borrow haystack ] in
                let* α2 := M.read needle in
                M.call
                  (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["contains"]
                  [ α1; α2 ]) :
                Ty.path "bool"
            ]) :
          Ty.path "bool") in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.get_method
            "core::ops::function::Fn"
            "call"
            [
              (* Self *)
                Ty.function
                  [ Ty.tuple [ Ty.apply (Ty.path "ref") [ Ty.path "i32" ] ] ]
                  (Ty.path "bool");
              (* Args *) Ty.tuple [ Ty.apply (Ty.path "ref") [ Ty.path "i32" ] ]
            ] in
        let* α4 := M.alloc ((Integer.of_Z 1) : Ty.path "i32") in
        let* α5 := M.call α3 [ borrow contains; (borrow α4) ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow α6 ] in
        let* α8 := M.alloc [ α7 ] in
        let* α9 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α8)
            ] in
        let* α10 := M.call (M.var "std::io::stdio::_print") [ α9 ] in
        M.alloc α10 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.get_method
            "core::ops::function::Fn"
            "call"
            [
              (* Self *)
                Ty.function
                  [ Ty.tuple [ Ty.apply (Ty.path "ref") [ Ty.path "i32" ] ] ]
                  (Ty.path "bool");
              (* Args *) Ty.tuple [ Ty.apply (Ty.path "ref") [ Ty.path "i32" ] ]
            ] in
        let* α4 := M.alloc ((Integer.of_Z 4) : Ty.path "i32") in
        let* α5 := M.call α3 [ borrow contains; (borrow α4) ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow α6 ] in
        let* α8 := M.alloc [ α7 ] in
        let* α9 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α8)
            ] in
        let* α10 := M.call (M.var "std::io::stdio::_print") [ α9 ] in
        M.alloc α10 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
