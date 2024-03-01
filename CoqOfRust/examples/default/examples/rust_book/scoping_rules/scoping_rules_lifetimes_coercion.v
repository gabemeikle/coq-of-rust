(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn multiply<'a>(first: &'a i32, second: &'a i32) -> i32 {
    first * second
}
*)
Definition multiply (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [first; second] =>
    let* first := M.alloc first in
    let* second := M.alloc second in
    let* α0 :
        Ty.function
          [Ty.apply (Ty.path "ref") [Ty.path "i32"];
            Ty.apply (Ty.path "ref") [Ty.path "i32"]]
          _ :=
      ltac:(M.get_method (fun ℐ =>
        core.ops.arith.Mul.mul
          (Self := Ty.apply (Ty.path "ref") [Ty.path "i32"])
          (Rhs := Ty.apply (Ty.path "ref") [Ty.path "i32"])
          (Trait := ℐ))) in
    let* α1 : Ty.apply (Ty.path "ref") [Ty.path "i32"] := M.read first in
    let* α2 : Ty.apply (Ty.path "ref") [Ty.path "i32"] := M.read second in
    M.call (α0 α1 α2)
  | _, _ => M.impossible
  end.

(*
fn choose_first<'a: 'b, 'b>(first: &'a i32, _: &'b i32) -> &'b i32 {
    first
}
*)
Definition choose_first (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [first; arg] =>
    let* first := M.alloc first in
    let* arg := M.alloc arg in
    M.read first
  | _, _ => M.impossible
  end.

(*
fn main() {
    let first = 2; // Longer lifetime

    {
        let second = 3; // Shorter lifetime

        println!("The product is {}", multiply(&first, &second));
        println!("{} is the first", choose_first(&first, &second));
    };
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* first : Ty.path "i32" := M.alloc ((Integer.of_Z 2) : Ty.path "i32") in
    let* _ : Ty.tuple :=
      let* second : Ty.path "i32" :=
        M.alloc ((Integer.of_Z 3) : Ty.path "i32") in
      let* _ : Ty.tuple :=
        let* _ : Ty.tuple :=
          let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
            M.read (mk_str "The product is ") in
          let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
            M.read (mk_str "
") in
          let* α2 :
              Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
            M.alloc [ α0; α1 ] in
          let* α3 : Ty.path "i32" :=
            M.call
              (scoping_rules_lifetimes_coercion.multiply
                (borrow first)
                (borrow second)) in
          let* α4 : Ty.path "i32" := M.alloc α3 in
          let* α5 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
            M.call
              ((Ty.apply
                    (Ty.path "core::fmt::rt::Argument")
                    [])::["new_display"]
                (borrow α4)) in
          let* α6 :
              Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
            M.alloc [ α5 ] in
          let* α7 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
            M.call
              ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
                (pointer_coercion "Unsize" (borrow α2))
                (pointer_coercion "Unsize" (borrow α6))) in
          let* α8 : Ty.tuple := M.call (std.io.stdio._print α7) in
          M.alloc α8 in
        M.alloc tt in
      let* _ : Ty.tuple :=
        let* _ : Ty.tuple :=
          let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
            M.read (mk_str "") in
          let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
            M.read (mk_str " is the first
") in
          let* α2 :
              Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
            M.alloc [ α0; α1 ] in
          let* α3 : Ty.apply (Ty.path "ref") [Ty.path "i32"] :=
            M.call
              (scoping_rules_lifetimes_coercion.choose_first
                (borrow first)
                (borrow second)) in
          let* α4 : Ty.apply (Ty.path "ref") [Ty.path "i32"] := M.alloc α3 in
          let* α5 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
            M.call
              ((Ty.apply
                    (Ty.path "core::fmt::rt::Argument")
                    [])::["new_display"]
                (borrow α4)) in
          let* α6 :
              Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
            M.alloc [ α5 ] in
          let* α7 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
            M.call
              ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
                (pointer_coercion "Unsize" (borrow α2))
                (pointer_coercion "Unsize" (borrow α6))) in
          let* α8 : Ty.tuple := M.call (std.io.stdio._print α7) in
          M.alloc α8 in
        M.alloc tt in
      M.alloc tt in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
