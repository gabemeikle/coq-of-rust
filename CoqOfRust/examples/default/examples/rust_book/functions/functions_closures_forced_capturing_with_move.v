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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* haystack :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply (Ty.path "array") [ Ty.path "i32" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α2 :=
        M.alloc
          (Value.Array
            [
              Value.Integer Integer.I32 1;
              Value.Integer Integer.I32 2;
              Value.Integer Integer.I32 3
            ]) in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.read α3 in
      let* α5 := M.call_closure α0 [ M.pointer_coercion (* Unsize *) α4 ] in
      M.alloc α5 in
    let* contains :=
      M.alloc
        (M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    let* needle := M.copy γ in
                    let* α0 :=
                      M.get_associated_function
                        (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
                        "contains"
                        [] in
                    let* α1 :=
                      M.get_trait_method
                        "core::ops::deref::Deref"
                        (Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
                        []
                        "deref"
                        [] in
                    let* α2 := M.call_closure α1 [ haystack ] in
                    let* α3 := M.read needle in
                    M.call_closure α0 [ α2; α3 ]
                ]
            | _ => M.impossible
            end)) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "bool" ] in
        let* α6 :=
          M.get_trait_method
            "core::ops::function::Fn"
            (Ty.function
              [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] ]
              (Ty.path "bool"))
            [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] ]
            "call"
            [] in
        let* α7 := M.alloc (Value.Integer Integer.I32 1) in
        let* α8 := M.call_closure α6 [ contains; Value.Tuple [ α7 ] ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call_closure α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call_closure α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "bool" ] in
        let* α6 :=
          M.get_trait_method
            "core::ops::function::Fn"
            (Ty.function
              [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] ]
              (Ty.path "bool"))
            [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] ]
            "call"
            [] in
        let* α7 := M.alloc (Value.Integer Integer.I32 4) in
        let* α8 := M.call_closure α6 [ contains; Value.Tuple [ α7 ] ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call_closure α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call_closure α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
