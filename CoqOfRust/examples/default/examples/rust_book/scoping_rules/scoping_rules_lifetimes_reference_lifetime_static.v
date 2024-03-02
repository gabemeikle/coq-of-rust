(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition NUM : Ty.apply (Ty.path "ref") [Ty.path "i32"] :=
  M.run
    (let* α0 := M.alloc ((Integer.of_Z 18) : Ty.path "i32") in
    M.alloc α0).

(*
fn coerce_static<'a>(_: &'a i32) -> &'a i32 {
    &NUM
}
*)
Definition coerce_static (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [arg] =>
    let* arg := M.alloc arg in
    M.read (M.var "scoping_rules_lifetimes_reference_lifetime_static::NUM")
  | _, _ => M.impossible
  end.

(*
fn main() {
    {
        // Make a `string` literal and print it:
        let static_string = "I'm in read-only memory";
        println!("static_string: {}", static_string);

        // When `static_string` goes out of scope, the reference
        // can no longer be used, but the data remains in the binary.
    }

    {
        // Make an integer to use for `coerce_static`:
        let lifetime_num = 9;

        // Coerce `NUM` to lifetime of `lifetime_num`:
        let coerced_static = coerce_static(&lifetime_num);

        println!("coerced_static: {}", coerced_static);
    }

    println!("NUM: {} stays accessible!", NUM);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* static_string := M.copy (mk_str "I'm in read-only memory") in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "static_string: ") in
          let* α1 := M.read (mk_str "
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 :=
            M.call
              ((Ty.apply
                    (Ty.path "core::fmt::rt::Argument")
                    [])::["new_display"]
                (borrow static_string)) in
          let* α4 := M.alloc [ α3 ] in
          let* α5 :=
            M.call
              ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
                (pointer_coercion "Unsize" (borrow α2))
                (pointer_coercion "Unsize" (borrow α4))) in
          let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
          M.alloc α6 in
        M.alloc tt in
      M.alloc tt in
    let* _ :=
      let* lifetime_num := M.alloc ((Integer.of_Z 9) : Ty.path "i32") in
      let* coerced_static :=
        let* α0 :=
          M.call
            ((M.var
                "scoping_rules_lifetimes_reference_lifetime_static::coerce_static")
              (borrow lifetime_num)) in
        M.alloc α0 in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "coerced_static: ") in
          let* α1 := M.read (mk_str "
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 :=
            M.call
              ((Ty.apply
                    (Ty.path "core::fmt::rt::Argument")
                    [])::["new_display"]
                (borrow coerced_static)) in
          let* α4 := M.alloc [ α3 ] in
          let* α5 :=
            M.call
              ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
                (pointer_coercion "Unsize" (borrow α2))
                (pointer_coercion "Unsize" (borrow α4))) in
          let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
          M.alloc α6 in
        M.alloc tt in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "NUM: ") in
        let* α1 := M.read (mk_str " stays accessible!
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.read
            (M.var "scoping_rules_lifetimes_reference_lifetime_static::NUM") in
        let* α4 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              α3) in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α5))) in
        let* α7 := M.call ((M.var "std::io::stdio::_print") α6) in
        M.alloc α7 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
