(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let shadowed_binding = 1;

    {
        println!("before being shadowed: {}", shadowed_binding);

        // This binding *shadows* the outer one
        let shadowed_binding = "abc";

        println!("shadowed in inner block: {}", shadowed_binding);
    }
    println!("outside inner block: {}", shadowed_binding);

    // This binding *shadows* the previous binding
    let shadowed_binding = 2;
    println!("shadowed in outer block: {}", shadowed_binding);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* shadowed_binding := M.alloc (Value.Integer Integer.I32 1) in
    let* _ :=
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "before being shadowed: ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 := M.call_closure α5 [ shadowed_binding ] in
          let* α7 := M.alloc (Value.Array [ α6 ]) in
          let* α8 :=
            M.call_closure
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α7
              ] in
          let* α9 := M.call_closure α0 [ α8 ] in
          M.alloc α9 in
        M.alloc (Value.Tuple []) in
      let* shadowed_binding := M.copy (mk_str "abc") in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "shadowed in inner block: ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 := M.call_closure α5 [ shadowed_binding ] in
          let* α7 := M.alloc (Value.Array [ α6 ]) in
          let* α8 :=
            M.call_closure
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α7
              ] in
          let* α9 := M.call_closure α0 [ α8 ] in
          M.alloc α9 in
        M.alloc (Value.Tuple []) in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "outside inner block: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call_closure α5 [ shadowed_binding ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* shadowed_binding := M.alloc (Value.Integer Integer.I32 2) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "shadowed in outer block: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call_closure α5 [ shadowed_binding ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
